import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/widgets/product_rail.dart';
import '../../application/bag_cubit.dart';
import '../../domain/cart.dart';
import '../widgets/bag_line_tile.dart';

/// Bag tab: server-priced lines, promo, gift flag, free-delivery progress and the checkout bar.
@RoutePage()
class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  final _bag = sl<BagCubit>();

  @override
  void initState() {
    super.initState();
    _bag.refresh();
  }

  void _open(ProductCard p, String prefix) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: prefix));

  Future<void> _remove(CartItem item) async {
    final l = context.l10n;
    final removed = await _bag.remove(item);
    if (removed != null && mounted) {
      HooToast.show(context, l.cartRemoved(item.name), action: l.cartUndo, onAction: () => _bag.undoRemove(removed));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider.value(
      value: _bag,
      child: BlocConsumer<BagCubit, BagState>(
        listenWhen: (a, b) => b.error != null && a.error != b.error && b.cart != null,
        listener: (context, s) => HooToast.error(context, s.error!),
        builder: (context, s) {
          final cart = s.cart;
          return Scaffold(
            appBar: HooAppBar(title: l.navBag, showBack: false),
            body: Column(
              children: [
                OfflineBanner(visible: s.stale),
                Expanded(child: _body(context, s, cart)),
              ],
            ),
            bottomNavigationBar: cart == null || cart.isEmpty
                ? null
                : PriceSummaryBar(
                    total: cart.totals.total,
                    ctaLabel: l.cartCheckout,
                    caption: l.cartItemsCount(cart.itemsCount),
                    updating: s.busyItems.isNotEmpty || s.pendingQuantities.isNotEmpty || s.promoBusy,
                    onCta: cart.canCheckout && !s.stale && s.pendingQuantities.isEmpty ? () => context.router.push(const CheckoutRoute()) : null,
                    breakdown: [
                      PriceLine(label: l.summarySubtotal, amount: cart.totals.subtotal),
                      if (cart.totals.discount > 0) PriceLine(label: cart.promo?.code ?? l.summaryDiscount, amount: -cart.totals.discount, signed: true),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context, BagState s, Cart? cart) {
    final l = context.l10n;
    if (cart == null) {
      if (s.error != null) return HooErrorState(error: s.error!, onRetry: _bag.refresh);
      return ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          for (var i = 0; i < 3; i++) const Padding(padding: EdgeInsets.only(bottom: HooSpacing.lg), child: HooSkeleton(height: 110)),
        ],
      );
    }
    if (cart.isEmpty) {
      return RefreshIndicator(
        onRefresh: _bag.refresh,
        child: ListView(
          children: [
            HooEmptyState(
              icon: HooIcons.bag,
              title: l.cartEmptyTitle,
              message: l.cartEmptyBody,
              actionLabel: l.cartEmptyAction,
              onAction: () => context.router.navigate(const MainShellRoute(children: [ShopRoute()])),
            ),
            if (cart.bestsellers.isNotEmpty) ...[
              SectionHeader(title: l.cartBestsellers),
              const SizedBox(height: HooSpacing.md),
              ProductRail(products: cart.bestsellers, heroPrefix: 'bag-best', onOpen: _open, wishlist: sl.isRegistered<WishlistService>() ? sl<WishlistService>() : null),
            ],
          ],
        ),
      );
    }
    final enabled = !s.stale;
    return RefreshIndicator(
      onRefresh: _bag.refresh,
      child: ListView(
        padding: const EdgeInsets.only(bottom: HooSpacing.xl),
        children: [
          if (cart.freeDelivery != null)
            Padding(padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, 0), child: FreeDeliveryBar(progress: cart.freeDelivery!)),
          if (cart.hasLineErrors)
            Padding(padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, 0), child: InlineAlert(kind: HooAlertKind.warning, message: l.cartLineErrors)),
          for (final item in cart.items)
            Dismissible(
              key: ValueKey(item.id),
              direction: enabled ? DismissDirection.endToStart : DismissDirection.none,
              background: Container(
                color: context.hoo.colors.error,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: HooSpacing.screen),
                child: Icon(HooIcons.trash, color: context.hoo.colors.onAccent),
              ),
              onDismissed: (_) => _remove(item),
              child: BagLineTile(
                item: item,
                quantity: s.quantityOf(item),
                busy: s.busyItems.contains(item.id),
                enabled: enabled,
                onQuantity: (q) => _bag.setQuantity(item, q),
              ),
            ),
          Divider(color: context.hoo.colors.border, height: 1, indent: HooSpacing.screen, endIndent: HooSpacing.screen),
          Padding(
            padding: const EdgeInsets.all(HooSpacing.screen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PromoField(enabled: enabled),
                const SizedBox(height: HooSpacing.md),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: cart.isGift,
                  onChanged: enabled ? _bag.setGift : null,
                  secondary: const Icon(HooIcons.gift),
                  title: Text(l.cartIsGift, style: context.hoo.text.body),
                  subtitle: Text(l.cartIsGiftHint, style: context.hoo.text.caption),
                ),
                const SizedBox(height: HooSpacing.md),
                SummaryRow(label: l.summarySubtotal, value: HooFormat.money(context, cart.totals.subtotal)),
                if (cart.totals.discount > 0)
                  SummaryRow(label: l.summaryDiscount, value: HooFormat.signedMoney(context, -cart.totals.discount), valueColor: context.hoo.colors.accent),
                SummaryRow(label: l.summaryTotal, value: HooFormat.money(context, cart.totals.total), strong: true),
                if (cart.totals.vatIncluded > 0) Text(l.summaryVatIncluded(HooFormat.money(context, cart.totals.vatIncluded)), style: context.hoo.text.caption),
                Text(l.cartDeliveryAtCheckout, style: context.hoo.text.caption),
              ],
            ),
          ),
          if (cart.completeTheLook.isNotEmpty) ...[
            SectionHeader(title: l.cartCompleteTheLook),
            const SizedBox(height: HooSpacing.md),
            ProductRail(products: cart.completeTheLook, heroPrefix: 'bag-look', onOpen: _open, wishlist: sl.isRegistered<WishlistService>() ? sl<WishlistService>() : null),
          ],
        ],
      ),
    );
  }
}

class _PromoField extends StatefulWidget {
  const _PromoField({required this.enabled});
  final bool enabled;

  @override
  State<_PromoField> createState() => _PromoFieldState();
}

class _PromoFieldState extends State<_PromoField> {
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bag = context.read<BagCubit>();
    return BlocBuilder<BagCubit, BagState>(
      buildWhen: (a, b) => a.cart?.promo != b.cart?.promo || a.promoBusy != b.promoBusy || a.promoError != b.promoError,
      builder: (context, s) {
        final promo = s.cart?.promo;
        if (promo != null) {
          return Row(
            children: [
              Icon(promo.valid ? HooIcons.checkCircle : HooIcons.warning, color: promo.valid ? context.hoo.colors.accent : context.hoo.colors.error, size: 20),
              const SizedBox(width: HooSpacing.xs),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(promo.code, style: context.hoo.text.bodyStrong),
                    if (!promo.valid && promo.errorMessage != null) Text(promo.errorMessage!, style: context.hoo.text.caption.copyWith(color: context.hoo.colors.error)),
                  ],
                ),
              ),
              HooTextButton(label: l.commonRemove, onPressed: widget.enabled && !s.promoBusy ? bag.removePromo : null),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: HooTextField(
                controller: _code,
                hint: l.cartPromoHint,
                enabled: widget.enabled,
                textCapitalization: TextCapitalization.characters,
                errorText: s.promoError == null ? null : (s.promoError!.fieldError('code') ?? errorMessage(context, s.promoError!)),
                onSubmitted: (v) => bag.applyPromo(v),
              ),
            ),
            const SizedBox(width: HooSpacing.sm),
            SecondaryButton(label: l.commonApply, expand: false, loading: s.promoBusy, onPressed: widget.enabled ? () => bag.applyPromo(_code.text) : null),
          ],
        );
      },
    );
  }
}
