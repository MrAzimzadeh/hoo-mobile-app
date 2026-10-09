import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../data/checkout_repository.dart';
import '../../domain/checkout_models.dart';

/// Order confirmed — a brand moment: check animation, progressive reveal, order number, payment status, gift receipt.
@RoutePage()
class CheckoutConfirmationPage extends StatefulWidget {
  const CheckoutConfirmationPage({super.key, @PathParam('number') required this.number, this.giftReceiptCode});

  final String number;
  final String? giftReceiptCode;

  @override
  State<CheckoutConfirmationPage> createState() => _CheckoutConfirmationPageState();
}

class _CheckoutConfirmationPageState extends State<CheckoutConfirmationPage> {
  PaymentState? _payment;

  @override
  void initState() {
    super.initState();
    sl<CheckoutRepository>().paymentStatus(widget.number).then((p) {
      if (mounted) setState(() => _payment = p);
    }).catchError((Object _) {});
  }

  void _copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
    HooToast.show(context, context.l10n.commonCopied);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final signedIn = sl<AuthGate>().isSignedIn;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.router.replaceAll([const MainShellRoute()]);
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(HooSpacing.screen),
            children: [
              const SizedBox(height: HooSpacing.xxl),
              const Center(child: HooSuccessCheck(size: 96)),
              const SizedBox(height: HooSpacing.xl),
              HooTextReveal(delay: HooDurations.slow, child: Text(l.checkoutConfirmedTitle, textAlign: TextAlign.center, style: context.hoo.text.h1)),
              const SizedBox(height: HooSpacing.sm),
              HooReveal(delay: HooDurations.slow, index: 1, child: Text(l.checkoutConfirmedBody, textAlign: TextAlign.center, style: context.hoo.text.bodySecondary)),
              const SizedBox(height: HooSpacing.xl),
              HooReveal(
                delay: HooDurations.slow,
                index: 2,
                child: HooCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(l.checkoutOrderNumber.toUpperCase(), style: context.hoo.text.labelSecondary),
                      Row(children: [
                        Expanded(child: Text(widget.number, style: context.hoo.text.h2)),
                        HooIconButton(icon: HooIcons.copy, semanticLabel: l.commonCopy, onPressed: () => _copy(widget.number)),
                      ]),
                      if (_payment != null) ...[
                        const SizedBox(height: HooSpacing.xs),
                        Text('${_payment!.method.label(l)} · ${_payment!.status.label(l)}', style: context.hoo.text.caption),
                        Text(_payment!.orderStatus.label(l), style: context.hoo.text.captionPrimary),
                      ],
                      if (widget.giftReceiptCode != null) ...[
                        Divider(color: context.hoo.colors.border, height: HooSpacing.xl),
                        Text(l.checkoutGiftReceipt.toUpperCase(), style: context.hoo.text.labelSecondary),
                        Row(children: [
                          Expanded(child: Text(widget.giftReceiptCode!, style: context.hoo.text.bodyStrong)),
                          HooIconButton(icon: HooIcons.copy, semanticLabel: l.commonCopy, onPressed: () => _copy(widget.giftReceiptCode!)),
                        ]),
                        Text(l.checkoutGiftReceiptHint, style: context.hoo.text.caption),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: HooSpacing.xl),
              HooReveal(
                delay: HooDurations.slow,
                index: 3,
                child: PrimaryButton(
                  label: l.checkoutTrackOrder,
                  onPressed: () => context.router.replaceAll([
                    const MainShellRoute(),
                    if (signedIn) OrderDetailRoute(number: widget.number) else TrackOrderRoute(number: widget.number),
                  ]),
                ),
              ),
              const SizedBox(height: HooSpacing.sm),
              HooReveal(
                delay: HooDurations.slow,
                index: 4,
                child: SecondaryButton(label: l.checkoutContinueShopping, onPressed: () => context.router.replaceAll([const MainShellRoute()])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
