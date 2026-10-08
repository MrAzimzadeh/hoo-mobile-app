import 'package:flutter/material.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/cart_models.dart';

/// Free-delivery progress from the server (`freeDelivery`): thin green bar + copy.
class FreeDeliveryBar extends StatelessWidget {
  const FreeDeliveryBar({super.key, required this.progress});

  final FreeDeliveryProgress progress;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final done = progress.qualifies;
    return Semantics(
      liveRegion: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(done ? HooIcons.checkCircle : HooIcons.truck, size: HooSize.iconSmall, color: done ? c.accent : c.textPrimary),
              const SizedBox(width: HooSpacing.xs),
              Expanded(
                child: AnimatedSwitcher(
                  duration: context.hoo.motion(HooDurations.normal),
                  child: Text(
                    done ? l.cartFreeDeliveryQualified : l.cartFreeDeliveryRemaining(HooFormat.money(context, progress.remaining)),
                    key: ValueKey(done ? 'done' : progress.remaining),
                    style: context.hoo.text.captionPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: HooSpacing.xs),
          ClipRRect(
            borderRadius: HooRadius.pillAll,
            child: SizedBox(
              height: 3,
              child: Stack(
                children: [
                  Positioned.fill(child: ColoredBox(color: c.border)),
                  TweenAnimationBuilder<double>(
                    tween: Tween(end: progress.fraction),
                    duration: context.hoo.motion(HooDurations.medium),
                    curve: HooCurves.emphasized,
                    builder: (_, v, _) => FractionallySizedBox(
                      widthFactor: v,
                      child: ColoredBox(color: c.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Promo code: input + Apply, or the applied code with a remove button. Shows the server's message on failure.
class PromoCodeSection extends StatefulWidget {
  const PromoCodeSection({
    super.key,
    required this.promo,
    required this.busy,
    required this.enabled,
    required this.onApply,
    required this.onRemove,
    this.error,
    this.onEdited,
  });

  final CartPromo? promo;
  final bool busy;
  final bool enabled;
  final Object? error;
  final Future<bool> Function(String code) onApply;
  final VoidCallback onRemove;
  final VoidCallback? onEdited;

  @override
  State<PromoCodeSection> createState() => _PromoCodeSectionState();
}

class _PromoCodeSectionState extends State<PromoCodeSection> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final has = _controller.text.trim().isNotEmpty;
      if (has != _hasText) setState(() => _hasText = has);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _apply() async {
    FocusScope.of(context).unfocus();
    final ok = await widget.onApply(_controller.text);
    if (ok && mounted) _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final t = context.hoo.text;
    final l = context.l10n;
    final promo = widget.promo;
    final error = widget.error;
    String? fieldError;
    if (error != null) {
      fieldError = error is ApiException ? (error.fieldError('code') ?? errorMessage(context, error)) : errorMessage(context, error);
    }

    return AnimatedSwitcher(
      duration: context.hoo.motion(HooDurations.normal),
      child: promo != null
          ? Column(
              key: const ValueKey('applied'),
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: HooSpacing.md),
                  decoration: BoxDecoration(
                    color: promo.valid ? c.accentTint : c.surface,
                    borderRadius: HooRadius.cardAll,
                    border: Border.all(color: promo.valid ? c.accent : c.error),
                  ),
                  child: Row(
                    children: [
                      Icon(promo.valid ? HooIcons.checkCircle : HooIcons.warning, size: HooSize.iconSmall, color: promo.valid ? c.accent : c.error),
                      const SizedBox(width: HooSpacing.xs),
                      Expanded(child: Text(promo.valid ? l.cartPromoApplied(promo.code) : promo.code, style: t.bodyStrong)),
                      if (widget.busy)
                        const Padding(
                          padding: EdgeInsets.all(HooSpacing.md),
                          child: SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                        )
                      else
                        HooIconButton(
                          icon: HooIcons.close,
                          size: HooSize.iconSmall,
                          semanticLabel: l.cartPromoRemoveA11y,
                          onPressed: widget.enabled ? widget.onRemove : null,
                        ),
                    ],
                  ),
                ),
                if (!promo.valid && (promo.errorMessage?.isNotEmpty ?? false))
                  Padding(
                    padding: const EdgeInsets.only(top: HooSpacing.xs),
                    child: Text(promo.errorMessage!, style: t.caption.copyWith(color: c.error)),
                  ),
              ],
            )
          : Row(
              key: const ValueKey('input'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: HooTextField(
                    controller: _controller,
                    hint: l.cartPromoHint,
                    errorText: fieldError,
                    enabled: widget.enabled,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.done,
                    onChanged: (_) => widget.onEdited?.call(),
                    onSubmitted: (_) => _apply(),
                  ),
                ),
                const SizedBox(width: HooSpacing.sm),
                SecondaryButton(label: l.commonApply, expand: false, loading: widget.busy, onPressed: widget.enabled && _hasText ? _apply : null),
              ],
            ),
    );
  }
}

/// "This is a gift" switch (`PUT /cart/gift`).
class GiftToggle extends StatelessWidget {
  const GiftToggle({super.key, required this.value, required this.onChanged, this.busy = false, this.enabled = true});

  final bool value;
  final ValueChanged<bool> onChanged;
  final bool busy;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    return MergeSemantics(
      child: HooCard(
        padding: const EdgeInsets.fromLTRB(HooSpacing.md, HooSpacing.sm, HooSpacing.xs, HooSpacing.sm),
        child: Row(
          children: [
            Icon(HooIcons.gift, color: context.hoo.colors.textPrimary),
            const SizedBox(width: HooSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.cartGiftTitle, style: t.bodyStrong),
                  Text(l.cartGiftSubtitle, style: t.caption),
                ],
              ),
            ),
            Switch.adaptive(value: value, onChanged: enabled && !busy ? onChanged : null),
          ],
        ),
      ),
    );
  }
}

/// Server totals of the bag. Delivery is only known at checkout.
class BagSummary extends StatelessWidget {
  const BagSummary({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final totals = cart.totals;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l.cartSummaryTitle, style: context.hoo.text.h3),
        const SizedBox(height: HooSpacing.sm),
        SummaryRow(label: l.cartSubtotalWithCount(cart.itemsCount), value: HooFormat.money(context, totals.subtotal)),
        if (totals.discount > 0)
          SummaryRow(label: l.summaryDiscount, value: HooFormat.signedMoney(context, -totals.discount), valueColor: context.hoo.colors.accent),
        SummaryRow(label: l.summaryDelivery, value: l.cartDeliveryAtCheckout),
        const Divider(height: HooSpacing.lg),
        SummaryRow(label: l.summaryTotal, value: HooFormat.money(context, totals.total), strong: true),
        if (totals.vatIncluded > 0) Text(l.summaryVatIncluded(HooFormat.money(context, totals.vatIncluded)), style: context.hoo.text.caption),
      ],
    );
  }
}

/// Horizontal product rail (bestsellers on the empty bag, complete-the-look under the lines).
class BagProductRail extends StatelessWidget {
  const BagProductRail({super.key, required this.title, required this.products, required this.onOpen, this.heroTagPrefix = 'bag'});

  final String title;
  final List<ProductCard> products;
  final ValueChanged<ProductCard> onOpen;
  final String heroTagPrefix;

  static const double _cardWidth = 156;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: HooSpacing.md),
        SizedBox(
          height: _cardWidth / HooSize.productImageAspect + 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
            itemCount: products.length,
            separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
            itemBuilder: (context, i) => HooReveal(
              index: i,
              child: ProductCardTile(product: products[i], width: _cardWidth, heroTagPrefix: heroTagPrefix, onTap: () => onOpen(products[i])),
            ),
          ),
        ),
      ],
    );
  }
}
