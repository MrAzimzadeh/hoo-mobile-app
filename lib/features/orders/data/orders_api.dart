import '../../../core/network/api_client.dart';
import '../../../shared/domain/enums.dart';
import '../domain/models/order_models.dart';
import '../domain/models/return_models.dart';

/// HTTP endpoints of the orders feature (routes and verbs from `Hoo.Api/Endpoints`). Methods backing offline
/// caches return raw JSON so the repository can store it.
class OrdersApi {
  OrdersApi(this._api);

  final ApiClient _api;

  static String _seg(String s) => Uri.encodeComponent(s.trim());

  // ---- account
  Future<Object?> myOrdersJson({required int page, required int pageSize}) => _api.get<Object?>('/account/orders', query: {'page': page, 'pageSize': pageSize});

  Future<Object?> myOrderJson(String number) => _api.get<Object?>('/account/orders/${_seg(number)}');

  Future<Object?> myReturnsJson() => _api.get<Object?>('/account/returns');

  Future<ReturnInfo> createAccountReturn(String number, CreateReturnRequest request) =>
      _api.post('/account/orders/${_seg(number)}/returns', body: request.toJson(), decode: (j) => ReturnInfo.fromJson(Decoders.map(j)));

  // ---- public tracking (number + phone)
  Future<TrackingResult> track(String number, String phone) =>
      _api.get('/orders/track', query: {'number': number.trim(), 'phone': phone}, decode: (j) => TrackingResult.fromJson(Decoders.map(j)));

  Future<OrderDetail> changeSlot(String number, {required String phone, required DateTime date, required String windowId}) => _api.put(
    '/orders/track/${_seg(number)}/slot',
    body: {'phone': phone, 'date': dateOnlyWire(date), 'windowId': windowId},
    decode: (j) => OrderDetail.fromJson(Decoders.map(j)),
  );

  // TODO(backend): there is no endpoint listing delivery windows for an existing order (only
  // `GET /checkout/{id}/slots` for a checkout session). This calls the proposed
  // `GET /orders/track/{number}/slots?phone=` (same auth as `PUT …/slot`); until it exists the server answers 404
  // and the app falls back to contacting the store.
  Future<List<SlotDay>> slots(String number, {required String phone}) =>
      _api.get('/orders/track/${_seg(number)}/slots', query: {'phone': phone}, decode: (j) => Decoders.list(j, SlotDay.fromJson));

  Future<ReturnInfo> createGuestReturn(String number, CreateReturnRequest request) =>
      _api.post('/orders/track/${_seg(number)}/returns', body: request.toJson(), decode: (j) => ReturnInfo.fromJson(Decoders.map(j)));

  // ---- payment
  Future<PaymentStatusInfo> retryPayment(String number, PaymentMethod method, {required String idempotencyKey}) => _api.post(
    '/orders/${_seg(number)}/payment/retry',
    body: {'method': method.wire},
    idempotencyKey: idempotencyKey,
    decode: (j) => PaymentStatusInfo.fromJson(Decoders.map(j)),
  );

  Future<PaymentStatusInfo> paymentStatus(String number) =>
      _api.get('/orders/${_seg(number)}/payment', decode: (j) => PaymentStatusInfo.fromJson(Decoders.map(j)));

  // ---- gift receipts
  Future<GiftReceipt> giftReceipt(String code, {required String phone}) =>
      _api.get('/gift-receipts/${_seg(code)}', query: {'phone': phone}, decode: (j) => GiftReceipt.fromJson(Decoders.map(j)));

  Future<ReturnInfo> giftExchange(String code, GiftExchangeRequest request) =>
      _api.post('/gift-receipts/${_seg(code)}/exchange', body: request.toJson(), decode: (j) => ReturnInfo.fromJson(Decoders.map(j)));
}
