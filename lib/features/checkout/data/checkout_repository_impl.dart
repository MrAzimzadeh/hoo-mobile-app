import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/checkout_models.dart';
import '../domain/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  CheckoutRepositoryImpl(this._api);

  final ApiClient _api;

  static String _id(String id) => Uri.encodeComponent(id);

  CheckoutSession _session(Object? json) => CheckoutSession.fromJson(Decoders.map(json));

  @override
  Future<CheckoutSession> start() => _api.post('/checkout', decode: _session);

  @override
  Future<CheckoutSession> get(String id) => _api.get('/checkout/${_id(id)}', decode: _session);

  @override
  Future<CheckoutSession> setContact(String id, ContactInfo contact) => _api.put(
    '/checkout/${_id(id)}/contact',
    body: {'fullName': contact.fullName, 'phone': contact.phone, 'email': (contact.email?.isEmpty ?? true) ? null : contact.email},
    decode: _session,
  );

  @override
  Future<CheckoutSession> setGift(String id, GiftSelection selection) => _api.put('/checkout/${_id(id)}/gift', body: selection.toJson(), decode: _session);

  @override
  Future<CheckoutSession> setDelivery(String id, {required String zoneId, String? savedAddressId, DeliveryAddress? address}) =>
      _api.put('/checkout/${_id(id)}/delivery', body: {'zoneId': zoneId, 'savedAddressId': savedAddressId, 'address': address?.toJson()}, decode: _session);

  @override
  Future<List<SlotDay>> slots(String id) => _api.get('/checkout/${_id(id)}/slots', decode: (j) => Decoders.list(j, SlotDay.fromJson));

  @override
  Future<CheckoutSession> setSlot(String id, {required DateTime date, required String windowId}) =>
      _api.put('/checkout/${_id(id)}/slot', body: {'date': _dateOnly(date), 'windowId': windowId}, decode: _session);

  @override
  Future<CheckoutSession> setPaymentMethod(String id, PaymentMethod method, {String? savedCardId}) =>
      _api.put('/checkout/${_id(id)}/payment-method', body: {'method': method.wire, 'savedCardId': savedCardId}, decode: _session);

  @override
  Future<OrderPlaced> placeOrder(
    String id, {
    required bool acceptTerms,
    required bool confirmImageRights,
    required bool saveCard,
    required String idempotencyKey,
  }) => _api.post(
    '/checkout/${_id(id)}/place-order',
    body: {'acceptTerms': acceptTerms, 'confirmImageRights': confirmImageRights, 'saveCard': saveCard, 'source': OrderSource.app.wire},
    idempotencyKey: idempotencyKey,
    decode: (j) => OrderPlaced.fromJson(Decoders.map(j)),
  );

  @override
  Future<GiftOptions> giftOptions() => _api.get('/gift/options', decode: (j) => GiftOptions.fromJson(Decoders.map(j)));

  @override
  Future<GiftMessageCheck> validateGiftMessage({String? message, String? fromName, CancelToken? cancelToken}) => _api.post(
    '/gift/message/validate',
    body: {'message': message, 'fromName': fromName},
    cancelToken: cancelToken,
    decode: (j) => GiftMessageCheck.fromJson(Decoders.map(j)),
  );

  @override
  Future<PaymentInfo> paymentStatus(String orderNumber) =>
      _api.get('/orders/${_id(orderNumber)}/payment', decode: (j) => PaymentInfo.fromJson(Decoders.map(j)));

  @override
  Future<PaymentInfo> retryPayment(String orderNumber, PaymentMethod method, {required String idempotencyKey}) => _api.post(
    '/orders/${_id(orderNumber)}/payment/retry',
    body: {'method': method.wire},
    idempotencyKey: idempotencyKey,
    decode: (j) => PaymentInfo.fromJson(Decoders.map(j)),
  );

  static String _dateOnly(DateTime d) => '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
