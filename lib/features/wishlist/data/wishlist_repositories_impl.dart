import '../../../shared/domain/models.dart';
import '../domain/wishlist_models.dart';
import '../domain/wishlist_repositories.dart';
import 'wishlist_api.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(this._api);

  final WishlistApi _api;

  @override
  Future<List<ProductCard>> list() => _api.wishlist();

  @override
  Future<void> add(String productId) => _api.add(productId);

  @override
  Future<void> remove(String productId) => _api.remove(productId);

  @override
  Future<WishlistShare> share() => _api.share();

  @override
  Future<SharedWishlist> shared(String token) => _api.shared(token);
}

class AlertsRepositoryImpl implements AlertsRepository {
  AlertsRepositoryImpl(this._api);

  final WishlistApi _api;

  @override
  Future<List<StockAlert>> list() => _api.alerts();

  @override
  Future<void> delete(String id) => _api.deleteAlert(id);
}

class ProductVariantsRepositoryImpl implements ProductVariantsRepository {
  ProductVariantsRepositoryImpl(this._api);

  final WishlistApi _api;

  @override
  Future<PickerProduct> bySlug(String slug) => _api.product(slug);
}
