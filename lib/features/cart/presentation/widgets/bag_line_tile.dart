import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/cart_models.dart';

/// One bag line: thumbnail (design mockup for Studio lines), options, stock notes, quantity stepper, price and the
/// server's per-line error. Dumb — every action is a callback.
class BagLineTile extends StatelessWidget {
  const BagLineTile({
    super.key,
    required this.item,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
    this.onOpen,
    this.error,
    this.enabled = true,
    this.updating = false,
  });

  final CartItem item;

  /// Displayed quantity (optimistic while a step is pending).
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;
  final VoidCallback? onOpen;

  /// A failed update for this line (shown in addition to the server's line error).
  final Object? error;
  final bool enabled;
  final bool updating;

  static const double _thumbWidth = 88;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final t = context.hoo.text;
    final l = context.l10n;
    final options = [
      if (item.color?.isNotEmpty ?? false) item.color!,
      if (item.size != null && item.size != Size.unknown) l.cartSize(item.size!.label),
    ].join(' · ');
    final note = _stockNote(l);
    final serverError = item.errorMessage;
    final localError = error;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HooPressable(
                onTap: onOpen,
                child: SizedBox(
                  width: _thumbWidth,
                  child: AspectRatio(
                    aspectRatio: HooSize.productImageAspect,
                    child: HooNetworkImage(url: item.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: _thumbWidth.round(), semanticLabel: item.name),
                  ),
                ),
              ),
              const SizedBox(width: HooSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(item.name, style: t.bodyStrong, maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: HooSpacing.xs),
                        AnimatedOpacity(
                          opacity: updating ? 0.45 : 1,
                          duration: context.hoo.motion(HooDurations.fast),
                          child: AnimatedMoney(amount: item.lineTotal, style: t.bodyStrong),
                        ),
                      ],
                    ),
                    if (options.isNotEmpty) ...[const SizedBox(height: HooSpacing.xxs), Text(options, style: t.caption)],
                    if (item.isCustom) ...[
                      const SizedBox(height: HooSpacing.xs),
                      Wrap(
                        spacing: HooSpacing.xs,
                        runSpacing: HooSpacing.xxs,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          HooBadge(label: l.cartCustomDesign, accent: true),
                          if (item.leadTimeDays != null) Text(l.cartLeadTime(item.leadTimeDays!), style: t.caption),
                        ],
                      ),
                    ],
                    if (quantity > 1) ...[
                      const SizedBox(height: HooSpacing.xxs),
                      Text(l.cartUnitPrice(quantity, HooFormat.money(context, item.unitPrice)), style: t.caption),
                    ],
                    if (note != null) ...[
                      const SizedBox(height: HooSpacing.xxs),
                      Text(note, style: t.caption.copyWith(color: item.isBlocked ? c.error : c.textPrimary)),
                    ],
                    const SizedBox(height: HooSpacing.sm),
                    Row(
                      children: [
                        QuantityStepper(
                          value: quantity,
                          min: 1,
                          max: item.maxQuantity,
                          compact: true,
                          enabled: enabled && !item.isBlocked,
                          onChanged: onQuantityChanged,
                        ),
                        const Spacer(),
                        HooIconButton(
                          icon: HooIcons.trash,
                          size: HooSize.iconSmall,
                          color: c.textSecondary,
                          semanticLabel: l.cartRemoveA11y(item.name),
                          onPressed: enabled ? onRemove : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: context.hoo.motion(HooDurations.normal),
            curve: HooCurves.standard,
            child: serverError == null && localError == null
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsets.only(top: HooSpacing.sm),
                    child: InlineAlert(kind: HooAlertKind.error, message: localError != null ? errorMessage(context, localError) : serverError!),
                  ),
          ),
        ],
      ),
    );
  }

  String? _stockNote(AppLocalizations l) {
    switch (item.stock) {
      case StockState.lowStock:
        return item.stockLeft != null ? l.cartStockLeft(item.stockLeft!) : item.stock.label(l);
      case StockState.preorder:
      case StockState.outOfStock:
      case StockState.unavailable:
        return item.stock.label(l);
      case StockState.inStock:
      case StockState.madeToOrder:
      case StockState.unknown:
        return null;
    }
  }
}

/// Red swipe-to-remove background.
class BagLineDismissBackground extends StatelessWidget {
  const BagLineDismissBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Container(
      color: c.error,
      alignment: AlignmentDirectional.centerEnd,
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      child: Icon(HooIcons.trash, color: c.onAccent),
    );
  }
}

/// Skeleton for the first load.
class BagLineSkeleton extends StatelessWidget {
  const BagLineSkeleton({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.md),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 88, child: HooSkeleton(aspectRatio: HooSize.productImageAspect)),
        SizedBox(width: HooSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HooSkeleton(width: 160, height: 16, radius: 4),
              SizedBox(height: HooSpacing.xs),
              HooSkeleton(width: 96, height: 12, radius: 4),
              SizedBox(height: HooSpacing.lg),
              HooSkeleton(width: 112, height: 36, radius: HooRadius.pill),
            ],
          ),
        ),
      ],
    ),
  );
}
