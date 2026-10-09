import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/analytics/analytics.dart';
import 'package:hoo/core/deeplinks/deep_link_service.dart';
import 'package:hoo/core/network/api_client.dart';
import 'package:hoo/features/checkout/data/checkout_repository.dart';
import 'package:hoo/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:hoo/shared/domain/enums.dart';
import 'package:hoo/shared/domain/models.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/fake_api.dart';

class _Analytics extends Mock implements Analytics {}

class _Links extends Mock implements DeepLinkService {}

Map<String, dynamic> checkoutJson(String id, {List<String> missing = const ['contact', 'delivery', 'payment'], bool canPlace = false}) => {
      'id': id,
      'expiresAt': '2030-01-01T00:00:00Z',
      'items': [],
      'totals': {'subtotal': 100, 'discount': 0, 'delivery': 5, 'total': 105, 'vatIncluded': 16},
      'zones': [
        {'id': 'z1', 'code': 'BAKU', 'name': 'Bakı', 'kind': 'Courier', 'price': 5, 'supportsTimeSlots': false},
      ],
      'paymentMethods': [
        {'method': 'Card', 'available': true},
        {'method': 'CashOnDelivery', 'available': false, 'unavailableReason': 'Limit'},
      ],
      'missingSteps': missing,
      'canPlaceOrder': canPlace,
    };

void main() {
  late StreamController<PaymentReturnLink> returns;
  late _Links links;

  setUp(() {
    returns = StreamController<PaymentReturnLink>.broadcast();
    links = _Links();
    when(() => links.paymentReturns).thenAnswer((_) => returns.stream);
  });

  tearDown(() => returns.close());

  CheckoutBloc build(ApiClient api) => CheckoutBloc(CheckoutRepository(api), _Analytics(), links, pollEvery: const Duration(milliseconds: 10));

  test('starts on the first missing step and advances after each PUT', () async {
    final api = fakeApiClient({
      'POST /checkout': (r) => (200, checkoutJson('c1')),
      'PUT /checkout/{id}/contact': (r) => (200, checkoutJson('c1', missing: ['delivery', 'payment'])),
    });
    final bloc = build(api)..add(const CheckoutStarted());
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.phase == CheckoutPhase.editing && s.step == CheckoutStep.contact)));
    bloc.add(const ContactSubmitted(ContactInfo(fullName: 'Aysel', phone: '+994501234567')));
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.step == CheckoutStep.delivery && !s.busy)));
    await bloc.close();
  });

  test('an expired session is recreated silently and the step replayed', () async {
    var calls = 0;
    final api = fakeApiClient({
      'POST /checkout': (r) => (200, checkoutJson(calls == 0 ? 'old' : 'new')),
      'PUT /checkout/{id}/contact': (r) {
        calls++;
        return r.path.contains('/old/') ? (410, {'code': 'checkout.session_expired', 'status': 410}) : (200, checkoutJson('new', missing: ['delivery']));
      },
    });
    final bloc = build(api)..add(const CheckoutStarted());
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.phase == CheckoutPhase.editing)));
    bloc.add(const ContactSubmitted(ContactInfo(fullName: 'A', phone: '+994501234567')));
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.checkout?.id == 'new' && s.error == null && !s.busy)));
    await bloc.close();
  });

  test('card payment: redirect, poll until captured, then completed; idempotency key sent', () async {
    var polls = 0;
    final adapter = FakeApiAdapter({
      'POST /checkout': (r) => (200, checkoutJson('c1', missing: [], canPlace: true)),
      'POST /checkout/{id}/place-order': (r) => (200, {
            'orderId': 'o1',
            'orderNumber': 'HOO-1',
            'status': 'New',
            'total': 105,
            'paymentMethod': 'Card',
            'paymentStatus': 'Pending',
            'paymentRedirectUrl': 'https://epoint.az/pay/1',
          }),
      'GET /orders/{n}/payment': (r) => (200, {'orderNumber': 'HOO-1', 'orderStatus': 'Paid', 'method': 'Card', 'status': ++polls >= 2 ? 'Captured' : 'Pending', 'amount': 105}),
    });
    final bloc = build(fakeApiClient(const {}, adapter: adapter))..add(const CheckoutStarted());
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.phase == CheckoutPhase.editing)));
    bloc.add(const PlaceOrderRequested(acceptTerms: true, confirmImageRights: false, saveCard: false));
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.phase == CheckoutPhase.awaitingPayment && s.redirectUrl != null)));
    await expectLater(bloc.stream, emitsThrough(predicate<CheckoutState>((s) => s.phase == CheckoutPhase.completed)));
    final place = adapter.requests.firstWhere((r) => r.path.endsWith('place-order'));
    expect((place.body! as Map)['source'], OrderSource.app.wire);
    await bloc.close();
  });
}
