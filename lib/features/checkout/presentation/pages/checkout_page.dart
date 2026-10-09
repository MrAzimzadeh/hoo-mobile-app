import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../../../shared/widgets/payment_browser.dart';
import '../bloc/checkout_bloc.dart';
import '../widgets/checkout_steps.dart';

/// Checkout: contact → gift → delivery → slot → payment → review, driven by the server's `missingSteps`.
@RoutePage()
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<CheckoutBloc>()..add(const CheckoutStarted()), child: const _CheckoutView());
}

class _CheckoutView extends StatefulWidget {
  const _CheckoutView();

  @override
  State<_CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<_CheckoutView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // back from the payment page (browser closed) → check now instead of waiting for the next poll
    if (state == AppLifecycleState.resumed) context.read<CheckoutBloc>().add(const PaymentCheckRequested());
  }

  String _title(BuildContext context, CheckoutStep step) {
    final l = context.l10n;
    return switch (step) {
      CheckoutStep.contact => l.checkoutStepContact,
      CheckoutStep.gift => l.checkoutStepGift,
      CheckoutStep.delivery => l.checkoutStepDelivery,
      CheckoutStep.slot => l.checkoutStepSlot,
      CheckoutStep.payment => l.checkoutStepPayment,
      CheckoutStep.review => l.checkoutStepReview,
    };
  }

  Future<void> _onState(BuildContext context, CheckoutState s) async {
    final bloc = context.read<CheckoutBloc>();
    final url = s.redirectUrl;
    if (url != null) {
      bloc.add(const PaymentRedirectOpened());
      await openPaymentPage(context, url);
      return;
    }
    if (s.phase == CheckoutPhase.completed && s.placed != null) {
      unawaited(HooHaptics.success());
      await sl<BagService>().refresh();
      if (context.mounted) await context.router.replace(CheckoutConfirmationRoute(number: s.placed!.orderNumber, giftReceiptCode: s.placed!.giftReceiptCode));
    }
    if (s.phase == CheckoutPhase.paymentFailed && context.mounted) await _paymentFailed(context, s);
  }

  Future<void> _paymentFailed(BuildContext context, CheckoutState s) async {
    final l = context.l10n;
    final bloc = context.read<CheckoutBloc>();
    final codAllowed = s.checkout?.paymentMethods.any((o) => o.method == PaymentMethod.cashOnDelivery && o.available) ?? false;
    final method = s.payment?.method ?? s.placed?.paymentMethod ?? PaymentMethod.card;
    final choice = await showHooSheet<PaymentMethod>(
      context,
      title: l.checkoutPaymentFailedTitle,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(s.payment?.failureMessage ?? l.checkoutPaymentFailedBody, style: ctx.hoo.text.bodySecondary),
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton(label: l.checkoutRetryPayment, onPressed: () => Navigator.of(ctx).pop(method)),
          if (codAllowed) ...[
            const SizedBox(height: HooSpacing.sm),
            SecondaryButton(label: l.checkoutSwitchToCod, onPressed: () => Navigator.of(ctx).pop(PaymentMethod.cashOnDelivery)),
          ],
        ],
      ),
    );
    if (choice != null) bloc.add(PaymentRetryRequested(choice));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listenWhen: (a, b) => a.redirectUrl != b.redirectUrl || a.phase != b.phase,
      listener: _onState,
      builder: (context, s) {
        final c = s.checkout;
        return Scaffold(
          appBar: HooAppBar(title: l.checkoutTitle),
          body: switch (s.phase) {
            CheckoutPhase.loading => const HooLoading(),
            CheckoutPhase.failure => HooErrorState(error: s.error!, onRetry: () => context.read<CheckoutBloc>().add(const CheckoutStarted())),
            CheckoutPhase.awaitingPayment || CheckoutPhase.paymentFailed || CheckoutPhase.completed => _AwaitingPayment(state: s),
            CheckoutPhase.editing => ListView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                children: [
                  HooStepper(current: s.steps.indexOf(s.step) + 1, total: s.steps.length, title: _title(context, s.step)),
                  const SizedBox(height: HooSpacing.lg),
                  for (final step in s.steps)
                    _StepSection(
                      title: _title(context, step),
                      summary: _summary(context, s, step),
                      open: s.step == step,
                      done: s.isComplete(step),
                      onTap: () => context.read<CheckoutBloc>().add(CheckoutStepSelected(step)),
                      child: switch (step) {
                        CheckoutStep.contact => ContactStep(state: s),
                        CheckoutStep.gift => GiftStep(state: s),
                        CheckoutStep.delivery => DeliveryStep(state: s),
                        CheckoutStep.slot => SlotStep(state: s),
                        CheckoutStep.payment => PaymentStep(state: s),
                        CheckoutStep.review => ReviewStep(state: s),
                      },
                    ),
                ],
              ),
          },
          bottomNavigationBar: c == null || s.phase != CheckoutPhase.editing || s.step == CheckoutStep.review
              ? null
              : PriceSummaryBar(
                  total: c.totals.total,
                  updating: s.busy,
                  ctaLabel: l.checkoutStepReview,
                  accentCta: false,
                  onCta: c.canPlaceOrder ? () => context.read<CheckoutBloc>().add(const CheckoutStepSelected(CheckoutStep.review)) : null,
                  breakdown: [
                    PriceLine(label: l.summarySubtotal, amount: c.totals.subtotal),
                    if (c.totals.discount > 0) PriceLine(label: l.summaryDiscount, amount: -c.totals.discount, signed: true),
                    PriceLine(label: l.summaryDelivery, amount: c.totals.delivery),
                    if (c.totals.giftPackaging > 0) PriceLine(label: l.summaryGiftPackaging, amount: c.totals.giftPackaging),
                    if (c.totals.greetingCard > 0) PriceLine(label: l.summaryGreetingCard, amount: c.totals.greetingCard),
                  ],
                ),
        );
      },
    );
  }

  String? _summary(BuildContext context, CheckoutState s, CheckoutStep step) {
    final c = s.checkout!;
    final l = context.l10n;
    if (!s.isComplete(step)) return null;
    return switch (step) {
      CheckoutStep.contact => [c.contact?.fullName, if (c.contact != null) HooFormat.phone(c.contact!.phone)].whereType<String>().join(' · '),
      CheckoutStep.gift => c.gift == null ? null : '${c.gift!.recipientName} · ${c.gift!.occasion.label(l)}',
      CheckoutStep.delivery => [c.zone?.name, c.address?.oneLine].whereType<String>().join(' · '),
      CheckoutStep.slot => c.slot == null ? null : '${HooFormat.dayMonth(context, c.slot!.date)}, ${HooFormat.timeOnly(c.slot!.start)}–${HooFormat.timeOnly(c.slot!.end)}',
      CheckoutStep.payment => c.paymentMethod?.label(l),
      CheckoutStep.review => null,
    };
  }
}

/// A collapsible step: title + one-line summary when done; the form when open.
class _StepSection extends StatelessWidget {
  const _StepSection({required this.title, required this.open, required this.done, required this.onTap, required this.child, this.summary});

  final String title;
  final String? summary;
  final bool open;
  final bool done;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: open ? null : onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: HooSpacing.md),
              child: Row(children: [
                AnimatedSwitcher(
                  duration: context.hoo.motion(HooDurations.fast),
                  child: Icon(done ? HooIcons.checkCircle : HooIcons.chevronRight, key: ValueKey(done), size: 20, color: done ? c.accent : c.textTertiary),
                ),
                const SizedBox(width: HooSpacing.sm),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(title, style: open ? context.hoo.text.h3 : context.hoo.text.bodyStrong),
                    if (!open && summary != null && summary!.isNotEmpty) Text(summary!, style: context.hoo.text.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ]),
                ),
                if (!open && done) Text(context.l10n.commonEdit, style: context.hoo.text.caption.copyWith(decoration: TextDecoration.underline)),
              ]),
            ),
          ),
          AnimatedSize(
            duration: context.hoo.motion(HooDurations.normal),
            curve: HooCurves.standard,
            alignment: Alignment.topCenter,
            child: open ? Padding(padding: const EdgeInsets.only(bottom: HooSpacing.lg), child: child) : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

/// While the customer pays on the EPoint page.
class _AwaitingPayment extends StatelessWidget {
  const _AwaitingPayment({required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bloc = context.read<CheckoutBloc>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(HooSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HooLoading(),
            const SizedBox(height: HooSpacing.lg),
            Text(l.checkoutAwaitingPayment, style: context.hoo.text.h3, textAlign: TextAlign.center),
            const SizedBox(height: HooSpacing.xs),
            Text(l.checkoutAwaitingPaymentBody(state.placed?.orderNumber ?? ''), style: context.hoo.text.bodySecondary, textAlign: TextAlign.center),
            const SizedBox(height: HooSpacing.lg),
            SecondaryButton(label: l.checkoutCheckPayment, expand: false, onPressed: () => bloc.add(const PaymentCheckRequested())),
            if (state.payment?.redirectUrl != null || state.placed?.paymentRedirectUrl != null)
              HooTextButton(label: l.checkoutOpenPaymentAgain, onPressed: () => openPaymentPage(context, state.payment?.redirectUrl ?? state.placed!.paymentRedirectUrl!)),
          ],
        ),
      ),
    );
  }
}
