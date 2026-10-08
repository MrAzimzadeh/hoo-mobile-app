import '../../../core/network/api_client.dart';
import '../../../shared/domain/models.dart';
import '../domain/wishlist_models.dart';

/// HTTP endpoints of the wishlist feature: `/wishlist/*`, `/recently-viewed/*`, `/alerts/*` and the product
/// detail used by the size picker.
class WishlistApi {
  WishlistApi(this._api);

  final ApiClient _api;

  Future<List<ProductCard>> wishlist() => _api.get('/wishlist', decode: (json) => Decoders.list(json, ProductCard.fromJson));

  Future<void> add(String productId) => _api.post<void>('/wishlist/${Uri.encodeComponent(productId)}');

  Future<void> remove(String productId) => _api.delete<void>('/wishlist/${Uri.encodeComponent(productId)}');

  Future<WishlistShare> share() => _api.post('/wishlist/share', decode: (json) => WishlistShare.fromJson(Decoders.map(json)));

  Future<SharedWishlist> shared(String token) =>
      _api.get('/wishlist/shared/${Uri.encodeComponent(token)}', decode: (json) => SharedWishlist.fromJson(Decoders.map(json)));

  Future<void> recordView(String productId) => _api.post<void>('/recently-viewed/${Uri.encodeComponent(productId)}');

  Future<List<StockAlert>> alerts() => _api.get('/alerts', decode: (json) => Decoders.list(json, StockAlert.fromJson));

  Future<void> deleteAlert(String id) => _api.delete<void>('/alerts/${Uri.encodeComponent(id)}');

  Future<PickerProduct> product(String slug) =>
      _api.get('/catalog/products/${Uri.encodeComponent(slug)}', decode: (json) => PickerProduct.fromJson(Decoders.map(json)));
}
