import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/error/api_exception.dart';
import 'package:hoo/features/checkout/data/checkout_repository_impl.dart';
import 'package:hoo/features/checkout/domain/checkout_models.dart';
import 'package:hoo/features/checkout/domain/checkout_repository.dart';
import 'package:hoo/features/checkout/domain/payment_launcher.dart';
import 'package:hoo/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:hoo/shared/domain/enums.dart';
import 'package:hoo/shared/domain/models.dart';

import '../../helpers/fake_api.dart';

CheckoutSession _session(String id, {List<String> missing = const ['contact']}) =>
    CheckoutSession(id: id, expiresAt: DateTime(2030), missingSteps: missing, canPlaceOrder: missing.isEmpty);

ApiException _problem(String code, int status) => ApiException(statusCode: status, code: code);

class _FakeRepo implements CheckoutRepository {
  int started = 0;
  final calls = <String>[];
  final placeKeys = <String>[];
  bool expireNext = false;
  int placeFailures = 0;
  PaymentStatus payment = PaymentStatus.pending;

  @override
  Future<CheckoutSession> start() async => _session('s${++started}');

  @override
  Future<CheckoutSession> get(String id) async => _session(id);

  @override
  Future<CheckoutSession> setContact(String id, ContactInfo contact) async {
    calls.add('contact@$id');
    if (expireNext) {
      expireNext = false;
      throw _problem(ErrorCodes.checkoutSessionExpired, 410);
    }
    return _session(id, missing: const []);
  }

  @override
  Future<OrderPlaced> placeOrder(
    String id, {
    required bool acceptTerms,
    required bool confirmImageRights,
    required bool saveCard,
    required String idempotencyKey,
  }) async {
    placeKeys.add(idempotencyKey);
    if (placeFailures-- > 0) throw const ApiException(statusCode: 0, code: 'general.network');
    return const OrderPlaced(orderId: 'o1', orderNumber: 'HOO-1', paymentRedirectUrl: 'https://pay.test/1');
  }

  @override
  Future<PaymentInfo> paymentStatus(String orderNumber) async => PaymentInfo(orderNumber: orderNumber, status: payment);

  @override
  Future<PaymentInfo> retryPayment(String orderNumber, PaymentMethod method, {required String idempotencyKey}) async =>
      PaymentInfo(orderNumber: orderNumber, method: method, redirectUrl: 'https://pay.test/2');

  @override
  Future<GiftOptions> giftOptions() async => const GiftOptions();
  @override
  Future<CheckoutSession> setGift(String id, GiftSelection selection) async => _session(id);
  @override
  Future<CheckoutSession> setDelivery(String id, {required String zoneId, String? savedAddressId, DeliveryAddress? address}) async => _session(id);
  @override
  Future<List<SlotDay>> slots(String id) async => const [];
  @override
  Future<CheckoutSession> setSlot(String id, {required DateTime date, required String windowId}) async => _session(id);
  @override
  Future<CheckoutSession> setPaymentMethod(String id, PaymentMethod method, {String? savedCardId}) async => _session(id);
  @override
  Future<GiftMessageCheck> validateGiftMessage({String? message, String? fromName, CancelToken? cancelToken}) async => const GiftMessageCheck();
}

class _Launcher implements PaymentRedirectLauncher {
  final opened = <String>[];
  @override
  Future<void> open(String url) async => opened.add(url);
}

const _contact = ContactInfo(fullName: 'A B', phone: '+994501234567');

void main() {
  test('an expired session is re-created and the contact replayed', () async {
    final repo = _FakeRepo();
    final bloc = CheckoutBloc(repo, _Launcher());
    addTearDown(bloc.close);
    bloc.add(const CheckoutStarted());
    await bloc.stream.firstWhere((s) => s.status == CheckoutStatus.ready);
    repo.expireNext = true;
    bloc.add(const ContactSubmitted(_contact));
    final s = await bloc.stream.firstWhere((s) => s.session?.id == 's2' && !s.busy && s.step != CheckoutStep.contact);
    expect(repo.calls, ['contact@s1', 'contact@s2', 'contact@s2']);
    expect(s.error, isNull);
  });

  test('place-order retries with the same Idempotency-Key and opens the payment page', () async {
    final repo = _FakeRepo()..placeFailures = 1;
    final launcher = _Launcher();
    final bloc = CheckoutBloc(repo, launcher, pollInterval: const Duration(milliseconds: 5));
    addTearDown(bloc.close);
    bloc.add(const CheckoutStarted());
    await bloc.stream.firstWhere((s) => s.status == CheckoutStatus.ready);
    bloc.add(const PlaceOrderRequested(acceptTerms: true, confirmImageRights: false, saveCard: false));
    await bloc.stream.firstWhere((s) => s.error != null);
    bloc.add(const PlaceOrderRequested(acceptTerms: true, confirmImageRights: false, saveCard: false));
    await bloc.stream.firstWhere((s) => s.phase == CheckoutPhase.awaitingPayment);
    expect(repo.placeKeys.length, 2);
    expect(repo.placeKeys.first, repo.placeKeys.last);
    expect(launcher.opened, ['https://pay.test/1']);
  });

  test('polling moves to done on Captured and to paymentFailed on Failed', () async {
    for (final (status, phase) in [(PaymentStatus.captured, CheckoutPhase.done), (PaymentStatus.failed, CheckoutPhase.paymentFailed)]) {
      final repo = _FakeRepo()..payment = status;
      final bloc = CheckoutBloc(repo, _Launcher(), pollInterval: const Duration(milliseconds: 5));
      bloc.add(const CheckoutStarted());
      await bloc.stream.firstWhere((s) => s.status == CheckoutStatus.ready);
      bloc.add(const PlaceOrderRequested(acceptTerms: true, confirmImageRights: false, saveCard: false));
      await bloc.stream.firstWhere((s) => s.phase == phase);
      await bloc.close();
    }
  });

  test('repository sends a date-only slot and the order flags', () async {
    final adapter = FakeApiAdapter({
      'POST /checkout/c1/place-order': (_) =>
          (200, {'orderId': 'o1', 'orderNumber': 'HOO-1', 'status': 'New', 'total': 10.0, 'paymentMethod': 'Card', 'paymentStatus': 'Pending'}),
      'PUT /checkout/c1/slot': (_) => (200, {'id': 'c1', 'expiresAt': '2030-01-01T00:00:00Z'}),
    });
    final repo = CheckoutRepositoryImpl(fakeApiClient({}, adapter: adapter));
    await repo.placeOrder('c1', acceptTerms: true, confirmImageRights: false, saveCard: false, idempotencyKey: 'key-1');
    await repo.setSlot('c1', date: DateTime(2026, 10, 9), windowId: 'w1');
    expect((adapter.requests.last.body as Map)['date'], '2026-10-09');
  });
}
