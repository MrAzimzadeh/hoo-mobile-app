import '../../../core/storage/cached.dart';
import 'cart.dart';

/// The bag on the server (`/cart`). Every call returns the full, server-priced [Cart]. Mutations throw
/// `ApiException` (branch on `code`: `catalog.out_of_stock`, `cart.max_quantity_exceeded`, `promo.*`…).
abstract interface class CartRepository {
  /// `GET /cart`. Falls back to the last cached bag (flagged `stale`) when the device is offline.
  Future<Cached<Cart>> fetch();

  /// `POST /cart/items { variantId, quantity }`.
  Future<Cart> addVariant(String variantId, {int quantity = 1});

  /// `POST /cart/items { designId, quantity }` (the Studio design carries its own quantity).
  Future<Cart> addDesign(String designId, {int quantity = 1});

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
