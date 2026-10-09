import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/orders_repositories.dart';

/// Guest tracking: order number + phone → the same order detail UI.
@RoutePage()
class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key, @QueryParam('number') this.number});

  final String? number;

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  late final _number = TextEditingController(text: widget.number ?? '');
  final _phone = TextEditingController();
  bool _busy = false;
  ApiException? _error;

  @override
  void dispose() {
    _number.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _track() async {
    final number = _number.text.trim().toUpperCase();
    final phone = HooFormat.phoneWire(_phone.text);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await sl<OrderDetailRepository>().track(number, phone);
      if (mounted) await context.router.push(OrderDetailRoute(number: number, phone: phone));
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: HooAppBar(title: l.ordersTrackTitle),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          Text(l.ordersTrackBody, style: context.hoo.text.bodySecondary),
          const SizedBox(height: HooSpacing.lg),
          HooTextField(controller: _number, label: l.checkoutOrderNumber, hint: 'HOO-1042', textCapitalization: TextCapitalization.characters, errorText: _error?.fieldError('number')),
          const SizedBox(height: HooSpacing.md),
          HooPhoneField(controller: _phone, label: l.ordersTrackPhone, errorText: _error?.fieldError('phone')),
          if (_error != null && _error!.fieldErrors.isEmpty) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!))],
          const SizedBox(height: HooSpacing.lg),
          ListenableBuilder(
            listenable: Listenable.merge([_number, _phone]),
            builder: (context, _) => PrimaryButton(label: l.checkoutTrackOrder, loading: _busy, onPressed: _number.text.trim().isEmpty || !HooPhoneField.isComplete(_phone.text) ? null : _track),
          ),
        ],
      ),
    );
  }
}
