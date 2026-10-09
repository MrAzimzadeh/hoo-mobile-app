import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/analytics/analytics.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/network/interceptors/hoo_interceptors.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../data/checkout_repository.dart';
import '../../domain/checkout_models.dart';

/// Checkout steps in display order. Which ones apply depends on the server state (gift, zone kind, time slots).
enum CheckoutStep { contact, gift, delivery, slot, payment, review }

sealed class CheckoutEvent {
  const CheckoutEvent();
}

class CheckoutStarted extends CheckoutEvent {
  const CheckoutStarted();
}

class CheckoutStepSelected extends CheckoutEvent {
  const CheckoutStepSelected(this.step);
  final CheckoutStep step;
}

class ContactSubmitted extends CheckoutEvent {
  const ContactSubmitted(this.contact);
  final ContactInfo contact;
}

class GiftSubmitted extends CheckoutEvent {
  const GiftSubmitted(this.gift);
  final GiftSelection gift;
}

class DeliverySubmitted extends CheckoutEvent {
  const DeliverySubmitted({required this.zoneId, this.savedAddressId, this.address});
  final String zoneId;
  final String? savedAddressId;
  final DeliveryAddress? address;
}

class SlotsRequested extends CheckoutEvent {
  const SlotsRequested();
}

class SlotSelected extends CheckoutEvent {
  const SlotSelected(this.date, this.windowId);
  final DateTime date;
  final String windowId;
}

class PaymentMethodSelected extends CheckoutEvent {
  const PaymentMethodSelected(this.method, {this.savedCardId});
  final PaymentMethod method;
  final String? savedCardId;
}

class PlaceOrderRequested extends CheckoutEvent {
  const PlaceOrderRequested({required this.acceptTerms, required this.confirmImageRights, required this.saveCard});
  final bool acceptTerms;
  final bool confirmImageRights;
  final bool saveCard;
}

/// The in-app browser closed / app resumed / EPoint redirected back → check the payment now.
class PaymentCheckRequested extends CheckoutEvent {
  const PaymentCheckRequested();
}

class PaymentRetryRequested extends CheckoutEvent {
  const PaymentRetryRequested(this.method);
  final PaymentMethod method;
}

/// The page handed [CheckoutState.redirectUrl] to the in-app browser.
class PaymentRedirectOpened extends CheckoutEvent {
  const PaymentRedirectOpened();
}

class _PollTick extends CheckoutEvent {
  const _PollTick();
}

enum CheckoutPhase {
  loading,
  editing,

  /// Waiting for the customer to finish on the EPoint page.
  awaitingPayment,
  paymentFailed,

  /// Order placed and paid (or cash on delivery) → confirmation.
  completed,
  failure,
}

class CheckoutState extends Equatable {
  const CheckoutState({
    this.phase = CheckoutPhase.loading,
    this.checkout,
    this.step = CheckoutStep.contact,
    this.busy = false,
    this.error,
    this.slots = const [],
    this.slotsLoading = false,
    this.placed,
    this.payment,
    this.idempotencyKey,
    this.redirectUrl,
  });

  final CheckoutPhase phase;
  final Checkout? checkout;
  final CheckoutStep step;
  final bool busy;
  final Object? error;
  final List<SlotDay> slots;
  final bool slotsLoading;
  final OrderPlaced? placed;
  final PaymentState? payment;

  /// Reused for retries of the same place-order attempt.
  final String? idempotencyKey;

  /// EPoint page to open (set when it must be opened, cleared once handed to the browser).
  final String? redirectUrl;

  ApiException? get apiError => error is ApiException ? error as ApiException : null;

  List<CheckoutStep> get steps {
    final c = checkout;
    if (c == null) return const [CheckoutStep.contact];
    return [
      CheckoutStep.contact,
      if (c.isGift || c.missing('gift')) CheckoutStep.gift,
      CheckoutStep.delivery,
      if (c.zone?.supportsTimeSlots ?? false) CheckoutStep.slot,
      CheckoutStep.payment,
      CheckoutStep.review,
    ];
  }

  /// Steps the server still needs (`missingSteps`: contact, gift, delivery, address, slot, payment).
  bool isComplete(CheckoutStep s) {
    final c = checkout;
    if (c == null) return false;
    return switch (s) {
      CheckoutStep.contact => !c.missing('contact'),
      CheckoutStep.gift => !c.missing('gift'),
      CheckoutStep.delivery => !c.missing('delivery') && !c.missing('address'),
      CheckoutStep.slot => !c.missing('slot'),
      CheckoutStep.payment => !c.missing('payment'),
      CheckoutStep.review => false,
    };
  }

  CheckoutState copyWith({
    CheckoutPhase? phase,
    Checkout? checkout,
    CheckoutStep? step,
    bool? busy,
    Object? Function()? error,
    List<SlotDay>? slots,
    bool? slotsLoading,
    OrderPlaced? placed,
    PaymentState? payment,
    String? Function()? idempotencyKey,
    String? Function()? redirectUrl,
  }) =>
      CheckoutState(
        phase: phase ?? this.phase,
        checkout: checkout ?? this.checkout,
        step: step ?? this.step,
        busy: busy ?? this.busy,
        error: error == null ? this.error : error(),
        slots: slots ?? this.slots,
        slotsLoading: slotsLoading ?? this.slotsLoading,
        placed: placed ?? this.placed,
        payment: payment ?? this.payment,
        idempotencyKey: idempotencyKey == null ? this.idempotencyKey : idempotencyKey(),
        redirectUrl: redirectUrl == null ? this.redirectUrl : redirectUrl(),
      );

  @override
  List<Object?> get props => [phase, checkout, step, busy, error, slots, slotsLoading, placed, payment, idempotencyKey, redirectUrl];
}

/// Checkout state machine. The server is the source of truth: every step PUTs and re-renders from the returned
/// `CheckoutResponse`; progress follows `missingSteps`. Expired sessions are recreated silently and the step replayed.
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(this._repo, this._analytics, DeepLinkService links, {Duration pollEvery = const Duration(seconds: 2), int maxPolls = 45})
      : _pollEvery = pollEvery,
        _maxPolls = maxPolls,
        super(const CheckoutState()) {
    on<CheckoutStarted>(_onStarted);
    on<CheckoutStepSelected>((e, emit) => emit(state.copyWith(step: e.step, error: () => null)));
    on<ContactSubmitted>((e, emit) => _mutate(emit, (id) => _repo.setContact(id, e.contact)));
    on<GiftSubmitted>((e, emit) => _mutate(emit, (id) => _repo.setGift(id, e.gift)));
    on<DeliverySubmitted>((e, emit) => _mutate(emit, (id) => _repo.setDelivery(id, zoneId: e.zoneId, savedAddressId: e.savedAddressId, address: e.address)));
    on<SlotsRequested>(_onSlots);
    on<SlotSelected>(_onSlot);
    on<PaymentMethodSelected>((e, emit) => _mutate(emit, (id) => _repo.setPaymentMethod(id, e.method, savedCardId: e.savedCardId)));
    on<PlaceOrderRequested>(_onPlace);
    on<PaymentCheckRequested>((e, emit) => _check(emit));
    on<_PollTick>((e, emit) => _check(emit, fromTimer: true));
    on<PaymentRetryRequested>(_onRetry);
    on<PaymentRedirectOpened>((e, emit) => emit(state.copyWith(redirectUrl: () => null)));
    _linkSub = links.paymentReturns.listen((_) => add(const PaymentCheckRequested()));
  }

  final CheckoutRepository _repo;
  final Analytics _analytics;
  final Duration _pollEvery;
  final int _maxPolls;
  late final StreamSubscription<PaymentReturnLink> _linkSub;
  Timer? _poll;
  int _polls = 0;

  Future<void> _onStarted(CheckoutStarted e, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(phase: CheckoutPhase.loading, error: () => null));
    try {
      final c = await _repo.start();
      _analytics.checkoutStarted();
      emit(state.copyWith(phase: CheckoutPhase.editing, checkout: c, step: _firstOpen(c)));
    } catch (err) {
      emit(state.copyWith(phase: CheckoutPhase.failure, error: () => err));
    }
  }

  CheckoutStep _firstOpen(Checkout c, {CheckoutStep? after}) {
    final s = CheckoutState(checkout: c);
    final steps = s.steps;
    final from = after == null ? 0 : steps.indexOf(after) + 1;
    for (final step in steps.skip(from)) {
      if (step == CheckoutStep.review || !s.isComplete(step)) return step;
    }
    return CheckoutStep.review;
  }

  /// One step mutation with silent session recreation (`checkout.session_expired` / `_not_found`).
  Future<void> _mutate(Emitter<CheckoutState> emit, Future<Checkout> Function(String id) call) async {
    final c = state.checkout;
    if (c == null || state.busy) return;
    emit(state.copyWith(busy: true, error: () => null));
    try {
      Checkout next;
      try {
        next = await call(c.id);
      } on ApiException catch (err) {
        if (err.code != 'checkout.session_expired' && err.code != 'checkout.session_not_found') rethrow;
        final fresh = await _repo.start();
        next = await call(fresh.id);
      }
      emit(state.copyWith(busy: false, checkout: next, step: _firstOpen(next, after: state.step)));
    } on ApiException catch (err) {
      emit(state.copyWith(busy: false, error: () => err));
      if (err.isConflict) await _refresh(emit);
    }
  }

  Future<void> _refresh(Emitter<CheckoutState> emit) async {
    final c = state.checkout;
    if (c == null) return;
    try {
      emit(state.copyWith(checkout: await _repo.get(c.id)));
    } catch (_) {}
  }

  Future<void> _onSlots(SlotsRequested e, Emitter<CheckoutState> emit) async {
    final c = state.checkout;
    if (c == null) return;
    emit(state.copyWith(slotsLoading: true));
    try {
      emit(state.copyWith(slots: await _repo.slots(c.id), slotsLoading: false));
    } catch (err) {
      emit(state.copyWith(slotsLoading: false, error: () => err));
    }
  }

  Future<void> _onSlot(SlotSelected e, Emitter<CheckoutState> emit) async {
    await _mutate(emit, (id) => _repo.setSlot(id, e.date, e.windowId));
    // slot taken meanwhile (409 delivery.slot_full) → fresh availability
    if (state.apiError?.isConflict ?? false) add(const SlotsRequested());
  }

  Future<void> _onPlace(PlaceOrderRequested e, Emitter<CheckoutState> emit) async {
    final c = state.checkout;
    if (c == null || state.busy || !c.canPlaceOrder) return;
    final key = state.idempotencyKey ?? IdempotencyInterceptor.newKey();
    emit(state.copyWith(busy: true, error: () => null, idempotencyKey: () => key));
    try {
      final placed = await _repo.placeOrder(c.id, acceptTerms: e.acceptTerms, confirmImageRights: e.confirmImageRights, saveCard: e.saveCard, idempotencyKey: key);
      _analytics.orderPlaced();
      final url = placed.paymentRedirectUrl;
      if (url != null && url.isNotEmpty && placed.paymentStatus != PaymentStatus.captured) {
        emit(state.copyWith(busy: false, placed: placed, phase: CheckoutPhase.awaitingPayment, redirectUrl: () => url));
        _startPolling();
      } else {
        emit(state.copyWith(busy: false, placed: placed, phase: CheckoutPhase.completed));
      }
    } on ApiException catch (err) {
      // network: keep the key so a retry can't create a second order; anything else: a new attempt gets a new key
      emit(state.copyWith(busy: false, error: () => err, idempotencyKey: err.isNetwork ? null : () => null));
      if (err.isConflict || err.isBusinessRule || err.code == 'checkout.cart_changed') await _refresh(emit);
    }
  }

  void _startPolling() {
    _polls = 0;
    _poll?.cancel();
    _poll = Timer.periodic(_pollEvery, (_) => add(const _PollTick()));
  }

  Future<void> _check(Emitter<CheckoutState> emit, {bool fromTimer = false}) async {
    final placed = state.placed;
    if (placed == null || state.phase != CheckoutPhase.awaitingPayment) return;
    if (fromTimer && ++_polls > _maxPolls) {
      _poll?.cancel();
      return;
    }
    try {
      final p = await _repo.paymentStatus(placed.orderNumber);
      if (p.status == PaymentStatus.captured || !p.method.isOnline) {
        _poll?.cancel();
        emit(state.copyWith(payment: p, phase: CheckoutPhase.completed));
      } else if (p.status.isFinal) {
        _poll?.cancel();
        emit(state.copyWith(payment: p, phase: CheckoutPhase.paymentFailed));
      } else {
        emit(state.copyWith(payment: p));
      }
    } catch (_) {
      // transient — the next tick retries
    }
  }

  Future<void> _onRetry(PaymentRetryRequested e, Emitter<CheckoutState> emit) async {
    final placed = state.placed;
    if (placed == null || state.busy) return;
    emit(state.copyWith(busy: true, error: () => null));
    try {
      final p = await _repo.retryPayment(placed.orderNumber, e.method, idempotencyKey: IdempotencyInterceptor.newKey());
      final url = p.redirectUrl;
      if (p.method.isOnline && url != null && url.isNotEmpty) {
        emit(state.copyWith(busy: false, payment: p, phase: CheckoutPhase.awaitingPayment, redirectUrl: () => url));
        _startPolling();
      } else {
        emit(state.copyWith(busy: false, payment: p, phase: CheckoutPhase.completed));
      }
    } on ApiException catch (err) {
      emit(state.copyWith(busy: false, error: () => err));
    }
  }

  @override
  Future<void> close() async {
    _poll?.cancel();
    await _linkSub.cancel();
    return super.close();
  }
}
