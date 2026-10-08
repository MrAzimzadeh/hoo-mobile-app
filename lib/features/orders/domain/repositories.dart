import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'models/order_models.dart';
import 'models/return_models.dart';

/// Orders of the signed-in customer, guest tracking and delivery-slot changes.
abstract interface class OrdersRepository {
  /// `GET /account/orders` (paged). The first page is cached for offline reading.
  Future<Cached<Paged<OrderListItem>>> myOrders({int page = 1});

  /// Account → `GET /account/orders/{number}` (cached offline); guest → `GET /orders/track` (never cached — it is
  /// phone-bound). A tracking result fetched by [track] moments ago is reused instead of hitting the
  /// rate-limited endpoint twice.
  Future<LoadedOrder> order(OrderAccess access);

  /// `GET /orders/track?number&phone` — the Track order form.
  Future<TrackingResult> track(String number, String phone);

  /// Delivery windows the order can move to.
  Future<List<SlotDay>> slots(String number, {required String phone});

  /// `PUT /orders/track/{number}/slot` (the only slot-change endpoint; signed-in customers send the order's
  /// contact phone). Returns the updated order.
  Future<OrderDetail> changeSlot(String number, {required String phone, required DateTime date, required String windowId});
}

/// Payment retry for unpaid online orders.
abstract interface class OrderPaymentRepository {
  /// `POST /orders/{number}/payment/retry` with an `Idempotency-Key` (reuse the same key when retrying the call).
  Future<PaymentStatusInfo> retry(String number, PaymentMethod method, {required String idempotencyKey});

  /// `GET /orders/{number}/payment` — polled after the EPoint redirect.
  Future<PaymentStatusInfo> status(String number);
}

/// Returns & exchanges.
abstract interface class ReturnsRepository {
  /// Account → `POST /account/orders/{number}/returns`; guest (`request.phone != null`) →
  /// `POST /orders/track/{number}/returns`.
  Future<ReturnInfo> requestReturn(String number, CreateReturnRequest request);

  /// `GET /account/returns` (cached offline).
  Future<Cached<List<ReturnInfo>>> myReturns();
}

/// Gift receipts (the recipient's view and size exchange).
abstract interface class GiftReceiptRepository {
  /// `GET /gift-receipts/{code}?phone=` — recipient's phone authorizes; no prices.
  Future<GiftReceipt> receipt(String code, {required String phone});

  /// `POST /gift-receipts/{code}/exchange`.
  Future<ReturnInfo> exchange(String code, GiftExchangeRequest request);
}

/// In-app browser for the EPoint payment page (Custom Tabs / SFSafariViewController).
abstract interface class PaymentBrowser {
  Future<void> open(Uri url);
  Future<void> close();
}
