import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/design_system/tokens/hoo_tokens.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/search_repository.dart';
import '../../domain/search_result.dart';
import 'event_transformers.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

/// Full-screen search: suggestions while typing (debounced, stale requests cancelled), recent searches,
/// results with "load more", and bestsellers for the idle/empty states.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._search, this._discovery, {Duration debounce = HooDurations.searchDebounce}) : super(const SearchState()) {
    on<SearchStarted>(_onStarted);
    on<SearchQueryChanged>(_onQueryChanged);
    on<_SuggestionsRequested>(_onSuggestionsRequested, transformer: debounceRestartable(debounce));
    on<SearchSubmitted>(_onSubmitted, transformer: restartable());
    on<SearchRetried>(_onRetried);
    on<SearchMoreRequested>(_onMoreRequested, transformer: droppable());
    on<SearchRecentCleared>(_onRecentCleared, transformer: droppable());
  }

  static const pageSize = 24;
  static const _maxRecent = 10;

  final SearchRepository _search;
  final SearchDiscoveryRepository _discovery;

  CancelToken? _suggestToken;
  CancelToken? _searchToken;

  Future<void> _onStarted(SearchStarted event, Emitter<SearchState> emit) async {
    final initial = event.initialQuery?.trim() ?? '';
    if (initial.isNotEmpty) add(SearchSubmitted(initial));
    emit(state.copyWith(bestsellersStatus: SearchStatus.loading));
    await Future.wait([_loadRecent(emit), _loadBestsellers(emit)]);
  }

  Future<void> _loadRecent(Emitter<SearchState> emit) async {
    try {
      final recent = await _search.recent();
      if (!emit.isDone) emit(state.copyWith(recent: recent));
    } on ApiException {
      // Recent searches are a convenience — the page works without them.
    }
  }

  Future<void> _loadBestsellers(Emitter<SearchState> emit) async {
    try {
      final cached = await _discovery.bestsellers();
      if (!emit.isDone) {
        emit(state.copyWith(bestsellers: cached.data, bestsellersStale: cached.stale, bestsellersStatus: SearchStatus.success, bestsellersError: null));
      }
    } on ApiException catch (e) {
      if (!emit.isDone) emit(state.copyWith(bestsellersStatus: SearchStatus.failure, bestsellersError: e));
    }
  }

  void _onQueryChanged(SearchQueryChanged event, Emitter<SearchState> emit) {
    final text = event.text;
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      _suggestToken?.cancel();
      // An empty field goes back to recent searches; results stay only while their query is shown.
      emit(state.copyWith(query: text, view: SearchView.idle, suggestions: const []));
      add(const _SuggestionsRequested(''));
      return;
    }
    if (trimmed == state.submittedQuery && state.resultsStatus != SearchStatus.initial) {
      _suggestToken?.cancel();
      emit(state.copyWith(query: text, view: SearchView.results));
      return;
    }
    emit(state.copyWith(query: text, view: SearchView.suggestions));
    add(_SuggestionsRequested(trimmed));
  }

  Future<void> _onSuggestionsRequested(_SuggestionsRequested event, Emitter<SearchState> emit) async {
    _suggestToken?.cancel();
    if (event.text.isEmpty) return;
    final token = _suggestToken = CancelToken();
    try {
      final suggestions = await _search.suggest(event.text, cancelToken: token);
      // Ignore answers for text that is no longer in the field (or a view that moved on).
      if (emit.isDone || state.view != SearchView.suggestions || state.query.trim() != event.text) return;
      emit(state.copyWith(suggestions: suggestions));
    } on ApiException {
      // Cancelled or failed: keep the previous suggestions; the user can still submit.
    }
  }

  Future<void> _onSubmitted(SearchSubmitted event, Emitter<SearchState> emit) async {
    final query = event.text.trim();
    if (query.isEmpty) return;
    _suggestToken?.cancel();
    emit(
      state.copyWith(
        query: query,
        view: SearchView.results,
        submittedQuery: query,
        resultsStatus: SearchStatus.loading,
        result: null,
        limit: pageSize,
        loadingMore: false,
        error: null,
        suggestions: const [],
        recent: _withRecent(state.recent, query),
      ),
    );
    await _runSearch(query, pageSize, emit);
  }

  Future<void> _onRetried(SearchRetried event, Emitter<SearchState> emit) async {
    if (state.submittedQuery.isEmpty) {
      emit(state.copyWith(bestsellersStatus: SearchStatus.loading));
      await _loadBestsellers(emit);
      return;
    }
    add(SearchSubmitted(state.submittedQuery));
  }

  Future<void> _runSearch(String query, int limit, Emitter<SearchState> emit) async {
    _searchToken?.cancel();
    final token = _searchToken = CancelToken();
    try {
      final result = await _search.search(query, limit: limit, cancelToken: token);
      if (emit.isDone || state.submittedQuery != query) return;
      emit(state.copyWith(resultsStatus: SearchStatus.success, result: result, limit: limit, error: null));
      // Nothing found → the empty state shows bestsellers; make sure they are there.
      if (result.items.isEmpty && state.bestsellersStatus == SearchStatus.failure) {
        emit(state.copyWith(bestsellersStatus: SearchStatus.loading));
        await _loadBestsellers(emit);
      }
    } on ApiException catch (e) {
      if (e.isCancelled || emit.isDone || state.submittedQuery != query) return;
      emit(state.copyWith(resultsStatus: SearchStatus.failure, error: e));
    }
  }

  Future<void> _onMoreRequested(SearchMoreRequested event, Emitter<SearchState> emit) async {
    if (!state.canLoadMore) return;
    final query = state.submittedQuery;
    final next = (state.limit + pageSize).clamp(pageSize, SearchRepository.maxLimit);
    emit(state.copyWith(loadingMore: true));
    final token = _searchToken = CancelToken();
    try {
      // TODO(backend): `GET /search` has no paging (only `limit`, max 48) — page/pageSize would allow real paging.
      final result = await _search.search(query, limit: next, cancelToken: token);
      if (emit.isDone || state.submittedQuery != query) return;
      emit(state.copyWith(result: result, limit: next, loadingMore: false));
    } on ApiException catch (e) {
      if (emit.isDone || state.submittedQuery != query) return;
      emit(
        state.copyWith(
          loadingMore: false,
          actionError: e.isCancelled ? state.actionError : e,
          actionErrorId: e.isCancelled ? state.actionErrorId : state.actionErrorId + 1,
        ),
      );
    }
  }

  Future<void> _onRecentCleared(SearchRecentCleared event, Emitter<SearchState> emit) async {
    final previous = state.recent;
    if (previous.isEmpty) return;
    emit(state.copyWith(recent: const []));
    try {
      await _search.clearRecent();
    } on ApiException catch (e) {
      emit(state.copyWith(recent: previous, actionError: e, actionErrorId: state.actionErrorId + 1));
    }
  }

  /// Mirrors what the server does on `GET /search` (push to front, dedupe, keep 10) so the list is current
  /// without another request.
  static List<String> _withRecent(List<String> recent, String query) {
    final normalized = query.toLowerCase();
    return [normalized, ...recent.where((r) => r.toLowerCase() != normalized)].take(_maxRecent).toList();
  }

  @override
  Future<void> close() {
    _suggestToken?.cancel();
    _searchToken?.cancel();
    return super.close();
  }
}
