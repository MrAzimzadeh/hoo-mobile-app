import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';

/// "Thank you" after an order: number, what happens next, gift receipt code, links to the order and back to shopping.
@RoutePage()
class CheckoutConfirmationPage extends StatelessWidget {
  const CheckoutConfirmationPage({super.key, @PathParam('number') required this.number, this.giftReceiptCode});

  final String number;
  final String? giftReceiptCode;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final router = context.router;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) router.replaceAll([const MainShellRoute()]);
      },
      child: Scaffold(
        backgroundColor: c.background,
        body: SafeArea(
          child: HooConstrained(
            child: Padding(
              padding: const EdgeInsets.all(HooSpacing.screen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  const Center(child: HooSuccessCheck()),
                  const SizedBox(height: HooSpacing.lg),
                  HooReveal(
                    child: Text(l.checkoutConfirmedTitle, style: t.h1, textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: HooSpacing.xs),
                  HooReveal(
                    index: 1,
                    child: Text(l.checkoutConfirmedNumber(number), style: t.h3, textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: HooSpacing.sm),
                  HooReveal(
                    index: 2,
                    child: Text(
                      l.checkoutConfirmedBody,
                      style: t.body.copyWith(color: c.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (giftReceiptCode != null && giftReceiptCode!.isNotEmpty) ...[
                    const SizedBox(height: HooSpacing.lg),
                    HooCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.checkoutGiftReceipt, style: t.bodyStrong),
                          const SizedBox(height: HooSpacing.xxs),
                          Text(l.checkoutGiftReceiptHint, style: t.caption.copyWith(color: c.textSecondary)),
                          const SizedBox(height: HooSpacing.sm),
                          Row(
                            children: [
                              Expanded(child: SelectableText(giftReceiptCode!, style: t.h3)),
                              TextButton(
                                onPressed: () async {
                                  await Clipboard.setData(ClipboardData(text: giftReceiptCode!));
                                  if (context.mounted) HooToast.success(context, l.commonCopied);
                                },
                                child: Text(l.commonCopy),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  const Spacer(),
                  PrimaryButton(
                    label: l.checkoutViewOrder,
                    onPressed: () => router.replaceAll([const MainShellRoute(), OrderDetailRoute(number: number)]),
                  ),
                  const SizedBox(height: HooSpacing.sm),
                  SecondaryButton(label: l.cartContinueShopping, onPressed: () => router.replaceAll([const MainShellRoute()])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
