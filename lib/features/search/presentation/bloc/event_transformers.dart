import 'dart:async';

import 'package:bloc/bloc.dart';

/// Bloc event transformers built on plain streams (no bloc_concurrency / stream_transform dependency).

/// Only the latest event is processed: a new event cancels the handler of the previous one (its `emit` becomes a
/// no-op), so stale responses can never overwrite fresh state.
EventTransformer<E> restartable<E>() =>
    (events, mapper) => events.switchMapLatest(mapper);

/// Waits until events stop arriving for [duration], then processes the last one; a newer event restarts it.
EventTransformer<E> debounceRestartable<E>(Duration duration) =>
    (events, mapper) => events.debounceLatest(duration).switchMapLatest(mapper);

/// Ignores events while one is being handled (load more, pull to refresh).
EventTransformer<E> droppable<E>() =>
    (events, mapper) => events.exhaustMap(mapper);

extension StreamOperators<T> on Stream<T> {
  StreamController<R> _controller<R>() => isBroadcast ? StreamController<R>.broadcast(sync: true) : StreamController<R>(sync: true);

  /// Emits the last value once [duration] has passed without a new one. A pending value is flushed on done.
  Stream<T> debounceLatest(Duration duration) {
    final controller = _controller<T>();
    StreamSubscription<T>? sub;
    Timer? timer;
    T? pending;
    var hasPending = false;

    controller.onListen = () {
      sub = listen(
        (value) {
          timer?.cancel();
          pending = value;
          hasPending = true;
          timer = Timer(duration, () {
            hasPending = false;
            controller.add(pending as T);
          });
        },
        onError: controller.addError,
        onDone: () {
          timer?.cancel();
          if (hasPending) controller.add(pending as T);
          controller.close();
        },
      );
    };
    controller.onCancel = () {
      timer?.cancel();
      return sub?.cancel();
    };
    return controller.stream;
  }

  /// Maps each value to a stream and forwards only the most recent one, cancelling the previous inner stream.
  Stream<R> switchMapLatest<R>(Stream<R> Function(T value) convert) {
    final controller = _controller<R>();
    StreamSubscription<T>? outer;
    StreamSubscription<R>? inner;
    var outerDone = false;

    controller.onListen = () {
      outer = listen(
        (value) {
          final previous = inner;
          inner = null;
          previous?.cancel();
          late final StreamSubscription<R> current;
          current = convert(value).listen(
            controller.add,
            onError: controller.addError,
            onDone: () {
              if (identical(inner, current)) inner = null;
              if (outerDone && inner == null) controller.close();
            },
          );
          inner = current;
        },
        onError: controller.addError,
        onDone: () {
          outerDone = true;
          if (inner == null) controller.close();
        },
      );
    };
    controller.onCancel = () async {
      await inner?.cancel();
      await outer?.cancel();
    };
    return controller.stream;
  }

  /// Maps a value to a stream and ignores new values until that stream is done.
  Stream<R> exhaustMap<R>(Stream<R> Function(T value) convert) {
    final controller = _controller<R>();
    StreamSubscription<T>? outer;
    StreamSubscription<R>? inner;
    var outerDone = false;

    controller.onListen = () {
      outer = listen(
        (value) {
          if (inner != null) return;
          inner = convert(value).listen(
            controller.add,
            onError: controller.addError,
            onDone: () {
              inner = null;
              if (outerDone) controller.close();
            },
          );
        },
        onError: controller.addError,
        onDone: () {
          outerDone = true;
          if (inner == null) controller.close();
        },
      );
    };
    controller.onCancel = () async {
      await inner?.cancel();
      await outer?.cancel();
    };
    return controller.stream;
  }
}
