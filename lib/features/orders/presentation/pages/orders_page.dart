import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/orders_list_cubit.dart';
import '../widgets/order_widgets.dart';

/// "My orders": newest first, filter chips, infinite scroll, read-only offline.
@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<OrdersListCubit>()..load(), child: const _OrdersView());
}

class _OrdersView extends StatefulWidget {
  const _OrdersView();

  @override
  State<_OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<_OrdersView> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.hasClients && _scroll.position.pixels > _scroll.position.maxScrollExtent - 500) context.read<OrdersListCubit>().loadMore();
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  String _filterLabel(AppLocalizations l, OrderFilter f) => switch (f) {
    OrderFilter.all => l.ordersFilterAll,
    OrderFilter.active => l.ordersFilterActive,
    OrderFilter.delivered => l.ordersFilterDelivered,
    OrderFilter.closed => l.ordersFilterClosed,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return Scaffold(
      backgroundColor: c.background,
      appBar: HooAppBar(title: l.ordersTitle),
      body: BlocBuilder<OrdersListCubit, OrdersListState>(
        builder: (context, state) {
          final cubit = context.read<OrdersListCubit>();
          if (state.status == ListStatus.loading && state.items.isEmpty) return const Center(child: HooLoading());
          if (state.status == ListStatus.failure && state.items.isEmpty) return HooErrorState(error: state.error!, onRetry: cubit.load);
          if (state.items.isEmpty) {
            return HooEmptyState(
              title: l.ordersEmptyTitle,
              message: l.ordersEmptyMessage,
              icon: HooIcons.package,
              actionLabel: l.cartEmptyCta,
              onAction: () => context.router.navigate(const ShopRoute()),
            );
          }
          final visible = state.visible;
          return RefreshIndicator(
            onRefresh: cubit.refresh,
            child: HooConstrained(
              child: ListView(
                controller: _scroll,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(HooSpacing.screen),
                children: [
                  OfflineBanner(visible: state.stale),
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: OrderFilter.values.length,
                      separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
                      itemBuilder: (_, i) {
                        final f = OrderFilter.values[i];
                        return OptionChip(label: _filterLabel(l, f), uppercase: false, selected: f == state.filter, onTap: () => cubit.setFilter(f));
                      },
                    ),
                  ),
                  const SizedBox(height: HooSpacing.md),
                  if (visible.isEmpty) HooEmptyState(title: l.ordersNoMatch, compact: true, icon: HooIcons.package),
                  for (final o in visible)
                    Padding(
                      padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                      child: HooCard(
                        onTap: () => context.router.push(OrderDetailRoute(number: o.number)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 64,
                              height: 80,
                              child: HooNetworkImage(url: o.thumbnailUrl, borderRadius: HooRadius.cardAll, cacheWidth: 200),
                            ),
                            const SizedBox(width: HooSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text(o.number, style: t.bodyStrong)),
                                      OrderStatusPill(status: o.status),
                                    ],
                                  ),
                                  const SizedBox(height: HooSpacing.xxs),
                                  Text(
                                    '${HooFormat.date(context, o.createdAt)} · ${l.commonPieces(o.itemsCount)}',
                                    style: t.caption.copyWith(color: c.textSecondary),
                                  ),
                                  const SizedBox(height: HooSpacing.xxs),
                                  Text(HooFormat.money(context, o.total), style: t.bodyStrong),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (state.loadingMore)
                    const Padding(
                      padding: EdgeInsets.all(HooSpacing.md),
                      child: Center(child: HooLoading()),
                    ),
                  if (state.loadMoreError != null) SecondaryButton(label: l.commonRetry, onPressed: cubit.loadMore),
                  Center(
                    child: TextButton(onPressed: () => context.router.push(const ReturnsRoute()), child: Text(l.ordersMyReturns)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
