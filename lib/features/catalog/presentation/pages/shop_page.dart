import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repositories.dart';
import '../browse/catalog_browse_cubit.dart';
import '../widgets/catalog_browse_view.dart';

/// Shop tab: category tabs over the browse grid.
@RoutePage()
class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<CatalogBrowseCubit>()..load(),
      child: Scaffold(
        appBar: HooAppBar(
          showBack: false,
          titleWidget: Text(l.navShop, style: context.hoo.text.h3),
          actions: [HooIconButton(icon: HooIcons.search, semanticLabel: l.commonSearch, onPressed: () => context.router.push(SearchRoute()))],
        ),
        body: const CatalogBrowseView(heroPrefix: 'shop', header: [SliverToBoxAdapter(child: _CategoryTabs())]),
      ),
    );
  }
}

class _CategoryTabs extends StatefulWidget {
  const _CategoryTabs();

  @override
  State<_CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<_CategoryTabs> {
  List<Category> _categories = const [];

  @override
  void initState() {
    super.initState();
    sl<TaxonomyRepository>().categories().then((r) {
      if (mounted) setState(() => _categories = r.data.where((c) => c.parentId == null).toList());
    }).catchError((Object _) {});
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final selected = context.select<CatalogBrowseCubit, String?>((c) => c.state.query.category);
    final cubit = context.read<CatalogBrowseCubit>();
    Widget tab(String label, String? slug) {
      final active = selected == slug;
      return HooPressable(
        onTap: () => cubit.setCategory(slug),
        semanticLabel: label,
        child: Padding(
          padding: const EdgeInsets.only(right: HooSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedDefaultTextStyle(
                duration: context.hoo.motion(HooDurations.fast),
                style: context.hoo.text.h2.copyWith(color: active ? context.hoo.colors.textPrimary : context.hoo.colors.textTertiary),
                child: Text(label),
              ),
              AnimatedContainer(
                duration: context.hoo.motion(HooDurations.normal),
                curve: HooCurves.standard,
                margin: const EdgeInsets.only(top: HooSpacing.xxs),
                height: 2,
                width: active ? 24 : 0,
                color: context.hoo.colors.accent,
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
        children: [tab(l.catalogChipAll, null), for (final c in _categories) tab(c.name, c.slug)],
      ),
    );
  }
}
