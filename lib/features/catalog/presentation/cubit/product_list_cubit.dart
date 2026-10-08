import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repository.dart';
import '../../domain/product_query.dart';

enum ProductListStatus { initial, loading, success, failure }

class ProductListState extends Equatable {
  const ProductListState({
    this.query = const ProductQuery(),
    this.status = ProductListStatus.initial,
    this.items = const [],
    this.facets = const ProductFacets(),
    this.totalCount = 0,
    this.page = 0,
    this.hasMore = false,
    this.loadingMore = false,
    this.loadMoreError,
    this.error,
    this.stale = false,
    this.categories = const [],
    this.collections = const [],
    this.palette = const {},
  });

  final ProductQuery query;
  final ProductListStatus status;
  final List<ProductCard> items;

  /// Facets of the current scope (drive the filter sheet).
  final ProductFacets facets;
  final int totalCount;
  final int page;
  final bool hasMore;
  final bool loadingMore;
  final Object? loadMoreError;
  final Object? error;

  /// Served from the offline cache → read-only banner, no paging.
  final bool stale;

  /// Top-level categories (Shop tabs) and collections (filter sheet).
  final List<CatalogCategory> categories;
  final List<CatalogCollection> collections;

  /// Color code → hex, for color facet swatches.
  final Map<String, String> palette;

  bool get isEmpty => status == ProductListStatus.success && items.isEmpty;

  /// Refreshing filters keeps the previous grid visible under a subtle progress indicator.
  bool get isRefreshing => status == ProductListStatus.loading && items.isNotEmpty;

  ProductListState copyWith({
    ProductQuery? query,
    ProductListStatus? status,
    List<ProductCard>? items,
    ProductFacets? facets,
    int? totalCount,
    int? page,
    bool? hasMore,
    bool? loadingMore,
    Object? loadMoreError = _keep,
    Object? error = _keep,
    bool? stale,
    List<CatalogCategory>? categories,
    List<CatalogCollection>? collections,
    Map<String, String>? palette,
  }) => ProductListState(
    query: query ?? this.query,
    status: status ?? this.status,
    items: items ?? this.items,
    facets: facets ?? this.facets,
    totalCount: totalCount ?? this.totalCount,
    page: page ?? this.page,
    hasMore: hasMore ?? this.hasMore,
    loadingMore: loadingMore ?? this.loadingMore,
    loadMoreError: identical(loadMoreError, _keep) ? this.loadMoreError : loadMoreError,
    error: identical(error, _keep) ? this.error : error,
    stale: stale ?? this.stale,
    categories: categories ?? this.categories,
    collections: collections ?? this.collections,
    palette: palette ?? this.palette,
  );

  @override
  List<Object?> get props => [
    query,
    status,
    items,
    facets,
    totalCount,
    page,
    hasMore,
    loadingMore,
    loadMoreError,
    error,
    stale,
    categories,
    collections,
    palette,
  ];
}

const _keep = Object();

/// Shop tab and catalog lists: scope + filters + sort → paged grid. A filter change cancels the in-flight request
/// and drops late responses, so the grid always matches the visible chips.
class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this._repo, {ProductQuery initial = const ProductQuery(), this.pageSize = 24}) : super(ProductListState(query: initial));

  final CatalogRepository _repo;
  final int pageSize;
  CancelToken? _token;
  int _generation = 0;

  /// First load: products + taxonomy (taxonomy failures are non-fatal — tabs/sections just stay hidden).
  Future<void> load() async {
    unawaited(_loadTaxonomy());
    await _fetchFirstPage();
  }

  Future<void> refresh() => _fetchFirstPage();

  Future<void> apply(ProductQuery query) async {
    if (query == state.query && state.status == ProductListStatus.success) return;
    emit(state.copyWith(query: query));
    await _fetchFirstPage();
  }

  Future<void> setCategory(String? slug) => apply(state.query.copyWith(category: slug));
  Future<void> setChip(ProductChip chip) => apply(state.query.copyWith(chip: chip));
  Future<void> setSort(ProductSort sort) => apply(state.query.copyWith(sort: sort));
  Future<void> clearFilters() => apply(state.query.cleared());

  Future<void> removeSize(String v) => apply(state.query.copyWith(sizes: {...state.query.sizes}..remove(v)));
  Future<void> removeColor(String v) => apply(state.query.copyWith(colors: {...state.query.colors}..remove(v)));
  Future<void> removeFit(String v) => apply(state.query.copyWith(fits: {...state.query.fits}..remove(v)));
  Future<void> removePrice() => apply(state.query.copyWith(minPrice: null, maxPrice: null));
  Future<void> removeInStockOnly() => apply(state.query.copyWith(inStockOnly: false));

  Future<void> loadMore() async {
    final s = state;
    if (!s.hasMore || s.loadingMore || s.stale || s.status != ProductListStatus.success) return;
    final generation = _generation;
    emit(s.copyWith(loadingMore: true, loadMoreError: null));
    try {
      final next = await _repo.products(s.query, page: s.page + 1, pageSize: pageSize, cancelToken: _token);
      if (generation != _generation || isClosed) return;
      final seen = state.items.map((p) => p.id).toSet();
      emit(
        state.copyWith(
          items: [...state.items, ...next.data.items.where((p) => !seen.contains(p.id))],
          page: next.data.page,
          hasMore: next.data.hasMore,
          totalCount: next.data.totalCount,
          loadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      if (generation != _generation || isClosed || e.isCancelled) return;
      emit(state.copyWith(loadingMore: false, loadMoreError: e));
    }
  }

  Future<void> _fetchFirstPage() async {
    _token?.cancel();
    final token = _token = CancelToken();
    final generation = ++_generation;
    emit(state.copyWith(status: ProductListStatus.loading, error: null, loadMoreError: null, loadingMore: false));
    try {
      final r = await _repo.products(state.query, pageSize: pageSize, cancelToken: token);
      if (generation != _generation || isClosed) return;
      emit(
        state.copyWith(
          status: ProductListStatus.success,
          items: r.data.items,
          facets: r.data.facets,
          totalCount: r.data.totalCount,
          page: r.data.page,
          hasMore: r.data.hasMore,
          stale: r.stale,
        ),
      );
    } on ApiException catch (e) {
      if (generation != _generation || isClosed || e.isCancelled) return;
      emit(state.copyWith(status: ProductListStatus.failure, error: e));
    }
  }

  Future<void> _loadTaxonomy() async {
    Future<T?> safe<T>(Future<T> f) async {
      try {
        return await f;
      } on ApiException {
        return null;
      }
    }

    final results = await Future.wait([safe(_repo.categories()), safe(_repo.collections()), safe(_repo.colors())]);
    if (isClosed) return;
    final cats = (results[0]?.data as List<CatalogCategory>?) ?? const <CatalogCategory>[];
    final cols = (results[1]?.data as List<CatalogCollection>?) ?? const <CatalogCollection>[];
    final palette = (results[2]?.data as List<ColorInfo>?) ?? const <ColorInfo>[];
    emit(state.copyWith(categories: cats.where((c) => c.parentId == null).toList(), collections: cols, palette: {for (final c in palette) c.code: c.hex}));
  }

  @override
  Future<void> close() {
    _token?.cancel();
    return super.close();
  }
}
