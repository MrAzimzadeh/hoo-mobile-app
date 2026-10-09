import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../data/checkout_repository.dart';
import '../../domain/checkout_models.dart';
import '../bloc/checkout_bloc.dart';

/// Field error from the last step mutation.
String? _field(CheckoutState s, String name) => s.apiError?.fieldError(name);

Widget _stepError(BuildContext context, CheckoutState s, List<String> fields) {
  final e = s.apiError;
  if (e == null) return const SizedBox.shrink();
  if (e.fieldErrors.isNotEmpty && e.fieldErrors.keys.every((k) => fields.any((f) => k.toLowerCase().endsWith(f.toLowerCase())))) return const SizedBox.shrink();
  return Padding(padding: const EdgeInsets.only(top: HooSpacing.md), child: InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, e)));
}

// ---------------------------------------------------------------- 1 contact

class ContactStep extends StatefulWidget {
  const ContactStep({super.key, required this.state});
  final CheckoutState state;

  @override
  State<ContactStep> createState() => _ContactStepState();
}

class _ContactStepState extends State<ContactStep> {
  late final ContactInfo? _initial = widget.state.checkout?.contact;
  late final Me? _me = sl<AuthGate>().currentUser;
  late final _name = TextEditingController(text: _initial?.fullName ?? _me?.fullName ?? '');
  late final _phone = TextEditingController(text: _national(_initial?.phone ?? _me?.phone));
  late final _email = TextEditingController(text: _initial?.email ?? _me?.email ?? '');

  static String _national(String? phone) => phone == null ? '' : HooFormat.phone(phone).replaceFirst('+994 ', '');

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = widget.state;
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HooTextField(controller: _name, label: l.authFullNameLabel, textCapitalization: TextCapitalization.words, autofillHints: const [AutofillHints.name], errorText: _field(s, 'fullName')),
          const SizedBox(height: HooSpacing.md),
          HooPhoneField(controller: _phone, label: l.authPhoneLabel, errorText: _field(s, 'phone')),
          const SizedBox(height: HooSpacing.xxs),
          Text(l.checkoutPhoneHint, style: context.hoo.text.caption),
          const SizedBox(height: HooSpacing.md),
          HooTextField(controller: _email, label: '${l.authEmailLabel} (${l.commonOptional})', keyboardType: TextInputType.emailAddress, autofillHints: const [AutofillHints.email], errorText: _field(s, 'email')),
          _stepError(context, s, const ['fullName', 'phone', 'email']),
          const SizedBox(height: HooSpacing.lg),
          ListenableBuilder(
            listenable: Listenable.merge([_name, _phone]),
            builder: (context, _) => PrimaryButton(
              label: l.commonContinue,
              loading: s.busy,
              onPressed: _name.text.trim().isEmpty || !HooPhoneField.isComplete(_phone.text)
                  ? null
                  : () => context.read<CheckoutBloc>().add(ContactSubmitted(ContactInfo(fullName: _name.text, phone: HooFormat.phoneWire(_phone.text), email: _email.text))),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- 2 gift

class GiftStep extends StatefulWidget {
  const GiftStep({super.key, required this.state});
  final CheckoutState state;

  @override
  State<GiftStep> createState() => _GiftStepState();
}

class _GiftStepState extends State<GiftStep> {
  final _repo = sl<CheckoutRepository>();
  GiftOptions? _options;
  Object? _loadError;
  late final GiftSummary? _g = widget.state.checkout?.gift;
  late final _recipient = TextEditingController(text: _g?.recipientName ?? '');
  late final _phone = TextEditingController(text: _g == null || _g.recipientPhone.isEmpty ? '' : HooFormat.phone(_g.recipientPhone).replaceFirst('+994 ', ''));
  late final _message = TextEditingController(text: _g?.message ?? '');
  late final _from = TextEditingController(text: _g?.fromName ?? '');
  late Occasion _occasion = _g?.occasion ?? Occasion.birthday;
  late bool _surprise = _g?.surprise ?? true;
  bool? _hidePrices;
  String? _packaging;
  String? _cardType;
  String? _cardDesign;
  GiftMessageCheck? _check;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final o = await _repo.giftOptions();
      setState(() {
        _options = o;
        _packaging = o.packaging.where((p) => p.name == _g?.packaging).firstOrNull?.id ?? o.rules.freePackagingOptionId ?? o.packaging.firstOrNull?.id;
        _cardType = o.cardTypes.where((c) => c.name == _g?.cardType).firstOrNull?.id ?? o.cardTypes.firstOrNull?.id;
        _cardDesign = o.cardDesigns.where((c) => c.name == _g?.cardDesign).firstOrNull?.id;
        _hidePrices = _g?.hidePrices ?? o.rules.hidePricesByDefault;
      });
    } catch (e) {
      setState(() => _loadError = e);
    }
  }

  void _validateMessage() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        final r = await _repo.validateGiftMessage(_message.text, _from.text);
        if (mounted) setState(() => _check = r);
      } catch (_) {}
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    for (final c in [_recipient, _phone, _message, _from]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = widget.state;
    final o = _options;
    if (o == null) return _loadError != null ? HooErrorState(error: _loadError!, onRetry: _load, compact: true) : const HooLoading();
    if (!o.rules.allowForCustomOrders && (s.checkout?.hasCustomItems ?? false)) {
      return InlineAlert(kind: HooAlertKind.warning, message: l.checkoutGiftNotForCustom);
    }
    final cardType = o.cardTypes.where((c) => c.id == _cardType).firstOrNull;
    final needsMessage = cardType?.requiresMessage ?? false;
    final issues = _check?.issues ?? const <GiftIssue>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HooTextField(controller: _recipient, label: l.checkoutRecipientName, textCapitalization: TextCapitalization.words, errorText: _field(s, 'recipientName')),
        const SizedBox(height: HooSpacing.md),
        HooPhoneField(controller: _phone, label: l.checkoutRecipientPhone, errorText: _field(s, 'recipientPhone')),
        const SizedBox(height: HooSpacing.lg),
        Text(l.checkoutOccasion.toUpperCase(), style: context.hoo.text.labelSecondary),
        const SizedBox(height: HooSpacing.xs),
        Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
          for (final oc in (o.occasions.isEmpty ? Occasion.values.where((x) => x != Occasion.unknown) : o.occasions))
            OptionChip(label: oc.label(l), uppercase: false, style: OptionChipStyle.tint, selected: _occasion == oc, onTap: () => setState(() => _occasion = oc)),
        ]),
        SwitchListTile.adaptive(contentPadding: EdgeInsets.zero, value: _surprise, onChanged: (v) => setState(() => _surprise = v), title: Text(l.checkoutSurprise, style: context.hoo.text.body), subtitle: Text(l.checkoutSurpriseHint, style: context.hoo.text.caption)),
        const SizedBox(height: HooSpacing.md),
        Text(l.checkoutPackaging.toUpperCase(), style: context.hoo.text.labelSecondary),
        const SizedBox(height: HooSpacing.xs),
        for (final p in o.packaging)
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.sm),
            child: SelectableCard(
              selected: _packaging == p.id,
              onTap: () => setState(() => _packaging = p.id),
              child: Row(children: [
                if (p.imageUrl != null) ...[SizedBox.square(dimension: 56, child: HooNetworkImage(url: p.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 56)), const SizedBox(width: HooSpacing.md)],
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(p.name, style: context.hoo.text.bodyStrong),
                    if (p.description != null) Text(p.description!, style: context.hoo.text.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
                    if (o.rules.freePackagingThreshold != null && p.id == o.rules.freePackagingOptionId)
                      Text(l.checkoutPackagingFreeFrom(HooFormat.money(context, o.rules.freePackagingThreshold!)), style: context.hoo.text.caption.copyWith(color: context.hoo.colors.accent)),
                  ]),
                ),
                Text(p.isFree || p.price == 0 ? l.commonFree : HooFormat.money(context, p.price), style: context.hoo.text.bodyStrong),
              ]),
            ),
          ),
        const SizedBox(height: HooSpacing.sm),
        Text(l.checkoutCard.toUpperCase(), style: context.hoo.text.labelSecondary),
        const SizedBox(height: HooSpacing.xs),
        Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
          for (final c in o.cardTypes)
            OptionChip(
              label: c.name,
              uppercase: false,
              style: OptionChipStyle.tint,
              selected: _cardType == c.id,
              trailing: c.price > 0 ? HooFormat.money(context, c.price) : null,
              onTap: () => setState(() => _cardType = c.id),
            ),
        ]),
        if (cardType != null && cardType.kind != GreetingCardKind.none) ...[
          if (o.cardDesigns.isNotEmpty) ...[
            const SizedBox(height: HooSpacing.md),
            SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: o.cardDesigns.length,
                separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.sm),
                itemBuilder: (context, i) {
                  final d = o.cardDesigns[i];
                  return SelectableCard(
                    padding: const EdgeInsets.all(HooSpacing.xxs),
                    selected: _cardDesign == d.id,
                    onTap: () => setState(() => _cardDesign = d.id),
                    child: SizedBox(width: 72, child: d.previewUrl == null ? Center(child: Text(d.name, style: context.hoo.text.caption)) : HooNetworkImage(url: d.previewUrl, borderRadius: HooRadius.cardAll, cacheWidth: 72, semanticLabel: d.name)),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: HooSpacing.md),
          HooTextField(
            controller: _message,
            label: needsMessage ? l.checkoutMessage : '${l.checkoutMessage} (${l.commonOptional})',
            maxLines: 4,
            minLines: 3,
            maxLength: o.rules.maxMessageLength,
            onChanged: (_) => _validateMessage(),
            errorText: issues.where((i) => i.field == null || i.field!.toLowerCase().contains('message')).map((i) => i.message).firstOrNull ?? _field(s, 'message'),
          ),
          const SizedBox(height: HooSpacing.sm),
          HooTextField(
            controller: _from,
            label: '${l.checkoutFromName} (${l.commonOptional})',
            maxLength: o.rules.fromNameMaxLength,
            onChanged: (_) => _validateMessage(),
            errorText: issues.where((i) => i.field?.toLowerCase().contains('from') ?? false).map((i) => i.message).firstOrNull,
          ),
        ],
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          value: _hidePrices ?? true,
          onChanged: (v) => setState(() => _hidePrices = v),
          title: Text(l.checkoutHidePrices, style: context.hoo.text.body),
        ),
        _stepError(context, s, const ['recipientName', 'recipientPhone', 'message']),
        const SizedBox(height: HooSpacing.lg),
        ListenableBuilder(
          listenable: Listenable.merge([_recipient, _phone, _message]),
          builder: (context, _) => PrimaryButton(
            label: l.commonContinue,
            loading: s.busy,
            onPressed: _recipient.text.trim().length < 2 || !HooPhoneField.isComplete(_phone.text) || (needsMessage && _message.text.trim().isEmpty) || (_check != null && !_check!.valid)
                ? null
                : () => context.read<CheckoutBloc>().add(GiftSubmitted(GiftSelection(
                      recipientName: _recipient.text,
                      recipientPhone: HooFormat.phoneWire(_phone.text),
                      occasion: _occasion,
                      surprise: _surprise,
                      packagingOptionId: _packaging,
                      cardTypeId: _cardType,
                      cardDesignId: _cardDesign,
                      message: _message.text,
                      fromName: _from.text,
                      hidePrices: _hidePrices,
                    ))),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 3 delivery

class DeliveryStep extends StatefulWidget {
  const DeliveryStep({super.key, required this.state});
  final CheckoutState state;

  @override
  State<DeliveryStep> createState() => _DeliveryStepState();
}

class _DeliveryStepState extends State<DeliveryStep> {
  late String? _zoneId = widget.state.checkout?.zone?.id ?? widget.state.checkout?.zones.firstOrNull?.id;
  late final Checkout _c = widget.state.checkout!;
  late String? _savedId = _c.savedAddresses.where((a) => a.isDefault).firstOrNull?.id ?? _c.savedAddresses.firstOrNull?.id;
  late bool _newAddress = _c.savedAddresses.isEmpty;
  late final _city = TextEditingController(text: _c.address?.city ?? 'Bakı');
  late final _district = TextEditingController(text: _c.address?.district ?? '');
  late final _street = TextEditingController(text: _c.address?.street ?? '');
  late final _apartment = TextEditingController(text: _c.address?.apartment ?? '');
  late final _note = TextEditingController(text: _c.address?.courierNote ?? '');

  @override
  void dispose() {
    for (final c in [_city, _district, _street, _apartment, _note]) {
      c.dispose();
    }
    super.dispose();
  }

  String _eta(BuildContext context, DeliveryZone z) {
    final l = context.l10n;
    if (z.readyInHours != null) return l.checkoutReadyInHours(z.readyInHours!);
    if (z.etaMaxDays <= 1) return z.etaMaxDays == 0 ? l.catalogToday : l.catalogTomorrow;
    return l.commonDays(z.etaMinDays, z.etaMaxDays);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = widget.state;
    final zone = _c.zones.where((z) => z.id == _zoneId).firstOrNull;
    final needsAddress = zone != null && zone.kind != DeliveryKind.pickup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final z in _c.zones)
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.sm),
            child: SelectableCard(
              selected: z.id == _zoneId,
              onTap: () => setState(() => _zoneId = z.id),
              child: Row(children: [
                Icon(z.kind == DeliveryKind.pickup ? HooIcons.pin : HooIcons.truck, color: context.hoo.colors.textPrimary),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(z.name, style: context.hoo.text.bodyStrong),
                    Text([z.kind.label(l), _eta(context, z)].join(' · '), style: context.hoo.text.caption),
                    if (z.freeFrom != null) Text(l.checkoutFreeFrom(HooFormat.money(context, z.freeFrom!)), style: context.hoo.text.caption.copyWith(color: context.hoo.colors.accent)),
                    if (z.kind == DeliveryKind.pickup && z.pickupAddress != null) Text(z.pickupAddress!, style: context.hoo.text.caption),
                  ]),
                ),
                Text(z.price == 0 ? l.commonFree : HooFormat.money(context, z.price), style: context.hoo.text.bodyStrong),
              ]),
            ),
          ),
        if (needsAddress) ...[
          const SizedBox(height: HooSpacing.md),
          Text(l.checkoutAddress.toUpperCase(), style: context.hoo.text.labelSecondary),
          const SizedBox(height: HooSpacing.xs),
          for (final a in _c.savedAddresses)
            Padding(
              padding: const EdgeInsets.only(bottom: HooSpacing.sm),
              child: SelectableCard(
                selected: !_newAddress && _savedId == a.id,
                onTap: () => setState(() {
                  _newAddress = false;
                  _savedId = a.id;
                }),
                child: Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(a.label, style: context.hoo.text.bodyStrong), Text(a.address.oneLine, style: context.hoo.text.caption)])),
                ]),
              ),
            ),
          if (_c.savedAddresses.isNotEmpty)
            OptionChip(label: l.checkoutNewAddress, uppercase: false, style: OptionChipStyle.tint, selected: _newAddress, leading: const Icon(HooIcons.plus, size: 14), onTap: () => setState(() => _newAddress = true)),
          if (_newAddress) ...[
            const SizedBox(height: HooSpacing.md),
            HooTextField(controller: _city, label: l.checkoutCity, errorText: _field(s, 'city')),
            const SizedBox(height: HooSpacing.sm),
            HooTextField(controller: _district, label: '${l.checkoutDistrict} (${l.commonOptional})'),
            const SizedBox(height: HooSpacing.sm),
            HooTextField(controller: _street, label: l.checkoutStreet, autofillHints: const [AutofillHints.fullStreetAddress], errorText: _field(s, 'street')),
            const SizedBox(height: HooSpacing.sm),
            HooTextField(controller: _apartment, label: '${l.checkoutApartment} (${l.commonOptional})'),
            const SizedBox(height: HooSpacing.sm),
            HooTextField(controller: _note, label: '${l.checkoutCourierNote} (${l.commonOptional})', maxLines: 2),
          ],
        ],
        _stepError(context, s, const ['city', 'street']),
        const SizedBox(height: HooSpacing.lg),
        ListenableBuilder(
          listenable: Listenable.merge([_city, _street]),
          builder: (context, _) {
            final addressOk = !needsAddress || (!_newAddress && _savedId != null) || (_newAddress && _city.text.trim().isNotEmpty && _street.text.trim().isNotEmpty);
            return PrimaryButton(
              label: l.commonContinue,
              loading: s.busy,
              onPressed: zone == null || !addressOk
                  ? null
                  : () => context.read<CheckoutBloc>().add(DeliverySubmitted(
                        zoneId: zone.id,
                        savedAddressId: needsAddress && !_newAddress ? _savedId : null,
                        address: needsAddress && _newAddress
                            ? DeliveryAddress(
                                city: _city.text.trim(),
                                district: _district.text.trim().isEmpty ? null : _district.text.trim(),
                                street: _street.text.trim(),
                                apartment: _apartment.text.trim().isEmpty ? null : _apartment.text.trim(),
                                courierNote: _note.text.trim().isEmpty ? null : _note.text.trim(),
                              )
                            : null,
                      )),
            );
          },
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 4 slot

class SlotStep extends StatefulWidget {
  const SlotStep({super.key, required this.state});
  final CheckoutState state;

  @override
  State<SlotStep> createState() => _SlotStepState();
}

class _SlotStepState extends State<SlotStep> {
  DateTime? _day;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutBloc>().add(const SlotsRequested());
    _day = widget.state.checkout?.slot?.date;
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = widget.state;
    if (s.slotsLoading && s.slots.isEmpty) return const HooLoading();
    if (s.slots.isEmpty) return HooEmptyState(icon: HooIcons.clock, title: l.checkoutNoSlots, compact: true, actionLabel: l.commonRetry, onAction: () => context.read<CheckoutBloc>().add(const SlotsRequested()));
    final day = s.slots.where((d) => DateUtils.isSameDay(d.date, _day)).firstOrNull ?? s.slots.firstWhere((d) => d.hasSelectable, orElse: () => s.slots.first);
    final selected = s.checkout?.slot;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 72,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: s.slots.length,
            separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
            itemBuilder: (context, i) {
              final d = s.slots[i];
              return SelectableCard(
                padding: const EdgeInsets.symmetric(horizontal: HooSpacing.md, vertical: HooSpacing.sm),
                selected: DateUtils.isSameDay(d.date, day.date),
                enabled: d.hasSelectable,
                onTap: () => setState(() => _day = d.date),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(HooFormat.weekdayDayMonth(context, d.date).split(',').first, style: context.hoo.text.labelSecondary),
                  Text(HooFormat.dayMonth(context, d.date), style: context.hoo.text.bodyStrong),
                ]),
              );
            },
          ),
        ),
        const SizedBox(height: HooSpacing.lg),
        Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
          for (final w in day.windows)
            OptionChip(
              label: '${HooFormat.timeOnly(w.start)}–${HooFormat.timeOnly(w.end)}',
              uppercase: false,
              selected: selected != null && selected.windowId == w.windowId && DateUtils.isSameDay(selected.date, day.date),
              unavailable: !w.selectable,
              onTap: w.selectable && !s.busy ? () => context.read<CheckoutBloc>().add(SlotSelected(day.date, w.windowId)) : null,
            ),
        ]),
        if (s.apiError?.isConflict ?? false) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.warning, message: l.checkoutSlotTaken)] else _stepError(context, s, const []),
      ],
    );
  }
}

// ---------------------------------------------------------------- 5 payment

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key, required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = state.checkout!;
    final bloc = context.read<CheckoutBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final o in c.paymentMethods.where((o) => o.method != PaymentMethod.savedCard || c.savedCards.isNotEmpty))
          if (o.method == PaymentMethod.savedCard)
            for (final card in c.savedCards)
              Padding(
                padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                child: SelectableCard(
                  selected: c.paymentMethod == PaymentMethod.savedCard && c.savedCardId == card.id,
                  enabled: o.available && !state.busy,
                  onTap: () => bloc.add(PaymentMethodSelected(PaymentMethod.savedCard, savedCardId: card.id)),
                  child: Row(children: [
                    const Icon(HooIcons.card),
                    const SizedBox(width: HooSpacing.md),
                    Expanded(child: Text('${card.brand} ${card.maskedPan}', style: context.hoo.text.bodyStrong)),
                  ]),
                ),
              )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: HooSpacing.sm),
              child: SelectableCard(
                selected: c.paymentMethod == o.method,
                enabled: o.available && !state.busy,
                onTap: () => bloc.add(PaymentMethodSelected(o.method)),
                child: Row(children: [
                  Icon(o.method.isOnline ? HooIcons.card : HooIcons.receipt),
                  const SizedBox(width: HooSpacing.md),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(o.method.label(l), style: context.hoo.text.bodyStrong),
                      if (!o.available && o.unavailableReason != null) Text(o.unavailableReason!, style: context.hoo.text.caption.copyWith(color: context.hoo.colors.error)),
                    ]),
                  ),
                ]),
              ),
            ),
        _stepError(context, state, const []),
        const SizedBox(height: HooSpacing.md),
        PrimaryButton(
          label: l.commonContinue,
          loading: state.busy,
          onPressed: c.missing('payment') ? null : () => bloc.add(const CheckoutStepSelected(CheckoutStep.review)),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 6 review

class ReviewStep extends StatefulWidget {
  const ReviewStep({super.key, required this.state});
  final CheckoutState state;

  @override
  State<ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends State<ReviewStep> {
  bool _terms = false;
  bool _rights = false;
  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = widget.state;
    final c = s.checkout!;
    final t = c.totals;
    final ready = c.canPlaceOrder && _terms && (!c.hasCustomItems || _rights);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final item in c.items)
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.sm),
            child: Row(children: [
              SizedBox(width: 48, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: item.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 48))),
              const SizedBox(width: HooSpacing.sm),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(item.name, style: context.hoo.text.body, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text([item.color, item.size?.label, '× ${item.quantity}'].whereType<String>().join(' · '), style: context.hoo.text.caption),
                  if (item.errorMessage != null) Text(item.errorMessage!, style: context.hoo.text.caption.copyWith(color: context.hoo.colors.error)),
                ]),
              ),
              Text(HooFormat.money(context, item.lineTotal), style: context.hoo.text.bodyStrong),
            ]),
          ),
        Divider(color: context.hoo.colors.border, height: HooSpacing.lg),
        SummaryRow(label: l.summarySubtotal, value: HooFormat.money(context, t.subtotal)),
        if (t.discount > 0) SummaryRow(label: c.promoCode ?? l.summaryDiscount, value: HooFormat.signedMoney(context, -t.discount), valueColor: context.hoo.colors.accent),
        SummaryRow(label: l.summaryDelivery, value: t.delivery == 0 ? l.commonFree : HooFormat.money(context, t.delivery)),
        if (t.giftPackaging > 0 || t.giftPackagingSaving > 0)
          SummaryRow(label: l.summaryGiftPackaging, value: t.giftPackaging == 0 ? l.commonFree : HooFormat.money(context, t.giftPackaging)),
        if (t.giftPackagingSaving > 0) SummaryRow(label: l.checkoutPackagingSaving, value: HooFormat.signedMoney(context, -t.giftPackagingSaving), caption: true),
        if (t.greetingCard > 0) SummaryRow(label: l.summaryGreetingCard, value: HooFormat.money(context, t.greetingCard)),
        SummaryRow(label: l.summaryTotal, value: HooFormat.money(context, t.total), strong: true),
        if (t.vatIncluded > 0) Text(l.summaryVatIncluded(HooFormat.money(context, t.vatIncluded)), style: context.hoo.text.caption),
        if (c.estimatedDeliveryFrom != null && c.estimatedDeliveryTo != null) ...[
          const SizedBox(height: HooSpacing.sm),
          Row(children: [
            const Icon(HooIcons.truck, size: 18),
            const SizedBox(width: HooSpacing.xs),
            Expanded(child: Text(l.checkoutEstimatedDelivery(HooFormat.dateRange(context, c.estimatedDeliveryFrom!, c.estimatedDeliveryTo!)), style: context.hoo.text.captionPrimary)),
          ]),
        ],
        if (c.promoError != null) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.warning, message: c.promoError!)],
        if (c.hasCustomItems) ...[const SizedBox(height: HooSpacing.md), InlineAlert(message: l.checkoutCustomApprovalNote)],
        const SizedBox(height: HooSpacing.md),
        if (c.paymentMethod == PaymentMethod.card) HooCheckboxTile(value: _saveCard, onChanged: (v) => setState(() => _saveCard = v), label: Text(l.checkoutSaveCard)),
        HooCheckboxTile(value: _terms, onChanged: (v) => setState(() => _terms = v), label: Text(l.checkoutAcceptTerms)),
        if (c.hasCustomItems) HooCheckboxTile(value: _rights, onChanged: (v) => setState(() => _rights = v), label: Text(l.checkoutImageRights)),
        if (!c.canPlaceOrder && c.missingSteps.isNotEmpty) ...[const SizedBox(height: HooSpacing.sm), InlineAlert(kind: HooAlertKind.warning, message: l.checkoutMissingSteps)],
        _stepError(context, s, const []),
        const SizedBox(height: HooSpacing.lg),
        PrimaryButton.accent(
          label: l.checkoutPlaceOrder(HooFormat.money(context, t.total)),
          loading: s.busy,
          onPressed: ready ? () => context.read<CheckoutBloc>().add(PlaceOrderRequested(acceptTerms: _terms, confirmImageRights: _rights, saveCard: _saveCard)) : null,
        ),
      ],
    );
  }
}
