import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../data/bag_store.dart';
import '../../domain/cart_models.dart';

/// Mini-bag shown after a successful add: the added line, the server's subtotal, "View bag".
Future<void> presentAddedSheet(BuildContext context, BagStore store, CartItem? added) {
  final router = context.router.root;
  return showHooSheet<void>(
    context,
    title: context.l10n.cartAddedTitle,
    builder: (sheetContext) {
      final l = sheetContext.l10n;
      final cart = store.cart;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (added != null)
            Row(
              children: [
                SizedBox(
                  width: 64,
                  height: 80,
                  child: HooNetworkImage(url: added.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 200),
                ),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(added.name, style: sheetContext.hoo.text.bodyStrong, maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text([?added.color, if (added.size != null) added.size!.label].join(' · '), style: sheetContext.hoo.text.caption),
                    ],
                  ),
                ),
              ],
            ),
          if (cart != null) ...[
            const SizedBox(height: HooSpacing.md),
            SummaryRow(label: l.cartSubtotalWithCount(cart.itemsCount), value: HooFormat.money(sheetContext, cart.totals.subtotal)),
          ],
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton(
            label: l.cartViewBag,
            onPressed: () {
              Navigator.of(sheetContext).pop();
              router.navigate(const BagRoute());
            },
          ),
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(label: l.cartContinueShopping, onPressed: () => Navigator.of(sheetContext).pop()),
        ],
      );
    },
  );
}
