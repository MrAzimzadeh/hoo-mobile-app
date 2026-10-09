import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/order_models.dart';
import '../../domain/orders_repositories.dart';

/// Gift recipient: open the receipt (code + phone) — no prices — and request a size exchange.
@RoutePage()
class GiftReceiptPage extends StatefulWidget {
  const GiftReceiptPage({super.key, @PathParam('code') this.code});

  final String? code;

  @override
  State<GiftReceiptPage> createState() => _GiftReceiptPageState();
}

class _GiftReceiptPageState extends State<GiftReceiptPage> {
  late final _code = TextEditingController(text: widget.code ?? '');
  final _phone = TextEditingController();
  GiftReceipt? _receipt;
  final _sizes = <String, Size>{};
  bool _busy = false;
  ApiException? _error;
  bool _exchanged = false;

  @override
  void dispose() {
    _code.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() task) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await task();
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _open() => _run(() async {
        final r = await sl<GiftReceiptRepository>().receipt(_code.text.trim(), HooFormat.phoneWire(_phone.text));
        setState(() => _receipt = r);
      });

  Future<void> _exchange() => _run(() async {
        await sl<GiftReceiptRepository>().exchange(
          _receipt!.receiptCode,
          phone: HooFormat.phoneWire(_phone.text),
          items: [for (final e in _sizes.entries) ReturnItem(orderLineId: e.key, quantity: 1, exchangeSize: e.value)],
        );
        setState(() => _exchanged = true);
      });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final r = _receipt;
    return Scaffold(
      appBar: HooAppBar(title: l.checkoutGiftReceipt),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          if (_exchanged)
            HooEmptyState(icon: HooIcons.checkCircle, title: l.ordersExchangeSent, message: l.ordersReturnSentBody)
          else if (r == null) ...[
            Text(l.ordersGiftReceiptBody, style: context.hoo.text.bodySecondary),
            const SizedBox(height: HooSpacing.lg),
            HooTextField(controller: _code, label: l.ordersGiftCode, textCapitalization: TextCapitalization.characters),
            const SizedBox(height: HooSpacing.md),
            HooPhoneField(controller: _phone, label: l.ordersRecipientPhone),
            if (_error != null) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!))],
            const SizedBox(height: HooSpacing.lg),
            ListenableBuilder(
              listenable: Listenable.merge([_code, _phone]),
              builder: (context, _) => PrimaryButton(label: l.commonContinue, loading: _busy, onPressed: _code.text.trim().isEmpty || !HooPhoneField.isComplete(_phone.text) ? null : _open),
            ),
          ] else ...[
            const Center(child: Icon(HooIcons.gift, size: 40)),
            const SizedBox(height: HooSpacing.md),
            Text(l.ordersGiftFor(r.recipientName), textAlign: TextAlign.center, style: context.hoo.text.h2),
            Text([r.occasion.label(l), if (r.fromName != null) l.ordersGiftFrom(r.fromName!)].join(' · '), textAlign: TextAlign.center, style: context.hoo.text.bodySecondary),
            const SizedBox(height: HooSpacing.lg),
            for (final line in r.lines)
              Padding(
                padding: const EdgeInsets.only(bottom: HooSpacing.md),
                child: HooCard(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(line.name, style: context.hoo.text.bodyStrong),
                    Text([line.color, line.size?.label].whereType<String>().join(' · '), style: context.hoo.text.caption),
                    if (r.exchangeAllowed && line.canExchange) ...[
                      const SizedBox(height: HooSpacing.sm),
                      Text(l.ordersExchangeTo, style: context.hoo.text.labelSecondary),
                      const SizedBox(height: HooSpacing.xs),
                      Wrap(spacing: HooSpacing.xs, children: [
                        for (final s in line.exchangeSizes)
                          OptionChip(
                            label: s.label,
                            selected: _sizes[line.lineId] == s,
                            onTap: () => setState(() => _sizes[line.lineId] == s ? _sizes.remove(line.lineId) : _sizes[line.lineId] = s),
                          ),
                      ]),
                    ],
                  ]),
                ),
              ),
            if (r.exchangeDeadline != null) Text(l.ordersExchangeUntil(HooFormat.date(context, r.exchangeDeadline!)), style: context.hoo.text.caption),
            if (_error != null) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!))],
            if (r.exchangeAllowed && r.hasExchangeableLines) ...[
              const SizedBox(height: HooSpacing.lg),
              PrimaryButton(label: l.ordersRequestExchange, loading: _busy, onPressed: _sizes.isEmpty ? null : _exchange),
            ],
          ],
        ],
      ),
    );
  }
}
