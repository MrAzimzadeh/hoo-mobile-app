import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../domain/catalog_query.dart';

/// HTTP surface of the catalog feature. Returns raw JSON so repositories can cache the exact server response;
/// decoding happens in the repositories.
class CatalogApi {
  CatalogApi(this._api);

  final ApiClient _api;

  Future<Object?> categories() => _api.get<Object?>('/catalog/categories');
  Future<Object?> collections() => _api.get<Object?>('/catalog/collections');
  Future<Object?> colors() => _api.get<Object?>('/catalog/colors');

  Future<Object?> products(CatalogQuery query, {required int page, required int pageSize, CancelToken? cancelToken}) =>
      _api.get<Object?>('/catalog/products', query: query.toParams(page: page, pageSize: pageSize), cancelToken: cancelToken);

  Future<Object?> product(String slug) => _api.get<Object?>('/catalog/products/${Uri.encodeComponent(slug)}');

  Future<Object?> recommendations(String slug) => _api.get<Object?>('/catalog/products/${Uri.encodeComponent(slug)}/recommendations');

  Future<Object?> reviews(String slug, {required int page, required int pageSize}) =>
      _api.get<Object?>('/catalog/products/${Uri.encodeComponent(slug)}/reviews', query: {'page': page, 'pageSize': pageSize});

  Future<void> createReview(String slug, Map<String, dynamic> body) =>
      _api.post<Object?>('/catalog/products/${Uri.encodeComponent(slug)}/reviews', body: body);

  Future<void> createAlert(Map<String, dynamic> body) => _api.post<Object?>('/alerts', body: body);
}
