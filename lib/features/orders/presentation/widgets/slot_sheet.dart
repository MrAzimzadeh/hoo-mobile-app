import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/models/order_models.dart';
import '../cubit/slot_picker_cubit.dart';

class SlotPickerArgs {
  const SlotPickerArgs({required this.number, required this.phone, this.currentDate, this.currentStart});
  final String number;
  final String phone;
  final DateTime? currentDate;
  final String? currentStart;
}

/// Change the delivery slot of an order. Resolves with the updated order when saved.
Future<OrderDetail?> showSlotSheet(BuildContext context, SlotPickerArgs args) {
  return showHooSheet<OrderDetail>(
    context,
    title: context.l10n.ordersChangeSlot,
    builder: (sheetContext) => BlocProvider(
      create: (_) => sl<SlotPickerCubit>(param1: args)..load(),
      child: const _SlotSheet(),
    ),
  );
}

class _SlotSheet extends StatelessWidget {
  const _SlotSheet();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return BlocConsumer<SlotPickerCubit, SlotPickerState>(
      listener: (context, state) {
        if (state.updated != null) Navigator.of(context).pop(state.updated);
      },
      builder: (context, state) {
        final cubit = context.read<SlotPickerCubit>();
        switch (state.status) {
          case SlotPickerStatus.loading:
            return const Padding(
              padding: EdgeInsets.all(HooSpacing.xl),
              child: Center(child: HooLoading()),
            );
          case SlotPickerStatus.unavailable:
            return HooEmptyState(title: l.ordersSlotUnavailable, compact: true, icon: HooIcons.truck);
          case SlotPickerStatus.failure:
            return HooErrorState(error: state.error!, compact: true, onRetry: cubit.load);
          case SlotPickerStatus.ready:
            final day = state.selectedDay;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.submitError != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: HooSpacing.md),
                      child: InlineAlert(message: errorMessage(context, state.submitError!), kind: HooAlertKind.error),
                    ),
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.days.length,
                      separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
                      itemBuilder: (_, i) => OptionChip(
                        label: HooFormat.weekdayDayMonth(context, state.days[i].date),
                        uppercase: false,
                        selected: state.days[i].date == state.selectedDate,
                        unavailable: !state.days[i].hasSelectable,
                        onTap: () => cubit.selectDay(state.days[i].date),
                      ),
                    ),
                  ),
                  const SizedBox(height: HooSpacing.md),
                  if (day != null)
                    for (final w in day.windows) ...[
                      SelectableCard(
                        selected: w.windowId == state.selectedWindowId,
                        onTap: w.selectable && !cubit.isCurrent(day.date, w) ? () => cubit.selectWindow(w.windowId) : null,
                        child: Row(
                          children: [
                            Expanded(child: Text('${HooFormat.timeOnly(w.start)} – ${HooFormat.timeOnly(w.end)}', style: t.bodyStrong)),
                            Text(
                              cubit.isCurrent(day.date, w) ? l.ordersSlotCurrent : (w.selectable ? l.checkoutSlotsLeft(w.available) : l.checkoutSlotFull),
                              style: t.caption.copyWith(color: c.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: HooSpacing.sm),
                    ],
                  const SizedBox(height: HooSpacing.md),
                  PrimaryButton(label: l.commonSave, loading: state.submitting, onPressed: state.canSubmit ? cubit.submit : null),
                ],
              ),
            );
        }
      },
    );
  }
}
