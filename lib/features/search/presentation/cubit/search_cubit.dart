import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/design_system/tokens/hoo_tokens.dart';
import '../../../../shared/domain/models.dart';
import '../../data/search_repository.dart';

class SearchState extends Equatable {
  const SearchState({this.text = '', this.suggestions = const [], this.recent = const [], this.result, this.searching = false, this.error, this.bestsellers = const []});

  final String text;
  final List<String> suggestions;
  final List<String> recent;
  final SearchResult? result;
  final bool searching;
  final Object? error;
  final List<ProductCard> bestsellers;

  SearchState copyWith({
    String? text,
    List<String>? suggestions,
    List<String>? recent,
    SearchResult? Function()? result,
    bool? searching,
    Object? Function()? error,
    List<ProductCard>? bestsellers,
  }) =>
      SearchState(
        text: text ?? this.text,
        suggestions: suggestions ?? this.suggestions,
        recent: recent ?? this.recent,
        result: result == null ? this.result : result(),
        searching: searching ?? this.searching,
        error: error == null ? this.error : error(),
        bestsellers: bestsellers ?? this.bestsellers,
      );

  @override
  List<Object?> get props => [text, suggestions, recent, result, searching, error, bestsellers];
}

/// Typing → debounced suggestions (stale requests cancelled); submit → results. Recent searches when empty.
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._repo) : super(const SearchState());

  final SearchRepository _repo;
  Timer? _debounce;
  CancelToken? _suggestToken;
  CancelToken? _searchToken;

  Future<void> init([String? query]) async {
    unawaited(_loadRecent());
    if (query != null && query.trim().isNotEmpty) await submit(query);
  }

  Future<void> _loadRecent() async {
    try {
      final recent = await _repo.recent();
      emit(state.copyWith(recent: recent));
    } catch (_) {}
  }

  void typed(String text) {
    emit(state.copyWith(text: text, result: () => null, error: () => null));
    _debounce?.cancel();
    _suggestToken?.cancel();
    if (text.trim().length < 2) {
      emit(state.copyWith(suggestions: const []));
      return;
    }
    _debounce = Timer(HooDurations.searchDebounce, () async {
      final token = _suggestToken = CancelToken();
      try {
        final s = await _repo.suggest(text.trim(), cancelToken: token);
        if (!token.isCancelled && !isClosed) emit(state.copyWith(suggestions: s));
      } on ApiException {
        // suggestions are best-effort
      }
    });
  }

  Future<void> submit(String query) async {
    final q = query.trim();
    if (q.isEmpty) return;
    _debounce?.cancel();
    _suggestToken?.cancel();
    _searchToken?.cancel();
    final token = _searchToken = CancelToken();
    emit(state.copyWith(text: q, searching: true, error: () => null, suggestions: const []));
    try {
      final r = await _repo.search(q, cancelToken: token);
      if (token.isCancelled) return;
      emit(state.copyWith(result: () => r, searching: false, recent: [q, ...state.recent.where((x) => x != q)].take(10).toList()));
      if (r.items.isEmpty && state.bestsellers.isEmpty) {
        final best = await _repo.bestsellers().catchError((Object _) => <ProductCard>[]);
        if (!isClosed) emit(state.copyWith(bestsellers: best));
      }
    } on ApiException catch (e) {
      if (e.isCancelled) return;
      emit(state.copyWith(searching: false, error: () => e));
    }
  }

  Future<void> clearRecent() async {
    final before = state.recent;
    emit(state.copyWith(recent: const []));
    try {
      await _repo.clearRecent();
    } catch (_) {
      emit(state.copyWith(recent: before));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _suggestToken?.cancel();
    _searchToken?.cancel();
    return super.close();
  }
}
