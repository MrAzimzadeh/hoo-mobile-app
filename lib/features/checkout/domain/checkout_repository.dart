import 'package:dio/dio.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'checkout_models.dart';

/// `/checkout/*`, `/gift/*` and `/orders/{number}/payment` endpoints. All throw `ApiException`.
abstract interface class CheckoutRepository {
  /// `POST /checkout` — starts (or resumes) the session for the current bag.
  Future<CheckoutSession> start();

  Future<CheckoutSession> get(String id);

  Future<CheckoutSession> setContact(String id, ContactInfo contact);

  Future<CheckoutSession> setGift(String id, GiftSelection selection);

  /// Zone (courier / post / pickup) plus a saved address or a typed one.
  Future<CheckoutSession> setDelivery(String id, {required String zoneId, String? savedAddressId, DeliveryAddress? address});

  Future<List<SlotDay>> slots(String id);

  Future<CheckoutSession> setSlot(String id, {required DateTime date, required String windowId});

  Future<CheckoutSession> setPaymentMethod(String id, PaymentMethod method, {String? savedCardId});

  /// `POST /checkout/{id}/place-order` with an **Idempotency-Key**: the same key on retry returns the same order.
  Future<OrderPlaced> placeOrder(
    String id, {
    required bool acceptTerms,
    required bool confirmImageRights,
    required bool saveCard,
    required String idempotencyKey,
  });

  Future<GiftOptions> giftOptions();

  Future<GiftMessageCheck> validateGiftMessage({String? message, String? fromName, CancelToken? cancelToken});

  /// `GET /orders/{number}/payment`.
  Future<PaymentInfo> paymentStatus(String orderNumber);

  /// `POST /orders/{number}/payment/retry` with an **Idempotency-Key**.
  Future<PaymentInfo> retryPayment(String orderNumber, PaymentMethod method, {required String idempotencyKey});
}
