import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../bloc/search_bloc.dart';
import '../widgets/search_product_grid.dart';
import '../widgets/search_sections.dart';

/// Full-screen search: suggestions while typing, recent searches, results grid, bestsellers when idle or empty.
/// `/search?q=` deep links open with the query already searched.
@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key, @QueryParam('q') this.query});

  final String? query;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<SearchBloc>()..add(SearchStarted(initialQuery: query)),
    child: _SearchView(initialQuery: query?.trim() ?? ''),
  );
}

class _SearchView extends StatefulWidget {
  const _SearchView({required this.initialQuery});

  final String initialQuery;

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  late final _controller = TextEditingController(text: widget.initialQuery);
  final _focus = FocusNode();
  final _wishlist = sl<WishlistService>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    _focus.dispose();
    super.dispose();
  }

  // Rebuilds the clear button.
  void _onTextChanged() => setState(() {});

  void _submit(String text) {
    final q = text.trim();
    if (q.isEmpty) return;
    _controller.value = TextEditingValue(
      text: q,
      selection: TextSelection.collapsed(offset: q.length),
    );
    _focus.unfocus();
    context.read<SearchBloc>().add(SearchSubmitted(q));
  }

  void _fill(String text) {
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
    _focus.requestFocus();
    context.read<SearchBloc>().add(SearchQueryChanged(text));
  }

  void _clear() {
    _controller.clear();
    _focus.requestFocus();
    context.read<SearchBloc>().add(const SearchQueryChanged(''));
  }

  void _openProduct(ProductCard p) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: 'search'));

  void _toggleHeart(ProductCard p) => _wishlist.toggle(context, p.id);

  void _openStudio() => context.router.push(StudioRoute());

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocListener<SearchBloc, SearchState>(
      listenWhen: (a, b) => a.actionErrorId != b.actionErrorId && b.actionError != null,
      listener: (context, state) => HooToast.error(context, state.actionError!),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(HooSpacing.xs, HooSpacing.xs, HooSpacing.screen, HooSpacing.xs),
                child: Row(
                  children: [
                    HooIconButton(icon: HooIcons.back, semanticLabel: l.a11yBack, onPressed: () => context.router.maybePop()),
                    Expanded(
                      child: HooTextField(
                        controller: _controller,
                        focusNode: _focus,
                        autofocus: widget.initialQuery.isEmpty,
                        hint: l.searchHint,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        onChanged: (t) => context.read<SearchBloc>().add(SearchQueryChanged(t)),
                        onSubmitted: _submit,
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: HooSpacing.md, right: HooSpacing.xs),
                          child: Icon(HooIcons.search, size: HooSize.iconSmall, color: context.hoo.colors.textSecondary),
                        ),
                        suffix: AnimatedSwitcher(
                          duration: context.hoo.motion(HooDurations.fast),
                          child: _controller.text.isEmpty
                              ? const SizedBox.shrink()
                              : HooIconButton(icon: HooIcons.close, size: HooSize.iconSmall, semanticLabel: l.searchClearA11y, onPressed: _clear),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocSelector<SearchBloc, SearchState, bool>(
                selector: (s) => s.bestsellersStale && s.view != SearchView.suggestions,
                builder: (_, stale) => OfflineBanner(visible: stale),
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (a, b) => a.view != b.view,
                  builder: (context, state) => AnimatedSwitcher(
                    duration: context.hoo.motion(HooDurations.normal),
                    switchInCurve: HooCurves.standard,
                    switchOutCurve: HooCurves.exit,
                    child: switch (state.view) {
                      SearchView.idle => _IdleView(key: const ValueKey('idle'), onSubmit: _submit, onFill: _fill, grid: _grid),
                      SearchView.suggestions => _SuggestionsView(key: const ValueKey('suggestions'), onSubmit: _submit, onFill: _fill),
                      SearchView.results => _ResultsView(key: const ValueKey('results'), grid: _grid, onStudio: _openStudio),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _grid(List<ProductCard> products, {int skeletons = 0, String prefix = 'search'}) =>
      SearchProductGrid(products: products, wishlist: _wishlist, onOpen: _openProduct, onHeart: _toggleHeart, heroTagPrefix: prefix, skeletonCount: skeletons);
}

typedef _GridBuilder = Widget Function(List<ProductCard> products, {int skeletons, String prefix});

/// Empty field: recent searches (clear all) + bestsellers.
class _IdleView extends StatelessWidget {
  const _IdleView({super.key, required this.onSubmit, required this.onFill, required this.grid});

  final ValueChanged<String> onSubmit;
  final ValueChanged<String> onFill;
  final _GridBuilder grid;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (a, b) => a.recent != b.recent || a.bestsellers != b.bestsellers || a.bestsellersStatus != b.bestsellersStatus,
      builder: (context, state) => CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          if (state.recent.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, HooSpacing.xs),
                child: Row(
                  children: [
                    Expanded(
                      child: Semantics(header: true, child: Text(l.searchRecentTitle.toUpperCase(), style: context.hoo.text.labelSecondary)),
                    ),
                    HooTextButton(
                      label: l.commonClearAll,
                      style: HooType.caption.copyWith(fontWeight: FontWeight.w600),
                      onPressed: () => context.read<SearchBloc>().add(const SearchRecentCleared()),
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: state.recent.length,
              itemBuilder: (_, i) =>
                  SearchTermRow(text: state.recent[i], icon: HooIcons.clock, onTap: () => onSubmit(state.recent[i]), onFill: () => onFill(state.recent[i])),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.section)),
          ] else
            const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
          ..._bestsellers(context, state, l.searchBestsellersTitle, grid),
          const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xxl)),
        ],
      ),
    );
  }
}

/// Bestsellers section slivers (idle view and the no-results state).
List<Widget> _bestsellers(BuildContext context, SearchState state, String title, _GridBuilder grid) {
  if (state.bestsellersStatus == SearchStatus.failure) {
    return [
      SliverToBoxAdapter(
        child: HooErrorState(
          error: state.bestsellersError ?? const ApiException.network(),
          compact: true,
          onRetry: () => context.read<SearchBloc>().add(const SearchRetried()),
        ),
      ),
    ];
  }
  final loading = state.bestsellersStatus != SearchStatus.success;
  if (!loading && state.bestsellers.isEmpty) return const [];
  return [
    SliverToBoxAdapter(child: SectionHeader(title: title)),
    const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
    if (loading) const SearchGridSkeleton(count: 4) else grid(state.bestsellers, prefix: 'search-bestseller'),
  ];
}

/// Typing: "Search for “…”" + autocomplete.
class _SuggestionsView extends StatelessWidget {
  const _SuggestionsView({super.key, required this.onSubmit, required this.onFill});

  final ValueChanged<String> onSubmit;
  final ValueChanged<String> onFill;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (a, b) => a.suggestions != b.suggestions || a.query != b.query,
      builder: (context, state) {
        final q = state.query.trim();
        final suggestions = state.suggestions.where((s) => s.toLowerCase() != q.toLowerCase()).toList();
        return ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: HooSpacing.xs, bottom: HooSpacing.xxl),
          children: [
            SearchTermRow(text: l.searchFor(q), icon: HooIcons.search, onTap: () => onSubmit(q)),
            for (var i = 0; i < suggestions.length; i++)
              HooReveal(
                index: i,
                offset: HooSpacing.xs,
                child: SearchTermRow(
                  text: suggestions[i],
                  highlight: q,
                  icon: HooIcons.search,
                  onTap: () => onSubmit(suggestions[i]),
                  onFill: () => onFill(suggestions[i]),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Submitted query: count, grid with infinite scroll, Design-your-own offer, empty state with bestsellers.
class _ResultsView extends StatelessWidget {
  const _ResultsView({super.key, required this.grid, required this.onStudio});

  final _GridBuilder grid;
  final VoidCallback onStudio;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (a, b) =>
          a.resultsStatus != b.resultsStatus ||
          a.result != b.result ||
          a.loadingMore != b.loadingMore ||
          a.bestsellers != b.bestsellers ||
          a.bestsellersStatus != b.bestsellersStatus,
      builder: (context, state) {
        final bloc = context.read<SearchBloc>();
        if (state.resultsStatus == SearchStatus.failure) {
          return HooErrorState(error: state.error ?? const ApiException.network(), onRetry: () => bloc.add(const SearchRetried()));
        }
        final loading = state.resultsStatus == SearchStatus.loading || state.resultsStatus == SearchStatus.initial;
        final result = state.result;
        return NotificationListener<ScrollNotification>(
          onNotification: (n) {
            if (n.metrics.axis == Axis.vertical && n.metrics.extentAfter < n.metrics.viewportDimension && state.canLoadMore) {
              bloc.add(const SearchMoreRequested());
            }
            return false;
          },
          child: RefreshIndicator(
            color: context.hoo.colors.textPrimary,
            onRefresh: () async {
              bloc.add(SearchSubmitted(state.submittedQuery));
              await bloc.stream.firstWhere((s) => s.resultsStatus != SearchStatus.loading);
            },
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                if (loading) ...[
                  const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
                  const SearchGridSkeleton(),
                ] else if (state.hasNoResults) ...[
                  SliverToBoxAdapter(
                    child: HooEmptyState(
                      icon: HooIcons.search,
                      title: l.searchNoResultsTitle(state.submittedQuery),
                      message: l.searchNoResultsMessage,
                      compact: true,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.section),
                      child: DesignYourOwnCard(onTap: onStudio),
                    ),
                  ),
                  ..._bestsellers(context, state, l.searchMayLikeTitle, grid),
                ] else ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.md),
                      child: Semantics(
                        liveRegion: true,
                        child: Text(l.searchResultsCount(result!.totalCount, state.submittedQuery), style: context.hoo.text.caption),
                      ),
                    ),
                  ),
                  grid(result.items, skeletons: state.loadingMore ? productGridColumns(context) : 0),
                  if (result.suggestDesignYourOwn && !state.canLoadMore && !state.loadingMore)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.section, HooSpacing.screen, 0),
                        child: DesignYourOwnCard(onTap: onStudio),
                      ),
                    ),
                ],
                SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xxl + MediaQuery.paddingOf(context).bottom)),
              ],
            ),
          ),
        );
      },
    );
  }
}
