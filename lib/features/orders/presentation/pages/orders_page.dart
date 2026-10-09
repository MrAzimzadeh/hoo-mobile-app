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

/// My orders, paged.
@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<OrdersListCubit>()..load(),
      child: Scaffold(
        appBar: HooAppBar(title: l.ordersTitle),
        body: BlocBuilder<OrdersListCubit, OrdersListState>(
          builder: (context, s) {
            final cubit = context.read<OrdersListCubit>();
            if (s.status == ListStatus.loading) return const HooLoading();
            if (s.status == ListStatus.failure) return HooErrorState(error: s.error!, onRetry: cubit.load);
            if (s.isEmpty) {
              return HooEmptyState(icon: HooIcons.package, title: l.ordersEmptyTitle, message: l.ordersEmptyBody, actionLabel: l.cartEmptyAction, onAction: () => context.router.navigate(const MainShellRoute(children: [ShopRoute()])));
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.extentAfter < 400) cubit.loadMore();
                return false;
              },
              child: RefreshIndicator(
                onRefresh: cubit.refresh,
                child: ListView.separated(
                  itemCount: s.items.length + (s.loadingMore ? 1 : 0) + 1,
                  separatorBuilder: (_, _) => Divider(color: context.hoo.colors.border, height: 1, indent: HooSpacing.screen),
                  itemBuilder: (context, i) {
                    if (i == 0) return OfflineBanner(visible: s.stale);
                    final idx = i - 1;
                    if (idx >= s.items.length) return const Padding(padding: EdgeInsets.all(HooSpacing.lg), child: HooLoading());
                    final o = s.items[idx];
                    return InkWell(
                      onTap: () => context.router.push(OrderDetailRoute(number: o.number)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.md),
                        child: Row(children: [
                          SizedBox(width: 56, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: o.thumbnailUrl, borderRadius: HooRadius.cardAll, cacheWidth: 56))),
                          const SizedBox(width: HooSpacing.md),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(o.number, style: context.hoo.text.bodyStrong),
                              Text('${HooFormat.date(context, o.createdAt)} · ${l.cartItemsCount(o.itemsCount)}', style: context.hoo.text.caption),
                              const SizedBox(height: HooSpacing.xxs),
                              OrderStatusChip(status: o.status),
                            ]),
                          ),
                          Text(HooFormat.money(context, o.total), style: context.hoo.text.bodyStrong),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
