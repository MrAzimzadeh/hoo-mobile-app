import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/models/order_models.dart';
import '../cubit/order_detail_cubit.dart';
import '../widgets/order_widgets.dart';
import '../widgets/slot_sheet.dart';

/// One order — for the signed-in customer, a guest who tracked it with number + phone, and a gift recipient.
@RoutePage()
class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key, @PathParam('number') required this.number, this.phone});

  final String number;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final access = phone == null ? OrderAccess.account(number) : OrderAccess.guest(number, phone!);
    return BlocProvider(create: (_) => sl<OrderDetailCubit>()..load(access), child: const _OrderDetailView());
  }
}

class _OrderDetailView extends StatelessWidget {
  const _OrderDetailView();

  void _onState(BuildContext context, OrderDetailState state) {
    final l = context.l10n;
    switch (state.notice) {
      case OrderNotice.slotChanged:
        HooToast.success(context, l.ordersSlotChanged);
      case OrderNotice.paymentSucceeded:
        HooToast.success(context, l.ordersPaymentSucceeded);
      case null:
        break;
    }
    if (state.actionError != null) HooToast.error(context, state.actionError!);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<OrderDetailCubit, OrderDetailState>(
      listenWhen: (a, b) => a.noticeSeq != b.noticeSeq || a.actionError != b.actionError,
      listener: _onState,
      builder: (context, state) {
        final cubit = context.read<OrderDetailCubit>();
        final order = state.order;
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: order?.number ?? l.ordersTitle),
          body: switch (state.status) {
            OrderDetailStatus.loading => const Center(child: HooLoading()),
            OrderDetailStatus.failure => HooErrorState(error: state.error!, onRetry: () => cubit.load(state.access)),
            OrderDetailStatus.ready => RefreshIndicator(
              onRefresh: cubit.refresh,
              child: HooConstrained(
                child: _Body(state: state, order: order!),
              ),
            ),
          },
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state, required this.order});

  final OrderDetailState state;
  final OrderDetail order;

  Future<void> _changeSlot(BuildContext context) async {
    final phone = state.slotPhone;
    if (phone == null) return;
    final cubit = context.read<OrderDetailCubit>();
    final updated = await showSlotSheet(
      context,
      SlotPickerArgs(number: order.number, phone: phone, currentDate: order.delivery.slotDate, currentStart: order.delivery.slotStart),
    );
    if (updated != null) cubit.applyUpdatedOrder(updated);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final cubit = context.read<OrderDetailCubit>();
    final d = order.delivery;
    final showPrices = !(order.gift?.hidePrices ?? false) || !state.isRecipientView;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        OfflineBanner(visible: state.stale),
        Row(
          children: [
            Expanded(
              child: Text(HooFormat.dateTime(context, order.createdAt), style: t.caption.copyWith(color: c.textSecondary)),
            ),
            OrderStatusPill(status: order.status),
          ],
        ),
        const SizedBox(height: HooSpacing.md),
        if (state.isRecipientView) InlineAlert(message: l.ordersRecipientView),
        if (state.canPay) ...[_PayCard(state: state), const SizedBox(height: HooSpacing.md)],
        Text(l.ordersTimeline, style: t.h3),
        const SizedBox(height: HooSpacing.sm),
        OrderTimeline(order: order),
        const SizedBox(height: HooSpacing.md),
        Text(l.checkoutDeliveryTitle, style: t.h3),
        const SizedBox(height: HooSpacing.sm),
        HooCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(d.zoneName, style: t.bodyStrong),
              if (d.address != null) Text(d.address!.oneLine, style: t.body),
              if (d.hasSlot)
                Text(
                  '${HooFormat.weekdayDayMonth(context, d.slotDate!)}, ${HooFormat.timeOnly(d.slotStart!)}–${HooFormat.timeOnly(d.slotEnd!)}',
                  style: t.body.copyWith(color: c.textSecondary),
                ),
              if (d.courierFirstName != null)
                Padding(
                  padding: const EdgeInsets.only(top: HooSpacing.xs),
                  child: Text(
                    [
                      l.ordersCourier(d.courierFirstName!),
                      if (d.courierEtaMinutes != null) l.ordersCourierEta(d.courierEtaMinutes!),
                      if (d.courierStopsAway != null) l.ordersCourierStops(d.courierStopsAway!),
                    ].join(' · '),
                    style: t.caption.copyWith(color: c.accent),
                  ),
                ),
              if (state.canChangeSlot && state.slotPhone != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(onPressed: () => _changeSlot(context), child: Text(l.ordersChangeSlot)),
                ),
            ],
          ),
        ),
        if (order.gift != null) ...[
          const SizedBox(height: HooSpacing.md),
          HooCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(HooIcons.gift, size: HooSize.iconSmall),
                    const SizedBox(width: HooSpacing.xs),
                    Text(l.checkoutGiftTitle, style: t.bodyStrong),
                  ],
                ),
                Text(l.checkoutGiftFor(order.gift!.recipientName), style: t.body),
                if (order.gift!.message != null && order.gift!.message!.isNotEmpty)
                  Text('“${order.gift!.message}”', style: t.body.copyWith(color: c.textSecondary)),
                if (order.gift!.receiptCode != null && !state.isRecipientView)
                  TextButton(
                    onPressed: () => context.router.push(GiftReceiptRoute(code: order.gift!.receiptCode)),
                    child: Text(l.checkoutGiftReceipt),
                  ),
              ],
            ),
          ),
        ],
        const SizedBox(height: HooSpacing.md),
        Text(l.ordersItems, style: t.h3),
        for (final line in order.lines) OrderLineTile(line: line, showPrices: showPrices),
        if (order.totals != null && showPrices) ...[const Divider(height: HooSpacing.lg), OrderTotalsCard(totals: order.totals!)],
        if (order.payment != null) ...[
          const SizedBox(height: HooSpacing.md),
          SummaryRow(label: order.payment!.method.label(l), value: _paymentStatus(l, order.payment!.status)),
        ],
        const SizedBox(height: HooSpacing.lg),
        if (state.canReturn)
          SecondaryButton(
            label: l.ordersRequestReturn,
            onPressed: () => context.router.push(ReturnRequestRoute(number: order.number, phone: state.access.phone)),
          ),
        if (state.whatsAppUrl != null) ...[
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(
            label: l.ordersContactWhatsApp,
            onPressed: () => launchUrl(Uri.parse(state.whatsAppUrl!), mode: LaunchMode.externalApplication),
          ),
        ],
        const SizedBox(height: HooSpacing.sm),
        TextButton(onPressed: cubit.refresh, child: Text(l.ordersRefresh)),
      ],
    );
  }

  String _paymentStatus(AppLocalizations l, PaymentStatus s) => s.label(l);
}

class _PayCard extends StatelessWidget {
  const _PayCard({required this.state});
  final OrderDetailState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<OrderDetailCubit>();
    final message = switch (state.payment) {
      PayFlow.failed => state.paymentFailure ?? l.checkoutPaymentFailedBody,
      PayFlow.pending => l.checkoutPaymentStillProcessing,
      PayFlow.awaitingReturn || PayFlow.verifying => l.checkoutPaymentWaitingTitle,
      _ => l.ordersPayPrompt,
    };
    return InlineAlert(
      kind: state.payment == PayFlow.failed ? HooAlertKind.error : HooAlertKind.warning,
      message: message,
      action: state.paymentBusy ? null : (state.payment == PayFlow.pending ? l.checkoutPaymentCheckNow : l.ordersPayAgain),
      onAction: state.paymentBusy ? null : (state.payment == PayFlow.pending ? cubit.checkPayment : cubit.payAgain),
    );
  }
}
