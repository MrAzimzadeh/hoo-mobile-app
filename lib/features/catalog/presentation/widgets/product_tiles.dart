import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../app/router/app_router.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';

/// Rebuilds with the wishlist ids (hearts on every card of a screen share one subscription).
class WishlistIdsBuilder extends StatelessWidget {
  const WishlistIdsBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, Set<String> ids) builder;

  @override
  Widget build(BuildContext context) {
    final wishlist = GetIt.I<WishlistService>();
    return StreamBuilder<Set<String>>(
      stream: wishlist.ids,
      initialData: wishlist.currentIds,
      builder: (context, snap) => builder(context, snap.data ?? const {}),
    );
  }
}

/// Opens the PDP with the card as an instant first frame and a matching Hero tag.
void openProduct(BuildContext context, ProductCard product, {required String heroPrefix}) {
  context.router.push(ProductRoute(slug: product.slug, preview: product, heroTagPrefix: heroPrefix));
}

/// Card wired to navigation and the wishlist.
class CatalogProductTile extends StatelessWidget {
  const CatalogProductTile({super.key, required this.product, required this.heroPrefix, required this.wishlisted, this.width});

  final ProductCard product;
  final String heroPrefix;
  final bool wishlisted;
  final double? width;

  @override
  Widget build(BuildContext context) => ProductCardTile(
    product: product,
    width: width,
    heroTagPrefix: heroPrefix,
    isWishlisted: wishlisted,
    onTap: () => openProduct(context, product, heroPrefix: heroPrefix),
    onWishlistTap: () => GetIt.I<WishlistService>().toggle(context, product.id),
  );
}

/// Grid geometry shared by the Shop grid and its skeleton: 2 columns on phones, 3–4 on tablets.
abstract final class ProductGridMetrics {
  static int columns(double width) => width >= 900 ? 4 : (width >= 600 ? 3 : 2);

  static const gap = HooSpacing.md;

  /// Image (4:5) + name (2 lines) + price (may wrap) + color dots, scaled with the user's text size.
  static double tileExtent(BuildContext context, double tileWidth) {
    final scale = MediaQuery.textScalerOf(context);
    return tileWidth / HooSize.productImageAspect + HooSpacing.sm + scale.scale(84) + HooSpacing.md;
  }

  static SliverGridDelegate delegate(BuildContext context, double crossAxisExtent) {
    final cols = columns(crossAxisExtent);
    final tileWidth = (crossAxisExtent - gap * (cols - 1)) / cols;
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: cols,
      crossAxisSpacing: gap,
      mainAxisSpacing: HooSpacing.lg,
      mainAxisExtent: tileExtent(context, tileWidth),
    );
  }
}

/// 2-column product grid sliver (screen padding included).
class SliverProductGrid extends StatelessWidget {
  const SliverProductGrid({super.key, required this.items, required this.heroPrefix});

  final List<ProductCard> items;
  final String heroPrefix;

  @override
  Widget build(BuildContext context) {
    return WishlistIdsBuilder(
      builder: (context, ids) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
        sliver: SliverLayoutBuilder(
          builder: (context, constraints) => SliverGrid(
            gridDelegate: ProductGridMetrics.delegate(context, constraints.crossAxisExtent),
            delegate: SliverChildBuilderDelegate((context, i) {
              final p = items[i];
              return HooReveal(
                key: ValueKey(p.id),
                // stagger only within the first screenful; later pages appear as they scroll in
                index: i < 6 ? i : 0,
                child: CatalogProductTile(product: p, heroPrefix: heroPrefix, wishlisted: ids.contains(p.id)),
              );
            }, childCount: items.length),
          ),
        ),
      ),
    );
  }
}

/// Skeleton grid while the first page loads.
class SliverProductGridSkeleton extends StatelessWidget {
  const SliverProductGridSkeleton({super.key, this.count = 6});

  final int count;

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
    sliver: SliverLayoutBuilder(
      builder: (context, constraints) => SliverGrid(
        gridDelegate: ProductGridMetrics.delegate(context, constraints.crossAxisExtent),
        delegate: SliverChildBuilderDelegate((_, _) => const ProductCardSkeleton(), childCount: count),
      ),
    ),
  );
}

/// Horizontal rail of product cards (Home sections, PDP recommendations).
class ProductRail extends StatelessWidget {
  const ProductRail({super.key, required this.items, required this.heroPrefix, this.cardWidth = 168});

  final List<ProductCard> items;
  final String heroPrefix;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final height = ProductGridMetrics.tileExtent(context, cardWidth);
    return WishlistIdsBuilder(
      builder: (context, ids) => SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
          itemBuilder: (context, i) => HooReveal(
            index: i < 4 ? i : 0,
            child: CatalogProductTile(product: items[i], heroPrefix: heroPrefix, wishlisted: ids.contains(items[i].id), width: cardWidth),
          ),
        ),
      ),
    );
  }
}

/// Skeleton for [ProductRail].
class ProductRailSkeleton extends StatelessWidget {
  const ProductRailSkeleton({super.key, this.cardWidth = 168});

  final double cardWidth;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: ProductGridMetrics.tileExtent(context, cardWidth),
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      itemCount: 3,
      separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
      itemBuilder: (_, _) => ProductCardSkeleton(width: cardWidth),
    ),
  );
}
