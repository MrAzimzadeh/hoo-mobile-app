import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';

/// Two/three/four-column grid of product cards. [footer] adds a per-item action under the card.
class WishlistGrid extends StatelessWidget {
  const WishlistGrid({super.key, required this.items, required this.heroPrefix, this.footer, this.footerHeight = 0, this.onHeart});

  final List<ProductCard> items;
  final String heroPrefix;
  final Widget Function(BuildContext context, ProductCard product)? footer;
  final double footerHeight;

  /// Overrides the heart tap (the Wishlist page removes with undo); default toggles through [WishlistService].
  final void Function(ProductCard product)? onHeart;

  @override
  Widget build(BuildContext context) {
    final wishlist = sl<WishlistService>();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.crossAxisExtent;
          final cols = width >= 900 ? 4 : (width >= 600 ? 3 : 2);
          const gap = HooSpacing.md;
          final tileWidth = (width - gap * (cols - 1)) / cols;
          final scale = MediaQuery.textScalerOf(context);
          final extent = tileWidth / HooSize.productImageAspect + HooSpacing.sm + scale.scale(84) + HooSpacing.md + footerHeight;
          return StreamBuilder<Set<String>>(
            stream: wishlist.ids,
            initialData: wishlist.currentIds,
            builder: (context, snap) {
              final ids = snap.data ?? const <String>{};
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: gap,
                  mainAxisSpacing: HooSpacing.lg,
                  mainAxisExtent: extent,
                ),
                delegate: SliverChildBuilderDelegate((context, i) {
                  final p = items[i];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ProductCardTile(
                          product: p,
                          heroTagPrefix: heroPrefix,
                          isWishlisted: ids.contains(p.id),
                          onTap: () => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: heroPrefix)),
                          onWishlistTap: () => onHeart != null ? onHeart!(p) : wishlist.toggle(context, p.id),
                        ),
                      ),
                      if (footer != null) footer!(context, p),
                    ],
                  );
                }, childCount: items.length),
              );
            },
          );
        },
      ),
    );
  }
}
