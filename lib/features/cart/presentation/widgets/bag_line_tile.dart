import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/cart.dart';

/// One bag line: thumbnail (design mockup for Studio lines), options, quantity stepper, price, per-line problem.
class BagLineTile extends StatelessWidget {
  const BagLineTile({super.key, required this.item, required this.quantity, required this.busy, required this.enabled, required this.onQuantity});

  final CartItem item;
  final int quantity;
  final bool busy;
  final bool enabled;
  final ValueChanged<int> onQuantity;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final options = [item.color, if (item.size != null && item.size != Size.unknown) item.size!.label].whereType<String>().join(' · ');
    final stockNote = switch (item.stock) {
      StockState.lowStock when item.stockLeft != null => l.cartOnlyLeft(item.stockLeft!),
      StockState.preorder => l.stockStatePreorder,
      StockState.madeToOrder => item.leadTimeDays == null ? l.stockStateMadeToOrder : l.cartMadeToOrderDays(item.leadTimeDays!),
      _ => null,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HooPressable(
            onTap: item.productSlug == null || item.isCustom ? null : () => context.router.push(ProductRoute(slug: item.productSlug!)),
            child: SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: HooSize.productImageAspect,
                child: HooNetworkImage(url: item.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 88, semanticLabel: item.name),
              ),
            ),
          ),
          const SizedBox(width: HooSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.isCustom) Padding(padding: const EdgeInsets.only(bottom: HooSpacing.xxs), child: HooBadge(label: l.cartCustomBadge, accent: true)),
                Text(item.name, style: context.hoo.text.h3.copyWith(fontSize: 15), maxLines: 2, overflow: TextOverflow.ellipsis),
                if (options.isNotEmpty) Text(options, style: context.hoo.text.caption),
                if (stockNote != null) Text(stockNote, style: context.hoo.text.caption.copyWith(color: c.accent)),
                if (item.hasProblem)
                  Padding(
                    padding: const EdgeInsets.only(top: HooSpacing.xxs),
                    child: Text(item.errorMessage ?? item.stock.label(l), style: context.hoo.text.caption.copyWith(color: c.error)),
                  ),
                const SizedBox(height: HooSpacing.sm),
                Row(
                  children: [
                    QuantityStepper(value: quantity, max: item.maxQuantity, compact: true, enabled: enabled && !item.hasProblem, onChanged: onQuantity),
                    const Spacer(),
                    AnimatedOpacity(
                      opacity: busy ? 0.4 : 1,
                      duration: context.hoo.motion(HooDurations.fast),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(HooFormat.money(context, item.lineTotal), style: context.hoo.text.bodyStrong),
                          if (item.quantity > 1) Text('${item.quantity} × ${HooFormat.money(context, item.unitPrice)}', style: context.hoo.text.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "X ₼ until free delivery" progress bar.
class FreeDeliveryBar extends StatelessWidget {
  const FreeDeliveryBar({super.key, required this.progress});
  final FreeDeliveryProgress progress;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(HooIcons.truck, size: 18, color: progress.qualifies ? c.accent : c.textPrimary),
            const SizedBox(width: HooSpacing.xs),
            Expanded(
              child: Text(
                progress.qualifies ? l.cartFreeDeliveryReached : l.cartFreeDeliveryRemaining(HooFormat.money(context, progress.remaining)),
                style: context.hoo.text.captionPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: HooSpacing.xs),
        ClipRRect(
          borderRadius: HooRadius.pillAll,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: progress.progress),
            duration: context.hoo.motion(HooDurations.slow),
            curve: HooCurves.emphasized,
            builder: (_, v, _) => LinearProgressIndicator(value: v, minHeight: 3, color: c.accent, backgroundColor: c.border),
          ),
        ),
      ],
    );
  }
}
