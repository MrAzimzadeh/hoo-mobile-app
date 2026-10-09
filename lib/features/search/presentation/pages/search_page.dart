import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/widgets/product_rail.dart';
import '../cubit/search_cubit.dart';

/// Full-screen search: suggestions while typing, recent searches, results grid, empty state with bestsellers.
@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key, @QueryParam('q') this.query});

  final String? query;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final _cubit = sl<SearchCubit>()..init(widget.query);
  late final _field = TextEditingController(text: widget.query ?? '');
  final _focus = FocusNode();

  WishlistService? get _wishlist => sl.isRegistered<WishlistService>() ? sl<WishlistService>() : null;

  @override
  void dispose() {
    _cubit.close();
    _field.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _submit(String q) {
    _field.text = q;
    _focus.unfocus();
    _cubit.submit(q);
  }

  void _open(ProductCard p, String prefix) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: prefix));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: HooAppBar(
          titleWidget: TextField(
            controller: _field,
            focusNode: _focus,
            autofocus: widget.query == null,
            textInputAction: TextInputAction.search,
            onChanged: _cubit.typed,
            onSubmitted: _submit,
            style: context.hoo.text.body,
            decoration: InputDecoration(
              hintText: l.searchHint,
              isDense: true,
              prefixIcon: const Icon(HooIcons.search, size: 20),
              suffixIcon: ListenableBuilder(
                listenable: _field,
                builder: (context, _) => _field.text.isEmpty
                    ? const SizedBox.shrink()
                    : IconButton(
                        tooltip: l.commonClear,
                        icon: const Icon(HooIcons.close, size: 18),
                        onPressed: () {
                          _field.clear();
                          _cubit.typed('');
                          _focus.requestFocus();
                        },
                      ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, s) {
            if (s.searching) return const _ResultsSkeleton();
            if (s.error != null) return HooErrorState(error: s.error!, onRetry: () => _cubit.submit(s.text));
            final r = s.result;
            if (r != null) return _results(context, s);
            final typing = s.text.trim().length >= 2;
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: HooSpacing.md),
              children: [
                if (typing && s.suggestions.isNotEmpty) ...[
                  _label(context, l.searchSuggestions),
                  for (final sug in s.suggestions) HooListTile(title: sug, icon: HooIcons.search, showChevron: false, onTap: () => _submit(sug)),
                ],
                if (!typing && s.recent.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.xs, 0),
                    child: Row(children: [
                      Expanded(child: Text(l.searchRecent.toUpperCase(), style: context.hoo.text.labelSecondary)),
                      HooTextButton(label: l.commonClearAll, onPressed: _cubit.clearRecent, style: HooType.caption.copyWith(fontWeight: FontWeight.w600)),
                    ]),
                  ),
                  for (final q in s.recent) HooListTile(title: q, icon: HooIcons.clock, showChevron: false, onTap: () => _submit(q)),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _label(BuildContext context, String text) =>
      Padding(padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.xs), child: Text(text.toUpperCase(), style: context.hoo.text.labelSecondary));

  Widget _results(BuildContext context, SearchState s) {
    final l = context.l10n;
    final r = s.result!;
    final studioPromo = r.suggestDesignYourOwn
        ? Padding(
            padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, 0),
            child: HooCard(
              color: HooPalette.green,
              onTap: () => context.router.push(StudioRoute()),
              child: Row(children: [
                const Icon(HooIcons.studio, color: HooPalette.white),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(l.searchDesignYourOwnTitle, style: HooType.bodyStrong.copyWith(color: HooPalette.white)),
                    Text(l.searchDesignYourOwnBody, style: HooType.caption.copyWith(color: HooPalette.white.withValues(alpha: 0.8))),
                  ]),
                ),
              ]),
            ),
          )
        : null;
    if (r.items.isEmpty) {
      return ListView(
        children: [
          HooEmptyState(icon: HooIcons.search, title: l.searchNoResultsTitle(r.query), message: l.searchNoResultsBody, compact: true),
          ?studioPromo,
          if (s.bestsellers.isNotEmpty) ...[
            const SizedBox(height: HooSpacing.section),
            SectionHeader(title: l.homeBestsellers),
            const SizedBox(height: HooSpacing.md),
            ProductRail(products: s.bestsellers, heroPrefix: 'search-best', wishlist: _wishlist, onOpen: _open),
          ],
        ],
      );
    }
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, HooSpacing.md), child: Text(l.searchResults(r.totalCount, r.query), style: context.hoo.text.caption)),
        ),
        ProductSliverGrid(products: r.items, heroPrefix: 'search', wishlist: _wishlist, onOpen: _open),
        if (studioPromo != null) SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.only(top: HooSpacing.lg), child: studioPromo)),
        const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xxl)),
      ],
    );
  }
}

class _ResultsSkeleton extends StatelessWidget {
  const _ResultsSkeleton();

  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.lg)),
        ProductSliverGrid(products: const [], heroPrefix: 'search', onOpen: (_, _) {}, trailingLoaders: 4),
      ]);
}
