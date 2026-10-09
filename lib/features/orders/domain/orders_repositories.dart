import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'order_models.dart';
import 'order_view.dart';

/// The signed-in customer's orders and returns (`/account/orders`, `/account/returns`).
abstract interface class OrdersRepository {
  /// Paged list; page 1 is cached for offline reading.
  Future<Cached<Paged<OrderListItem>>> orders({int page = 1, int pageSize = 20});

  Future<List<ReturnRecord>> returns();
}

/// One order's detail, from the account or from public tracking — the [OrderAccess] decides the endpoint.
abstract interface class OrderDetailRepository {
  Future<OrderView> load(OrderAccess access);

  /// The last tracking result looked up for (number, phone) a moment ago (Track order form → detail), so the
  /// detail renders instantly while it refreshes.
  OrderView? recentTracking(String number, String phone);

  /// `GET /orders/track` — also used by the Track order form to validate number + phone.
  Future<TrackingResult> track(String number, String phone);
}

/// Delivery slot changes (`PUT /orders/track/{number}/slot`).
abstract interface class OrderSlotRepository {
  /// Days/windows the order can move to. Throws [SlotListingUnavailable] when the backend does not expose a
  /// listing for existing orders.
  Future<List<SlotDay>> slots(String number, String phone);

  Future<OrderDetail> changeSlot(String number, {required String phone, required DateTime date, required String windowId});
}

/// Thrown when the slot listing endpoint for existing orders is not available on the server.
class SlotListingUnavailable implements Exception {
  const SlotListingUnavailable();
}

/// Return / exchange requests.
abstract interface class ReturnsRepository {
  /// Signed-in: `POST /account/orders/{number}/returns`; guest (phone given): `POST /orders/track/{number}/returns`.
  Future<ReturnRecord> requestReturn(String number, {required ReturnKind kind, required List<ReturnItem> items, String? reason, String? phone});
}

/// Online payment retry + status (`/orders/{number}/payment`).
abstract interface class PaymentRepository {
  Future<PaymentStatusInfo> retry(String number, {required PaymentMethod method, required String idempotencyKey});

  Future<PaymentStatusInfo> status(String number);
}

/// Gift receipt (`/gift-receipts/{code}`): price-free recipient view + size exchange.
abstract interface class GiftReceiptRepository {
  Future<GiftReceipt> receipt(String code, String phone);

  Future<ReturnRecord> exchange(String code, {required String phone, required List<ReturnItem> items, String? reason});
}
