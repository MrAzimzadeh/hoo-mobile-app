import '../../../core/network/api_client.dart';
import '../../../shared/domain/enums.dart';
import '../domain/order_models.dart';

/// HTTP surface of the orders feature. Paths and bodies mirror the backend endpoints
/// (`Account`, `Tracking`, `Payments`, `Gift` modules). Every call returns decoded data or throws `ApiException`.
class OrdersApi {
  OrdersApi(this._api);

  final ApiClient _api;

  static String _seg(String value) => Uri.encodeComponent(value.trim());

  /// `yyyy-MM-dd` — the wire format of `DateOnly`.
  static String dateOnly(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  // ---- account
  Future<Object?> ordersJson({required int page, required int pageSize}) =>
      _api.get<Object?>('/account/orders', query: {'page': page, 'pageSize': pageSize});

  Future<Object?> orderJson(String number) => _api.get<Object?>('/account/orders/${_seg(number)}');

  Future<List<ReturnRecord>> returns() => _api.get('/account/returns', decode: (j) => Decoders.list(j, ReturnRecord.fromJson));

  Future<ReturnRecord> createAccountReturn(String number, Map<String, dynamic> body) =>
      _api.post('/account/orders/${_seg(number)}/returns', body: body, decode: (j) => ReturnRecord.fromJson(Decoders.map(j)));

  // ---- tracking (number + phone)
  Future<TrackingResult> track(String number, String phone) => _api.get(
        '/orders/track',
        query: {'number': number.trim(), 'phone': phone},
        decode: (j) => TrackingResult.fromJson(Decoders.map(j)),
      );

  /// Not part of the current public API (see INTEGRATION_NOTES): the checkout-style slot listing for an existing
  /// order, authorized by number + phone like the other tracking endpoints.
  Future<List<SlotDay>> slots(String number, String phone) => _api.get(
        '/orders/track/${_seg(number)}/slots',
        query: {'phone': phone},
        decode: (j) => Decoders.list(j, SlotDay.fromJson),
      );

  Future<OrderDetail> changeSlot(String number, {required String phone, required DateTime date, required String windowId}) => _api.put(
        '/orders/track/${_seg(number)}/slot',
        body: {'phone': phone, 'date': dateOnly(date), 'windowId': windowId},
        decode: (j) => OrderDetail.fromJson(Decoders.map(j)),
      );

  Future<ReturnRecord> createTrackingReturn(String number, Map<String, dynamic> body) =>
      _api.post('/orders/track/${_seg(number)}/returns', body: body, decode: (j) => ReturnRecord.fromJson(Decoders.map(j)));

  // ---- payments
  Future<PaymentStatusInfo> retryPayment(String number, PaymentMethod method, String idempotencyKey) => _api.post(
        '/orders/${_seg(number)}/payment/retry',
        body: {'method': method.wire},
        idempotencyKey: idempotencyKey,
        decode: (j) => PaymentStatusInfo.fromJson(Decoders.map(j)),
      );

  Future<PaymentStatusInfo> paymentStatus(String number) =>
      _api.get('/orders/${_seg(number)}/payment', decode: (j) => PaymentStatusInfo.fromJson(Decoders.map(j)));

  // ---- gift receipts
  Future<GiftReceipt> giftReceipt(String code, String phone) =>
      _api.get('/gift-receipts/${_seg(code)}', query: {'phone': phone}, decode: (j) => GiftReceipt.fromJson(Decoders.map(j)));

  Future<ReturnRecord> giftExchange(String code, Map<String, dynamic> body) =>
      _api.post('/gift-receipts/${_seg(code)}/exchange', body: body, decode: (j) => ReturnRecord.fromJson(Decoders.map(j)));
}
