import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import 'wishlist_models.dart';

/// `/wishlist`, `/recently-viewed`, `/alerts`.
abstract interface class WishlistRepository {
  Future<List<ProductCard>> wishlist();
  Future<void> add(String productId);
  Future<void> remove(String productId);

  /// `POST /wishlist/share` → public URL.
  Future<String> share();
  Future<SharedWishlist> shared(String token);

  Future<Cached<List<RecentlyViewed>>> recentlyViewed();
  Future<void> recordView(String productId);
  Future<void> clearRecentlyViewed();

  Future<List<StockAlert>> alerts();
  Future<void> deleteAlert(String id);
}
