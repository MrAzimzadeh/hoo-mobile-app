import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/network/interceptors/hoo_interceptors.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../../../shared/widgets/contact_links.dart';
import '../../../../shared/widgets/payment_browser.dart';
import '../../domain/order_errors.dart';
import '../../domain/order_models.dart';
import '../../domain/order_view.dart';
import '../../domain/orders_repositories.dart';
import '../cubit/order_detail_cubit.dart';
import '../widgets/order_widgets.dart';

/// Order detail for the signed-in customer, or for a guest who tracked it with number + phone.
@RoutePage()
class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key, @PathParam('number') required this.number, this.phone});

  final String number;

  /// Set for guest tracking (number + phone); null → the signed-in customer's order.
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final access = phone == null ? AccountOrderAccess(number) : TrackingOrderAccess(number, phone!);
    return BlocProvider(
      create: (_) => OrderDetailCubit(sl<OrderDetailRepository>(), sl<AuthGate>(), access)..load(),
      child: _OrderDetailView(number: number, access: access),
    );
  }
}

class _OrderDetailView extends StatefulWidget {
  const _OrderDetailView({required this.number, required this.access});
  final String number;
  final OrderAccess access;

  @override
  State<_OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<_OrderDetailView> with WidgetsBindingObserver {
  bool _paying = false;

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
    if (state == AppLifecycleState.resumed && _paying) {
      _paying = false;
      context.read<OrderDetailCubit>().refresh();
    }
  }

  void _handle(ApiException e) {
    HooToast.error(context, e);
    if (e.isConflict || OrderErrorCodes.refreshTriggers.contains(e.code)) context.read<OrderDetailCubit>().refresh();
  }

  Future<void> _payAgain(OrderDetail o) async {
    final method = o.payment?.method.isOnline ?? false ? o.payment!.method : PaymentMethod.card;
    try {
      final p = await sl<PaymentRepository>().retry(o.number, method: method, idempotencyKey: IdempotencyInterceptor.newKey());
      if (!mounted) return;
      final url = p.redirectUrl;
      if (url != null && url.isNotEmpty) {
        _paying = true;
        await openPaymentPage(context, url);
      } else {
        await context.read<OrderDetailCubit>().refresh();
      }
    } on ApiException catch (e) {
      if (mounted) _handle(e);
    }
  }

  Future<void> _changeSlot(OrderDetail o) async {
    final l = context.l10n;
    final phone = widget.access.phoneFor(o);
    if (phone == null) return;
    final cubit = context.read<OrderDetailCubit>();
    final repo = sl<OrderSlotRepository>();
    await showHooSheet<void>(
      context,
      title: l.ordersChangeSlot,
      builder: (ctx) => FutureBuilder<List<SlotDay>>(
        future: repo.slots(o.number, phone),
        builder: (ctx, snap) {
          if (snap.hasError) {
            final unavailable = snap.error is SlotListingUnavailable;
            return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              InlineAlert(kind: HooAlertKind.info, message: unavailable ? l.ordersSlotChangeContact : errorMessage(ctx, snap.error!)),
            ]);
          }
          if (!snap.hasData) return const SizedBox(height: 160, child: HooLoading());
          final days = snap.data!.where((d) => d.hasSelectable).toList();
          if (days.isEmpty) return Text(l.checkoutNoSlots, style: ctx.hoo.text.bodySecondary);
          return ListView(shrinkWrap: true, children: [
            for (final d in days) ...[
              Text(HooFormat.weekdayDayMonth(ctx, d.date), style: ctx.hoo.text.bodyStrong),
              const SizedBox(height: HooSpacing.xs),
              Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
                for (final w in d.windows)
                  OptionChip(
                    label: '${HooFormat.timeOnly(w.start)}–${HooFormat.timeOnly(w.end)}',
                    uppercase: false,
                    unavailable: !w.selectable,
                    onTap: !w.selectable
                        ? null
                        : () async {
                            Navigator.of(ctx).pop();
                            try {
                              cubit.applyOrder(await repo.changeSlot(o.number, phone: phone, date: d.date, windowId: w.windowId));
                              if (mounted) HooToast.success(context, l.ordersSlotChanged);
                            } on ApiException catch (e) {
                              if (mounted) _handle(e);
                            }
                          },
                  ),
              ]),
              const SizedBox(height: HooSpacing.md),
            ],
          ]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<OrderDetailCubit, OrderDetailState>(
      builder: (context, s) {
        final view = s.view;
        return Scaffold(
          appBar: HooAppBar(title: widget.number),
          body: switch (s.status) {
            OrderDetailStatus.loading when view == null => const HooLoading(),
            OrderDetailStatus.needsSignIn => HooEmptyState(
                icon: HooIcons.lock,
                title: l.ordersSignInToView,
                actionLabel: l.commonSignIn,
                onAction: () => sl<AuthGate>().requireSignIn(context),
              ),
            OrderDetailStatus.failure when view == null => HooErrorState(error: s.error!, onRetry: context.read<OrderDetailCubit>().load),
            _ => RefreshIndicator(onRefresh: context.read<OrderDetailCubit>().refresh, child: _body(context, view!)),
          },
        );
      },
    );
  }

  Widget _body(BuildContext context, OrderView view) {
    final l = context.l10n;
    final o = view.order;
    final c = context.hoo.colors;
    Widget section(String title, Widget child) => Padding(
          padding: const EdgeInsets.only(top: HooSpacing.section),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title.toUpperCase(), style: context.hoo.text.labelSecondary), const SizedBox(height: HooSpacing.sm), child]),
        );
    final d = o.delivery;
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        if (view.stale) const OfflineBanner(),
        Row(children: [
          Expanded(child: Text(l.ordersPlacedOn(HooFormat.date(context, o.createdAt)), style: context.hoo.text.caption)),
          OrderStatusChip(status: o.status),
        ]),
        if (o.status == OrderStatus.awaitingApproval) ...[const SizedBox(height: HooSpacing.md), InlineAlert(message: l.checkoutCustomApprovalNote)],
        if (o.canPay || o.canChangeSlot || o.canReturn) ...[
          const SizedBox(height: HooSpacing.lg),
          if (o.canPay) ...[PrimaryButton.accent(label: l.ordersPayAgain, onPressed: () => _payAgain(o)), const SizedBox(height: HooSpacing.sm)],
          if (o.canChangeSlot) ...[SecondaryButton(label: l.ordersChangeSlot, icon: HooIcons.clock, onPressed: () => _changeSlot(o)), const SizedBox(height: HooSpacing.sm)],
          if (o.canReturn) SecondaryButton(label: l.ordersReturnExchange, icon: HooIcons.swap, onPressed: () => context.router.push(ReturnRequestRoute(number: o.number, phone: widget.access is TrackingOrderAccess ? widget.access.phoneFor(o) : null))),
        ],
        if (view.whatsAppUrl != null) ...[
          const SizedBox(height: HooSpacing.sm),
          HooTextButton(label: l.ordersWhatsApp, onPressed: () => openLink(Uri.parse(view.whatsAppUrl!))),
        ],
        section(l.ordersTimeline, OrderTimeline(events: o.timeline)),
        section(
          l.ordersItems,
          Column(children: [for (final line in o.lines) OrderLineRow(line: line, showPrices: view.showPrices)]),
        ),
        if (view.showPrices)
          section(
            l.summaryTotal,
            Column(children: [
              SummaryRow(label: l.summarySubtotal, value: HooFormat.money(context, o.totals!.subtotal)),
              if (o.totals!.discount > 0) SummaryRow(label: l.summaryDiscount, value: HooFormat.signedMoney(context, -o.totals!.discount), valueColor: c.accent),
              SummaryRow(label: l.summaryDelivery, value: o.totals!.delivery == 0 ? l.commonFree : HooFormat.money(context, o.totals!.delivery)),
              if (o.totals!.giftPackaging > 0) SummaryRow(label: l.summaryGiftPackaging, value: HooFormat.money(context, o.totals!.giftPackaging)),
              if (o.totals!.greetingCard > 0) SummaryRow(label: l.summaryGreetingCard, value: HooFormat.money(context, o.totals!.greetingCard)),
              SummaryRow(label: l.summaryTotal, value: HooFormat.money(context, o.totals!.total), strong: true),
            ]),
          ),
        if (o.payment != null)
          section(
            l.checkoutStepPayment,
            Text([o.payment!.method.label(l), o.payment!.status.label(l), ?o.payment!.cardMask].join(' · '), style: context.hoo.text.body),
          ),
        section(
          l.checkoutStepDelivery,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${d.zoneName} · ${d.kind.label(l)}', style: context.hoo.text.bodyStrong),
            if (d.address != null) Text(d.address!.oneLine, style: context.hoo.text.bodySecondary),
            if (d.hasSlot) Text('${HooFormat.weekdayDayMonth(context, d.slotDate!)}, ${HooFormat.timeOnly(d.slotStart!)}–${HooFormat.timeOnly(d.slotEnd!)}', style: context.hoo.text.body),
            if (d.hasCourierInfo)
              Padding(
                padding: const EdgeInsets.only(top: HooSpacing.xs),
                child: InlineAlert(
                  kind: HooAlertKind.success,
                  message: [
                    if (d.courierFirstName != null) l.ordersCourier(d.courierFirstName!),
                    if (d.courierStopsAway != null) l.ordersStopsAway(d.courierStopsAway!),
                    if (d.courierEtaMinutes != null) l.ordersEta(d.courierEtaMinutes!),
                  ].join(' · '),
                ),
              ),
          ]),
        ),
        if (o.gift != null)
          section(
            l.checkoutStepGift,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${o.gift!.recipientName} · ${o.gift!.occasion.label(l)}', style: context.hoo.text.bodyStrong),
              if (o.gift!.message != null) Text('“${o.gift!.message!}”', style: context.hoo.text.bodySecondary),
              if (o.gift!.receiptCode != null) Text('${l.checkoutGiftReceipt}: ${o.gift!.receiptCode}', style: context.hoo.text.caption),
            ]),
          ),
        const SizedBox(height: HooSpacing.xxl),
      ],
    );
  }
}
