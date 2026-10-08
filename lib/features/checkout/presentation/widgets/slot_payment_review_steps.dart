import 'package:flutter/material.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/checkout_models.dart';
import 'contact_delivery_steps.dart';

class SlotStep extends StatefulWidget {
  const SlotStep({
    super.key,
    required this.slots,
    required this.error,
    required this.loadError,
    required this.selected,
    required this.busy,
    required this.onRetry,
    required this.onSubmit,
  });

  final List<SlotDay>? slots;
  final ApiException? loadError;
  final ApiException? error;
  final SelectedSlot? selected;
  final bool busy;
  final VoidCallback onRetry;
  final void Function(DateTime date, String windowId) onSubmit;

  @override
  State<SlotStep> createState() => _SlotStepState();
}

class _SlotStepState extends State<SlotStep> {
  int _day = 0;
  String? _windowId;
  bool _inited = false;

  void _init(List<SlotDay> days) {
    if (_inited) return;
    _inited = true;
    final sel = widget.selected;
    if (sel != null) {
      final i = days.indexWhere((d) => d.date.year == sel.date.year && d.date.month == sel.date.month && d.date.day == sel.date.day);
      if (i >= 0) {
        _day = i;
        _windowId = sel.windowId;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final days = widget.slots;
    Widget content;
    if (widget.loadError != null) {
      content = HooErrorState(error: widget.loadError!, compact: true, onRetry: widget.onRetry);
    } else if (days == null) {
      content = const Padding(
        padding: EdgeInsets.all(HooSpacing.lg),
        child: Center(child: HooLoading()),
      );
    } else if (days.isEmpty) {
      content = HooEmptyState(title: l.checkoutNoSlots, compact: true, icon: HooIcons.truck);
    } else {
      _init(days);
      final day = days[_day.clamp(0, days.length - 1)];
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
              itemBuilder: (_, i) => OptionChip(
                label: HooFormat.weekdayDayMonth(context, days[i].date),
                uppercase: false,
                selected: i == _day,
                unavailable: !days[i].windows.any((w) => w.selectable),
                onTap: () => setState(() {
                  _day = i;
                  _windowId = null;
                }),
              ),
            ),
          ),
          const SizedBox(height: HooSpacing.md),
          for (final w in day.windows) ...[
            SelectableCard(
              selected: w.windowId == _windowId,
              onTap: w.selectable ? () => setState(() => _windowId = w.windowId) : null,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${HooFormat.timeOnly(w.start)} – ${HooFormat.timeOnly(w.end)}',
                      style: t.bodyStrong.copyWith(color: w.selectable ? c.textPrimary : c.textTertiary),
                    ),
                  ),
                  Text(
                    w.selectable ? l.checkoutSlotsLeft(w.available) : l.checkoutSlotFull,
                    style: t.caption.copyWith(color: w.selectable ? c.textSecondary : c.error),
                  ),
                ],
              ),
            ),
            const SizedBox(height: HooSpacing.sm),
          ],
        ],
      );
    }
    return StepCard(
      title: l.checkoutSlotTitle,
      subtitle: l.checkoutSlotSubtitle,
      children: [
        StepError(error: widget.error),
        content,
        const SizedBox(height: HooSpacing.lg),
        PrimaryButton(
          label: l.commonContinue,
          loading: widget.busy,
          onPressed: widget.busy || _windowId == null || days == null ? null : () => widget.onSubmit(days[_day.clamp(0, days.length - 1)].date, _windowId!),
        ),
      ],
    );
  }
}

class PaymentStep extends StatefulWidget {
  const PaymentStep({super.key, required this.session, required this.busy, required this.error, required this.onSubmit});

  final CheckoutSession session;
  final bool busy;
  final ApiException? error;
  final void Function(PaymentMethod method, {String? savedCardId}) onSubmit;

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  late PaymentMethod? _method = widget.session.paymentMethod;
  late String? _cardId = widget.session.savedCardId;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final s = widget.session;
    final options = s.paymentMethods.where((o) => o.method != PaymentMethod.savedCard).toList();
    final savedAvailable = s.paymentMethods.any((o) => o.method == PaymentMethod.savedCard && o.available);
    return StepCard(
      title: l.checkoutPaymentTitle,
      children: [
        StepError(error: widget.error),
        if (savedAvailable)
          for (final card in s.savedCards) ...[
            SelectableCard(
              selected: _method == PaymentMethod.savedCard && _cardId == card.id,
              onTap: () => setState(() {
                _method = PaymentMethod.savedCard;
                _cardId = card.id;
              }),
              child: Row(
                children: [
                  const Icon(HooIcons.card),
                  const SizedBox(width: HooSpacing.md),
                  Expanded(child: Text('${card.brand} ${card.maskedPan}', style: t.bodyStrong)),
                ],
              ),
            ),
            const SizedBox(height: HooSpacing.sm),
          ],
        for (final o in options) ...[
          SelectableCard(
            selected: _method == o.method,
            onTap: o.available
                ? () => setState(() {
                    _method = o.method;
                    _cardId = null;
                  })
                : null,
            child: Row(
              children: [
                Icon(o.method == PaymentMethod.cashOnDelivery ? HooIcons.truck : HooIcons.card, color: o.available ? c.textPrimary : c.textTertiary),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(o.method.label(l), style: t.bodyStrong.copyWith(color: o.available ? c.textPrimary : c.textTertiary)),
                      if (!o.available && o.unavailableReason != null) Text(o.unavailableReason!, style: t.caption.copyWith(color: c.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: HooSpacing.sm),
        ],
        const SizedBox(height: HooSpacing.lg),
        PrimaryButton(
          label: l.commonContinue,
          loading: widget.busy,
          onPressed: widget.busy || _method == null ? null : () => widget.onSubmit(_method!, savedCardId: _cardId),
        ),
      ],
    );
  }
}

/// Collapsed summary of a finished step; tap to edit.
class StepSummaryTile extends StatelessWidget {
  const StepSummaryTile({super.key, required this.title, required this.lines, required this.onEdit});

  final String title;
  final List<String> lines;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return HooCard(
      onTap: onEdit,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(HooIcons.checkCircle, color: c.accent, size: HooSize.iconSmall),
          const SizedBox(width: HooSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: t.label.copyWith(color: c.textSecondary)),
                for (final line in lines.where((x) => x.isNotEmpty)) Text(line, style: t.body),
              ],
            ),
          ),
          Text(context.l10n.commonEdit, style: t.caption.copyWith(color: c.textSecondary)),
        ],
      ),
    );
  }
}

class ReviewStep extends StatefulWidget {
  const ReviewStep({super.key, required this.session, required this.error, required this.onPlace});

  final CheckoutSession session;
  final ApiException? error;
  final void Function({required bool acceptTerms, required bool confirmImageRights, required bool saveCard}) onPlace;

  @override
  State<ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends State<ReviewStep> {
  bool _terms = false;
  bool _rights = false;
  bool _saveCard = false;
  bool _tried = false;

  bool get _ready => _terms && (!widget.session.hasCustomItems || _rights);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final s = widget.session;
    final totals = s.totals;
    return StepCard(
      title: l.checkoutReviewTitle,
      children: [
        StepError(error: widget.error),
        for (final item in s.items)
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.sm),
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                  height: 70,
                  child: HooNetworkImage(url: item.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 160),
                ),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: t.bodyStrong, maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(
                        [?item.color, if (item.size != null && item.size != Size.unknown) item.size!.label, '×${item.quantity}'].join(' · '),
                        style: t.caption.copyWith(color: c.textSecondary),
                      ),
                      if (item.errorMessage != null) Text(item.errorMessage!, style: t.caption.copyWith(color: c.error)),
                    ],
                  ),
                ),
                Text(HooFormat.money(context, item.lineTotal), style: t.bodyStrong),
              ],
            ),
          ),
        const Divider(height: HooSpacing.lg),
        SummaryRow(label: l.summarySubtotal, value: HooFormat.money(context, totals.subtotal)),
        if (totals.discount > 0)
          SummaryRow(
            label: s.promoCode == null ? l.summaryDiscount : '${l.summaryDiscount} (${s.promoCode})',
            value: HooFormat.signedMoney(context, -totals.discount),
            valueColor: c.accent,
          ),
        SummaryRow(label: l.summaryDelivery, value: totals.delivery == 0 ? l.commonFree : HooFormat.money(context, totals.delivery)),
        if (totals.giftPackaging > 0 || totals.giftPackagingSaving > 0)
          SummaryRow(label: l.summaryGiftPackaging, value: totals.giftPackaging == 0 ? l.commonFree : HooFormat.money(context, totals.giftPackaging)),
        if (totals.greetingCard > 0) SummaryRow(label: l.summaryGreetingCard, value: HooFormat.money(context, totals.greetingCard)),
        const Divider(height: HooSpacing.lg),
        SummaryRow(label: l.summaryTotal, value: HooFormat.money(context, totals.total), strong: true),
        if (totals.vatIncluded > 0) SummaryRow(label: l.summaryVatIncluded(HooFormat.money(context, totals.vatIncluded)), value: '', caption: true),
        if (s.promoError != null)
          Padding(
            padding: const EdgeInsets.only(top: HooSpacing.sm),
            child: InlineAlert(message: s.promoError!, kind: HooAlertKind.warning),
          ),
        const SizedBox(height: HooSpacing.lg),
        HooCheckboxTile(
          value: _terms,
          onChanged: (v) => setState(() => _terms = v),
          label: Text(l.checkoutAcceptTerms, style: t.body),
          errorText: _tried && !_terms ? l.authErrTerms : null,
        ),
        if (s.hasCustomItems)
          HooCheckboxTile(
            value: _rights,
            onChanged: (v) => setState(() => _rights = v),
            label: Text(l.checkoutImageRights, style: t.body),
            errorText: _tried && !_rights ? l.fieldRequired : null,
          ),
        if (s.paymentMethod == PaymentMethod.card)
          HooCheckboxTile(
            value: _saveCard,
            onChanged: (v) => setState(() => _saveCard = v),
            label: Text(l.checkoutSaveCard, style: t.body),
          ),
        const SizedBox(height: HooSpacing.md),
        PrimaryButton.accent(
          label: s.paymentMethod == PaymentMethod.cashOnDelivery || s.paymentMethod == PaymentMethod.cardOnDelivery ? l.checkoutPlaceOrder : l.checkoutPayNow,
          onPressed: () {
            if (!_ready || !s.canPlaceOrder) {
              setState(() => _tried = true);
              return;
            }
            widget.onPlace(acceptTerms: _terms, confirmImageRights: _rights, saveCard: _saveCard);
          },
        ),
      ],
    );
  }
}
