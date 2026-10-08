import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/checkout_models.dart';
import '../../domain/checkout_repository.dart';
import '../../domain/payment_launcher.dart';

enum CheckoutStep { contact, gift, delivery, slot, payment, review }

enum CheckoutStatus { loading, ready, failure }

/// What the customer is doing after pressing "Place order".
enum CheckoutPhase {
  /// Filling in the steps.
  editing,

  /// `place-order` in flight.
  placing,

  /// Order exists, the payment page is open / being verified.
  awaitingPayment,

  /// The gateway said no (or the customer cancelled). Retry, pay on delivery, or leave.
  paymentFailed,

  /// Paid or payable on delivery — go to the confirmation.
  done,
}

sealed class CheckoutEvent {
  const CheckoutEvent();
}

final class CheckoutStarted extends CheckoutEvent {
  const CheckoutStarted();
}

final class StepRequested extends CheckoutEvent {
  const StepRequested(this.step);
  final CheckoutStep step;
}

final class ContactSubmitted extends CheckoutEvent {
  const ContactSubmitted(this.contact);
  final ContactInfo contact;
}

final class GiftSubmitted extends CheckoutEvent {
  const GiftSubmitted(this.selection);
  final GiftSelection selection;
}

final class DeliverySubmitted extends CheckoutEvent {
  const DeliverySubmitted({required this.zoneId, this.savedAddressId, this.address});
  final String zoneId;
  final String? savedAddressId;
  final DeliveryAddress? address;
}

final class SlotsRequested extends CheckoutEvent {
  const SlotsRequested();
}

final class SlotSubmitted extends CheckoutEvent {
  const SlotSubmitted({required this.date, required this.windowId});
  final DateTime date;
  final String windowId;
}

final class PaymentSubmitted extends CheckoutEvent {
  const PaymentSubmitted(this.method, {this.savedCardId});
  final PaymentMethod method;
  final String? savedCardId;
}

final class PlaceOrderRequested extends CheckoutEvent {
  const PlaceOrderRequested({required this.acceptTerms, required this.confirmImageRights, required this.saveCard});
  final bool acceptTerms;
  final bool confirmImageRights;
  final bool saveCard;
}

/// The payment page was opened — start verifying the status.
final class PaymentPageOpened extends CheckoutEvent {
  const PaymentPageOpened();
}

/// Back from the payment page (deep link or app resume): check now.
final class PaymentCheckRequested extends CheckoutEvent {
  const PaymentCheckRequested();
}

/// Retry the payment (same order, new attempt, new Idempotency-Key). [method] switches it (e.g. pay on delivery).
final class PaymentRetryRequested extends CheckoutEvent {
  const PaymentRetryRequested({this.method});
  final PaymentMethod? method;
}

final class ErrorDismissed extends CheckoutEvent {
  const ErrorDismissed();
}

final class _PollTick extends CheckoutEvent {
  const _PollTick();
}

class CheckoutState extends Equatable {
  const CheckoutState({
    this.status = CheckoutStatus.loading,
    this.session,
    this.step = CheckoutStep.contact,
    this.phase = CheckoutPhase.editing,
    this.busy = false,
    this.slots,
    this.slotsError,
    this.error,
    this.refreshedSession = false,
    this.order,
    this.payment,
    this.pollsExhausted = false,
    this.giftOptions,
  });

  final CheckoutStatus status;
  final CheckoutSession? session;
  final CheckoutStep step;
  final CheckoutPhase phase;

  /// A step is being saved.
  final bool busy;
  final List<SlotDay>? slots;
  final ApiException? slotsError;

  /// Latest failure to show (field errors are read from it by the step forms).
  final ApiException? error;

  /// The session expired and was silently re-created with the customer's choices — shown once as a notice.
  final bool refreshedSession;
  final OrderPlaced? order;
  final PaymentInfo? payment;
  final bool pollsExhausted;

  /// Null when gifting is off or the options could not be loaded.
  final GiftOptions? giftOptions;

  /// Gift wrapping is offered (enabled by the store; custom designs only when the store allows it).
  bool get giftAvailable {
    final o = giftOptions;
    final s = session;
    if (o == null || s == null || !o.rules.enabled) return false;
    return !s.hasCustomItems || o.rules.allowForCustomOrders;
  }

  CheckoutState copyWith({
    CheckoutStatus? status,
    CheckoutSession? session,
    CheckoutStep? step,
    CheckoutPhase? phase,
    bool? busy,
    Object? slots = _keep,
    Object? slotsError = _keep,
    Object? error = _keep,
    bool? refreshedSession,
    OrderPlaced? order,
    PaymentInfo? payment,
    bool? pollsExhausted,
    GiftOptions? giftOptions,
  }) => CheckoutState(
    status: status ?? this.status,
    session: session ?? this.session,
    step: step ?? this.step,
    phase: phase ?? this.phase,
    busy: busy ?? this.busy,
    slots: identical(slots, _keep) ? this.slots : slots as List<SlotDay>?,
    slotsError: identical(slotsError, _keep) ? this.slotsError : slotsError as ApiException?,
    error: identical(error, _keep) ? this.error : error as ApiException?,
    refreshedSession: refreshedSession ?? this.refreshedSession,
    order: order ?? this.order,
    payment: payment ?? this.payment,
    pollsExhausted: pollsExhausted ?? this.pollsExhausted,
    giftOptions: giftOptions ?? this.giftOptions,
  );

  @override
  List<Object?> get props => [status, session, step, phase, busy, slots, slotsError, error, refreshedSession, order, payment, pollsExhausted, giftOptions];
}

const _keep = Object();

/// The checkout flow: contact → gift → delivery → slot → payment → review → place order → pay.
///
/// * Every step is saved on the server, which returns the re-priced session — the bloc only renders it.
/// * The customer's choices are remembered locally ([_draft]) so an expired session (`checkout.session_expired`,
///   `checkout.session_not_found`) is re-created and replayed without losing them.
/// * `place-order` and payment retry carry an Idempotency-Key that stays the same for a retry of the same attempt
///   (network failure) and changes when the inputs change.
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(this._repo, this._launcher, {Duration pollInterval = const Duration(seconds: 3), this.maxPolls = 40, String Function()? newKey})
    : _pollInterval = pollInterval,
      _newKey = newKey ?? (() => const Uuid().v4()),
      super(const CheckoutState()) {
    on<CheckoutStarted>(_onStarted);
    on<StepRequested>((e, emit) => emit(state.copyWith(step: e.step, error: null)));
    on<ContactSubmitted>(_onContact);
    on<GiftSubmitted>(_onGift);
    on<DeliverySubmitted>(_onDelivery);
    on<SlotsRequested>(_onSlots);
    on<SlotSubmitted>(_onSlot);
    on<PaymentSubmitted>(_onPayment);
    on<PlaceOrderRequested>(_onPlace);
    on<PaymentPageOpened>(_onPaymentPageOpened);
    on<PaymentCheckRequested>(_onCheck);
    on<PaymentRetryRequested>(_onRetry);
    on<ErrorDismissed>((_, emit) => emit(state.copyWith(error: null, refreshedSession: false)));
    on<_PollTick>(_onTick);
  }

  final CheckoutRepository _repo;
  final PaymentRedirectLauncher _launcher;
  final Duration _pollInterval;
  final int maxPolls;
  final String Function() _newKey;

  // The customer's choices, to replay into a fresh session.
  ContactInfo? _contact;
  GiftSelection? _gift;
  DeliverySubmitted? _delivery;
  SlotSubmitted? _slot;
  PaymentSubmitted? _payment;

  String? _placeKey;
  String? _retryKey;
  Timer? _timer;
  int _polls = 0;

  String get _id => state.session!.id;

  // ── start ────────────────────────────────────────────────────────────────

  Future<void> _onStarted(CheckoutStarted event, Emitter<CheckoutState> emit) async {
    emit(const CheckoutState());
    try {
      final results = await Future.wait<Object?>([_repo.start(), _repo.giftOptions().then<Object?>((o) => o, onError: (Object _) => null)]);
      final session = results[0]! as CheckoutSession;
      _seedDraft(session);
      emit(CheckoutState(status: CheckoutStatus.ready, session: session, giftOptions: results[1] as GiftOptions?, step: _firstOpenStep(session)));
    } on ApiException catch (e) {
      emit(CheckoutState(status: CheckoutStatus.failure, error: e));
    }
  }

  void _seedDraft(CheckoutSession s) {
    _contact ??= s.contact;
  }

  /// First step that still misses something; Review when everything is set.
  static CheckoutStep _firstOpenStep(CheckoutSession s) {
    if (s.missing('contact')) return CheckoutStep.contact;
    if (s.missing('gift')) return CheckoutStep.gift;
    if (s.missing('delivery') || s.missing('address')) return CheckoutStep.delivery;
    if (s.missing('slot')) return CheckoutStep.slot;
    if (s.missing('payment')) return CheckoutStep.payment;
    return CheckoutStep.review;
  }

  /// The step after [from], skipping the ones that do not apply.
  CheckoutStep next(CheckoutSession s, CheckoutStep from) {
    switch (from) {
      case CheckoutStep.contact:
        return state.giftAvailable ? CheckoutStep.gift : CheckoutStep.delivery;
      case CheckoutStep.gift:
        return CheckoutStep.delivery;
      case CheckoutStep.delivery:
        return (s.zone?.supportsTimeSlots ?? false) ? CheckoutStep.slot : CheckoutStep.payment;
      case CheckoutStep.slot:
        return CheckoutStep.payment;
      case CheckoutStep.payment:
      case CheckoutStep.review:
        return CheckoutStep.review;
    }
  }

  // ── steps ────────────────────────────────────────────────────────────────

  Future<void> _onContact(ContactSubmitted e, Emitter<CheckoutState> emit) {
    _contact = e.contact;
    return _save(emit, (id) => _repo.setContact(id, e.contact), advanceFrom: CheckoutStep.contact);
  }

  Future<void> _onGift(GiftSubmitted e, Emitter<CheckoutState> emit) {
    _gift = e.selection.isGift ? e.selection : null;
    return _save(emit, (id) => _repo.setGift(id, e.selection), advanceFrom: CheckoutStep.gift);
  }

  Future<void> _onDelivery(DeliverySubmitted e, Emitter<CheckoutState> emit) {
    _delivery = e;
    _slot = null; // the zone decides which slots exist
    return _save(
      emit,
      (id) => _repo.setDelivery(id, zoneId: e.zoneId, savedAddressId: e.savedAddressId, address: e.address),
      advanceFrom: CheckoutStep.delivery,
      beforeEmit: () => emit(state.copyWith(slots: null, slotsError: null)),
    );
  }

  Future<void> _onSlots(SlotsRequested e, Emitter<CheckoutState> emit) async {
    if (state.session == null) return;
    emit(state.copyWith(slots: null, slotsError: null));
    try {
      final days = await _repo.slots(_id);
      emit(state.copyWith(slots: days));
    } on ApiException catch (err) {
      if (await _recoverSession(err, emit)) return add(const SlotsRequested());
      emit(state.copyWith(slotsError: err));
    }
  }

  Future<void> _onSlot(SlotSubmitted e, Emitter<CheckoutState> emit) {
    _slot = e;
    return _save(
      emit,
      (id) => _repo.setSlot(id, date: e.date, windowId: e.windowId),
      advanceFrom: CheckoutStep.slot,
      // a full slot: reload the grid so the customer sees the live availability
      onError: (err) {
        if (err.code == ErrorCodes.slotFull) add(const SlotsRequested());
      },
    );
  }

  Future<void> _onPayment(PaymentSubmitted e, Emitter<CheckoutState> emit) {
    _payment = e;
    return _save(emit, (id) => _repo.setPaymentMethod(id, e.method, savedCardId: e.savedCardId), advanceFrom: CheckoutStep.payment);
  }

  Future<void> _save(
    Emitter<CheckoutState> emit,
    Future<CheckoutSession> Function(String id) call, {
    required CheckoutStep advanceFrom,
    void Function()? beforeEmit,
    void Function(ApiException error)? onError,
  }) async {
    final current = state.session;
    if (current == null || state.busy) return;
    _placeKey = null; // inputs changed → the next place-order is a new attempt
    emit(state.copyWith(busy: true, error: null));
    try {
      final session = await _call(call, emit);
      beforeEmit?.call();
      emit(state.copyWith(busy: false, session: session, step: next(session, advanceFrom)));
    } on ApiException catch (e) {
      onError?.call(e);
      emit(state.copyWith(busy: false, error: e));
    }
  }

  /// Runs [call]; on an expired session re-creates it, replays the draft and retries once.
  Future<CheckoutSession> _call(Future<CheckoutSession> Function(String id) call, Emitter<CheckoutState> emit) async {
    try {
      return await call(_id);
    } on ApiException catch (e) {
      if (!await _recoverSession(e, emit)) rethrow;
      return call(_id);
    }
  }

  static bool _isExpired(ApiException e) => e.code == ErrorCodes.checkoutSessionExpired || e.code == ErrorCodes.checkoutSessionNotFound;

  /// Re-creates an expired session and replays the customer's choices. Returns false when [e] is not an expiry.
  Future<bool> _recoverSession(ApiException e, Emitter<CheckoutState> emit) async {
    if (!_isExpired(e)) return false;
    var s = await _repo.start();
    if (_contact != null) s = await _repo.setContact(s.id, _contact!);
    if (_gift != null) s = await _tryReplay(s, () => _repo.setGift(s.id, _gift!));
    if (_delivery != null) {
      final d = _delivery!;
      s = await _tryReplay(s, () => _repo.setDelivery(s.id, zoneId: d.zoneId, savedAddressId: d.savedAddressId, address: d.address));
    }
    if (_slot != null) {
      final sl = _slot!;
      s = await _tryReplay(s, () => _repo.setSlot(s.id, date: sl.date, windowId: sl.windowId));
    }
    if (_payment != null) {
      final p = _payment!;
      s = await _tryReplay(s, () => _repo.setPaymentMethod(s.id, p.method, savedCardId: p.savedCardId));
    }
    emit(state.copyWith(session: s, refreshedSession: true));
    return true;
  }

  /// A replayed choice may be gone (slot filled meanwhile): keep the session and let the step ask again.
  Future<CheckoutSession> _tryReplay(CheckoutSession fallback, Future<CheckoutSession> Function() call) async {
    try {
      return await call();
    } on ApiException {
      return fallback;
    }
  }

  // ── place order + payment ────────────────────────────────────────────────

  Future<void> _onPlace(PlaceOrderRequested e, Emitter<CheckoutState> emit) async {
    final session = state.session;
    if (session == null || state.phase == CheckoutPhase.placing) return;
    final key = _placeKey ??= _newKey();
    emit(state.copyWith(phase: CheckoutPhase.placing, error: null));
    try {
      OrderPlaced order;
      try {
        order = await _repo.placeOrder(
          session.id,
          acceptTerms: e.acceptTerms,
          confirmImageRights: e.confirmImageRights,
          saveCard: e.saveCard,
          idempotencyKey: key,
        );
      } on ApiException catch (err) {
        if (!await _recoverSession(err, emit)) rethrow;
        order = await _repo.placeOrder(_id, acceptTerms: e.acceptTerms, confirmImageRights: e.confirmImageRights, saveCard: e.saveCard, idempotencyKey: key);
      }
      _placeKey = null;
      await _afterPlaced(order, emit);
    } on ApiException catch (err) {
      emit(state.copyWith(phase: CheckoutPhase.editing, error: err));
      // the bag or availability changed under us — refresh the session so the totals and lines are current
      if (err.isConflict || err.code == ErrorCodes.checkoutCartChanged || err.code == ErrorCodes.outOfStock) {
        try {
          final fresh = await _repo.get(_id);
          emit(state.copyWith(session: fresh));
        } on ApiException {
          // keep the error banner
        }
      }
    }
  }

  Future<void> _afterPlaced(OrderPlaced order, Emitter<CheckoutState> emit) async {
    final redirect = order.paymentRedirectUrl;
    if (redirect != null && redirect.isNotEmpty && order.paymentStatus != PaymentStatus.captured) {
      emit(state.copyWith(order: order, phase: CheckoutPhase.awaitingPayment, pollsExhausted: false));
      try {
        await _launcher.open(redirect);
      } on Object {
        // the customer can reopen the payment page from the waiting screen
      }
      add(const PaymentPageOpened());
    } else {
      emit(state.copyWith(order: order, phase: CheckoutPhase.done));
    }
  }

  void _onPaymentPageOpened(PaymentPageOpened e, Emitter<CheckoutState> emit) {
    if (isClosed) return;
    _polls = 0;
    _timer?.cancel();
    _timer = Timer.periodic(_pollInterval, (_) {
      if (!isClosed) add(const _PollTick());
    });
  }

  Future<void> _onTick(_PollTick e, Emitter<CheckoutState> emit) async {
    if (state.phase != CheckoutPhase.awaitingPayment) {
      _timer?.cancel();
      return;
    }
    if (++_polls > maxPolls) {
      _timer?.cancel();
      emit(state.copyWith(pollsExhausted: true));
      return;
    }
    await _check(emit);
  }

  Future<void> _onCheck(PaymentCheckRequested e, Emitter<CheckoutState> emit) async {
    if (state.order == null || state.phase == CheckoutPhase.done) return;
    emit(state.copyWith(pollsExhausted: false));
    await _check(emit);
    if (state.phase == CheckoutPhase.awaitingPayment && (_timer == null || !_timer!.isActive)) add(const PaymentPageOpened());
  }

  Future<void> _check(Emitter<CheckoutState> emit) async {
    final order = state.order;
    if (order == null) return;
    try {
      final info = await _repo.paymentStatus(order.orderNumber);
      switch (info.status) {
        case PaymentStatus.captured:
        case PaymentStatus.partiallyRefunded:
          _timer?.cancel();
          emit(state.copyWith(payment: info, phase: CheckoutPhase.done));
        case PaymentStatus.failed:
        case PaymentStatus.cancelled:
          _timer?.cancel();
          emit(state.copyWith(payment: info, phase: CheckoutPhase.paymentFailed));
        default:
          emit(state.copyWith(payment: info));
      }
    } on ApiException {
      // a failed check is just "not yet" — the next tick (or the button) tries again
    }
  }

  Future<void> _onRetry(PaymentRetryRequested e, Emitter<CheckoutState> emit) async {
    final order = state.order;
    if (order == null) return;
    final method = e.method ?? state.payment?.method ?? order.paymentMethod;
    final key = _retryKey ??= _newKey();
    emit(state.copyWith(phase: CheckoutPhase.placing, error: null));
    try {
      final info = await _repo.retryPayment(order.orderNumber, method, idempotencyKey: key);
      _retryKey = null;
      final redirect = info.redirectUrl;
      if (redirect != null && redirect.isNotEmpty) {
        emit(state.copyWith(payment: info, phase: CheckoutPhase.awaitingPayment, pollsExhausted: false));
        try {
          await _launcher.open(redirect);
        } on Object {
          // reopened from the waiting screen
        }
        add(const PaymentPageOpened());
      } else {
        emit(state.copyWith(payment: info, phase: info.status == PaymentStatus.failed ? CheckoutPhase.paymentFailed : CheckoutPhase.done));
      }
    } on ApiException catch (err) {
      emit(state.copyWith(phase: CheckoutPhase.paymentFailed, error: err));
    }
  }

  /// Reopens the payment page from the waiting screen.
  Future<void> reopenPaymentPage() async {
    final url = state.payment?.redirectUrl ?? state.order?.paymentRedirectUrl;
    if (url == null) return;
    try {
      await _launcher.open(url);
    } on Object {
      // nothing else to do
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
