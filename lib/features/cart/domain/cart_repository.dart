import '../../../core/storage/cached.dart';
import 'cart_models.dart';

/// `/cart` endpoints. Every mutation returns the full, re-priced bag.
abstract interface class CartRepository {
  /// `GET /cart`. Falls back to the last cached bag (stale, read-only) when offline.
  Future<Cached<Cart>> fetch();

  /// `POST /cart/items { variantId, quantity }`.
  Future<Cart> addVariant(String variantId, int quantity);

  /// `POST /cart/items { designId, quantity }`.
  Future<Cart> addDesign(String designId, int quantity);

  /// `PATCH /cart/items/{id} { quantity }`.
  Future<Cart> updateQuantity(String itemId, int quantity);

  /// `DELETE /cart/items/{id}`.
  Future<Cart> remove(String itemId);

  /// `PUT /cart/promo { code }`.
  Future<Cart> applyPromo(String code);

  /// `DELETE /cart/promo`.
  Future<Cart> removePromo();

  /// `PUT /cart/gift { isGift }`.
  Future<Cart> setGift(bool isGift);
}
