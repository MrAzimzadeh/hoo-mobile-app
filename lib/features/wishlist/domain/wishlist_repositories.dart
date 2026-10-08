import '../../../shared/domain/models.dart';
import 'wishlist_models.dart';

/// The signed-in customer's wishlist (`/wishlist`, login required) and public shared lists.
abstract interface class WishlistRepository {
  /// `GET /wishlist` — newest first.
  Future<List<ProductCard>> list();

  /// `POST /wishlist/{productId}` (idempotent on the server).
  Future<void> add(String productId);

  /// `DELETE /wishlist/{productId}` (idempotent on the server).
  Future<void> remove(String productId);

  /// `POST /wishlist/share`.
  Future<WishlistShare> share();

  /// `GET /wishlist/shared/{token}` — throws `customers.wishlist_share_not_found` for unknown tokens.
  Future<SharedWishlist> shared(String token);
}

/// Back-in-stock / price-drop subscriptions (`/alerts`, login required).
abstract interface class AlertsRepository {
  Future<List<StockAlert>> list();

  /// Throws `customers.alert_not_found` when it is already gone.
  Future<void> delete(String id);
}

/// Product variants for the "move to bag" size picker.
abstract interface class ProductVariantsRepository {
  /// `GET /catalog/products/{slug}`.
  Future<PickerProduct> bySlug(String slug);
}
