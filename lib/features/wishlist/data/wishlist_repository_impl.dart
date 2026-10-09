import '../../../core/network/api_client.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import '../domain/wishlist_models.dart';
import '../domain/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(this._api, this._db, this._session);

  final ApiClient _api;
  final AppDatabase _db;
  final SessionStore _session;

  String _id(String id) => Uri.encodeComponent(id);

  @override
  Future<List<ProductCard>> wishlist() => _api.get('/wishlist', decode: (j) => Decoders.list(j, ProductCard.fromJson));

  @override
  Future<void> add(String productId) => _api.post<Object?>('/wishlist/${_id(productId)}');

  @override
  Future<void> remove(String productId) => _api.delete<Object?>('/wishlist/${_id(productId)}');

  @override
  Future<String> share() => _api.post('/wishlist/share', decode: (j) => Decoders.map(j)['url'] as String);

  @override
  Future<SharedWishlist> shared(String token) => _api.get('/wishlist/shared/${_id(token)}', decode: (j) => SharedWishlist.fromJson(Decoders.map(j)));

  @override
  Future<Cached<List<RecentlyViewed>>> recentlyViewed() => cachedFetch(
        db: _db,
        key: 'recently-viewed:${_session.guestId ?? ''}',
        language: _session.language,
        fetchJson: () => _api.get<Object?>('/recently-viewed'),
        decode: (j) => Decoders.list(j, RecentlyViewed.fromJson),
      );

  @override
  Future<void> recordView(String productId) => _api.post<Object?>('/recently-viewed/${_id(productId)}');

  @override
  Future<void> clearRecentlyViewed() => _api.delete<Object?>('/recently-viewed');

  @override
  Future<List<StockAlert>> alerts() => _api.get('/alerts', decode: (j) => Decoders.list(j, StockAlert.fromJson));

  @override
  Future<void> deleteAlert(String id) => _api.delete<Object?>('/alerts/${_id(id)}');
}
