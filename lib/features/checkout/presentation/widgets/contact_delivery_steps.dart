import 'package:flutter/material.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/checkout_models.dart';

/// Section frame: title + content.
class StepCard extends StatelessWidget {
  const StepCard({super.key, required this.title, required this.children, this.subtitle});

  final String title;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.hoo.text.h2),
        if (subtitle != null) ...[
          const SizedBox(height: HooSpacing.xxs),
          Text(subtitle!, style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary)),
        ],
        const SizedBox(height: HooSpacing.lg),
        ...children,
      ],
    );
  }
}

/// Failure banner for a step (field errors are shown under their inputs).
class StepError extends StatelessWidget {
  const StepError({super.key, required this.error});
  final ApiException? error;

  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: HooSpacing.md),
      child: InlineAlert(message: errorMessage(context, error!), kind: HooAlertKind.error),
    );
  }
}

class ContactStep extends StatefulWidget {
  const ContactStep({super.key, required this.initial, required this.busy, required this.error, required this.onSubmit});

  final ContactInfo? initial;
  final bool busy;
  final ApiException? error;
  final ValueChanged<ContactInfo> onSubmit;

  @override
  State<ContactStep> createState() => _ContactStepState();
}

class _ContactStepState extends State<ContactStep> {
  late final _name = TextEditingController(text: widget.initial?.fullName);
  late final _phone = TextEditingController(text: _national(widget.initial?.phone));
  late final _email = TextEditingController(text: widget.initial?.email);
  bool _tried = false;

  static String _national(String? wire) {
    if (wire == null) return '';
    final digits = wire.replaceAll(RegExp(r'\D'), '');
    return digits.startsWith('994') ? digits.substring(3) : digits;
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    super.dispose();
  }

  bool get _phoneOk => _phone.text.replaceAll(RegExp(r'\D'), '').length >= 9;

  void _submit() {
    setState(() => _tried = true);
    if (_name.text.trim().isEmpty || !_phoneOk) return;
    widget.onSubmit(
      ContactInfo(fullName: _name.text.trim(), phone: HooFormat.phoneWire(_phone.text), email: _email.text.trim().isEmpty ? null : _email.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final e = widget.error;
    return StepCard(
      title: l.checkoutContactTitle,
      subtitle: l.checkoutContactSubtitle,
      children: [
        StepError(error: e != null && e.fieldErrors.isEmpty ? e : null),
        HooTextField(
          controller: _name,
          label: l.checkoutFullName,
          textCapitalization: TextCapitalization.words,
          autofillHints: const [AutofillHints.name],
          textInputAction: TextInputAction.next,
          errorText: e?.fieldError('fullName') ?? (_tried && _name.text.trim().isEmpty ? l.fieldRequired : null),
        ),
        const SizedBox(height: HooSpacing.md),
        HooPhoneField(
          controller: _phone,
          label: l.checkoutPhone,
          textInputAction: TextInputAction.next,
          errorText: e?.fieldError('phone') ?? (_tried && !_phoneOk ? l.fieldInvalidPhone : null),
        ),
        const SizedBox(height: HooSpacing.md),
        HooTextField(
          controller: _email,
          label: '${l.checkoutEmail} (${l.commonOptional.toLowerCase()})',
          helperText: l.checkoutEmailHelper,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          errorText: e?.fieldError('email'),
        ),
        const SizedBox(height: HooSpacing.lg),
        PrimaryButton(label: l.commonContinue, loading: widget.busy, onPressed: widget.busy ? null : _submit),
      ],
    );
  }
}

class DeliveryStep extends StatefulWidget {
  const DeliveryStep({super.key, required this.session, required this.busy, required this.error, required this.onSubmit});

  final CheckoutSession session;
  final bool busy;
  final ApiException? error;
  final void Function({required String zoneId, String? savedAddressId, DeliveryAddress? address}) onSubmit;

  @override
  State<DeliveryStep> createState() => _DeliveryStepState();
}

class _DeliveryStepState extends State<DeliveryStep> {
  late String? _zoneId = widget.session.zone?.id ?? (widget.session.zones.length == 1 ? widget.session.zones.first.id : null);
  String? _savedId;
  bool _newAddress = false;
  bool _tried = false;
  final _city = TextEditingController();
  final _district = TextEditingController();
  final _street = TextEditingController();
  final _apartment = TextEditingController();
  final _note = TextEditingController();

  @override
  void initState() {
    super.initState();
    final a = widget.session.address;
    if (a != null) {
      _city.text = a.city;
      _district.text = a.district ?? '';
      _street.text = a.street;
      _apartment.text = a.apartment ?? '';
      _note.text = a.courierNote ?? '';
    }
    final saved = widget.session.savedAddresses;
    if (saved.isNotEmpty && a == null) _savedId = (saved.where((s) => s.isDefault).firstOrNull ?? saved.first).id;
    _newAddress = saved.isEmpty || (a != null && !saved.any((s) => s.address == a));
  }

  @override
  void dispose() {
    for (final c in [_city, _district, _street, _apartment, _note]) {
      c.dispose();
    }
    super.dispose();
  }

  DeliveryZone? get _zone => widget.session.zones.where((z) => z.id == _zoneId).firstOrNull;

  void _submit() {
    final zone = _zone;
    if (zone == null) return;
    if (zone.kind == DeliveryKind.pickup) {
      widget.onSubmit(zoneId: zone.id);
      return;
    }
    if (!_newAddress && _savedId != null) {
      widget.onSubmit(zoneId: zone.id, savedAddressId: _savedId);
      return;
    }
    setState(() => _tried = true);
    if (_city.text.trim().isEmpty || _street.text.trim().isEmpty) return;
    widget.onSubmit(
      zoneId: zone.id,
      address: DeliveryAddress(
        city: _city.text.trim(),
        district: _district.text.trim().isEmpty ? null : _district.text.trim(),
        street: _street.text.trim(),
        apartment: _apartment.text.trim().isEmpty ? null : _apartment.text.trim(),
        courierNote: _note.text.trim().isEmpty ? null : _note.text.trim(),
      ),
    );
  }

  String _eta(BuildContext context, DeliveryZone z) {
    final l = context.l10n;
    if (z.kind == DeliveryKind.pickup) return z.readyInHours == null ? (z.pickupAddress ?? '') : l.checkoutReadyIn(z.readyInHours!);
    return z.etaMinDays == z.etaMaxDays ? l.checkoutEtaDays(z.etaMinDays) : l.checkoutEtaRange(z.etaMinDays, z.etaMaxDays);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final e = widget.error;
    final zone = _zone;
    final saved = widget.session.savedAddresses;
    return StepCard(
      title: l.checkoutDeliveryTitle,
      subtitle: widget.session.isGift ? l.checkoutDeliveryGiftNote : null,
      children: [
        StepError(error: e != null && e.fieldErrors.isEmpty ? e : null),
        for (final z in widget.session.zones) ...[
          SelectableCard(
            selected: z.id == _zoneId,
            onTap: () => setState(() => _zoneId = z.id),
            child: Row(
              children: [
                Icon(z.kind == DeliveryKind.pickup ? HooIcons.pin : HooIcons.truck, color: c.textPrimary),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(z.name, style: t.bodyStrong),
                      Text(_eta(context, z), style: t.caption.copyWith(color: c.textSecondary)),
                      if (z.description != null && z.description!.isNotEmpty) Text(z.description!, style: t.caption.copyWith(color: c.textSecondary)),
                    ],
                  ),
                ),
                Text(z.price == 0 ? l.commonFree : HooFormat.money(context, z.price), style: t.bodyStrong),
              ],
            ),
          ),
          const SizedBox(height: HooSpacing.sm),
        ],
        if (zone != null && zone.kind == DeliveryKind.pickup && zone.pickupAddress != null) InlineAlert(message: zone.pickupAddress!),
        if (zone != null && zone.kind != DeliveryKind.pickup) ...[
          const SizedBox(height: HooSpacing.md),
          Text(l.checkoutAddressTitle, style: t.h3),
          const SizedBox(height: HooSpacing.sm),
          for (final a in saved) ...[
            SelectableCard(
              selected: !_newAddress && _savedId == a.id,
              onTap: () => setState(() {
                _savedId = a.id;
                _newAddress = false;
              }),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(a.label, style: t.bodyStrong),
                  Text(a.address.oneLine, style: t.caption.copyWith(color: c.textSecondary)),
                ],
              ),
            ),
            const SizedBox(height: HooSpacing.sm),
          ],
          if (saved.isNotEmpty)
            SelectableCard(
              selected: _newAddress,
              onTap: () => setState(() => _newAddress = true),
              child: Row(
                children: [
                  const Icon(HooIcons.plus, size: HooSize.iconSmall),
                  const SizedBox(width: HooSpacing.sm),
                  Text(l.checkoutNewAddress, style: t.bodyStrong),
                ],
              ),
            ),
          if (_newAddress) ...[
            const SizedBox(height: HooSpacing.md),
            HooTextField(
              controller: _city,
              label: l.checkoutCity,
              textInputAction: TextInputAction.next,
              errorText: e?.fieldError('city') ?? (_tried && _city.text.trim().isEmpty ? l.fieldRequired : null),
            ),
            const SizedBox(height: HooSpacing.md),
            HooTextField(controller: _district, label: '${l.checkoutDistrict} (${l.commonOptional.toLowerCase()})', textInputAction: TextInputAction.next),
            const SizedBox(height: HooSpacing.md),
            HooTextField(
              controller: _street,
              label: l.checkoutStreet,
              textInputAction: TextInputAction.next,
              errorText: e?.fieldError('street') ?? (_tried && _street.text.trim().isEmpty ? l.fieldRequired : null),
            ),
            const SizedBox(height: HooSpacing.md),
            HooTextField(controller: _apartment, label: '${l.checkoutApartment} (${l.commonOptional.toLowerCase()})', textInputAction: TextInputAction.next),
            const SizedBox(height: HooSpacing.md),
            HooTextField(controller: _note, label: '${l.checkoutCourierNote} (${l.commonOptional.toLowerCase()})', maxLines: 2),
          ],
        ],
        const SizedBox(height: HooSpacing.lg),
        PrimaryButton(label: l.commonContinue, loading: widget.busy, onPressed: widget.busy || zone == null ? null : _submit),
      ],
    );
  }
}
