import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/home_content.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_sections.dart';

/// Home tab: header (logo, search, bag), hero, Design-your-own promo, rails, categories, collections, lookbook.
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => sl<HomeCubit>()..load(), child: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bag = sl<BagService>();
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(
        showBack: false,
        titleWidget: const Align(alignment: Alignment.centerLeft, child: HooLogo()),
        actions: [
          HooIconButton(icon: HooIcons.search, semanticLabel: l.commonSearch, onPressed: () => context.router.push(SearchRoute())),
          StreamBuilder<int>(
            stream: bag.count,
            initialData: bag.currentCount,
            builder: (context, snap) => HooIconButton(
              icon: HooIcons.bag,
              badge: snap.data,
              semanticLabel: l.a11yBag(snap.data ?? 0),
              onPressed: () => context.router.push(const BagRoute()),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          if (state.status == HomeStatus.loading) return const HomeSkeleton();
          if (state.status == HomeStatus.failure) return HooErrorState(error: state.error!, onRetry: cubit.load);
          final c = state.content;
          return RefreshIndicator(
            onRefresh: cubit.load,
            child: HooConstrained(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: HooSpacing.xl),
                children: [
                  OfflineBanner(visible: state.stale),
                  if (c.isEmpty)
                    HooEmptyState(title: l.homeEmptyTitle, message: l.homeEmptyMessage, icon: HooIcons.shop)
                  else ...[
                    HomeHero(product: c.newArrivals.firstOrNull),
                    const SizedBox(height: HooSpacing.section),
                    const DesignYourOwnPromo(),
                    if (c.newArrivals.isNotEmpty)
                      HomeRailSection(
                        title: l.homeNewArrivals,
                        items: c.newArrivals,
                        heroPrefix: 'home-new',
                        onSeeAll: () => context.router.push(CatalogListRoute(chip: 'New', title: l.homeNewArrivals)),
                      ),
                    if (c.categories.isNotEmpty || c.collections.isNotEmpty) HomeTaxonomy(categories: c.categories, collections: c.collections),
                    if (c.looks.isNotEmpty) HomeLooks(looks: c.looks),
                    if (c.bestsellers.isNotEmpty) HomeRailSection(title: l.homeBestsellers, items: c.bestsellers, heroPrefix: 'home-best'),
                    if (c.recentlyViewed.isNotEmpty) HomeRailSection(title: l.homeRecentlyViewed, items: c.recentlyViewed, heroPrefix: 'home-recent'),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Re-exported for the section widgets.
typedef HomeCategories = List<HomeCategory>;
