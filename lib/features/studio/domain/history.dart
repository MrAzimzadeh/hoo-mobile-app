import 'package:equatable/equatable.dart';

/// Undo/redo over immutable snapshots (port of the web `domain/history.ts`).
///
/// * [commit] records a step; consecutive commits with the same `key` inside [coalesceWindow] share one step
///   (typing in a text field is one undo, not one per character).
/// * Gestures: [checkpoint] at gesture start, then [replace] while dragging → one undo step per gesture.
class History<T> extends Equatable {
  const History._(this.past, this.present, this.future, this.lastKey, this.lastAt);

  const History(T present) : this._(const [], present, const [], null, null);

  static const limit = 100;
  static const coalesceWindow = Duration(milliseconds: 900);

  final List<T> past;
  final T present;
  final List<T> future;
  final String? lastKey;
  final DateTime? lastAt;

  bool get canUndo => past.isNotEmpty;
  bool get canRedo => future.isNotEmpty;

  History<T> commit(T next, {String? key, DateTime? at}) {
    if (next == present) return this;
    final now = at ?? DateTime.now();
    final coalesce = key != null && key == lastKey && lastAt != null && now.difference(lastAt!) <= coalesceWindow && past.isNotEmpty;
    final nextPast = coalesce ? past : _trim([...past, present]);
    return History._(nextPast, next, const [], key, now);
  }

  /// Replaces the present without recording a step (mid-gesture, after [checkpoint]).
  History<T> replace(T next) => next == present ? this : History._(past, next, future, lastKey, lastAt);

  /// Records the present as an undo step (gesture start).
  History<T> checkpoint() => History._(_trim([...past, present]), present, const [], null, null);

  /// Drops a checkpoint that turned out to be a no-op (gesture ended where it started).
  History<T> dropCheckpointIfUnchanged() => past.isNotEmpty && past.last == present ? History._(past.sublist(0, past.length - 1), present, future, null, null) : this;

  History<T> undo() => past.isEmpty ? this : History._(past.sublist(0, past.length - 1), past.last, [present, ...future], null, null);

  History<T> redo() => future.isEmpty ? this : History._([...past, present], future.first, future.sublist(1), null, null);

  static List<T> _trim<T>(List<T> l) => l.length > limit ? l.sublist(l.length - limit) : l;

  @override
  List<Object?> get props => [past, present, future, lastKey, lastAt];
}
