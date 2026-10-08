import '../../../core/network/api_client.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../domain/cart_models.dart';
import '../domain/cart_repository.dart';

/// [CartRepository] over [ApiClient]. The last good bag is cached so the Bag tab can render read-only offline.
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._api, this._db, this._session);

  final ApiClient _api;
  final AppDatabase _db;
  final SessionStore _session;

  static const _cacheKey = 'cart';

  @override
  Future<Cached<Cart>> fetch() =>
      cachedFetch<Cart>(db: _db, key: _cacheKey, language: _session.language, fetchJson: () => _api.get<Object?>('/cart'), decode: _decode);

  @override
  Future<Cart> addVariant(String variantId, int quantity) =>
      _mutate(() => _api.post<Object?>('/cart/items', body: {'variantId': variantId, 'quantity': quantity}));

  @override
  Future<Cart> addDesign(String designId, int quantity) => _mutate(() => _api.post<Object?>('/cart/items', body: {'designId': designId, 'quantity': quantity}));

  @override
  Future<Cart> updateQuantity(String itemId, int quantity) => _mutate(() => _api.patch<Object?>('/cart/items/$itemId', body: {'quantity': quantity}));

  @override
  Future<Cart> remove(String itemId) => _mutate(() => _api.delete<Object?>('/cart/items/$itemId'));

  @override
  Future<Cart> applyPromo(String code) => _mutate(() => _api.put<Object?>('/cart/promo', body: {'code': code.trim()}));

  @override
  Future<Cart> removePromo() => _mutate(() => _api.delete<Object?>('/cart/promo'));

  @override
  Future<Cart> setGift(bool isGift) => _mutate(() => _api.put<Object?>('/cart/gift', body: {'isGift': isGift}));

  Future<Cart> _mutate(Future<Object?> Function() call) async {
    final json = await call();
    final cart = _decode(json);
    // Keep the offline copy in sync; a cache failure must never fail the mutation.
    try {
      await _db.putCache(_cacheKey, json, language: _session.language);
    } catch (_) {}
    return cart;
  }

  static Cart _decode(Object? json) => Cart.fromJson(Decoders.map(json));
}
