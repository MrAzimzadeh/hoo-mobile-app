import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/models/order_models.dart';
import '../../domain/models/return_models.dart';
import '../../domain/repositories.dart';
import '../../domain/return_form.dart';

part 'track_and_gift_cubits.freezed.dart';

// ---------------------------------------------------------------- track order

@freezed
abstract class TrackOrderState with _$TrackOrderState {
  const factory TrackOrderState({
    @Default(false) bool submitting,
    @Default(false) bool numberMissing,
    @Default(false) bool phoneInvalid,
    Object? error,

    /// Found → the page opens the order detail with these guest credentials.
    OrderAccess? found,
  }) = _TrackOrderState;
}

/// Track order form: number + phone → `GET /orders/track` → the order detail (guest mode).
class TrackOrderCubit extends Cubit<TrackOrderState> {
  TrackOrderCubit(this._orders) : super(const TrackOrderState());

  final OrdersRepository _orders;

  Future<void> submit({required String number, required String phoneInput}) async {
    if (state.submitting) return;
    final n = number.trim().toUpperCase();
    final digits = ReturnForm.nationalDigits(phoneInput);
    final numberMissing = n.isEmpty, phoneInvalid = digits.length != 9;
    if (numberMissing || phoneInvalid) {
      emit(TrackOrderState(numberMissing: numberMissing, phoneInvalid: phoneInvalid));
      return;
    }
    final phone = '+994$digits';
    emit(const TrackOrderState(submitting: true));
    try {
      final result = await _orders.track(n, phone);
      if (isClosed) return;
      emit(TrackOrderState(found: OrderAccess.guest(result.order.number, phone)));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(TrackOrderState(error: e));
    }
  }

  /// After navigating, so coming back shows the form again.
  void consumed() => emit(const TrackOrderState());
}

// ---------------------------------------------------------------- gift receipt

enum GiftReceiptStep { form, loading, ready }

@freezed
abstract class GiftReceiptState with _$GiftReceiptState {
  const GiftReceiptState._();

  const factory GiftReceiptState({
    @Default(GiftReceiptStep.form) GiftReceiptStep step,
    @Default('') String code,

    /// Recipient's phone, wire format, once the receipt opened.
    String? phone,
    GiftReceipt? receipt,

    /// lineId → new size.
    @Default(<String, Size>{}) Map<String, Size> sizes,
    @Default(false) bool codeMissing,
    @Default(false) bool phoneInvalid,
    Object? error,
    @Default(false) bool submitting,
    Object? submitError,

    /// The exchange request created by the server.
    ReturnInfo? exchange,
  }) = _GiftReceiptState;

  bool get canExchange => receipt != null && receipt!.exchangeAllowed && sizes.isNotEmpty && !submitting && exchange == null;
}

/// Gift receipt: code (deep link or typed) + recipient's phone → price-less view → size exchange.
class GiftReceiptCubit extends Cubit<GiftReceiptState> {
  GiftReceiptCubit(this._receipts, {String? code}) : super(GiftReceiptState(code: code?.trim() ?? ''));

  final GiftReceiptRepository _receipts;

  Future<void> open({required String code, required String phoneInput}) async {
    if (state.step == GiftReceiptStep.loading) return;
    final c = code.trim().toUpperCase();
    final digits = ReturnForm.nationalDigits(phoneInput);
    final codeMissing = c.isEmpty, phoneInvalid = digits.length != 9;
    if (codeMissing || phoneInvalid) {
      emit(state.copyWith(code: c, codeMissing: codeMissing, phoneInvalid: phoneInvalid, error: null));
      return;
    }
    final phone = '+994$digits';
    emit(state.copyWith(step: GiftReceiptStep.loading, code: c, codeMissing: false, phoneInvalid: false, error: null));
    try {
      final receipt = await _receipts.receipt(c, phone: phone);
      if (isClosed) return;
      emit(state.copyWith(step: GiftReceiptStep.ready, receipt: receipt, phone: phone, sizes: const {}));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(step: GiftReceiptStep.form, error: e));
    }
  }

  /// Picks a new size for a line; null (or its current size) keeps it.
  void selectSize(String lineId, Size? size) {
    final receipt = state.receipt;
    if (receipt == null || state.submitting || state.exchange != null) return;
    final line = receipt.lines.where((l) => l.lineId == lineId).firstOrNull;
    if (line == null || !line.exchangeable) return;
    final next = {...state.sizes};
    if (size == null || size == line.size) {
      next.remove(lineId);
    } else if (line.availableSizes.contains(size)) {
      next[lineId] = size;
    }
    emit(state.copyWith(sizes: next, submitError: null));
  }

  Future<void> exchange({String? reason}) async {
    final receipt = state.receipt, phone = state.phone;
    if (receipt == null || phone == null || !state.canExchange) return;
    emit(state.copyWith(submitting: true, submitError: null));
    final r = reason?.trim();
    try {
      final created = await _receipts.exchange(
        receipt.receiptCode,
        GiftExchangeRequest(
          phone: phone,
          reason: (r == null || r.isEmpty) ? null : r,
          items: [
            for (final l in receipt.lines)
              if (state.sizes[l.lineId] case final size?) ReturnItem(orderLineId: l.lineId, quantity: l.quantity, exchangeSize: size),
          ],
        ),
      );
      if (isClosed) return;
      emit(state.copyWith(submitting: false, exchange: created));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(submitting: false, submitError: e));
    }
  }

  /// Back to the code/phone form (another receipt).
  void reset() => emit(GiftReceiptState(code: state.code));
}
