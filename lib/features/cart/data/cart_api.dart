import '../../../core/network/api_client.dart';

/// Raw `/cart` endpoints. Returns decoded JSON so the repository can cache the exact server payload.
class CartApi {
  const CartApi(this._api);

  final ApiClient _api;

  Future<Map<String, dynamic>> get() => _api.get('/cart', decode: Decoders.map);

  Future<Map<String, dynamic>> addItem({String? variantId, String? designId, required int quantity}) => _api.post(
        '/cart/items',
        body: {'variantId': ?variantId, 'designId': ?designId, 'quantity': quantity},
        decode: Decoders.map,
      );

  Future<Map<String, dynamic>> updateItem(String itemId, int quantity) =>
      _api.patch('/cart/items/${Uri.encodeComponent(itemId)}', body: {'quantity': quantity}, decode: Decoders.map);

  Future<Map<String, dynamic>> removeItem(String itemId) => _api.delete('/cart/items/${Uri.encodeComponent(itemId)}', decode: Decoders.map);

  Future<Map<String, dynamic>> applyPromo(String code) => _api.put('/cart/promo', body: {'code': code}, decode: Decoders.map);

  Future<Map<String, dynamic>> removePromo() => _api.delete('/cart/promo', decode: Decoders.map);

  Future<Map<String, dynamic>> setGift(bool isGift) => _api.put('/cart/gift', body: {'isGift': isGift}, decode: Decoders.map);
}
