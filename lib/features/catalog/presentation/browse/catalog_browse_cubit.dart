import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_query.dart';
import '../../domain/catalog_repositories.dart';

enum BrowseStatus { loading, ready, failure }

class CatalogBrowseState extends Equatable {
  const CatalogBrowseState({
    required this.query,
    required this.scope,
    this.status = BrowseStatus.loading,
    this.items = const [],
    this.facets = const ProductFacets(),
    this.totalCount = 0,
    this.page = 0,
    this.hasMore = false,
    this.loadingMore = false,
    this.error,
    this.loadMoreError,
    this.stale = false,
  });

  final CatalogQuery query;

  /// Preset, non-removable part of the query (CatalogList opened for a category / collection / chip).
  final CatalogQuery scope;
  final BrowseStatus status;
  final List<ProductCard> items;
  final ProductFacets facets;
  final int totalCount;

  /// Last page loaded (0 before the first response).
  final int page;
  final bool hasMore;
  final bool loadingMore;
  final Object? error;
  final Object? loadMoreError;

  /// Offline: the cached first page is shown read-only.
  final bool stale;

  bool get isEmpty => status == BrowseStatus.ready && items.isEmpty;
  bool get canLoadMore => status == BrowseStatus.ready && hasMore && !loadingMore && !stale && loadMoreError == null;

  List<ActiveFilter> get activeFilters =>
      query.activeFilters(includeCategory: scope.category == null, includeCollection: scope.collection == null);

  CatalogBrowseState copyWith({
    CatalogQuery? query,
    BrowseStatus? status,
    List<ProductCard>? items,
    ProductFacets? facets,
    int? totalCount,
    int? page,
    bool? hasMore,
    bool? loadingMore,
    Object? Function()? error,
    Object? Function()? loadMoreError,
    bool? stale,
  }) =>
      CatalogBrowseState(
        query: query ?? this.query,
        scope: scope,
        status: status ?? this.status,
        items: items ?? this.items,
        facets: facets ?? this.facets,
        totalCount: totalCount ?? this.totalCount,
        page: page ?? this.page,
        hasMore: hasMore ?? this.hasMore,
        loadingMore: loadingMore ?? this.loadingMore,
        error: error == null ? this.error : error(),
        loadMoreError: loadMoreError == null ? this.loadMoreError : loadMoreError(),
        stale: stale ?? this.stale,
      );

  @override
  List<Object?> get props => [query, scope, status, items, facets, totalCount, page, hasMore, loadingMore, error, loadMoreError, stale];
}

/// Product grid state: query (filters, chip, sort) → first page, infinite scroll, pull-to-refresh.
///
/// Every query change cancels the in-flight request and bumps a generation counter, so a slow response for an
/// old filter can never overwrite the results of a newer one.
class CatalogBrowseCubit extends Cubit<CatalogBrowseState> {
  CatalogBrowseCubit(this._repo, {CatalogQuery scope = const CatalogQuery()}) : super(CatalogBrowseState(query: scope, scope: scope));

  final ProductBrowseRepository _repo;
  CancelToken? _token;
  int _generation = 0;

  /// First load (shows skeletons).
  Future<void> load() async {
    emit(state.copyWith(status: BrowseStatus.loading, items: const [], error: () => null, loadMoreError: () => null, page: 0, hasMore: false));
    await _fetchFirst();
  }

  /// Pull-to-refresh: keeps the current grid until the fresh page arrives. Resolves with the error when the
  /// refresh failed but the previous grid stayed on screen (the UI shows it as a toast).
  Future<ApiException?> refresh() async {
    if (state.status != BrowseStatus.ready) {
      await load();
      return null;
    }
    return _fetchFirst();
  }

  /// Applies a new query (chip, sort, filter sheet, chip removal). No-op if nothing changed.
  Future<void> updateQuery(CatalogQuery query) {
    if (query == state.query) return Future.value();
    emit(state.copyWith(query: query));
    return load();
  }

  Future<void> setChip(ProductChip chip) => updateQuery(state.query.copyWith(chip: chip));
  Future<void> setSort(ProductSort sort) => updateQuery(state.query.copyWith(sort: sort));
  Future<void> setCategory(String? slug) => updateQuery(state.query.withCategory(slug));
  Future<void> removeFilter(ActiveFilter filter) => updateQuery(state.query.without(filter));
  Future<void> clearFilters() => updateQuery(state.query.cleared(scope: state.scope));

  Future<void> loadMore() async {
    if (!state.canLoadMore) return;
    final generation = _generation;
    final token = _token = CancelToken();
    emit(state.copyWith(loadingMore: true, loadMoreError: () => null));
    try {
      final result = await _repo.products(state.query, page: state.page + 1, cancelToken: token);
      if (generation != _generation || isClosed) return;
      final page = result.data;
      final known = {for (final p in state.items) p.id};
      emit(state.copyWith(
        items: [...state.items, ...page.items.where((p) => !known.contains(p.id))],
        page: page.page,
        hasMore: page.hasMore,
        totalCount: page.totalCount,
        loadingMore: false,
      ));
    } on ApiException catch (e) {
      if (e.isCancelled || generation != _generation || isClosed) return;
      emit(state.copyWith(loadingMore: false, loadMoreError: () => e));
    }
  }

  /// Retry after a failed "load more".
  Future<void> retryLoadMore() {
    emit(state.copyWith(loadMoreError: () => null));
    return loadMore();
  }

  Future<ApiException?> _fetchFirst() async {
    _token?.cancel();
    final generation = ++_generation;
    final token = _token = CancelToken();
    try {
      final result = await _repo.products(state.query, cancelToken: token);
      if (generation != _generation || isClosed) return null;
      final page = result.data;
      emit(state.copyWith(
        status: BrowseStatus.ready,
        items: page.items,
        facets: page.facets,
        totalCount: page.totalCount,
        page: page.page,
        hasMore: page.hasMore,
        loadingMore: false,
        stale: result.stale,
        error: () => null,
        loadMoreError: () => null,
      ));
      return null;
    } on ApiException catch (e) {
      if (e.isCancelled || generation != _generation || isClosed) return null;
      // `load()` clears the grid, so items on screen here means a pull-to-refresh of the same query: keep them.
      if (state.items.isNotEmpty) return e;
      emit(state.copyWith(status: BrowseStatus.failure, error: () => e, loadingMore: false));
      return null;
    }
  }

  @override
  Future<void> close() {
    _token?.cancel();
    return super.close();
  }
}
