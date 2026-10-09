import 'package:flutter/material.dart';

import '../application/contracts.dart';
import '../design_system/design_system.dart';
import '../domain/models.dart';

/// Horizontal rail of product cards with live wishlist hearts. Navigation is the caller's (features own routes).
class ProductRail extends StatelessWidget {
  const ProductRail({super.key, required this.products, required this.onOpen, required this.heroPrefix, this.wishlist, this.cardWidth = 168});

  final List<ProductCard> products;
  final void Function(ProductCard product, String heroPrefix) onOpen;
  final String heroPrefix;
  final WishlistService? wishlist;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final list = wishlist;
    Widget rail(Set<String> ids) => SizedBox(
          height: cardWidth / HooSize.productImageAspect + 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
            itemCount: products.length,
            separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
            itemBuilder: (context, i) {
              final p = products[i];
              return HooReveal(
                index: i.clamp(0, 4),
                child: ProductCardTile(
                  product: p,
                  width: cardWidth,
                  heroTagPrefix: heroPrefix,
                  isWishlisted: ids.contains(p.id),
                  onWishlistTap: list == null ? null : () => list.toggle(context, p.id),
                  onTap: () => onOpen(p, heroPrefix),
                ),
              );
            },
          ),
        );
    if (list == null) return rail(const {});
    return StreamBuilder<Set<String>>(stream: list.ids, initialData: list.currentIds, builder: (context, s) => rail(s.data ?? const {}));
  }
}

/// Grid of product cards (2 columns on phones, 3–4 on tablets) as a sliver.
class ProductSliverGrid extends StatelessWidget {
  const ProductSliverGrid({super.key, required this.products, required this.onOpen, required this.heroPrefix, this.wishlist, this.trailingLoaders = 0});

  final List<ProductCard> products;
  final void Function(ProductCard product, String heroPrefix) onOpen;
  final String heroPrefix;
  final WishlistService? wishlist;

  /// Skeleton cards appended while the next page loads.
  final int trailingLoaders;

  @override
  Widget build(BuildContext context) {
    final list = wishlist;
    Widget grid(Set<String> ids) => SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: productGridColumns(context),
              crossAxisSpacing: HooSpacing.md,
              mainAxisSpacing: HooSpacing.lg,
              childAspectRatio: 0.52,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                if (i >= products.length) return const ProductCardSkeleton();
                final p = products[i];
                return HooReveal(
                  index: i % 4,
                  child: ProductCardTile(
                    product: p,
                    heroTagPrefix: heroPrefix,
                    isWishlisted: ids.contains(p.id),
                    onWishlistTap: list == null ? null : () => list.toggle(context, p.id),
                    onTap: () => onOpen(p, heroPrefix),
                  ),
                );
              },
              childCount: products.length + trailingLoaders,
            ),
          ),
        );
    if (list == null) return grid(const {});
    return StreamBuilder<Set<String>>(stream: list.ids, initialData: list.currentIds, builder: (context, s) => grid(s.data ?? const {}));
  }
}
