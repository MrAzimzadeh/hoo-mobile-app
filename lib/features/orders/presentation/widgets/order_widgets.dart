import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/order_models.dart';

/// Status chip: green for good news, red for problems, neutral otherwise.
class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final positive = const {OrderStatus.delivered, OrderStatus.readyForPickup, OrderStatus.outForDelivery, OrderStatus.paid}.contains(status);
    final negative = const {OrderStatus.cancelled, OrderStatus.returned, OrderStatus.refunded}.contains(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.sm, vertical: HooSpacing.xxs),
      decoration: BoxDecoration(
        color: positive ? c.accentTint : c.surface,
        borderRadius: HooRadius.pillAll,
        border: Border.all(color: positive ? c.accent : c.border),
      ),
      child: Text(status.label(context.l10n).toUpperCase(), style: HooType.label.copyWith(fontSize: 10, color: negative ? c.textSecondary : positive ? c.accent : c.textPrimary)),
    );
  }
}

/// Localized label of a timeline event.
String orderEventLabel(AppLocalizations l, OrderEvent e) => switch (e.type) {
      OrderEventType.placed => l.ordersEventPlaced,
      OrderEventType.paymentCaptured => l.ordersEventPaymentCaptured,
      OrderEventType.paymentFailed => l.ordersEventPaymentFailed,
      OrderEventType.courierAssigned => e.data?['courier'] == null ? l.ordersEventCourierAssigned : l.ordersEventCourierAssignedNamed(e.data!['courier']!),
      OrderEventType.courierEtaUpdated => l.ordersEventEtaUpdated,
      OrderEventType.slotChanged => l.ordersEventSlotChanged,
      OrderEventType.refundIssued => l.ordersEventRefund,
      OrderEventType.giftMessageEdited => l.ordersEventGiftMessage,
      OrderEventType.returnRequested => l.ordersEventReturnRequested,
      OrderEventType.returnUpdated => l.ordersEventReturnUpdated,
      OrderEventType.designApproved => l.ordersEventDesignApproved,
      OrderEventType.designChangesRequested => l.ordersEventDesignChanges,
      OrderEventType.statusChanged || OrderEventType.unknown => e.status.label(l),
    };

/// Order timeline, most recent first.
class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.events});
  final List<OrderEvent> events;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final sorted = [...events]..sort((a, b) => b.occurredAt.compareTo(a.occurredAt));
    return StatusTimeline(entries: [
      for (final (i, e) in sorted.indexed)
        TimelineEntry(
          label: orderEventLabel(l, e),
          note: e.note,
          timestamp: HooFormat.dateTime(context, e.occurredAt),
          highlighted: i == 0,
          isError: e.type == OrderEventType.paymentFailed,
        ),
    ]);
  }
}

/// One order line (stock or Studio design) with optional prices.
class OrderLineRow extends StatelessWidget {
  const OrderLineRow({super.key, required this.line, required this.showPrices});
  final OrderLine line;
  final bool showPrices;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final d = line.design;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 64, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: line.previewUrl, borderRadius: HooRadius.cardAll, cacheWidth: 64))),
        const SizedBox(width: HooSpacing.md),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (line.isCustom) Padding(padding: const EdgeInsets.only(bottom: HooSpacing.xxs), child: HooBadge(label: l.cartCustomBadge, accent: true)),
            Text(line.name, style: context.hoo.text.bodyStrong),
            Text([line.color, if (line.size != null && line.size != Size.unknown) line.size!.label, '× ${line.quantity}'].whereType<String>().join(' · '), style: context.hoo.text.caption),
            if (d != null) Text(d.status.label(l), style: context.hoo.text.caption.copyWith(color: context.hoo.colors.accent)),
          ]),
        ),
        if (showPrices && line.lineTotal != null) Text(HooFormat.money(context, line.lineTotal!), style: context.hoo.text.bodyStrong),
      ]),
    );
  }
}
