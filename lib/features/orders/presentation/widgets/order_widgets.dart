import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/models/order_models.dart';

/// Small rounded status label.
class OrderStatusPill extends StatelessWidget {
  const OrderStatusPill({super.key, required this.status});
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final bad = status == OrderStatus.cancelled;
    final good = status == OrderStatus.delivered;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.sm, vertical: HooSpacing.xxs),
      decoration: BoxDecoration(color: bad ? c.error.withValues(alpha: 0.1) : (good ? c.accentTint : c.surface), borderRadius: HooRadius.pillAll),
      child: Text(status.label(context.l10n), style: context.hoo.text.label.copyWith(color: bad ? c.error : (good ? c.accent : c.textPrimary))),
    );
  }
}

String orderEventLabel(AppLocalizations l, OrderEvent e) => switch (e.type) {
  OrderEventType.placed => l.ordersEventPlaced,
  OrderEventType.paymentCaptured => l.ordersEventPaymentCaptured,
  OrderEventType.paymentFailed => l.ordersEventPaymentFailed,
  OrderEventType.courierAssigned => l.ordersEventCourierAssigned,
  OrderEventType.courierEtaUpdated => l.ordersEventCourierEta,
  OrderEventType.slotChanged => l.ordersEventSlotChanged,
  OrderEventType.refundIssued => l.ordersEventRefund,
  OrderEventType.returnRequested => l.ordersEventReturnRequested,
  OrderEventType.returnUpdated => l.ordersEventReturnUpdated,
  OrderEventType.designApproved => l.ordersEventDesignApproved,
  _ => e.status.label(l),
};

/// Order history, newest first; the latest entry is highlighted.
class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.order});
  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final events = order.timelineNewestFirst;
    return StatusTimeline(
      entries: [
        for (final (i, e) in events.indexed)
          TimelineEntry(
            label: orderEventLabel(l, e),
            note: e.note,
            timestamp: HooFormat.dateTime(context, e.occurredAt),
            highlighted: i == 0,
            isError: e.type == OrderEventType.paymentFailed,
          ),
      ],
    );
  }
}

class OrderLineTile extends StatelessWidget {
  const OrderLineTile({super.key, required this.line, this.showPrices = true});
  final OrderLine line;
  final bool showPrices;

  @override
  Widget build(BuildContext context) {
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final l = context.l10n;
    final meta = [?line.color, if (line.size != null && line.size != Size.unknown) line.size!.label, '×${line.quantity}'].join(' · ');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            height: 80,
            child: HooNetworkImage(url: line.previewUrl, borderRadius: HooRadius.cardAll, cacheWidth: 200),
          ),
          const SizedBox(width: HooSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(line.name, style: t.bodyStrong, maxLines: 2, overflow: TextOverflow.ellipsis),
                Text(meta, style: t.caption.copyWith(color: c.textSecondary)),
                if (line.isCustom) Text(line.design?.status.labelOrNull(l) ?? l.ordersCustomDesign, style: t.caption.copyWith(color: c.accent)),
                if (line.nonReturnable && !line.isCustom) Text(l.ordersNonReturnable, style: t.caption.copyWith(color: c.textTertiary)),
              ],
            ),
          ),
          if (showPrices && line.lineTotal != null) Text(HooFormat.money(context, line.lineTotal!), style: t.bodyStrong),
        ],
      ),
    );
  }
}

extension on DesignStatus {
  String? labelOrNull(AppLocalizations l) => this == DesignStatus.unknown ? null : label(l);
}

class OrderTotalsCard extends StatelessWidget {
  const OrderTotalsCard({super.key, required this.totals});
  final OrderTotals totals;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.hoo.colors;
    return Column(
      children: [
        SummaryRow(label: l.summarySubtotal, value: HooFormat.money(context, totals.subtotal)),
        if (totals.discount > 0) SummaryRow(label: l.summaryDiscount, value: HooFormat.signedMoney(context, -totals.discount), valueColor: c.accent),
        SummaryRow(label: l.summaryDelivery, value: totals.delivery == 0 ? l.commonFree : HooFormat.money(context, totals.delivery)),
        if (totals.giftPackaging > 0) SummaryRow(label: l.summaryGiftPackaging, value: HooFormat.money(context, totals.giftPackaging)),
        if (totals.greetingCard > 0) SummaryRow(label: l.summaryGreetingCard, value: HooFormat.money(context, totals.greetingCard)),
        const Divider(height: HooSpacing.lg),
        SummaryRow(label: l.summaryTotal, value: HooFormat.money(context, totals.total), strong: true),
        if (totals.vatIncluded > 0) SummaryRow(label: l.summaryVatIncluded(HooFormat.money(context, totals.vatIncluded)), value: '', caption: true),
      ],
    );
  }
}
