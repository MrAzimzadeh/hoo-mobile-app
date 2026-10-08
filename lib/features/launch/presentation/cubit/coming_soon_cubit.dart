import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/launch_models.dart';
import '../../domain/launch_repository.dart';

enum ComingSoonStatus { loading, ready, failure }

@immutable
class ComingSoonState extends Equatable {
  const ComingSoonState({
    this.status = ComingSoonStatus.loading,
    this.content,
    this.count,
    this.stale = false,
    this.error,
    this.storeLive = false,
    this.checkingLaunch = false,
  });

  final ComingSoonStatus status;
  final ComingSoonContent? content;

  /// Live counter (`GET /waitlist/count`); falls back to `content.waitlistCount`.
  final WaitlistCount? count;

  /// Cached content shown offline.
  final bool stale;
  final Object? error;

  /// The store went live (countdown reached, server flipped the mode) — the page enters the app.
  final bool storeLive;

  /// Re-checking `/meta/store` after the countdown or a pull-to-refresh.
  final bool checkingLaunch;

  int get waitlistTotal => count?.total ?? content?.waitlistCount ?? 0;

  ComingSoonState copyWith({
    ComingSoonStatus? status,
    ComingSoonContent? content,
    WaitlistCount? count,
    bool? stale,
    Object? error,
    bool clearError = false,
    bool? storeLive,
    bool? checkingLaunch,
  }) => ComingSoonState(
    status: status ?? this.status,
    content: content ?? this.content,
    count: count ?? this.count,
    stale: stale ?? this.stale,
    error: clearError ? null : (error ?? this.error),
    storeLive: storeLive ?? this.storeLive,
    checkingLaunch: checkingLaunch ?? this.checkingLaunch,
  );

  @override
  List<Object?> get props => [status, content, count, stale, error, storeLive, checkingLaunch];
}

/// Coming Soon content + waitlist counter, and watching for the launch moment.
class ComingSoonCubit extends Cubit<ComingSoonState> {
  ComingSoonCubit(this._repo, this._store, this._settings) : super(const ComingSoonState()) {
    _subs
      ..add(
        _store.changes.listen((info) {
          if (info.mode == StoreMode.live && !isClosed) emit(state.copyWith(storeLive: true));
        }),
      )
      ..add(_settings.stream.map((s) => s.language).distinct().listen((_) => load()));
  }

  final LaunchRepository _repo;
  final StoreInfoProvider _store;
  final AppSettingsCubit _settings;
  final _subs = <StreamSubscription<Object?>>[];
  int _generation = 0;

  /// Store contacts for the socials row before the content has loaded.
  StoreContacts get fallbackContacts => _store.info.contacts;

  Future<void> load() async {
    final gen = ++_generation;
    if (state.content == null) emit(state.copyWith(status: ComingSoonStatus.loading, clearError: true));
    final language = _settings.state.language;
    final countF = _repo.waitlistCount().then<WaitlistCount?>((c) => c, onError: (Object _) => null);
    try {
      final content = await _repo.comingSoon(language);
      final count = await countF;
      if (isClosed || gen != _generation) return;
      emit(state.copyWith(status: ComingSoonStatus.ready, content: content.data, count: count, stale: content.stale, clearError: true));
      // The server already reports Live: refresh the provider (the route guard reads it) — `changes` then flips
      // `storeLive` and the page enters the app.
      if (content.data.mode == StoreMode.live && !content.stale) unawaited(_store.refresh().then<void>((_) {}, onError: (Object _) {}));
    } on ApiException catch (e) {
      if (isClosed || gen != _generation) return;
      // Keep showing what we have; only an empty screen becomes an error state.
      emit(state.content == null ? state.copyWith(status: ComingSoonStatus.failure, error: e) : state.copyWith(stale: e.isNetwork, error: e));
    }
  }

  /// Countdown reached zero / pull-to-refresh: re-reads `/meta/store` and the content.
  Future<void> checkLaunch() async {
    if (state.checkingLaunch) return;
    emit(state.copyWith(checkingLaunch: true));
    try {
      final info = await _store.refresh();
      if (isClosed) return;
      emit(state.copyWith(checkingLaunch: false, storeLive: info.mode == StoreMode.live));
    } on ApiException {
      if (!isClosed) emit(state.copyWith(checkingLaunch: false));
    }
    if (!isClosed && !state.storeLive) await load();
  }

  /// After joining the waitlist the response carries the new total.
  void waitlistJoined(WaitlistJoined joined) {
    emit(
      state.copyWith(
        count: WaitlistCount(total: joined.total, today: (state.count?.today ?? 0) + (joined.alreadyJoined ? 0 : 1)),
      ),
    );
  }

  @override
  Future<void> close() async {
    for (final s in _subs) {
      await s.cancel();
    }
    return super.close();
  }
}
