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
import '../../domain/order_view.dart';
import '../../domain/orders_repositories.dart';

/// Return or exchange: pick lines and quantities, the new size for exchanges, a reason and a phone.
@RoutePage()
class ReturnRequestPage extends StatefulWidget {
  const ReturnRequestPage({super.key, @PathParam('number') required this.number, this.phone});

  final String number;
  final String? phone;

  @override
  State<ReturnRequestPage> createState() => _ReturnRequestPageState();
}

class _ReturnRequestPageState extends State<ReturnRequestPage> {
  OrderDetail? _order;
  Object? _loadError;
  ReturnKind _kind = ReturnKind.returnItem;
  final _qty = <String, int>{};
  final _sizes = <String, Size>{};
  final _reason = TextEditingController();
  late final _phone = TextEditingController(text: widget.phone == null ? '' : HooFormat.phone(widget.phone!).replaceFirst('+994 ', ''));
  bool _sending = false;
  ApiException? _error;
  ReturnRecord? _done;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final access = widget.phone == null ? AccountOrderAccess(widget.number) : TrackingOrderAccess(widget.number, widget.phone!);
      final view = await sl<OrderDetailRepository>().load(access);
      setState(() {
        _order = view.order;
        if (_phone.text.isEmpty) _phone.text = HooFormat.phone(view.order.contact.phone).replaceFirst('+994 ', '');
      });
    } catch (e) {
      setState(() => _loadError = e);
    }
  }

  @override
  void dispose() {
    _reason.dispose();
    _phone.dispose();
    super.dispose();
  }

  bool get _valid {
    final picked = _qty.entries.where((e) => e.value > 0);
    if (picked.isEmpty) return false;
    if (_kind == ReturnKind.exchange && picked.any((e) => _sizes[e.key] == null)) return false;
    return widget.phone == null || HooPhoneField.isComplete(_phone.text);
  }

  Future<void> _submit() async {
    setState(() {
      _sending = true;
      _error = null;
    });
    try {
      final items = [
        for (final e in _qty.entries.where((e) => e.value > 0)) ReturnItem(orderLineId: e.key, quantity: e.value, exchangeSize: _kind == ReturnKind.exchange ? _sizes[e.key] : null),
      ];
      final r = await sl<ReturnsRepository>().requestReturn(
        widget.number,
        kind: _kind,
        items: items,
        reason: _reason.text.trim().isEmpty ? null : _reason.text.trim(),
        phone: _phone.text.trim().isEmpty ? null : HooFormat.phoneWire(_phone.text),
      );
      setState(() => _done = r);
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final o = _order;
    return Scaffold(
      appBar: HooAppBar(title: l.ordersReturnExchange),
      body: _done != null
          ? HooEmptyState(icon: HooIcons.checkCircle, title: l.ordersReturnSent, message: l.ordersReturnSentBody, actionLabel: l.commonDone, onAction: () => context.router.maybePop())
          : o == null
              ? (_loadError != null ? HooErrorState(error: _loadError!, onRetry: _load) : const HooLoading())
              : ListView(
                  padding: const EdgeInsets.all(HooSpacing.screen),
                  children: [
                    Row(children: [
                      for (final k in ReturnKind.values) ...[
                        OptionChip(label: k.label(l), uppercase: false, selected: _kind == k, onTap: () => setState(() => _kind = k)),
                        const SizedBox(width: HooSpacing.xs),
                      ],
                    ]),
                    const SizedBox(height: HooSpacing.lg),
                    for (final line in o.lines)
                      Opacity(
                        opacity: line.nonReturnable ? 0.5 : 1,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: HooSpacing.md),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              SizedBox(width: 56, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: line.previewUrl, borderRadius: HooRadius.cardAll, cacheWidth: 56))),
                              const SizedBox(width: HooSpacing.md),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(line.name, style: context.hoo.text.bodyStrong),
                                  Text([line.color, line.size?.label].whereType<String>().join(' · '), style: context.hoo.text.caption),
                                  if (line.nonReturnable) Text(l.ordersNotReturnable, style: context.hoo.text.caption),
                                ]),
                              ),
                              if (!line.nonReturnable)
                                QuantityStepper(value: _qty[line.id] ?? 0, min: 0, max: line.quantity, compact: true, onChanged: (v) => setState(() => _qty[line.id] = v)),
                            ]),
                            if (_kind == ReturnKind.exchange && (_qty[line.id] ?? 0) > 0) ...[
                              const SizedBox(height: HooSpacing.xs),
                              Wrap(spacing: HooSpacing.xs, children: [
                                for (final size in Size.customerSizes.where((s) => s != line.size))
                                  OptionChip(label: size.label, selected: _sizes[line.id] == size, onTap: () => setState(() => _sizes[line.id] = size)),
                              ]),
                            ],
                          ]),
                        ),
                      ),
                    HooTextField(controller: _reason, label: '${l.ordersReturnReason} (${l.commonOptional})', maxLines: 3, maxLength: 500),
                    const SizedBox(height: HooSpacing.sm),
                    HooPhoneField(controller: _phone, label: l.authPhoneLabel, errorText: _error?.fieldError('phone')),
                    if (_error != null && _error!.fieldErrors.isEmpty) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!))],
                    const SizedBox(height: HooSpacing.lg),
                    PrimaryButton(label: l.ordersSendRequest, loading: _sending, onPressed: _valid ? _submit : null),
                  ],
                ),
    );
  }
}

