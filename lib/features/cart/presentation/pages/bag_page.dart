import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/cart_models.dart';
import '../cubit/bag_cubit.dart';
import '../widgets/bag_line_tile.dart';
import '../widgets/bag_sections.dart';

/// Bag tab: lines with quantity steppers and swipe-to-remove, free-delivery progress, promo, gift toggle, the
/// server's summary and the sticky Checkout bar. Works offline read-only (stale banner).
@RoutePage()
class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<BagCubit>()..load(), child: const _BagView());
}

class _BagView extends StatefulWidget {
  const _BagView();

  @override
  State<_BagView> createState() => _BagViewState();
}

class _BagViewState extends State<_BagView> {
  StreamSubscription<BagEffect>? _effects;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<BagCubit>();
    _effects = cubit.effects.listen((effect) {
      if (!mounted) return;
      final l = context.l10n;
      switch (effect) {
        case BagItemRemoved(:final item):
          HooToast.show(context, l.cartRemoved(item.name), action: l.cartUndo, onAction: () => unawaited(cubit.undoRemove(item)));
        case BagFailure(:final error):
          HooToast.error(context, error);
        case BagPromoApplied(:final code):
          HooToast.success(context, l.cartPromoApplied(code));
      }
    });
  }

  @override
  void dispose() {
    _effects?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        final cubit = context.read<BagCubit>();
        final cart = state.cart;
        final router = context.router;
        Widget body;
        if (state.status == BagStatus.loading && cart == null) {
          body = ListView(padding: const EdgeInsets.all(HooSpacing.screen), children: List.generate(3, (_) => const BagLineSkeleton()));
        } else if (state.status == BagStatus.failure && cart == null) {
          body = HooErrorState(error: state.error!, onRetry: cubit.load);
        } else if (cart == null || cart.isEmpty) {
          body = _Empty(cart: cart);
        } else {
          body = RefreshIndicator(
            onRefresh: cubit.refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                OfflineBanner(visible: state.stale),
                if (cart.freeDelivery != null) ...[FreeDeliveryBar(progress: cart.freeDelivery!), const SizedBox(height: HooSpacing.md)],
                for (final item in cart.items)
                  Dismissible(
                    key: ValueKey(item.id),
                    direction: state.stale ? DismissDirection.none : DismissDirection.endToStart,
                    background: const BagLineDismissBackground(),
                    onDismissed: (_) => cubit.remove(item),
                    child: BagLineTile(
                      item: item,
                      quantity: state.pendingQuantities[item.id] ?? item.quantity,
                      onQuantityChanged: (q) => cubit.changeQuantity(item, q),
                      onRemove: () => cubit.remove(item),
                      onOpen: item.productSlug == null ? null : () => router.push(ProductRoute(slug: item.productSlug!)),
                      error: state.lineErrors[item.id],
                      enabled: !state.stale,
                      updating: state.pendingQuantities.containsKey(item.id),
                    ),
                  ),
                const SizedBox(height: HooSpacing.md),
                PromoCodeSection(
                  promo: cart.promo,
                  busy: state.promoBusy,
                  enabled: !state.stale,
                  error: state.promoError,
                  onApply: cubit.applyPromo,
                  onRemove: cubit.removePromo,
                  onEdited: cubit.clearPromoError,
                ),
                const SizedBox(height: HooSpacing.md),
                GiftToggle(value: cart.isGift, busy: state.giftBusy, enabled: !state.stale, onChanged: cubit.setGift),
                const SizedBox(height: HooSpacing.lg),
                BagSummary(cart: cart),
                if (cart.completeTheLook.isNotEmpty) ...[
                  const SizedBox(height: HooSpacing.lg),
                  BagProductRail(
                    title: l.cartCompleteTheLookTitle,
                    products: cart.completeTheLook,
                    onOpen: (p) => router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: 'bag')),
                  ),
                ],
              ],
            ),
          );
        }
        final canCheckout = cart != null && cart.canCheckout && !cart.hasLineErrors && !state.stale && state.pendingQuantities.isEmpty;
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: l.cartTitle, showBack: false),
          body: HooConstrained(child: body),
          bottomNavigationBar: cart == null || cart.isEmpty
              ? null
              : PriceSummaryBar(
                  total: cart.totals.total,
                  ctaLabel: l.cartCheckout,
                  caption: cart.hasLineErrors ? l.cartFixErrors : null,
                  updating: state.pendingQuantities.isNotEmpty || state.promoBusy || state.giftBusy,
                  onCta: canCheckout ? () => router.push(const CheckoutRoute()) : null,
                ),
        );
      },
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.cart});
  final Cart? cart;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bestsellers = cart?.bestsellers ?? const <ProductCard>[];
    return ListView(
      children: [
        HooEmptyState(
          title: l.cartEmptyTitle,
          message: l.cartEmptyMessage,
          icon: HooIcons.bag,
          actionLabel: l.cartEmptyCta,
          onAction: () => context.router.navigate(const ShopRoute()),
        ),
        if (bestsellers.isNotEmpty)
          BagProductRail(
            title: l.cartBestsellersTitle,
            products: bestsellers,
            onOpen: (p) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: 'bag-best')),
          ),
      ],
    );
  }
}
