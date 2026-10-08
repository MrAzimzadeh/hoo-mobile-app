import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';
import '../../domain/product_query.dart';
import '../cubit/product_list_cubit.dart';
import 'filter_sheet.dart';
import 'product_tiles.dart';

/// Scrollable catalog body shared by Shop and the catalog list: header slivers, active-filter chips, count, the
/// infinite grid and its loading / empty / error / offline states. Needs a [ProductListCubit] above it.
class ProductListView extends StatefulWidget {
  const ProductListView({super.key, this.headerSlivers = const [], this.heroPrefix = 'shop', this.showCategoryFilter = true, this.showCollectionFilter = true});

  final List<Widget> headerSlivers;
  final String heroPrefix;
  final bool showCategoryFilter;
  final bool showCollectionFilter;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final p = _controller.position;
    if (p.pixels > p.maxScrollExtent - 600) context.read<ProductListCubit>().loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<ProductListCubit, ProductListState>(
      builder: (context, state) {
        final cubit = context.read<ProductListCubit>();
        final firstLoad = state.status == ProductListStatus.initial || (state.status == ProductListStatus.loading && state.items.isEmpty);
        return RefreshIndicator(
          onRefresh: cubit.refresh,
          child: CustomScrollView(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              ...widget.headerSlivers,
              SliverToBoxAdapter(child: OfflineBanner(visible: state.stale)),
              SliverToBoxAdapter(
                child: _Toolbar(state: state, showCategory: widget.showCategoryFilter, showCollection: widget.showCollectionFilter),
              ),
              if (firstLoad)
                const SliverProductGridSkeleton()
              else if (state.status == ProductListStatus.failure && state.items.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: HooErrorState(error: state.error!, onRetry: cubit.refresh),
                )
              else if (state.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: HooEmptyState(
                    title: l.catalogEmptyTitle,
                    message: l.catalogEmptyMessage,
                    icon: HooIcons.search,
                    actionLabel: state.query.filterCount > 0 ? l.commonClearAll : null,
                    onAction: state.query.filterCount > 0 ? cubit.clearFilters : null,
                  ),
                )
              else ...[
                SliverOpacity(
                  opacity: state.isRefreshing ? 0.5 : 1,
                  sliver: SliverProductGrid(items: state.items, heroPrefix: widget.heroPrefix),
                ),
                SliverToBoxAdapter(child: _Footer(state: state)),
              ],
              const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xl)),
            ],
          ),
        );
      },
    );
  }
}

class _Toolbar extends StatelessWidget {
  const _Toolbar({required this.state, required this.showCategory, required this.showCollection});

  final ProductListState state;
  final bool showCategory;
  final bool showCollection;

  Future<void> _openFilters(BuildContext context) async {
    final cubit = context.read<ProductListCubit>();
    final next = await showFilterSheet(
      context,
      query: state.query,
      facets: state.facets,
      collections: state.collections,
      palette: state.palette,
      showCategory: showCategory,
      showCollection: showCollection,
    );
    if (next != null) await cubit.apply(next);
  }

  String _label(List<FacetValue> facets, String value) => facets.where((f) => f.value == value).firstOrNull?.label ?? value;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<ProductListCubit>();
    final q = state.query;
    final chips = <(String, VoidCallback)>[
      for (final s in q.sizes) (s, () => cubit.removeSize(s)),
      for (final c in q.colors) (_label(state.facets.colors, c), () => cubit.removeColor(c)),
      for (final f in q.fits)
        (fitLabel(l, state.facets.fits.where((x) => x.value == f).firstOrNull ?? FacetValue(value: f, label: f)), () => cubit.removeFit(f)),
      if (q.hasPriceFilter) (_priceLabel(context, q), cubit.removePrice),
      if (q.inStockOnly) (l.catalogFilterInStockOnly, cubit.removeInStockOnly),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.xs, HooSpacing.screen, HooSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: state.status == ProductListStatus.success
                    ? Text(l.catalogResultCount(state.totalCount), style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary))
                    : const SizedBox.shrink(),
              ),
              SecondaryButton(
                expand: false,
                icon: HooIcons.filter,
                label: q.filterCount > 0 ? '${l.commonFilter} (${q.filterCount})' : l.commonFilter,
                onPressed: () => _openFilters(context),
              ),
            ],
          ),
          if (chips.isNotEmpty) ...[
            const SizedBox(height: HooSpacing.sm),
            Wrap(
              spacing: HooSpacing.xs,
              runSpacing: HooSpacing.xs,
              children: [for (final c in chips) OptionChip(label: c.$1, selected: true, uppercase: false, minWidth: 0, trailing: '×', onTap: c.$2)],
            ),
          ],
        ],
      ),
    );
  }

  String _priceLabel(BuildContext context, ProductQuery q) {
    final min = q.minPrice, max = q.maxPrice;
    if (min != null && max != null) return '${HooFormat.money(context, min)} – ${HooFormat.money(context, max)}';
    if (min != null) return '≥ ${HooFormat.money(context, min)}';
    return '≤ ${HooFormat.money(context, max!)}';
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.state});
  final ProductListState state;

  @override
  Widget build(BuildContext context) {
    if (state.loadingMore) {
      return const Padding(
        padding: EdgeInsets.all(HooSpacing.lg),
        child: Center(child: HooLoading()),
      );
    }
    if (state.loadMoreError != null) {
      return Padding(
        padding: const EdgeInsets.all(HooSpacing.md),
        child: SecondaryButton(label: context.l10n.commonRetry, onPressed: context.read<ProductListCubit>().loadMore),
      );
    }
    return const SizedBox.shrink();
  }
}
