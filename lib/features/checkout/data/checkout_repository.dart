import '../../../core/network/api_client.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/checkout_models.dart';

/// `/checkout/*`, `/gift/*`, `/orders/{number}/payment`. Every call throws `ApiException`.
class CheckoutRepository {
  CheckoutRepository(this._api);
  final ApiClient _api;

  Checkout _decode(Object? j) => Checkout.fromJson(Decoders.map(j));
  String _p(String id) => '/checkout/${Uri.encodeComponent(id)}';

  Future<Checkout> start() => _api.post('/checkout', decode: _decode);
  Future<Checkout> get(String id) => _api.get(_p(id), decode: _decode);

  Future<Checkout> setContact(String id, ContactInfo c) =>
      _api.put('${_p(id)}/contact', body: {'fullName': c.fullName.trim(), 'phone': c.phone, 'email': (c.email?.trim().isEmpty ?? true) ? null : c.email!.trim()}, decode: _decode);

  Future<Checkout> setGift(String id, GiftSelection? gift) => _api.put('${_p(id)}/gift', body: gift?.toJson() ?? {'isGift': false}, decode: _decode);

  Future<Checkout> setDelivery(String id, {required String zoneId, String? savedAddressId, DeliveryAddress? address}) =>
      _api.put('${_p(id)}/delivery', body: {'zoneId': zoneId, 'savedAddressId': savedAddressId, 'address': address?.toJson()}, decode: _decode);

  Future<List<SlotDay>> slots(String id) => _api.get('${_p(id)}/slots', decode: (j) => Decoders.list(j, SlotDay.fromJson));

  Future<Checkout> setSlot(String id, DateTime date, String windowId) => _api.put(
        '${_p(id)}/slot',
        body: {'date': '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}', 'windowId': windowId},
        decode: _decode,
      );

  Future<Checkout> setPaymentMethod(String id, PaymentMethod method, {String? savedCardId}) =>
      _api.put('${_p(id)}/payment-method', body: {'method': method.wire, 'savedCardId': savedCardId}, decode: _decode);

  /// `source: App`; the [idempotencyKey] is reused when the same attempt is retried.
  Future<OrderPlaced> placeOrder(String id, {required bool acceptTerms, required bool confirmImageRights, required bool saveCard, required String idempotencyKey}) => _api.post(
        '${_p(id)}/place-order',
        body: {'acceptTerms': acceptTerms, 'confirmImageRights': confirmImageRights, 'saveCard': saveCard, 'source': OrderSource.app.wire},
        idempotencyKey: idempotencyKey,
        decode: (j) => OrderPlaced.fromJson(Decoders.map(j)),
      );

  Future<PaymentState> paymentStatus(String number) =>
      _api.get('/orders/${Uri.encodeComponent(number)}/payment', decode: (j) => PaymentState.fromJson(Decoders.map(j)));

  Future<PaymentState> retryPayment(String number, PaymentMethod method, {required String idempotencyKey}) => _api.post(
        '/orders/${Uri.encodeComponent(number)}/payment/retry',
        body: {'method': method.wire},
        idempotencyKey: idempotencyKey,
        decode: (j) => PaymentState.fromJson(Decoders.map(j)),
      );

  Future<GiftOptions> giftOptions() => _api.get('/gift/options', decode: (j) => GiftOptions.fromJson(Decoders.map(j)));

  Future<GiftMessageCheck> validateGiftMessage(String? message, String? fromName) =>
      _api.post('/gift/message/validate', body: {'message': message, 'fromName': fromName}, decode: (j) => GiftMessageCheck.fromJson(Decoders.map(j)));
}
