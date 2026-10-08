import 'package:dio/dio.dart';

import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import 'search_result.dart';

/// Full-text search, autocomplete and the per-user/per-device recent searches (kept server-side for 30 days).
abstract interface class SearchRepository {
  /// Server maximum for `limit` (`SearchService` clamps to 1..48).
  static const maxLimit = 48;

  /// `GET /search?q=&limit=`. The server also records [query] in the recent searches.
  Future<SearchResult> search(String query, {int limit = 24, CancelToken? cancelToken});

  /// `GET /search/suggest?q=` — empty for queries shorter than two characters.
  Future<List<String>> suggest(String query, {CancelToken? cancelToken});

  /// `GET /search/recent` (most recent first).
  Future<List<String>> recent();

  /// `DELETE /search/recent`.
  Future<void> clearRecent();
}

/// Products shown when there is nothing to search yet or nothing was found.
abstract interface class SearchDiscoveryRepository {
  /// `GET /catalog/bestsellers` — cached for offline use (stale when served from cache).
  Future<Cached<List<ProductCard>>> bestsellers({int limit = 8});
}
