import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../cubit/wishlist_cubits.dart';
import '../../domain/wishlist_models.dart';

/// Back-in-stock and price-drop alerts the customer subscribed to.
@RoutePage()
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<AlertsCubit>()..load(),
      child: Scaffold(
        backgroundColor: context.hoo.colors.background,
        appBar: HooAppBar(title: l.wishlistAlertsTitle),
        body: BlocBuilder<AlertsCubit, AlertsState>(
          builder: (context, state) {
            final cubit = context.read<AlertsCubit>();
            return switch (state.status) {
              ListStatus.loading => const Center(child: HooLoading()),
              ListStatus.failure => HooErrorState(error: state.error!, onRetry: cubit.load),
              ListStatus.success when state.items.isEmpty => HooEmptyState(
                title: l.wishlistAlertsEmptyTitle,
                message: l.wishlistAlertsEmptyMessage,
                icon: HooIcons.bell,
              ),
              ListStatus.success => RefreshIndicator(
                onRefresh: cubit.load,
                child: HooConstrained(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(HooSpacing.screen),
                    itemCount: state.items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: HooSpacing.sm),
                    itemBuilder: (context, i) => _AlertTile(alert: state.items[i]),
                  ),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  const _AlertTile({required this.alert});
  final StockAlert alert;

  String _describe(BuildContext context) {
    final l = context.l10n;
    if (alert.type == StockAlertType.priceDrop) return l.wishlistAlertsPriceDrop;
    final parts = [if (alert.size != null && alert.size != Size.unknown) alert.size!.label, ?alert.colorName];
    return parts.isEmpty ? l.wishlistAlertsBackInStock : '${l.wishlistAlertsBackInStock} · ${parts.join(' · ')}';
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final p = alert.product;
    return Dismissible(
      key: ValueKey(alert.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: HooSpacing.lg),
        color: c.error,
        child: Icon(HooIcons.trash, color: c.onAccent),
      ),
      onDismissed: (_) async {
        final error = await context.read<AlertsCubit>().delete(alert);
        if (error != null && context.mounted) HooToast.error(context, error);
      },
      child: HooCard(
        onTap: () => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: 'alert')),
        child: Row(
          children: [
            SizedBox(
              width: 64,
              height: 80,
              child: HooNetworkImage(url: p.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 200),
            ),
            const SizedBox(width: HooSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.name, style: t.bodyStrong, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: HooSpacing.xxs),
                  Text(_describe(context), style: t.caption.copyWith(color: c.textSecondary)),
                  const SizedBox(height: HooSpacing.xxs),
                  Text(
                    alert.isNotified ? l.wishlistAlertsNotified(HooFormat.date(context, alert.notifiedAt!)) : l.wishlistAlertsWaiting,
                    style: t.caption.copyWith(color: alert.isNotified ? c.accent : c.textTertiary),
                  ),
                ],
              ),
            ),
            HooIconButton(icon: HooIcons.trash, semanticLabel: l.commonDelete, onPressed: () => context.read<AlertsCubit>().delete(alert)),
          ],
        ),
      ),
    );
  }
}
