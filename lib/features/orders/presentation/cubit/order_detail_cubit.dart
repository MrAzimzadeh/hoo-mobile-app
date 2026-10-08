import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/network/interceptors/hoo_interceptors.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/models/order_models.dart';
import '../../domain/orders_error_codes.dart';
import '../../domain/repositories.dart';

part 'order_detail_cubit.freezed.dart';

enum OrderDetailStatus { loading, ready, failure }

/// Pay-again flow: retry → EPoint page in the in-app browser → return link / app resume → poll the status.
enum PayFlow {
  idle,

  /// `POST …/payment/retry` in flight.
  starting,

  /// The payment page is open; waiting for the redirect back or for the app to resume.
  awaitingReturn,

  /// Polling `GET …/payment`.
  verifying,
  succeeded,
  failed,

  /// Still pending after polling — the user can check again.
  pending,
}

/// One-shot confirmations shown as toasts.
enum OrderNotice { slotChanged, paymentSucceeded }

@freezed
abstract class OrderDetailState with _$OrderDetailState {
  const OrderDetailState._();

  const factory OrderDetailState({
    required OrderAccess access,
    @Default(OrderDetailStatus.loading) OrderDetailStatus status,
    OrderDetail? order,
    @Default(false) bool stale,
    @Default(false) bool refreshing,
    @Default(false) bool isRecipientView,
    String? whatsAppUrl,

    /// Load failure (full-screen error).
    Object? error,
    @Default(PayFlow.idle) PayFlow payment,

    /// The gateway's localized reason when a retried payment failed.
    String? paymentFailure,

    /// Last action failure (toast). A new instance each time, so listeners fire once per failure.
    Object? actionError,
    OrderNotice? notice,
    @Default(0) int noticeSeq,
  }) = _OrderDetailState;

  bool get isGuest => access.isGuest;

  /// Mutations are disabled on stale (offline) data and in the gift recipient's view.
  bool get canMutate => order != null && !stale && !isRecipientView;
  bool get canPay => canMutate && order!.canPay;
  bool get canChangeSlot => canMutate && order!.canChangeSlot;
  bool get canReturn => canMutate && order!.canReturn && order!.returnableLines.isNotEmpty;
  bool get paymentBusy => payment == PayFlow.starting || payment == PayFlow.verifying;

  /// Phone that authorizes slot changes: the guest's tracking phone, else the order's contact phone.
  String? get slotPhone {
    final p = access.phone ?? order?.contact.phone;
    return (p == null || p.isEmpty) ? null : p;
  }
}

/// Order detail for the signed-in customer and for guest tracking (same UI): load, refresh, pay again (with
/// idempotency + redirect + polling), and slot-change results.
class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit(
    this._orders,
    this._payments,
    this._browser,
    Stream<PaymentReturnLink> paymentReturns, {
    Duration pollInterval = const Duration(seconds: 2),
    int maxPolls = 6,
    String Function()? newIdempotencyKey,
  }) : _pollInterval = pollInterval,
       _maxPolls = maxPolls,
       _newKey = newIdempotencyKey ?? IdempotencyInterceptor.newKey,
       super(const OrderDetailState(access: OrderAccess.account(''))) {
    _returns = paymentReturns.listen(_onPaymentReturn);
  }

  final OrdersRepository _orders;
  final OrderPaymentRepository _payments;
  final PaymentBrowser _browser;
  final Duration _pollInterval;
  final int _maxPolls;
  final String Function() _newKey;
  late final StreamSubscription<PaymentReturnLink> _returns;

  /// Kept across a failed (network) retry call so the server can de-duplicate; cleared once the server answered.
  String? _idempotencyKey;
  bool _polling = false;

  Future<void> load(OrderAccess access) async {
    emit(OrderDetailState(access: access));
    await _fetch();
  }

  Future<void> refresh() async {
    if (state.status == OrderDetailStatus.loading) return;
    emit(state.copyWith(refreshing: true));
    await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final loaded = await _orders.order(state.access);
      if (isClosed) return;
      emit(
        state.copyWith(
          status: OrderDetailStatus.ready,
          order: loaded.order,
          stale: loaded.stale,
          isRecipientView: loaded.isRecipientView,
          whatsAppUrl: loaded.whatsAppUrl ?? state.whatsAppUrl,
          refreshing: false,
          error: null,
        ),
      );
    } on ApiException catch (e) {
      if (isClosed) return;
      if (state.order != null) {
        // keep showing what we have; just report the failed refresh
        emit(state.copyWith(refreshing: false, actionError: e));
      } else {
        emit(state.copyWith(status: OrderDetailStatus.failure, error: e, refreshing: false));
      }
    }
  }

  /// The slot sheet returns the server's updated order.
  void applyUpdatedOrder(OrderDetail order) {
    emit(state.copyWith(order: order, notice: OrderNotice.slotChanged, noticeSeq: state.noticeSeq + 1));
  }

  /// Online method for the retry: the original card method; wallets fall back to card on the hosted page.
  static PaymentMethod retryMethodFor(OrderDetail order) => switch (order.payment?.method) {
    PaymentMethod.card || PaymentMethod.savedCard => order.payment!.method,
    _ => PaymentMethod.card,
  };

  Future<void> payAgain() async {
    final order = state.order;
    if (order == null || !state.canPay || state.paymentBusy) return;
    final key = _idempotencyKey ??= _newKey();
    emit(state.copyWith(payment: PayFlow.starting, paymentFailure: null));
    final PaymentStatusInfo started;
    try {
      started = await _payments.retry(order.number, retryMethodFor(order), idempotencyKey: key);
    } on ApiException catch (e) {
      if (isClosed) return;
      // Same key on a network retry; a server answer (even an error) closes this attempt.
      if (!e.isNetwork && e.code != ErrorCodes.idempotencyInProgress) _idempotencyKey = null;
      emit(state.copyWith(payment: PayFlow.idle, actionError: e));
      if (e.code == OrdersErrorCodes.orderNotPayable || e.code == OrdersErrorCodes.alreadyPaid || e.isConflict) await _fetch();
      return;
    }
    _idempotencyKey = null;
    if (isClosed) return;

    if (started.status == PaymentStatus.captured) {
      emit(state.copyWith(payment: PayFlow.succeeded, notice: OrderNotice.paymentSucceeded, noticeSeq: state.noticeSeq + 1));
      await _fetch();
      return;
    }
    final url = started.redirectUrl == null ? null : Uri.tryParse(started.redirectUrl!);
    if (started.status.isFinal || url == null) {
      emit(state.copyWith(payment: PayFlow.failed, paymentFailure: started.failureMessage));
      return;
    }
    emit(state.copyWith(payment: PayFlow.awaitingReturn));
    try {
      await _browser.open(url);
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(payment: PayFlow.idle, actionError: const ApiException.network()));
    }
  }

  /// Called when the app resumes, when the payment return link arrives, or from "Check again".
  Future<void> checkPayment() async {
    final order = state.order;
    if (order == null || _polling) return;
    if (state.payment != PayFlow.awaitingReturn && state.payment != PayFlow.pending) return;
    _polling = true;
    emit(state.copyWith(payment: PayFlow.verifying));
    try {
      for (var attempt = 0; attempt < _maxPolls; attempt++) {
        if (attempt > 0) await Future<void>.delayed(_pollInterval);
        if (isClosed) return;
        final PaymentStatusInfo s;
        try {
          s = await _payments.status(order.number);
        } on ApiException catch (e) {
          if (isClosed) return;
          if (!e.isNetwork) {
            emit(state.copyWith(payment: PayFlow.pending, actionError: e));
            return;
          }
          continue;
        }
        if (isClosed) return;
        if (s.status == PaymentStatus.captured) {
          emit(state.copyWith(payment: PayFlow.succeeded, notice: OrderNotice.paymentSucceeded, noticeSeq: state.noticeSeq + 1));
          await _fetch();
          return;
        }
        if (s.status.isFinal) {
          emit(state.copyWith(payment: PayFlow.failed, paymentFailure: s.failureMessage));
          await _fetch();
          return;
        }
      }
      if (!isClosed) emit(state.copyWith(payment: PayFlow.pending));
    } finally {
      _polling = false;
    }
  }

  /// Dismisses the success/failure banner of the payment flow.
  void resetPayment() => emit(state.copyWith(payment: PayFlow.idle, paymentFailure: null));

  void _onPaymentReturn(PaymentReturnLink link) {
    final order = state.order;
    if (order == null || state.payment != PayFlow.awaitingReturn) return;
    if (link.orderNumber != null && _digits(link.orderNumber!) != _digits(order.number)) return;
    unawaited(_browser.close());
    unawaited(checkPayment());
  }

  static String _digits(String s) => s.replaceAll(RegExp(r'\D'), '');

  @override
  Future<void> close() async {
    await _returns.cancel();
    return super.close();
  }
}
