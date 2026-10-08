import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/storage/cached.dart';

enum SectionStatus { loading, ready, error }

/// State of a simple profile list section (addresses, cards, devices): explicit loading / empty / error / stale,
/// plus the ids with a mutation in flight so rows can show their own progress.
class ListSectionState<T> extends Equatable {
  const ListSectionState({this.status = SectionStatus.loading, this.items = const [], this.error, this.stale = false, this.busyIds = const {}});

  final SectionStatus status;
  final List<T> items;
  final Object? error;

  /// Cached copy served offline → read-only.
  final bool stale;
  final Set<String> busyIds;

  bool get isEmpty => status == SectionStatus.ready && items.isEmpty;

  ListSectionState<T> copyWith({SectionStatus? status, List<T>? items, Object? error, bool clearError = false, bool? stale, Set<String>? busyIds}) =>
      ListSectionState<T>(
        status: status ?? this.status,
        items: items ?? this.items,
        error: clearError ? null : (error ?? this.error),
        stale: stale ?? this.stale,
        busyIds: busyIds ?? this.busyIds,
      );

  @override
  List<Object?> get props => [status, items, error, stale, busyIds];
}

/// Base for list sections: load/refresh with stale handling and per-row mutations that report failures back to the
/// page (which shows a toast) instead of replacing the list with an error.
abstract class ListSectionCubit<T> extends Cubit<ListSectionState<T>> {
  ListSectionCubit() : super(ListSectionState<T>());

  Future<Cached<List<T>>> fetch();

  Future<void> load() async {
    if (state.items.isEmpty) emit(state.copyWith(status: SectionStatus.loading, clearError: true));
    try {
      final r = await fetch();
      if (isClosed) return;
      emit(state.copyWith(status: SectionStatus.ready, items: r.data, stale: r.stale, clearError: true));
    } on ApiException catch (e) {
      if (isClosed) return;
      // keep what we have on screen if a refresh fails
      emit(state.items.isEmpty ? state.copyWith(status: SectionStatus.error, error: e) : state.copyWith(status: SectionStatus.ready, error: e));
    }
  }

  /// Runs [action] for row [id]; returns the failure (or null on success). The row is marked busy meanwhile.
  Future<ApiException?> mutate(String id, Future<void> Function() action) async {
    if (state.stale || state.busyIds.contains(id)) return null;
    emit(state.copyWith(busyIds: {...state.busyIds, id}));
    try {
      await action();
      return null;
    } on ApiException catch (e) {
      return e;
    } finally {
      if (!isClosed) emit(state.copyWith(busyIds: {...state.busyIds}..remove(id)));
    }
  }

  void replaceItems(List<T> items) => emit(state.copyWith(status: SectionStatus.ready, items: items));
}
