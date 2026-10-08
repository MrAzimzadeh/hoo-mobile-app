import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/models/order_models.dart';
import '../../domain/models/return_models.dart';
import '../../domain/repositories.dart';
import '../../domain/return_form.dart';

part 'return_request_cubit.freezed.dart';

enum ReturnRequestStatus {
  loading,
  ready,

  /// The order can't be returned (window closed, nothing returnable, offline copy).
  notReturnable,
  failure,
}

@freezed
abstract class ReturnRequestState with _$ReturnRequestState {
  const ReturnRequestState._();

  const factory ReturnRequestState({
    required OrderAccess access,
    @Default(ReturnRequestStatus.loading) ReturnRequestStatus status,
    OrderDetail? order,
    ReturnForm? form,

    /// Validation messages appear only after the first submit attempt.
    @Default(false) bool showErrors,
    @Default(false) bool submitting,
    Object? error,
    Object? submitError,

    /// The created return — the page switches to its success view.
    ReturnInfo? result,
  }) = _ReturnRequestState;

  Set<ReturnFormIssue> get visibleIssues => showErrors ? (form?.issues ?? const {}) : const {};
}

/// Return / exchange request: load the order, edit the [ReturnForm], submit to the account or guest endpoint.
class ReturnRequestCubit extends Cubit<ReturnRequestState> {
  ReturnRequestCubit(this._orders, this._returns) : super(const ReturnRequestState(access: OrderAccess.account('')));

  final OrdersRepository _orders;
  final ReturnsRepository _returns;

  Future<void> load(OrderAccess access) async {
    emit(ReturnRequestState(access: access));
    try {
      final loaded = await _orders.order(access);
      if (isClosed) return;
      final order = loaded.order;
      final returnable = !loaded.stale && !loaded.isRecipientView && order.canReturn && order.returnableLines.isNotEmpty;
      emit(
        state.copyWith(
          status: returnable ? ReturnRequestStatus.ready : ReturnRequestStatus.notReturnable,
          order: order,
          form: ReturnForm.forOrder(order, guestPhone: access.phone),
        ),
      );
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(status: ReturnRequestStatus.failure, error: e));
    }
  }

  void _edit(ReturnForm Function(ReturnForm f) change) {
    final form = state.form;
    if (form == null || state.submitting || state.result != null) return;
    emit(state.copyWith(form: change(form), submitError: null));
  }

  void setKind(ReturnKind kind) => _edit((f) => f.withKind(kind));
  void toggleLine(String lineId) => _edit((f) => f.toggle(lineId));
  void setQuantity(String lineId, int quantity) => _edit((f) => f.withQuantity(lineId, quantity));
  void setExchangeSize(String lineId, Size size) => _edit((f) => f.withExchangeSize(lineId, size));
  void setReason(String reason) => _edit((f) => f.withReason(reason));
  void setPhone(String phone) => _edit((f) => f.withPhone(phone));

  Future<void> submit() async {
    final form = state.form, order = state.order;
    if (form == null || order == null || state.submitting || state.result != null) return;
    if (!form.isValid) {
      emit(state.copyWith(showErrors: true));
      return;
    }
    emit(state.copyWith(showErrors: true, submitting: true, submitError: null));
    try {
      final created = await _returns.requestReturn(order.number, form.toRequest());
      if (isClosed) return;
      emit(state.copyWith(submitting: false, result: created));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(submitting: false, submitError: e));
    }
  }
}
