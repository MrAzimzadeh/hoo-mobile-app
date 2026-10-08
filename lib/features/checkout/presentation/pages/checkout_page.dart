import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/checkout_models.dart';
import '../bloc/checkout_bloc.dart';
import '../widgets/contact_delivery_steps.dart';
import '../widgets/gift_step.dart';
import '../widgets/slot_payment_review_steps.dart';

/// Checkout: contact → gift → delivery → slot → payment → review → pay. Open to guests (no sign-in needed).
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
  StreamSubscription<Object?>? _returns;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // The payment page hands back through a deep link; the app also resumes when the Custom Tab closes.
    _returns = sl<DeepLinkService>().paymentReturns.listen((_) {
      if (mounted) context.read<CheckoutBloc>().add(const PaymentCheckRequested());
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted && context.read<CheckoutBloc>().state.phase == CheckoutPhase.awaitingPayment) {
      context.read<CheckoutBloc>().add(const PaymentCheckRequested());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _returns?.cancel();
    super.dispose();
  }

  void _onState(BuildContext context, CheckoutState state) {
    if (state.refreshedSession) {
      HooToast.show(context, context.l10n.checkoutSessionRefreshed, kind: HooAlertKind.info);
      context.read<CheckoutBloc>().add(const ErrorDismissed());
    }
    if (state.phase == CheckoutPhase.done && state.order != null) {
      final order = state.order!;
      unawaited(sl<BagService>().refresh());
      unawaited(HooHaptics.success());
      context.router.replace(CheckoutConfirmationRoute(number: order.orderNumber, giftReceiptCode: order.giftReceiptCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: _onState,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: l.checkoutTitle),
          body: SafeArea(
            child: HooConstrained(
              child: switch (state.status) {
                CheckoutStatus.loading => const Center(child: HooLoading()),
                CheckoutStatus.failure => _StartFailure(error: state.error!),
                CheckoutStatus.ready => switch (state.phase) {
                  CheckoutPhase.editing => _Steps(state: state),
                  CheckoutPhase.placing => _Waiting(title: l.checkoutPlacing, message: l.checkoutPlacingHint),
                  CheckoutPhase.awaitingPayment => _AwaitingPayment(state: state),
                  CheckoutPhase.paymentFailed => _PaymentFailed(state: state),
                  CheckoutPhase.done => _Waiting(title: l.checkoutPlacing, message: ''),
                },
              },
            ),
          ),
        );
      },
    );
  }
}

class _StartFailure extends StatelessWidget {
  const _StartFailure({required this.error});
  final ApiException error;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    // an empty bag is the one expected failure (`cart.empty`)
    if (error.code == 'cart.empty') {
      return HooEmptyState(
        title: l.cartEmptyTitle,
        message: l.cartEmptyMessage,
        icon: HooIcons.bag,
        actionLabel: l.cartEmptyCta,
        onAction: () => context.router.navigate(const ShopRoute()),
      );
    }
    return HooErrorState(error: error, onRetry: () => context.read<CheckoutBloc>().add(const CheckoutStarted()));
  }
}

class _Waiting extends StatelessWidget {
  const _Waiting({required this.title, required this.message});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(HooSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HooLoading(),
            const SizedBox(height: HooSpacing.lg),
            Text(title, style: context.hoo.text.h2, textAlign: TextAlign.center),
            if (message.isNotEmpty) ...[
              const SizedBox(height: HooSpacing.xs),
              Text(
                message,
                style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AwaitingPayment extends StatelessWidget {
  const _AwaitingPayment({required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bloc = context.read<CheckoutBloc>();
    return Padding(
      padding: const EdgeInsets.all(HooSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: HooLoading()),
          const SizedBox(height: HooSpacing.lg),
          Text(l.checkoutPaymentWaitingTitle, style: context.hoo.text.h2, textAlign: TextAlign.center),
          const SizedBox(height: HooSpacing.xs),
          Text(
            state.pollsExhausted ? l.checkoutPaymentStillProcessing : l.checkoutPaymentWaitingBody(state.order?.orderNumber ?? ''),
            style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: HooSpacing.xl),
          PrimaryButton(label: l.checkoutPaymentCheckNow, onPressed: () => bloc.add(const PaymentCheckRequested())),
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(label: l.checkoutPaymentReopen, onPressed: bloc.reopenPaymentPage),
        ],
      ),
    );
  }
}

class _PaymentFailed extends StatelessWidget {
  const _PaymentFailed({required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bloc = context.read<CheckoutBloc>();
    final session = state.session;
    final codAllowed = session?.paymentMethods.any((o) => o.method == PaymentMethod.cashOnDelivery && o.available) ?? false;
    final message = state.error != null ? errorMessage(context, state.error!) : (state.payment?.failureMessage ?? l.checkoutPaymentFailedBody);
    return Padding(
      padding: const EdgeInsets.all(HooSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(HooIcons.error, size: 48, color: context.hoo.colors.error),
          const SizedBox(height: HooSpacing.lg),
          Text(l.checkoutPaymentFailedTitle, style: context.hoo.text.h2, textAlign: TextAlign.center),
          const SizedBox(height: HooSpacing.xs),
          Text(
            message,
            style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: HooSpacing.xl),
          PrimaryButton(label: l.checkoutPaymentTryAgain, onPressed: () => bloc.add(const PaymentRetryRequested())),
          if (codAllowed) ...[
            const SizedBox(height: HooSpacing.sm),
            SecondaryButton(
              label: l.checkoutPayOnDelivery,
              onPressed: () => bloc.add(const PaymentRetryRequested(method: PaymentMethod.cashOnDelivery)),
            ),
          ],
          const SizedBox(height: HooSpacing.xs),
          TextButton(
            onPressed: () => context.router.replace(OrderDetailRoute(number: state.order!.orderNumber)),
            child: Text(l.checkoutViewOrder),
          ),
        ],
      ),
    );
  }
}

class _Steps extends StatelessWidget {
  const _Steps({required this.state});
  final CheckoutState state;

  static const _order = [CheckoutStep.contact, CheckoutStep.gift, CheckoutStep.delivery, CheckoutStep.slot, CheckoutStep.payment, CheckoutStep.review];

  List<CheckoutStep> _visible(CheckoutState s) => [
    for (final step in _order)
      if (step == CheckoutStep.gift ? s.giftAvailable : (step == CheckoutStep.slot ? (s.session!.zone?.supportsTimeSlots ?? false) : true)) step,
  ];

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bloc = context.read<CheckoutBloc>();
    final s = state.session!;
    final steps = _visible(state);
    final index = steps.indexOf(state.step).clamp(0, steps.length - 1);
    final done = steps.take(index).toList();
    String title(CheckoutStep st) => switch (st) {
      CheckoutStep.contact => l.checkoutContactTitle,
      CheckoutStep.gift => l.checkoutGiftTitle,
      CheckoutStep.delivery => l.checkoutDeliveryTitle,
      CheckoutStep.slot => l.checkoutSlotTitle,
      CheckoutStep.payment => l.checkoutPaymentTitle,
      CheckoutStep.review => l.checkoutReviewTitle,
    };
    List<String> summary(CheckoutStep st) => switch (st) {
      CheckoutStep.contact => [s.contact?.fullName ?? '', HooFormat.phone(s.contact?.phone ?? '')],
      CheckoutStep.gift => [s.gift == null ? l.checkoutNoGift : l.checkoutGiftFor(s.gift!.recipientName)],
      CheckoutStep.delivery => [s.zone?.name ?? '', s.address?.oneLine ?? s.zone?.pickupAddress ?? ''],
      CheckoutStep.slot => [
        if (s.slot != null) '${HooFormat.weekdayDayMonth(context, s.slot!.date)}, ${HooFormat.timeOnly(s.slot!.start)}–${HooFormat.timeOnly(s.slot!.end)}',
      ],
      CheckoutStep.payment => [s.paymentMethod?.label(l) ?? ''],
      CheckoutStep.review => const [],
    };
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        OfflineHint(error: state.error),
        HooStepper(current: index + 1, total: steps.length, title: title(state.step)),
        const SizedBox(height: HooSpacing.md),
        for (final st in done) ...[StepSummaryTile(title: title(st), lines: summary(st), onEdit: () => _edit(bloc, st)), const SizedBox(height: HooSpacing.sm)],
        const SizedBox(height: HooSpacing.md),
        AnimatedSwitcher(
          duration: context.hoo.motion(HooDurations.normal),
          child: KeyedSubtree(key: ValueKey(state.step), child: _step(context, bloc, s)),
        ),
      ],
    );
  }

  void _edit(CheckoutBloc bloc, CheckoutStep step) {
    bloc.add(StepRequested(step));
    if (step == CheckoutStep.slot) bloc.add(const SlotsRequested());
  }

  Widget _step(BuildContext context, CheckoutBloc bloc, CheckoutSession s) {
    switch (state.step) {
      case CheckoutStep.contact:
        final user = sl<AuthGate>().currentUser;
        final initial = s.contact ?? (user == null ? null : ContactInfo(fullName: user.fullName, phone: user.phone ?? '', email: user.email));
        return ContactStep(initial: initial, busy: state.busy, error: state.error, onSubmit: (c) => bloc.add(ContactSubmitted(c)));
      case CheckoutStep.gift:
        return GiftStep(session: s, options: state.giftOptions!, busy: state.busy, error: state.error, onSubmit: (g) => bloc.add(GiftSubmitted(g)));
      case CheckoutStep.delivery:
        return DeliveryStep(
          session: s,
          busy: state.busy,
          error: state.error,
          onSubmit: ({required zoneId, savedAddressId, address}) =>
              bloc.add(DeliverySubmitted(zoneId: zoneId, savedAddressId: savedAddressId, address: address)),
        );
      case CheckoutStep.slot:
        if (state.slots == null && state.slotsError == null) bloc.add(const SlotsRequested());
        return SlotStep(
          slots: state.slots,
          loadError: state.slotsError,
          error: state.error,
          selected: s.slot,
          busy: state.busy,
          onRetry: () => bloc.add(const SlotsRequested()),
          onSubmit: (date, windowId) => bloc.add(SlotSubmitted(date: date, windowId: windowId)),
        );
      case CheckoutStep.payment:
        return PaymentStep(
          session: s,
          busy: state.busy,
          error: state.error,
          onSubmit: (m, {savedCardId}) => bloc.add(PaymentSubmitted(m, savedCardId: savedCardId)),
        );
      case CheckoutStep.review:
        return ReviewStep(
          session: s,
          error: state.error,
          onPlace: ({required acceptTerms, required confirmImageRights, required saveCard}) =>
              bloc.add(PlaceOrderRequested(acceptTerms: acceptTerms, confirmImageRights: confirmImageRights, saveCard: saveCard)),
        );
    }
  }
}

/// Network failures while editing a step are transient — a short hint above the stepper.
class OfflineHint extends StatelessWidget {
  const OfflineHint({super.key, required this.error});
  final ApiException? error;

  @override
  Widget build(BuildContext context) {
    if (error == null || !error!.isNetwork) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: HooSpacing.md),
      child: InlineAlert(message: context.l10n.errorNetwork, kind: HooAlertKind.warning),
    );
  }
}
