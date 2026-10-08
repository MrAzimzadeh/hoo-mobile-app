import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../domain/search_result.dart';

/// HTTP endpoints of the search feature (`/search/*`, `/catalog/bestsellers`).
class SearchApi {
  SearchApi(this._api);

  final ApiClient _api;

  Future<SearchResult> search(String query, {required int limit, CancelToken? cancelToken}) =>
      _api.get('/search', query: {'q': query, 'limit': limit}, cancelToken: cancelToken, decode: (json) => SearchResult.fromJson(Decoders.map(json)));

  Future<List<String>> suggest(String query, {CancelToken? cancelToken}) =>
      _api.get('/search/suggest', query: {'q': query}, cancelToken: cancelToken, decode: Decoders.strings);

  Future<List<String>> recent() => _api.get('/search/recent', decode: Decoders.strings);

  Future<void> clearRecent() => _api.delete<void>('/search/recent');

  /// Raw JSON so the repository can cache it as-is.
  Future<Object?> bestsellersJson({required int limit}) => _api.get<Object?>('/catalog/bestsellers', query: {'limit': limit});
}
