import 'package:flutter/material.dart';

import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';

/// Room under the 4:5 image for name (2 lines), price and color dots — scaled with the user's text size.
const double _cardTextExtent = 112;

/// Sliver grid of product cards with live wishlist hearts (2 columns on phones, 3–4 on tablets).
class SearchProductGrid extends StatelessWidget {
  const SearchProductGrid({
    super.key,
    required this.products,
    required this.wishlist,
    required this.onOpen,
    required this.onHeart,
    this.heroTagPrefix = 'search',
    this.skeletonCount = 0,
  });

  final List<ProductCard> products;
  final WishlistService wishlist;
  final ValueChanged<ProductCard> onOpen;
  final ValueChanged<ProductCard> onHeart;
  final String heroTagPrefix;

  /// Extra skeleton tiles appended while more results load.
  final int skeletonCount;

  @override
  Widget build(BuildContext context) {
    final columns = productGridColumns(context);
    final textExtent = MediaQuery.textScalerOf(context).scale(_cardTextExtent);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final tileWidth = (constraints.crossAxisExtent - HooSpacing.md * (columns - 1)) / columns;
          final delegate = SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: HooSpacing.md,
            mainAxisSpacing: HooSpacing.lg,
            mainAxisExtent: tileWidth / HooSize.productImageAspect + textExtent,
          );
          return StreamBuilder<Set<String>>(
            stream: wishlist.ids,
            initialData: wishlist.currentIds,
            builder: (context, snapshot) {
              final ids = snapshot.data ?? const <String>{};
              return SliverGrid(
                gridDelegate: delegate,
                delegate: SliverChildBuilderDelegate((context, i) {
                  if (i >= products.length) return const ProductCardSkeleton();
                  final p = products[i];
                  return HooReveal(
                    index: i % columns,
                    child: ProductCardTile(
                      product: p,
                      heroTagPrefix: heroTagPrefix,
                      isWishlisted: ids.contains(p.id),
                      onTap: () => onOpen(p),
                      onWishlistTap: () => onHeart(p),
                    ),
                  );
                }, childCount: products.length + skeletonCount),
              );
            },
          );
        },
      ),
    );
  }
}

/// Skeleton grid while the first results load.
class SearchGridSkeleton extends StatelessWidget {
  const SearchGridSkeleton({super.key, this.count = 6});

  final int count;

  @override
  Widget build(BuildContext context) {
    final columns = productGridColumns(context);
    final textExtent = MediaQuery.textScalerOf(context).scale(_cardTextExtent);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final tileWidth = (constraints.crossAxisExtent - HooSpacing.md * (columns - 1)) / columns;
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: HooSpacing.md,
              mainAxisSpacing: HooSpacing.lg,
              mainAxisExtent: tileWidth / HooSize.productImageAspect + textExtent,
            ),
            delegate: SliverChildBuilderDelegate((_, _) => const ProductCardSkeleton(), childCount: count),
          );
        },
      ),
    );
  }
}
