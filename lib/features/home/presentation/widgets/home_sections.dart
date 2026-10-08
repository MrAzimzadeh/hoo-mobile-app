import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/home_content.dart';

/// Full-width campaign banner: the newest product's photo, a headline and the one green CTA of the screen.
class HomeHero extends StatelessWidget {
  const HomeHero({super.key, required this.product});
  final ProductCard? product;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.hoo.colors;
    final t = context.hoo.text;
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Stack(
        fit: StackFit.expand,
        children: [
          HooImageReveal(child: HooNetworkImage(url: product?.imageUrl, cacheWidth: 1400)),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, c.scrim]),
            ),
          ),
          Positioned(
            left: HooSpacing.screen,
            right: HooSpacing.screen,
            bottom: HooSpacing.xl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HooReveal(
                  child: Text(l.badgeNewDrop.toUpperCase(), style: t.label.copyWith(color: c.onAccent)),
                ),
                const SizedBox(height: HooSpacing.xs),
                HooTextReveal(
                  child: Text(l.homeHeroTitle, style: t.display.copyWith(color: c.onAccent)),
                ),
                const SizedBox(height: HooSpacing.md),
                HooReveal(
                  index: 2,
                  child: PrimaryButton.accent(
                    label: l.homeHeroCta,
                    expand: false,
                    onPressed: () => context.router.push(CatalogListRoute(chip: 'New', title: l.homeNewArrivals)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Dark-green "Design your own" promo → Studio.
class DesignYourOwnPromo extends StatelessWidget {
  const DesignYourOwnPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.hoo.colors;
    final t = context.hoo.text;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      child: HooReveal(
        child: HooPressable(
          onTap: () => context.router.push(StudioRoute()),
          child: Container(
            padding: const EdgeInsets.all(HooSpacing.lg),
            decoration: const BoxDecoration(color: HooPalette.green, borderRadius: HooRadius.cardAll),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.homeDesignTitle, style: t.h2.copyWith(color: c.onAccent)),
                      const SizedBox(height: HooSpacing.xs),
                      Text(l.homeDesignBody, style: t.body.copyWith(color: c.onAccent)),
                    ],
                  ),
                ),
                const SizedBox(width: HooSpacing.md),
                Icon(HooIcons.arrowRight, color: c.onAccent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Wishlisted extends StatelessWidget {
  const _Wishlisted({required this.builder});
  final Widget Function(BuildContext, Set<String>) builder;

  @override
  Widget build(BuildContext context) {
    final w = sl<WishlistService>();
    return StreamBuilder<Set<String>>(stream: w.ids, initialData: w.currentIds, builder: (c, s) => builder(c, s.data ?? const {}));
  }
}

class HomeRailSection extends StatelessWidget {
  const HomeRailSection({super.key, required this.title, required this.items, required this.heroPrefix, this.onSeeAll});

  final String title;
  final List<ProductCard> items;
  final String heroPrefix;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    const cardWidth = 168.0;
    final scale = MediaQuery.textScalerOf(context);
    final height = cardWidth / HooSize.productImageAspect + HooSpacing.sm + scale.scale(84) + HooSpacing.md;
    return Padding(
      padding: const EdgeInsets.only(top: HooSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: title, onSeeAll: onSeeAll),
          const SizedBox(height: HooSpacing.sm),
          _Wishlisted(
            builder: (context, ids) => SizedBox(
              height: height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
                itemBuilder: (context, i) {
                  final p = items[i];
                  return ProductCardTile(
                    product: p,
                    width: cardWidth,
                    heroTagPrefix: heroPrefix,
                    isWishlisted: ids.contains(p.id),
                    onTap: () => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: heroPrefix)),
                    onWishlistTap: () => sl<WishlistService>().toggle(context, p.id),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Category and collection chips → scoped catalog lists.
class HomeTaxonomy extends StatelessWidget {
  const HomeTaxonomy({super.key, required this.categories, required this.collections});

  final List<HomeCategory> categories;
  final List<HomeCollection> collections;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: HooSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (categories.isNotEmpty) ...[
            SectionHeader(title: l.homeCategories),
            const SizedBox(height: HooSpacing.sm),
            _ChipRow(
              chips: [for (final c in categories) (c.name, () => context.router.push(CatalogListRoute(category: c.slug, title: c.name)))],
            ),
          ],
          if (collections.isNotEmpty) ...[
            const SizedBox(height: HooSpacing.lg),
            SectionHeader(title: l.homeCollections),
            const SizedBox(height: HooSpacing.sm),
            _ChipRow(
              chips: [for (final c in collections) (c.name, () => context.router.push(CatalogListRoute(collection: c.slug, title: c.name)))],
            ),
          ],
        ],
      ),
    );
  }
}

class _ChipRow extends StatelessWidget {
  const _ChipRow({required this.chips});
  final List<(String, VoidCallback)> chips;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
        itemCount: chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
        itemBuilder: (_, i) => OptionChip(label: chips[i].$1, uppercase: false, onTap: chips[i].$2),
      ),
    );
  }
}

/// Lookbook: editorial image per look with its products ("Shop the look").
class HomeLooks extends StatelessWidget {
  const HomeLooks({super.key, required this.looks});
  final List<HomeLook> looks;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: HooSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l.homeShopTheLook),
          const SizedBox(height: HooSpacing.sm),
          SizedBox(
            height: 360,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
              itemCount: looks.length,
              separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
              itemBuilder: (context, i) {
                final look = looks[i];
                final first = look.products.firstOrNull;
                return SizedBox(
                  width: 260,
                  child: HooPressable(
                    onTap: first == null ? null : () => context.router.push(ProductRoute(slug: first.slug, preview: first, heroTagPrefix: 'look')),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        HooNetworkImage(url: look.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 800),
                        if (look.title.isNotEmpty)
                          Positioned(
                            left: HooSpacing.md,
                            bottom: HooSpacing.md,
                            child: Text(look.title, style: context.hoo.text.h3.copyWith(color: context.hoo.colors.onAccent)),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          AspectRatio(aspectRatio: 4 / 5, child: HooSkeleton(radius: 0)),
          SizedBox(height: HooSpacing.lg),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: HooSpacing.screen),
            child: HooSkeleton(height: 96),
          ),
        ],
      ),
    );
  }
}
