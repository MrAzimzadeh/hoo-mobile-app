import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../l10n/l10n.dart';
import '../../domain/enums.dart';
import '../../domain/models.dart';
import '../../extensions/enum_labels.dart';
import '../motion/hoo_motion.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_icons.dart';
import 'hoo_image.dart';

/// Price with optional struck-through compare-at price and `-X%`. All values come from the server.
class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.price, this.compareAtPrice, this.discountPercent, this.style, this.inline = true});

  final double price;
  final double? compareAtPrice;
  final int? discountPercent;
  final TextStyle? style;
  final bool inline;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final main = (style ?? context.hoo.text.bodyStrong);
    final discounted = compareAtPrice != null && compareAtPrice! > price;
    final parts = <Widget>[
      Text(HooFormat.money(context, price), style: discounted ? main.copyWith(color: c.accent) : main),
      if (discounted)
        Text(
          HooFormat.money(context, compareAtPrice!),
          style: context.hoo.text.caption.copyWith(decoration: TextDecoration.lineThrough, decorationColor: c.textSecondary),
        ),
      if (discounted && discountPercent != null && discountPercent! > 0)
        Text(context.l10n.discountPercent(discountPercent!), style: context.hoo.text.label.copyWith(color: c.accent)),
    ];
    return inline
        ? Wrap(spacing: HooSpacing.xs, crossAxisAlignment: WrapCrossAlignment.center, children: parts)
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: parts);
  }
}

/// NEW / NEW DROP / BESTSELLER / SALE tag.
class HooBadge extends StatelessWidget {
  const HooBadge({super.key, required this.label, this.accent = false});

  factory HooBadge.product(BuildContext context, ProductBadge badge) =>
      HooBadge(label: badge.label(context.l10n), accent: badge == ProductBadge.newDrop || badge == ProductBadge.sale);

  final String label;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.xs, vertical: HooSpacing.xxs),
      decoration: BoxDecoration(color: accent ? c.accent : c.background, borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(label.toUpperCase(), style: HooType.label.copyWith(color: accent ? c.onAccent : c.textPrimary, fontSize: 10)),
    );
  }
}

/// Small color dots under a product card (`colorHexes`).
class ColorDots extends StatelessWidget {
  const ColorDots({super.key, required this.hexes, this.max = 5});

  final List<String> hexes;
  final int max;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final shown = hexes.take(max).toList();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final h in shown)
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(right: HooSpacing.xxs),
            decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: c.border)),
          ),
        if (hexes.length > max) Text('+${hexes.length - max}', style: context.hoo.text.caption.copyWith(fontSize: 11)),
      ],
    );
  }
}

/// `#RRGGBB` → Color (garment hexes from the API are exempt from the brand-color rule).
Color parseHex(String hex) {
  var h = hex.replaceAll('#', '').trim();
  if (h.length == 3) h = h.split('').map((c) => '$c$c').join();
  if (h.length == 6) h = 'FF$h';
  return Color(int.tryParse(h, radix: 16) ?? 0xFFE8E8E5);
}

/// Product card: 4:5 image on surface.muted, badge, heart top-right, name (h3), price, color dots.
/// The image is wrapped in a [Hero] tagged `product-<slug>` so it expands into the PDP gallery.
class ProductCardTile extends StatelessWidget {
  const ProductCardTile({
    super.key,
    required this.product,
    this.onTap,
    this.isWishlisted = false,
    this.onWishlistTap,
    this.width,
    this.heroTagPrefix = 'product',
  });

  final ProductCard product;
  final VoidCallback? onTap;
  final bool isWishlisted;
  final VoidCallback? onWishlistTap;
  final double? width;

  /// Distinct prefixes keep hero tags unique when the same product shows twice on one screen.
  final String heroTagPrefix;

  static String heroTag(String prefix, String slug) => '$prefix-$slug';

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final badge = product.badgeList.firstOrNull;
    final card = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: HooSize.productImageAspect,
          child: ClipRRect(
            borderRadius: HooRadius.cardAll,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: heroTag(heroTagPrefix, product.slug),
                  child: HooNetworkImage(url: product.imageUrl, cacheWidth: 360, semanticLabel: product.name),
                ),
                if (badge != null) Positioned(left: HooSpacing.xs, top: HooSpacing.xs, child: HooBadge.product(context, badge)),
                if (onWishlistTap != null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: WishlistHeart(active: isWishlisted, onTap: onWishlistTap!),
                  ),
                if (!product.inStock)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: c.background.withValues(alpha: 0.85),
                      padding: const EdgeInsets.symmetric(vertical: HooSpacing.xxs),
                      alignment: Alignment.center,
                      child: Text(l.stockStateOutOfStock.toUpperCase(), style: context.hoo.text.labelSecondary),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: HooSpacing.sm),
        Text(product.name, style: context.hoo.text.h3.copyWith(fontSize: 15, height: 20 / 15), maxLines: 2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: HooSpacing.xxs),
        PriceText(price: product.price, compareAtPrice: product.compareAtPrice, discountPercent: product.discountPercent),
        if (product.colorHexes.length > 1) ...[
          const SizedBox(height: HooSpacing.xs),
          ColorDots(hexes: product.colorHexes),
        ],
      ],
    );
    return SizedBox(
      width: width,
      child: HooPressable(onTap: onTap, scale: 0.985, semanticLabel: product.name, child: card),
    );
  }
}

/// Heart toggle with a small scale/state transition (never a big bounce).
class WishlistHeart extends StatelessWidget {
  const WishlistHeart({super.key, required this.active, required this.onTap, this.onImage = true});

  final bool active;
  final VoidCallback onTap;
  final bool onImage;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    return Semantics(
      button: true,
      toggled: active,
      label: active ? l.a11yRemoveFromWishlist : l.a11yAddToWishlist,
      excludeSemantics: true,
      child: HooPressable(
        onTap: () {
          HooHaptics.light();
          onTap();
        },
        scale: 0.85,
        child: SizedBox.square(
          dimension: HooSize.touchTarget,
          child: Center(
            child: AnimatedSwitcher(
              duration: context.hoo.motion(HooDurations.normal),
              switchInCurve: HooCurves.emphasized,
              transitionBuilder: (child, a) => ScaleTransition(scale: Tween(begin: 0.7, end: 1.0).animate(a), child: FadeTransition(opacity: a, child: child)),
              child: Icon(
                active ? HooIcons.heartFilled : HooIcons.heart,
                key: ValueKey(active),
                size: 22,
                color: active ? c.accent : (onImage ? HooPalette.black : c.textPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
