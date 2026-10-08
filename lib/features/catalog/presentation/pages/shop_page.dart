import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/product_query.dart';
import '../cubit/product_list_cubit.dart';
import '../widgets/product_list_view.dart';

/// Shop tab: search entry, category tabs + chips, filter/sort sheet, infinite product grid.
@RoutePage()
class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductListCubit>(param1: const ProductQuery())..load(),
      child: const _ShopView(),
    );
  }
}

class _ShopView extends StatelessWidget {
  const _ShopView();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(title: l.navShop, showBack: false),
      body: SafeArea(
        bottom: false,
        child: HooConstrained(
          child: ProductListView(
            headerSlivers: [
              SliverToBoxAdapter(child: _SearchEntry(onTap: () => context.router.push(SearchRoute()))),
              const SliverToBoxAdapter(child: _CategoryTabs()),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchEntry extends StatelessWidget {
  const _SearchEntry({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.xs),
      child: Semantics(
        button: true,
        label: context.l10n.commonSearch,
        child: HooPressable(
          onTap: onTap,
          child: Container(
            height: HooSize.inputHeight,
            padding: const EdgeInsets.symmetric(horizontal: HooSpacing.md),
            decoration: BoxDecoration(color: c.surface, borderRadius: HooRadius.inputAll),
            child: Row(
              children: [
                Icon(HooIcons.search, size: HooSize.iconSmall, color: c.textSecondary),
                const SizedBox(width: HooSpacing.sm),
                Expanded(
                  child: Text(
                    context.l10n.searchHint,
                    style: context.hoo.text.body.copyWith(color: c.textSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<ProductListCubit, ProductListState>(
      buildWhen: (a, b) => a.categories != b.categories || a.query.category != b.query.category || a.query.chip != b.query.chip,
      builder: (context, state) {
        final cubit = context.read<ProductListCubit>();
        final q = state.query;
        return SizedBox(
          height: 56,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.xs),
            children: [
              OptionChip(
                label: l.catalogTabAll,
                selected: q.category == null && q.chip == ProductChip.all,
                uppercase: false,
                onTap: () => cubit.apply(q.copyWith(category: null, chip: ProductChip.all)),
              ),
              const SizedBox(width: HooSpacing.xs),
              OptionChip(
                label: l.catalogTabNew,
                selected: q.chip == ProductChip.newIn,
                uppercase: false,
                onTap: () => cubit.apply(q.copyWith(category: null, chip: ProductChip.newIn)),
              ),
              const SizedBox(width: HooSpacing.xs),
              OptionChip(
                label: l.catalogTabSale,
                selected: q.chip == ProductChip.sale,
                uppercase: false,
                onTap: () => cubit.apply(q.copyWith(category: null, chip: ProductChip.sale)),
              ),
              for (final c in state.categories) ...[
                const SizedBox(width: HooSpacing.xs),
                OptionChip(
                  label: c.name,
                  selected: q.category == c.slug,
                  uppercase: false,
                  onTap: () => cubit.apply(q.copyWith(category: c.slug, chip: ProductChip.all)),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
