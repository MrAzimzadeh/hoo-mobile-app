import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/domain/models.dart';

/// `GET /search` result.
class SearchResult {
  const SearchResult({required this.query, required this.items, required this.totalCount, required this.suggestDesignYourOwn});

  factory SearchResult.fromJson(Map<String, dynamic> j) => SearchResult(
        query: j['query'] as String? ?? '',
        items: Decoders.list(j['items'], ProductCard.fromJson),
        totalCount: (j['totalCount'] as num?)?.toInt() ?? 0,
        suggestDesignYourOwn: j['suggestDesignYourOwn'] as bool? ?? false,
      );

  final String query;
  final List<ProductCard> items;
  final int totalCount;

  /// "Didn't find it? Design your own black hoodie in 3D."
  final bool suggestDesignYourOwn;
}

class SearchRepository {
  SearchRepository(this._api);
  final ApiClient _api;

  Future<List<String>> suggest(String q, {CancelToken? cancelToken}) =>
      _api.get('/search/suggest', query: {'q': q}, decode: Decoders.strings, cancelToken: cancelToken);

  Future<List<String>> recent() => _api.get('/search/recent', decode: Decoders.strings);

  Future<void> clearRecent() => _api.delete<Object?>('/search/recent');

  Future<SearchResult> search(String q, {CancelToken? cancelToken}) =>
      _api.get('/search', query: {'q': q, 'limit': 48}, decode: (j) => SearchResult.fromJson(Decoders.map(j)), cancelToken: cancelToken);

  Future<List<ProductCard>> bestsellers() => _api.get('/catalog/bestsellers', query: {'limit': 8}, decode: (j) => Decoders.list(j, ProductCard.fromJson));
}
