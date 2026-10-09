import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/localization/content_strings.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/widgets/product_rail.dart';
import '../../domain/home_models.dart';
import '../cubit/home_cubit.dart';

/// Home: editorial hero, Studio promo, new arrivals, categories & collections, lookbook, bestsellers, recently viewed.
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<HomeCubit>()..load(), child: const _HomeView());
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final _scroll = ScrollController();

  WishlistService? get _wishlist => sl.isRegistered<WishlistService>() ? sl<WishlistService>() : null;

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _open(ProductCard p, String prefix) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: prefix));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<HomeCubit, LoadState<HomeFeed>>(
      builder: (context, s) {
        final feed = s.data;
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: context.read<HomeCubit>().refresh,
            edgeOffset: MediaQuery.paddingOf(context).top,
            child: CustomScrollView(
              controller: _scroll,
              slivers: [
                SliverToBoxAdapter(child: _Hero(scroll: _scroll)),
                SliverToBoxAdapter(child: OfflineBanner(visible: s.stale)),
                const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.section)),
                const SliverToBoxAdapter(child: _StudioPromo()),
                if (feed == null && s.error != null)
                  SliverToBoxAdapter(child: HooErrorState(error: s.error!, onRetry: context.read<HomeCubit>().load, compact: true))
                else if (feed == null)
                  const SliverToBoxAdapter(child: _RailSkeleton())
                else ...[
                  if (feed.newArrivals.isNotEmpty) ..._section(
                    SectionHeader(title: l.homeNewArrivals, onSeeAll: () => context.router.push(CatalogListRoute(chip: 'New', title: l.homeNewArrivals))),
                    ProductRail(products: feed.newArrivals, heroPrefix: 'home-new', wishlist: _wishlist, onOpen: _open),
                  ),
                  if (feed.categories.isNotEmpty) ..._section(SectionHeader(title: l.homeCategories), _Categories(categories: feed.categories)),
                  if (feed.collections.isNotEmpty) ..._section(SectionHeader(title: l.homeCollections), _Collections(collections: feed.collections)),
                  if (feed.looks.isNotEmpty) ..._section(SectionHeader(title: l.homeShopTheLook), _Looks(looks: feed.looks, onOpen: _open, wishlist: _wishlist)),
                  if (feed.bestsellers.isNotEmpty) ..._section(
                    SectionHeader(title: l.homeBestsellers, onSeeAll: () => context.router.push(CatalogListRoute(title: l.homeBestsellers))),
                    ProductRail(products: feed.bestsellers, heroPrefix: 'home-best', wishlist: _wishlist, onOpen: _open),
                  ),
                  if (feed.recentlyViewed.isNotEmpty)
                    ..._section(SectionHeader(title: l.homeRecentlyViewed), ProductRail(products: feed.recentlyViewed, heroPrefix: 'home-recent', wishlist: _wishlist, onOpen: _open, cardWidth: 132)),
                ],
                const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xxl)),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _section(Widget header, Widget body) => [
        const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.section)),
        SliverToBoxAdapter(child: HooReveal(child: header)),
        const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
        SliverToBoxAdapter(child: body),
      ];
}

/// Full-bleed new-drop hero with subtle parallax, staggered copy and the screen's one green CTA.
class _Hero extends StatelessWidget {
  const _Hero({required this.scroll});
  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final content = sl<ContentStrings>();
    final width = MediaQuery.sizeOf(context).width;
    final height = (width * 1.2).clamp(420.0, 720.0);
    final bag = sl<BagService>();
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRect(
            child: AnimatedBuilder(
              animation: scroll,
              builder: (context, child) {
                final offset = scroll.hasClients ? scroll.offset.clamp(0.0, height) : 0.0;
                return Transform.translate(offset: Offset(0, context.hoo.reducedMotion ? 0 : offset * 0.35), child: child);
              },
              child: const HooImageReveal(child: Image(image: AssetImage('assets/images/hero.jpg'), fit: BoxFit.cover)),
            ),
          ),
          ColoredBox(color: HooPalette.black.withValues(alpha: 0.28)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.xs, HooSpacing.xs, HooSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const HooLogo(variant: HooLogoVariant.light, size: 26),
                      const Spacer(),
                      HooIconButton(icon: HooIcons.search, color: HooPalette.white, semanticLabel: l.commonSearch, onPressed: () => context.router.push(SearchRoute())),
                      StreamBuilder<int>(
                        stream: bag.count,
                        initialData: bag.currentCount,
                        builder: (context, s) => HooIconButton(
                          icon: HooIcons.bag,
                          color: HooPalette.white,
                          badge: s.data,
                          semanticLabel: l.a11yBag(s.data ?? 0),
                          onPressed: () => AutoTabsRouter.of(context).setActiveIndex(3),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  HooReveal(index: 1, child: Text(content.text('home.hero.eyebrow', l.homeHeroEyebrow).toUpperCase(), style: HooType.label.copyWith(color: HooPalette.white))),
                  const SizedBox(height: HooSpacing.xs),
                  HooTextReveal(delay: HooDurations.stagger * 2, child: Text(content.text('home.hero.title', l.homeHeroTitle), style: HooType.hero.copyWith(color: HooPalette.white))),
                  const SizedBox(height: HooSpacing.sm),
                  HooReveal(
                    index: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: HooSpacing.lg),
                      child: Text(content.text('home.hero.subtitle', l.homeHeroSubtitle), style: HooType.body.copyWith(color: HooPalette.white.withValues(alpha: 0.85))),
                    ),
                  ),
                  const SizedBox(height: HooSpacing.lg),
                  HooReveal(
                    index: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: HooSpacing.md),
                      child: PrimaryButton.accent(
                        label: content.text('home.hero.cta', l.homeHeroCta),
                        expand: false,
                        onPressed: () => context.router.push(CatalogListRoute(chip: 'New', title: l.homeNewArrivals)),
                      ),
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

/// Dark-green "Design Your Own" card.
class _StudioPromo extends StatelessWidget {
  const _StudioPromo();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      child: HooReveal(
        child: HooPressable(
          onTap: () => context.router.push(StudioRoute()),
          semanticLabel: l.homeStudioTitle,
          child: ClipRRect(
            borderRadius: HooRadius.cardAll,
            child: Container(
              color: HooPalette.green,
              height: 180,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(HooSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l.navStudio.toUpperCase(), style: HooType.label.copyWith(color: HooPalette.white.withValues(alpha: 0.7))),
                          const SizedBox(height: HooSpacing.xs),
                          Text(l.homeStudioTitle, style: HooType.h2.copyWith(color: HooPalette.white)),
                          const SizedBox(height: HooSpacing.xs),
                          Text(l.homeStudioBody, maxLines: 2, overflow: TextOverflow.ellipsis, style: HooType.caption.copyWith(color: HooPalette.white.withValues(alpha: 0.8))),
                          const Spacer(),
                          Text('${l.homeStudioCta} →', style: HooType.bodyStrong.copyWith(color: HooPalette.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 130, height: double.infinity, child: Image(image: AssetImage('assets/images/cat-design.jpg'), fit: BoxFit.cover)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({required this.categories});
  final List<HomeCategory> categories;

  static const _art = ['assets/images/cat-hoodies.jpg', 'assets/images/cat-tshirts.jpg', 'assets/images/look-2.jpg', 'assets/images/look-4.jpg'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
        itemBuilder: (context, i) {
          final c = categories[i];
          return HooPressable(
            onTap: () => context.router.push(CatalogListRoute(category: c.slug, title: c.name)),
            semanticLabel: c.name,
            child: SizedBox(
              width: 160,
              child: ClipRRect(
                borderRadius: HooRadius.cardAll,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(_art[i % _art.length], fit: BoxFit.cover),
                    ColoredBox(color: HooPalette.black.withValues(alpha: 0.25)),
                    Padding(
                      padding: const EdgeInsets.all(HooSpacing.md),
                      child: Align(alignment: Alignment.bottomLeft, child: Text(c.name, style: HooType.h3.copyWith(color: HooPalette.white))),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Collections extends StatelessWidget {
  const _Collections({required this.collections});
  final List<HomeCollection> collections;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      child: Column(
        children: [
          for (final (i, col) in collections.indexed)
            HooReveal(
              index: i,
              child: InkWell(
                onTap: () => context.router.push(CatalogListRoute(collection: col.slug, title: col.name)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: HooSpacing.md),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
                  child: Row(
                    children: [
                      Text((i + 1).toString().padLeft(2, '0'), style: context.hoo.text.labelSecondary),
                      const SizedBox(width: HooSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(col.name, style: context.hoo.text.h2),
                            if (col.description?.isNotEmpty ?? false) Text(col.description!, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.hoo.text.caption),
                          ],
                        ),
                      ),
                      Icon(HooIcons.arrowRight, color: c.textPrimary),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Looks extends StatelessWidget {
  const _Looks({required this.looks, required this.onOpen, this.wishlist});
  final List<Look> looks;
  final void Function(ProductCard, String) onOpen;
  final WishlistService? wishlist;

  void _show(BuildContext context, Look look) {
    showHooSheet<void>(
      context,
      title: look.title,
      padding: const EdgeInsets.only(bottom: HooSpacing.lg),
      builder: (ctx) => ProductRail(
        products: look.products,
        heroPrefix: 'look-${look.id}',
        wishlist: wishlist,
        onOpen: (p, prefix) {
          Navigator.of(ctx).pop();
          onOpen(p, prefix);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
        itemCount: looks.length,
        separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
        itemBuilder: (context, i) {
          final look = looks[i];
          return HooPressable(
            onTap: () => _show(context, look),
            semanticLabel: look.title,
            child: SizedBox(
              width: 260,
              child: ClipRRect(
                borderRadius: HooRadius.cardAll,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    HooNetworkImage(url: look.imageUrl, cacheWidth: 520),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.all(HooSpacing.md),
                        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.sm, vertical: HooSpacing.xs),
                        color: context.hoo.colors.background,
                        child: Text(context.l10n.homeShopLookCount(look.products.length), style: context.hoo.text.label),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RailSkeleton extends StatelessWidget {
  const _RailSkeleton();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.section, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HooSkeleton(width: 160, height: 22),
            const SizedBox(height: HooSpacing.md),
            SizedBox(
              height: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (var i = 0; i < 3; i++) const Padding(padding: EdgeInsets.only(right: HooSpacing.md), child: ProductCardSkeleton(width: 168)),
              ]),
            ),
          ],
        ),
      );
}
