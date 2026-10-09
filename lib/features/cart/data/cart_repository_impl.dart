import 'package:flutter/foundation.dart';

import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../domain/cart.dart';
import '../domain/cart_repository.dart';
import 'cart_api.dart';

/// [CartRepository] over `/cart` with a read-through offline cache: every successful response (reads and
/// mutations) becomes the cached bag, so the offline, read-only bag is always the latest one the user saw.
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required CartApi api, required AppDatabase db, required String Function() language, required String Function() cacheScope})
      : _api = api,
        _db = db,
        _language = language,
        _cacheScope = cacheScope;

  final CartApi _api;
  final AppDatabase _db;
  final String Function() _language;

  /// Who the bag belongs to (user id or guest id) — a different account never sees another one's cached bag.
  final String Function() _cacheScope;

  String get _key => 'cart:${_cacheScope()}';

  @override
  Future<Cached<Cart>> fetch() => cachedFetch<Cart>(
        db: _db,
        key: _key,
        language: _language(),
        fetchJson: _api.get,
        decode: (json) => Cart.fromJson((json as Map).cast<String, dynamic>()),
      );

  @override
  Future<Cart> addVariant(String variantId, {int quantity = 1}) => _store(_api.addItem(variantId: variantId, quantity: quantity));

  @override
  Future<Cart> addDesign(String designId, {int quantity = 1}) => _store(_api.addItem(designId: designId, quantity: quantity));

  @override
  Future<Cart> updateQuantity(String itemId, int quantity) => _store(_api.updateItem(itemId, quantity));

  @override
  Future<Cart> remove(String itemId) => _store(_api.removeItem(itemId));

  @override
  Future<Cart> applyPromo(String code) => _store(_api.applyPromo(code.trim()));

  @override
  Future<Cart> removePromo() => _store(_api.removePromo());

  @override
  Future<Cart> setGift(bool isGift) => _store(_api.setGift(isGift));

  Future<Cart> _store(Future<Map<String, dynamic>> call) async {
    final json = await call;
    final cart = Cart.fromJson(json);
    try {
      await _db.putCache(_key, json, language: _language());
    } catch (e) {
      // The cache is a convenience for offline mode — never fail a successful mutation because of it.
      if (kDebugMode) debugPrint('[cart] cache write failed: $e');
    }
    return cart;
  }
}
