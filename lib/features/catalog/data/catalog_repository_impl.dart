import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/catalog_models.dart';
import '../domain/catalog_repository.dart';
import '../domain/product_query.dart';

/// Current content language (cache entries are per language because product content arrives translated).
typedef LanguageProvider = String Function();

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl(this._api, this._db, this._language);

  final ApiClient _api;
  final AppDatabase _db;
  final LanguageProvider _language;

  Future<Cached<T>> _cached<T>(String key, Future<Object?> Function() fetch, T Function(Object? json) decode) =>
      cachedFetch(db: _db, key: key, language: _language(), fetchJson: fetch, decode: decode);

  @override
  Future<Cached<List<CatalogCategory>>> categories() =>
      _cached('catalog.categories', () => _api.get<Object?>('/catalog/categories'), (j) => Decoders.list(j, CatalogCategory.fromJson));

  @override
  Future<Cached<List<CatalogCollection>>> collections() =>
      _cached('catalog.collections', () => _api.get<Object?>('/catalog/collections'), (j) => Decoders.list(j, CatalogCollection.fromJson));

  @override
  Future<Cached<List<ColorInfo>>> colors() =>
      _cached('catalog.colors', () => _api.get<Object?>('/catalog/colors'), (j) => Decoders.list(j, ColorInfo.fromJson));

  @override
  Future<Cached<ProductList>> products(ProductQuery query, {int page = 1, int pageSize = 24, CancelToken? cancelToken}) async {
    Future<Object?> fetch() => _api.get<Object?>(
      '/catalog/products',
      query: query.toQuery(page: page, pageSize: pageSize),
      cancelToken: cancelToken,
    );
    ProductList decode(Object? j) => ProductList.fromJson(Decoders.map(j));
    if (page != 1) return Cached(decode(await fetch()));
    return _cached(query.cacheKey(pageSize), fetch, decode);
  }
}

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._api, this._db, this._language);

  final ApiClient _api;
  final AppDatabase _db;
  final LanguageProvider _language;

  static String _slug(String slug) => Uri.encodeComponent(slug);

  @override
  Future<Cached<ProductDetail>> product(String slug) => cachedFetch(
    db: _db,
    key: 'catalog.product.$slug',
    language: _language(),
    fetchJson: () => _api.get<Object?>('/catalog/products/${_slug(slug)}'),
    decode: (j) => ProductDetail.fromJson(Decoders.map(j)),
  );

  @override
  Future<Recommendations> recommendations(String slug) =>
      _api.get('/catalog/products/${_slug(slug)}/recommendations', decode: (j) => Recommendations.fromJson(Decoders.map(j)));

  @override
  Future<Paged<Review>> reviews(String slug, {int page = 1, int pageSize = 10}) => _api.get(
    '/catalog/products/${_slug(slug)}/reviews',
    query: {'page': page, 'pageSize': pageSize},
    decode: (j) => Paged.fromJson(Decoders.map(j), (e) => Review.fromJson((e as Map).cast<String, dynamic>())),
  );

  @override
  Future<String> writeReview(String slug, {required int rating, String? title, required String body}) => _api.post(
    '/catalog/products/${_slug(slug)}/reviews',
    body: {'rating': rating, 'title': (title?.trim().isEmpty ?? true) ? null : title!.trim(), 'body': body.trim()},
    decode: (j) => j is Map ? '${j['id'] ?? ''}' : '${j ?? ''}',
  );

  @override
  Future<void> createAlert({required String productId, required StockAlertType type, Size? size, String? colorId}) =>
      _api.post<void>('/alerts', body: {'productId': productId, 'type': type.wire, 'size': size?.wire, 'colorId': colorId}, decode: (_) {});
}
