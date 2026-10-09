import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/widgets/product_rail.dart';
import '../../domain/catalog_query.dart';
import '../../domain/catalog_repositories.dart';
import '../browse/catalog_browse_cubit.dart';
import 'filter_sheet.dart';

/// Browse UI shared by the Shop tab and catalog lists: quick chips, filter/sort, active filters, result count and an
/// infinite product grid. [header] slivers go above (category tabs, titles).
class CatalogBrowseView extends StatefulWidget {
  const CatalogBrowseView({super.key, this.header = const [], required this.heroPrefix, this.lockCategory = false});

  final List<Widget> header;
  final String heroPrefix;
  final bool lockCategory;

  @override
  State<CatalogBrowseView> createState() => _CatalogBrowseViewState();
}

class _CatalogBrowseViewState extends State<CatalogBrowseView> {
  final _scroll = ScrollController();
  List<ColorInfo> _palette = const [];

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_maybeLoadMore);
    sl<TaxonomyRepository>().colors().then((r) {
      if (mounted) setState(() => _palette = r.data);
    }).catchError((Object _) {});
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _maybeLoadMore() {
    if (_scroll.position.extentAfter < 800) context.read<CatalogBrowseCubit>().loadMore();
  }

  String _chipLabel(ProductChip c) => switch (c) {
        ProductChip.all => context.l10n.catalogChipAll,
        ProductChip.newIn => context.l10n.catalogChipNew,
        ProductChip.sale => context.l10n.catalogChipSale,
        ProductChip.oversized => context.l10n.catalogChipOversized,
      };

  String _filterLabel(ActiveFilter f, CatalogBrowseState s) {
    final l = context.l10n;
    String facet(List<dynamic> values) => (values.where((v) => v.value == f.value).firstOrNull?.label as String?) ?? f.value;
    return switch (f.kind) {
      CatalogFilterKind.category => facet(s.facets.categories),
      CatalogFilterKind.collection => f.value,
      CatalogFilterKind.size => f.value,
      CatalogFilterKind.color => facet(s.facets.colors),
      CatalogFilterKind.fit => facet(s.facets.fits),
      CatalogFilterKind.fabric => facet(s.facets.fabrics),
      CatalogFilterKind.price =>
        '${HooFormat.money(context, s.query.minPrice ?? s.facets.minPrice ?? 0)} – ${HooFormat.money(context, s.query.maxPrice ?? s.facets.maxPrice ?? 0)}',
      CatalogFilterKind.inStock => l.catalogFilterInStock,
    };
  }

  Future<void> _openFilters(CatalogBrowseState s) async {
    final cubit = context.read<CatalogBrowseCubit>();
    final q = await showFilterSheet(context, query: s.query, facets: s.facets, palette: _palette, lockCategory: widget.lockCategory);
    if (q != null) await cubit.updateQuery(q);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final wishlist = sl.isRegistered<WishlistService>() ? sl<WishlistService>() : null;
    return BlocBuilder<CatalogBrowseCubit, CatalogBrowseState>(
      builder: (context, s) {
        final cubit = context.read<CatalogBrowseCubit>();
        return RefreshIndicator(
          onRefresh: () async {
            final e = await cubit.refresh();
            if (e != null && context.mounted) HooToast.error(context, e);
          },
          child: CustomScrollView(
            controller: _scroll,
            slivers: [
              ...widget.header,
              SliverToBoxAdapter(child: OfflineBanner(visible: s.stale)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 56,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.xs),
                    children: [
                      for (final c in ProductChip.values)
                        Padding(
                          padding: const EdgeInsets.only(right: HooSpacing.xs),
                          child: OptionChip(label: _chipLabel(c), selected: s.query.chip == c, onTap: () => cubit.setChip(c)),
                        ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.xs, HooSpacing.xs, HooSpacing.xs),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          s.status == BrowseStatus.ready ? l.catalogShowing(s.items.length, s.totalCount) : ' ',
                          style: context.hoo.text.caption,
                        ),
                      ),
                      HooTextButton(
                        label: s.activeFilters.isEmpty ? l.catalogFilterAndSort : l.catalogFilterCount(s.activeFilters.length),
                        onPressed: () => _openFilters(s),
                        style: HooType.caption.copyWith(fontWeight: FontWeight.w600),
                      ),
                      HooIconButton(icon: HooIcons.filter, semanticLabel: l.catalogFilterAndSort, onPressed: () => _openFilters(s)),
                    ],
                  ),
                ),
              ),
              if (s.activeFilters.isNotEmpty)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
                      children: [
                        for (final f in s.activeFilters)
                          Padding(
                            padding: const EdgeInsets.only(right: HooSpacing.xs),
                            child: OptionChip(
                              label: _filterLabel(f, s),
                              uppercase: false,
                              style: OptionChipStyle.tint,
                              selected: true,
                              leading: Icon(HooIcons.close, size: 14, color: context.hoo.colors.textPrimary),
                              onTap: () => cubit.removeFilter(f),
                            ),
                          ),
                        HooTextButton(label: l.commonClearAll, onPressed: cubit.clearFilters, style: HooType.caption.copyWith(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.sm)),
              if (s.status == BrowseStatus.loading)
                ProductSliverGrid(products: const [], heroPrefix: widget.heroPrefix, onOpen: (_, _) {}, trailingLoaders: 6)
              else if (s.status == BrowseStatus.failure)
                SliverFillRemaining(hasScrollBody: false, child: HooErrorState(error: s.error!, onRetry: cubit.load))
              else if (s.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: HooEmptyState(
                    icon: HooIcons.search,
                    title: l.catalogEmptyTitle,
                    message: l.catalogEmptyBody,
                    actionLabel: s.activeFilters.isEmpty ? null : l.commonClearAll,
                    onAction: s.activeFilters.isEmpty ? null : cubit.clearFilters,
                  ),
                )
              else ...[
                ProductSliverGrid(
                  products: s.items,
                  heroPrefix: widget.heroPrefix,
                  wishlist: wishlist,
                  trailingLoaders: s.loadingMore ? productGridColumns(context) : 0,
                  onOpen: (p, prefix) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: prefix)),
                ),
                if (s.loadMoreError != null)
                  SliverToBoxAdapter(child: HooErrorState(error: s.loadMoreError!, onRetry: cubit.retryLoadMore, compact: true)),
              ],
              const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xxl)),
            ],
          ),
        );
      },
    );
  }
}
