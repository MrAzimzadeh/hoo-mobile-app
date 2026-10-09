import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/profile_repositories.dart';

/// Create or edit an address.
@RoutePage()
class AddressFormPage extends StatefulWidget {
  const AddressFormPage({super.key, this.address});

  final SavedAddress? address;

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  late final a = widget.address;
  late final _label = TextEditingController(text: a?.label ?? '');
  late final _city = TextEditingController(text: a?.address.city ?? 'Bakı');
  late final _district = TextEditingController(text: a?.address.district ?? '');
  late final _street = TextEditingController(text: a?.address.street ?? '');
  late final _apartment = TextEditingController(text: a?.address.apartment ?? '');
  late final _note = TextEditingController(text: a?.address.courierNote ?? '');
  late bool _default = a?.isDefault ?? false;
  bool _saving = false;
  ApiException? _error;

  @override
  void dispose() {
    for (final c in [_label, _city, _district, _street, _apartment, _note]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _opt(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    final address = DeliveryAddress(city: _city.text.trim(), district: _opt(_district), street: _street.text.trim(), apartment: _opt(_apartment), courierNote: _opt(_note));
    final repo = sl<AddressRepository>();
    try {
      if (a == null) {
        await repo.create(label: _label.text.trim(), address: address, isDefault: _default);
      } else {
        await repo.update(a!.id, label: _label.text.trim(), address: address, isDefault: _default);
      }
      if (mounted) await context.router.maybePop(true);
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete() async {
    final l = context.l10n;
    if (!await showHooConfirm(context, title: l.profileDeleteAddress, confirmLabel: l.commonDelete, destructive: true)) return;
    try {
      await sl<AddressRepository>().delete(a!.id);
      if (mounted) await context.router.maybePop(true);
    } on ApiException catch (e) {
      if (mounted) HooToast.error(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: HooAppBar(
        title: a == null ? l.profileAddAddress : l.profileEditAddress,
        leading: HooIconButton(icon: HooIcons.close, semanticLabel: l.a11yClose, onPressed: () => context.router.maybePop()),
        actions: [if (a != null) HooIconButton(icon: HooIcons.trash, semanticLabel: l.commonDelete, onPressed: _delete)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          HooTextField(controller: _label, label: l.profileAddressLabel, hint: l.profileAddressLabelHint, errorText: _error?.fieldError('label')),
          const SizedBox(height: HooSpacing.md),
          HooTextField(controller: _city, label: l.checkoutCity, errorText: _error?.fieldError('city')),
          const SizedBox(height: HooSpacing.sm),
          HooTextField(controller: _district, label: '${l.checkoutDistrict} (${l.commonOptional})'),
          const SizedBox(height: HooSpacing.sm),
          HooTextField(controller: _street, label: l.checkoutStreet, errorText: _error?.fieldError('street')),
          const SizedBox(height: HooSpacing.sm),
          HooTextField(controller: _apartment, label: '${l.checkoutApartment} (${l.commonOptional})'),
          const SizedBox(height: HooSpacing.sm),
          HooTextField(controller: _note, label: '${l.checkoutCourierNote} (${l.commonOptional})', maxLines: 2),
          SwitchListTile.adaptive(contentPadding: EdgeInsets.zero, value: _default, onChanged: (v) => setState(() => _default = v), title: Text(l.profileMakeDefault, style: context.hoo.text.body)),
          if (_error != null && _error!.fieldErrors.isEmpty) InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!)),
          const SizedBox(height: HooSpacing.lg),
          ListenableBuilder(
            listenable: Listenable.merge([_label, _city, _street]),
            builder: (context, _) => PrimaryButton(
              label: l.commonSave,
              loading: _saving,
              onPressed: _label.text.trim().isEmpty || _city.text.trim().isEmpty || _street.text.trim().isEmpty ? null : _save,
            ),
          ),
        ],
      ),
    );
  }
}
