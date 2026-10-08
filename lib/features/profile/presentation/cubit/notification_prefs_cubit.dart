import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';
import 'list_section_cubit.dart';

class NotificationPrefsState extends Equatable {
  const NotificationPrefsState({
    this.status = SectionStatus.loading,
    this.items = const [],
    this.error,
    this.pending = const {},
    this.failure,
    this.failureSeq = 0,
  });

  final SectionStatus status;
  final List<NotificationPreference> items;

  /// Load failure.
  final Object? error;

  /// Cell keys whose toggle is still being saved.
  final Set<String> pending;

  /// Last save failure (the cell was reverted). [failureSeq] increments so the page can toast each one.
  final ApiException? failure;
  final int failureSeq;

  List<NotificationTopic> get topics => [
    for (final t in NotificationTopic.values)
      if (items.any((p) => p.topic == t)) t,
  ];
  List<NotificationChannel> get channels => [
    for (final c in NotificationChannel.values)
      if (items.any((p) => p.channel == c)) c,
  ];

  NotificationPreference? cell(NotificationTopic topic, NotificationChannel channel) {
    for (final p in items) {
      if (p.topic == topic && p.channel == channel) return p;
    }
    return null;
  }

  NotificationPrefsState copyWith({
    SectionStatus? status,
    List<NotificationPreference>? items,
    Object? error,
    Set<String>? pending,
    ApiException? failure,
    int? failureSeq,
  }) => NotificationPrefsState(
    status: status ?? this.status,
    items: items ?? this.items,
    error: error ?? this.error,
    pending: pending ?? this.pending,
    failure: failure ?? this.failure,
    failureSeq: failureSeq ?? this.failureSeq,
  );

  @override
  List<Object?> get props => [status, items, error, pending, failure, failureSeq];
}

/// Topic × channel grid with optimistic toggles: a switch flips immediately, the single changed cell is saved, and
/// the server's authoritative grid is merged back — except for cells whose own save is still in flight, so rapid
/// toggles never flicker. A failed save reverts only its cell.
class NotificationPrefsCubit extends Cubit<NotificationPrefsState> {
  NotificationPrefsCubit(this._repo) : super(const NotificationPrefsState());

  final NotificationPreferencesRepository _repo;

  /// Per-cell generation so an older response never overrides a newer toggle of the same cell.
  final _generation = <String, int>{};

  Future<void> load() async {
    emit(const NotificationPrefsState());
    try {
      final items = await _repo.get();
      if (!isClosed) emit(state.copyWith(status: SectionStatus.ready, items: items));
    } on ApiException catch (e) {
      if (!isClosed) emit(NotificationPrefsState(status: SectionStatus.error, error: e));
    }
  }

  Future<void> toggle(NotificationTopic topic, NotificationChannel channel, bool enabled) async {
    final cell = state.cell(topic, channel);
    if (cell == null || cell.locked || cell.enabled == enabled) return;
    final key = cell.key;
    final gen = (_generation[key] ?? 0) + 1;
    _generation[key] = gen;
    final updated = cell.copyWith(enabled: enabled);
    emit(state.copyWith(items: _replace(state.items, updated), pending: {...state.pending, key}));
    try {
      final server = await _repo.save([updated]);
      if (isClosed || _generation[key] != gen) return;
      final pending = {...state.pending}..remove(key);
      // keep local values for cells with their own save still in flight
      final merged = [for (final s in server) pending.contains(s.key) ? (state.cell(s.topic, s.channel) ?? s) : s];
      emit(state.copyWith(items: merged, pending: pending));
    } on ApiException catch (e) {
      if (isClosed || _generation[key] != gen) return;
      emit(state.copyWith(items: _replace(state.items, cell), pending: {...state.pending}..remove(key), failure: e, failureSeq: state.failureSeq + 1));
    }
  }

  static List<NotificationPreference> _replace(List<NotificationPreference> items, NotificationPreference p) => [for (final i in items) i.key == p.key ? p : i];
}
