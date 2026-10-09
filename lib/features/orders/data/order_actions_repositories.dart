import '../../../core/error/api_exception.dart';
import '../../../shared/domain/enums.dart';
import '../domain/order_errors.dart';
import '../domain/order_models.dart';
import '../domain/orders_repositories.dart';
import 'orders_api.dart';

class OrderSlotRepositoryImpl implements OrderSlotRepository {
  OrderSlotRepositoryImpl(this._api);

  final OrdersApi _api;

  @override
  Future<List<SlotDay>> slots(String number, String phone) async {
    try {
      return await _api.slots(number, phone);
    } on ApiException catch (e) {
      // A missing route answers 404/405 without the order's own `order.not_found` code.
      final routeMissing = e.statusCode == 405 || (e.isNotFound && e.code != OrderErrorCodes.notFound);
      if (routeMissing) throw const SlotListingUnavailable();
      rethrow;
    }
  }

  @override
  Future<OrderDetail> changeSlot(String number, {required String phone, required DateTime date, required String windowId}) =>
      _api.changeSlot(number, phone: phone, date: date, windowId: windowId);
}

class ReturnsRepositoryImpl implements ReturnsRepository {
  ReturnsRepositoryImpl(this._api);

  final OrdersApi _api;

  @override
  Future<ReturnRecord> requestReturn(String number, {required ReturnKind kind, required List<ReturnItem> items, String? reason, String? phone}) {
    final trimmed = reason?.trim();
    final body = <String, dynamic>{
      'kind': kind.wire,
      'items': [
        for (final i in items)
          {'orderLineId': i.orderLineId, 'quantity': i.quantity, 'exchangeSize': kind == ReturnKind.exchange ? i.exchangeSize?.wire : null},
      ],
      'reason': (trimmed?.isEmpty ?? true) ? null : trimmed,
      'phone': phone,
    };
    return phone == null ? _api.createAccountReturn(number, body) : _api.createTrackingReturn(number, body);
  }
}

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl(this._api);

  final OrdersApi _api;

  @override
  Future<PaymentStatusInfo> retry(String number, {required PaymentMethod method, required String idempotencyKey}) =>
      _api.retryPayment(number, method, idempotencyKey);

  @override
  Future<PaymentStatusInfo> status(String number) => _api.paymentStatus(number);
}

class GiftReceiptRepositoryImpl implements GiftReceiptRepository {
  GiftReceiptRepositoryImpl(this._api);

  final OrdersApi _api;

  @override
  Future<GiftReceipt> receipt(String code, String phone) => _api.giftReceipt(code, phone);

  @override
  Future<ReturnRecord> exchange(String code, {required String phone, required List<ReturnItem> items, String? reason}) {
    final trimmed = reason?.trim();
    return _api.giftExchange(code, {
      'phone': phone,
      'items': [for (final i in items) {'orderLineId': i.orderLineId, 'quantity': i.quantity, 'exchangeSize': i.exchangeSize?.wire}],
      'reason': (trimmed?.isEmpty ?? true) ? null : trimmed,
    });
  }
}
