import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/models/order_models.dart';
import '../../domain/orders_error_codes.dart';
import '../../domain/repositories.dart';

part 'slot_picker_cubit.freezed.dart';

enum SlotPickerStatus {
  loading,
  ready,

  /// Windows can't be listed for this order (no listing endpoint yet / zone without slots) → contact the store.
  unavailable,
  failure,
}

@freezed
abstract class SlotPickerState with _$SlotPickerState {
  const SlotPickerState._();

  const factory SlotPickerState({
    @Default(SlotPickerStatus.loading) SlotPickerStatus status,
    @Default(<SlotDay>[]) List<SlotDay> days,
    DateTime? selectedDate,
    String? selectedWindowId,
    @Default(false) bool submitting,
    Object? error,
    Object? submitError,

    /// Set once the server accepted the change.
    OrderDetail? updated,
  }) = _SlotPickerState;

  SlotDay? get selectedDay {
    for (final d in days) {
      if (d.date == selectedDate) return d;
    }
    return null;
  }

  bool get canSubmit => selectedDate != null && selectedWindowId != null && !submitting;
}

/// "Change delivery time" sheet: list windows, pick one, `PUT /orders/track/{number}/slot`.
class SlotPickerCubit extends Cubit<SlotPickerState> {
  SlotPickerCubit(this._orders, {required this.number, required this.phone, this.currentDate, this.currentStart}) : super(const SlotPickerState());

  final OrdersRepository _orders;
  final String number;
  final String phone;

  /// The order's current slot — preselects its day and is never offered as a "new" window.
  final DateTime? currentDate;
  final String? currentStart;

  Future<void> load() async {
    emit(state.copyWith(status: SlotPickerStatus.loading, error: null));
    try {
      final days = await _orders.slots(number, phone: phone);
      if (isClosed) return;
      final usable = days.where((d) => d.hasSelectable).toList();
      final keep = usable.any((d) => d.date == state.selectedDate);
      final firstDay = usable.where((d) => d.date == currentDate).firstOrNull ?? usable.firstOrNull;
      emit(
        state.copyWith(
          status: SlotPickerStatus.ready,
          days: usable,
          selectedDate: keep ? state.selectedDate : firstDay?.date,
          selectedWindowId: keep && _windowStillSelectable(usable) ? state.selectedWindowId : null,
        ),
      );
    } on ApiException catch (e) {
      if (isClosed) return;
      final unavailable = e.isNotFound || e.code == OrdersErrorCodes.slotsNotSupported;
      emit(state.copyWith(status: unavailable ? SlotPickerStatus.unavailable : SlotPickerStatus.failure, error: e));
    }
  }

  bool _windowStillSelectable(List<SlotDay> days) =>
      days.any((d) => d.date == state.selectedDate && d.windows.any((w) => w.windowId == state.selectedWindowId && w.selectable));

  /// True for the window the order already has.
  bool isCurrent(DateTime date, SlotWindow w) {
    final start = currentStart;
    if (date != currentDate || start == null || start.isEmpty) return false;
    return w.start.startsWith(start.length >= 5 ? start.substring(0, 5) : start);
  }

  void selectDay(DateTime date) {
    if (date == state.selectedDate) return;
    emit(state.copyWith(selectedDate: date, selectedWindowId: null, submitError: null));
  }

  void selectWindow(String windowId) => emit(state.copyWith(selectedWindowId: windowId, submitError: null));

  Future<void> submit() async {
    final date = state.selectedDate, windowId = state.selectedWindowId;
    if (date == null || windowId == null || state.submitting) return;
    emit(state.copyWith(submitting: true, submitError: null));
    try {
      final updated = await _orders.changeSlot(number, phone: phone, date: date, windowId: windowId);
      if (isClosed) return;
      emit(state.copyWith(submitting: false, updated: updated));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(submitting: false, submitError: e));
      // The window filled up meanwhile → show fresh availability.
      if (e.code == ErrorCodes.slotFull || e.isConflict) await load();
    }
  }
}
