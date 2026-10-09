import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/wishlist_models.dart';
import '../../domain/wishlist_repository.dart';

/// Back-in-stock and price-drop subscriptions.
@RoutePage()
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = sl<WishlistRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<StockAlert>>(repo.alerts)..load(),
      child: Scaffold(
        appBar: HooAppBar(title: l.wishlistAlertsTitle),
        body: BlocBuilder<LoadCubit<List<StockAlert>>, LoadState<List<StockAlert>>>(
          builder: (context, s) {
            final cubit = context.read<LoadCubit<List<StockAlert>>>();
            final items = s.data;
            if (items == null) return s.error != null ? HooErrorState(error: s.error!, onRetry: cubit.load) : const HooLoading();
            if (items.isEmpty) return HooEmptyState(icon: HooIcons.bell, title: l.wishlistAlertsEmptyTitle, message: l.wishlistAlertsEmptyBody);
            return RefreshIndicator(
              onRefresh: cubit.refresh,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: HooSpacing.md),
                itemCount: items.length,
                separatorBuilder: (_, _) => Divider(color: context.hoo.colors.border, height: 1, indent: HooSpacing.screen),
                itemBuilder: (context, i) {
                  final a = items[i];
                  final what = a.type == StockAlertType.backInStock ? l.wishlistAlertBackInStock : l.wishlistAlertPriceDrop;
                  final detail = [what, if (a.size != null && a.size != Size.unknown) a.size!.label, if (a.notifiedAt != null) l.wishlistAlertNotified(HooFormat.dayMonth(context, a.notifiedAt!))].join(' · ');
                  return Dismissible(
                    key: ValueKey(a.id),
                    direction: DismissDirection.endToStart,
                    background: Container(color: context.hoo.colors.error, alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: HooSpacing.screen), child: Icon(HooIcons.trash, color: context.hoo.colors.onAccent)),
                    onDismissed: (_) async {
                      cubit.replace(items.where((x) => x.id != a.id).toList());
                      try {
                        await repo.deleteAlert(a.id);
                      } catch (e) {
                        cubit.replace(items);
                        if (context.mounted) HooToast.error(context, e);
                      }
                    },
                    child: InkWell(
                      onTap: () => context.router.push(ProductRoute(slug: a.product.slug, preview: a.product, heroTagPrefix: 'alert')),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.sm),
                        child: Row(
                          children: [
                            SizedBox(width: 56, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: a.product.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 56))),
                            const SizedBox(width: HooSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(a.product.name, style: context.hoo.text.bodyStrong, maxLines: 1, overflow: TextOverflow.ellipsis),
                                  Text(detail, style: context.hoo.text.caption),
                                ],
                              ),
                            ),
                            Icon(a.type == StockAlertType.backInStock ? HooIcons.bell : HooIcons.receipt, color: context.hoo.colors.textSecondary, size: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
