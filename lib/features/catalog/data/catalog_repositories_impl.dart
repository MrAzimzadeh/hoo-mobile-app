import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/catalog_models.dart';
import '../domain/catalog_query.dart';
import '../domain/catalog_repositories.dart';
import 'catalog_api.dart';

/// Read-through cache helper shared by the catalog repositories (cache entries are per language because product
/// content arrives translated).
class CatalogCache {
  CatalogCache(this._db, this._session);

  final AppDatabase _db;
  final SessionStore _session;

  Future<Cached<T>> fetch<T>(String key, Future<Object?> Function() fetchJson, T Function(Object? json) decode) =>
      cachedFetch(db: _db, key: key, language: _session.language, fetchJson: fetchJson, decode: decode);
}

class ProductBrowseRepositoryImpl implements ProductBrowseRepository {
  ProductBrowseRepositoryImpl(this._api, this._cache);

  final CatalogApi _api;
  final CatalogCache _cache;

  @override
  Future<Cached<ProductListPage>> products(CatalogQuery query, {int page = 1, int pageSize = CatalogQuery.defaultPageSize, CancelToken? cancelToken}) {
    Future<Object?> fetch() => _api.products(query, page: page, pageSize: pageSize, cancelToken: cancelToken);
    if (page == 1 && pageSize == CatalogQuery.defaultPageSize) {
      return _cache.fetch(query.cacheKey, fetch, _decodePage);
    }
    return fetch().then((json) => Cached(_decodePage(json), updatedAt: DateTime.now()));
  }

  static ProductListPage _decodePage(Object? json) => ProductListPage.fromJson(Decoders.map(json));
}

class TaxonomyRepositoryImpl implements TaxonomyRepository {
  TaxonomyRepositoryImpl(this._api, this._cache);

  final CatalogApi _api;
  final CatalogCache _cache;

  @override
  Future<Cached<List<Category>>> categories() => _cache.fetch('catalog.categories', _api.categories, (j) => Decoders.list(j, Category.fromJson));

  @override
  Future<Cached<List<Collection>>> collections() => _cache.fetch('catalog.collections', _api.collections, (j) => Decoders.list(j, Collection.fromJson));

  @override
  Future<Cached<List<ColorInfo>>> colors() => _cache.fetch('catalog.colors', _api.colors, (j) => Decoders.list(j, ColorInfo.fromJson));
}

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._api, this._cache);

  final CatalogApi _api;
  final CatalogCache _cache;

  @override
  Future<Cached<ProductDetail>> product(String slug) =>
      _cache.fetch('catalog.product.$slug', () => _api.product(slug), (j) => ProductDetail.fromJson(Decoders.map(j)));

  @override
  Future<Cached<Recommendations>> recommendations(String slug) =>
      _cache.fetch('catalog.recommendations.$slug', () => _api.recommendations(slug), (j) => Recommendations.fromJson(Decoders.map(j)));
}

class ReviewRepositoryImpl implements ReviewRepository {
  ReviewRepositoryImpl(this._api);

  final CatalogApi _api;

  @override
  Future<Paged<Review>> reviews(String slug, {int page = 1, int pageSize = 10}) async {
    final json = await _api.reviews(slug, page: page, pageSize: pageSize);
    return Paged<Review>.fromJson(Decoders.map(json), (e) => Review.fromJson(Decoders.map(e)));
  }

  @override
  Future<void> create(String slug, {required int rating, String? title, required String body}) => _api.createReview(slug, {
        'rating': rating,
        'title': (title?.trim().isEmpty ?? true) ? null : title!.trim(),
        'body': body.trim(),
      });
}

class ProductAlertRepositoryImpl implements ProductAlertRepository {
  ProductAlertRepositoryImpl(this._api);

  final CatalogApi _api;

  @override
  Future<void> subscribe({required String productId, required StockAlertType type, Size? size, String? colorId}) => _api.createAlert({
        'productId': productId,
        'type': type.wire,
        'size': size == null || size == Size.unknown ? null : size.wire,
        'colorId': colorId,
      });
}
