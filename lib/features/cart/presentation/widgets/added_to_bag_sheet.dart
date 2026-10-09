import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../application/bag_cubit.dart';

/// Mini-bag after a successful add: the bag summary from the server, "View bag" and "Checkout".
Future<void> showAddedToBagSheet(BuildContext context, BagCubit bag) {
  HooHaptics.light();
  final router = context.router;
  return showHooSheet<void>(
    context,
    title: context.l10n.cartAddedTitle,
    builder: (ctx) {
      final l = ctx.l10n;
      final cart = bag.state.cart;
      final last = cart?.items.lastOrNull;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (last != null)
            HooReveal(
              child: Row(
                children: [
                  SizedBox(width: 64, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: last.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 64))),
                  const SizedBox(width: HooSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(last.name, style: ctx.hoo.text.h3, maxLines: 2, overflow: TextOverflow.ellipsis),
                        Text([last.color, last.size?.label].whereType<String>().join(' · '), style: ctx.hoo.text.caption),
                        Text(HooFormat.money(ctx, last.unitPrice), style: ctx.hoo.text.bodyStrong),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (cart != null) ...[
            const SizedBox(height: HooSpacing.md),
            SummaryRow(label: l.cartItemsCount(cart.itemsCount), value: HooFormat.money(ctx, cart.totals.total), strong: true),
          ],
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton.accent(
            label: l.cartCheckout,
            onPressed: () {
              Navigator.of(ctx).pop();
              router.push(const CheckoutRoute());
            },
          ),
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(
            label: l.cartViewBag,
            onPressed: () {
              Navigator.of(ctx).pop();
              router.navigate(const MainShellRoute(children: [BagRoute()]));
            },
          ),
        ],
      );
    },
  );
}
