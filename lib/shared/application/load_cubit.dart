import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Loading / data / error for a screen that shows one fetched value (lists, details).
class LoadState<T> extends Equatable {
  const LoadState({this.data, this.loading = true, this.error, this.stale = false});

  final T? data;
  final bool loading;
  final Object? error;

  /// Served from the offline cache.
  final bool stale;

  bool get hasData => data != null;

  @override
  List<Object?> get props => [data, loading, error, stale];
}

/// Loads a value with [loader]; [refresh] keeps the current data visible while re-fetching.
class LoadCubit<T> extends Cubit<LoadState<T>> {
  LoadCubit(this.loader) : super(LoadState<T>());

  final Future<T> Function() loader;

  Future<void> load() async {
    emit(LoadState<T>(data: state.data, loading: true, stale: state.stale));
    try {
      emit(LoadState<T>(data: await loader(), loading: false));
    } catch (e) {
      emit(LoadState<T>(data: state.data, loading: false, error: e, stale: state.stale));
    }
  }

  Future<void> refresh() => load();

  /// Local update after a mutation the screen performed itself.
  void replace(T data) => emit(LoadState<T>(data: data, loading: false));
}
