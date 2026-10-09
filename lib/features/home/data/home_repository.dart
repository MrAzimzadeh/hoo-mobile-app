import '../../../core/error/api_exception.dart';
import '../../../core/network/api_client.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import '../domain/home_models.dart';

/// Loads the home sections in parallel. Each section degrades independently; the whole feed is cached for offline.
class HomeRepository {
  HomeRepository(this._api, this._db, this._session);

  final ApiClient _api;
  final AppDatabase _db;
  final SessionStore _session;

  static const _key = 'home.feed';

  Future<Cached<HomeFeed>> feed() async {
    try {
      final r = await Future.wait<Object?>([
        _api.get<Object?>('/catalog/new-arrivals', query: {'limit': 10}),
        _api.get<Object?>('/catalog/bestsellers', query: {'limit': 10}),
        _optional(() => _api.get<Object?>('/catalog/categories')),
        _optional(() => _api.get<Object?>('/catalog/collections')),
        _optional(() => _api.get<Object?>('/catalog/looks')),
        _optional(() => _api.get<Object?>('/recently-viewed')),
      ]);
      final feed = HomeFeed(
        newArrivals: Decoders.list(r[0], ProductCard.fromJson),
        bestsellers: Decoders.list(r[1], ProductCard.fromJson),
        categories: Decoders.list(r[2], HomeCategory.fromJson).where((c) => c.parentId == null).toList(),
        collections: Decoders.list(r[3], HomeCollection.fromJson),
        looks: Decoders.list(r[4], Look.fromJson),
        recentlyViewed: Decoders.list(r[5], (m) => ProductCard.fromJson((m['product'] as Map).cast<String, dynamic>())),
      );
      await _db.putCache(_key, feed.toJson(), language: _session.language);
      return Cached(feed, updatedAt: DateTime.now());
    } on ApiException catch (e) {
      if (!e.isNetwork) rethrow;
      final hit = await _db.readCache(_key, language: _session.language);
      if (hit == null) rethrow;
      return Cached(HomeFeed.fromJson(Decoders.map(hit.value)), stale: true, updatedAt: hit.updatedAt);
    }
  }

  /// Secondary sections never break the page.
  Future<Object?> _optional(Future<Object?> Function() call) async {
    try {
      return await call();
    } on ApiException catch (e) {
      if (e.isNetwork) rethrow;
      return const <Object?>[];
    }
  }
}
