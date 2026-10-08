import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import '../domain/search_repository.dart';
import '../domain/search_result.dart';
import 'search_api.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this._api);

  final SearchApi _api;

  @override
  Future<SearchResult> search(String query, {int limit = 24, CancelToken? cancelToken}) =>
      _api.search(query.trim(), limit: limit.clamp(1, SearchRepository.maxLimit), cancelToken: cancelToken);

  @override
  Future<List<String>> suggest(String query, {CancelToken? cancelToken}) async {
    final q = query.trim();
    // The server answers [] below two characters — skip the round trip.
    if (q.length < 2) return const [];
    return _api.suggest(q, cancelToken: cancelToken);
  }

  @override
  Future<List<String>> recent() => _api.recent();

  @override
  Future<void> clearRecent() => _api.clearRecent();
}

class SearchDiscoveryRepositoryImpl implements SearchDiscoveryRepository {
  SearchDiscoveryRepositoryImpl(this._api, this._db, this._language);

  final SearchApi _api;
  final AppDatabase _db;

  /// Current content language (cache entries are per language: product names arrive translated).
  final String Function() _language;

  @override
  Future<Cached<List<ProductCard>>> bestsellers({int limit = 8}) => cachedFetch(
    db: _db,
    key: 'search.bestsellers.$limit',
    language: _language(),
    fetchJson: () => _api.bestsellersJson(limit: limit),
    decode: (json) => Decoders.list(json, ProductCard.fromJson),
  );
}
