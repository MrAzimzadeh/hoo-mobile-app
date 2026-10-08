part of 'search_bloc.dart';

/// What the page body shows.
enum SearchView {
  /// Empty field: recent searches + bestsellers.
  idle,

  /// Typing: autocomplete suggestions.
  suggestions,

  /// A submitted query: the results grid (or the empty state with bestsellers).
  results,
}

enum SearchStatus { initial, loading, success, failure }

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    /// The text currently in the field.
    @Default('') String query,
    @Default(SearchView.idle) SearchView view,
    @Default(<String>[]) List<String> recent,
    @Default(<String>[]) List<String> suggestions,
    @Default(<ProductCard>[]) List<ProductCard> bestsellers,
    @Default(SearchStatus.initial) SearchStatus bestsellersStatus,
    Object? bestsellersError,

    /// Bestsellers came from the offline cache.
    @Default(false) bool bestsellersStale,

    /// The query the results belong to.
    @Default('') String submittedQuery,
    @Default(SearchStatus.initial) SearchStatus resultsStatus,
    SearchResult? result,

    /// Requested `limit` of the current result (the API is not paged: "load more" asks for a bigger limit).
    @Default(SearchBloc.pageSize) int limit,
    @Default(false) bool loadingMore,

    /// Why the last search failed (rendered by the error state).
    Object? error,

    /// One-shot failure of a secondary action (clear recent, load more) — shown as a toast. [actionErrorId]
    /// changes with every new failure so listeners fire even for equal errors.
    Object? actionError,
    @Default(0) int actionErrorId,
  }) = _SearchState;

  List<ProductCard> get items => result?.items ?? const [];

  /// More results can be requested: the last page was full and the server limit is not reached yet.
  bool get canLoadMore => resultsStatus == SearchStatus.success && !loadingMore && limit < SearchRepository.maxLimit && items.length >= limit;

  bool get hasNoResults => resultsStatus == SearchStatus.success && items.isEmpty;
}
