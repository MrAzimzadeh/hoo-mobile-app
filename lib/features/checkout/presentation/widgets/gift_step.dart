import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/checkout_models.dart';
import '../cubit/gift_message_cubit.dart';
import 'contact_delivery_steps.dart';

/// "This is a gift": recipient, occasion, surprise, packaging, greeting card + moderated message, signature.
/// Prices of packaging and card come from the server; the total updates from the returned session.
class GiftStep extends StatefulWidget {
  const GiftStep({super.key, required this.session, required this.options, required this.busy, required this.error, required this.onSubmit});

  final CheckoutSession session;
  final GiftOptions options;
  final bool busy;
  final ApiException? error;
  final ValueChanged<GiftSelection> onSubmit;

  @override
  State<GiftStep> createState() => _GiftStepState();
}

class _GiftStepState extends State<GiftStep> {
  late bool _isGift = widget.session.isGift;
  late final _name = TextEditingController(text: widget.session.gift?.recipientName);
  late final _phone = TextEditingController(text: _national(widget.session.gift?.recipientPhone));
  late final _message = TextEditingController(text: widget.session.gift?.message);
  late final _from = TextEditingController(text: widget.session.gift?.fromName);
  late Occasion _occasion = widget.session.gift?.occasion ?? (widget.options.occasions.firstOrNull ?? Occasion.justBecause);
  late bool _surprise = widget.session.gift?.surprise ?? true;
  late bool _hidePrices = widget.session.gift?.hidePrices ?? widget.options.rules.hidePricesByDefault;
  String? _packagingId;
  String? _cardTypeId;
  String? _designId;
  bool _tried = false;

  static String _national(String? wire) {
    final digits = (wire ?? '').replaceAll(RegExp(r'\D'), '');
    return digits.startsWith('994') ? digits.substring(3) : digits;
  }

  @override
  void initState() {
    super.initState();
    final o = widget.options;
    final g = widget.session.gift;
    _packagingId = o.packaging.where((p) => p.name == g?.packaging).firstOrNull?.id ?? o.packaging.firstOrNull?.id;
    _cardTypeId = o.cardTypes.where((c) => c.name == g?.cardType).firstOrNull?.id ?? o.cardTypes.where((c) => c.kind == GreetingCardKind.none).firstOrNull?.id;
    _designId = o.cardDesigns.where((d) => d.name == g?.cardDesign).firstOrNull?.id ?? o.cardDesigns.firstOrNull?.id;
  }

  @override
  void dispose() {
    for (final c in [_name, _phone, _message, _from]) {
      c.dispose();
    }
    super.dispose();
  }

  GiftCardType? get _cardType => widget.options.cardTypes.where((c) => c.id == _cardTypeId).firstOrNull;
  bool get _hasCard => _cardType != null && _cardType!.kind != GreetingCardKind.none;

  void _submit(GiftMessageState moderation) {
    if (!_isGift) {
      widget.onSubmit(const GiftSelection(isGift: false));
      return;
    }
    setState(() => _tried = true);
    final phoneOk = _phone.text.replaceAll(RegExp(r'\D'), '').length >= 9;
    final messageMissing = (_cardType?.requiresMessage ?? false) && _message.text.trim().isEmpty;
    if (_name.text.trim().isEmpty || !phoneOk || messageMissing || (moderation.check?.valid == false)) return;
    widget.onSubmit(
      GiftSelection(
        isGift: true,
        recipientName: _name.text.trim(),
        recipientPhone: HooFormat.phoneWire(_phone.text),
        occasion: _occasion,
        surprise: _surprise,
        packagingOptionId: _packagingId,
        cardTypeId: _cardTypeId,
        cardDesignId: _hasCard ? _designId : null,
        message: _hasCard ? _message.text.trim() : null,
        fromName: _hasCard && _from.text.trim().isNotEmpty ? _from.text.trim() : null,
        hidePrices: _hidePrices,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final o = widget.options;
    final e = widget.error;
    return BlocProvider(
      create: (_) => sl<GiftMessageCubit>(),
      child: BlocBuilder<GiftMessageCubit, GiftMessageState>(
        builder: (context, moderation) {
          return StepCard(
            title: l.checkoutGiftTitle,
            children: [
              StepError(error: e != null && e.fieldErrors.isEmpty ? e : null),
              HooCard(
                child: SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: _isGift,
                  onChanged: widget.busy ? null : (v) => setState(() => _isGift = v),
                  title: Text(l.checkoutGiftToggle, style: t.bodyStrong),
                  subtitle: Text(l.checkoutGiftToggleSubtitle, style: t.caption.copyWith(color: c.textSecondary)),
                ),
              ),
              if (_isGift) ...[
                const SizedBox(height: HooSpacing.lg),
                HooTextField(
                  controller: _name,
                  label: l.checkoutRecipientName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  errorText: e?.fieldError('recipientName') ?? (_tried && _name.text.trim().isEmpty ? l.fieldRequired : null),
                ),
                const SizedBox(height: HooSpacing.md),
                HooPhoneField(
                  controller: _phone,
                  label: l.checkoutRecipientPhone,
                  textInputAction: TextInputAction.next,
                  errorText: e?.fieldError('recipientPhone') ?? (_tried && _phone.text.replaceAll(RegExp(r'\D'), '').length < 9 ? l.fieldInvalidPhone : null),
                ),
                const SizedBox(height: HooSpacing.lg),
                Text(l.checkoutOccasion, style: t.bodyStrong),
                const SizedBox(height: HooSpacing.xs),
                Wrap(
                  spacing: HooSpacing.xs,
                  runSpacing: HooSpacing.xs,
                  children: [
                    for (final oc in o.occasions)
                      OptionChip(label: oc.label(l), uppercase: false, selected: oc == _occasion, onTap: () => setState(() => _occasion = oc)),
                  ],
                ),
                const SizedBox(height: HooSpacing.md),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: _surprise,
                  onChanged: (v) => setState(() => _surprise = v),
                  title: Text(l.checkoutSurprise, style: t.body),
                  subtitle: Text(l.checkoutSurpriseHint, style: t.caption.copyWith(color: c.textSecondary)),
                ),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: _hidePrices,
                  onChanged: (v) => setState(() => _hidePrices = v),
                  title: Text(l.checkoutHidePrices, style: t.body),
                ),
                if (o.packaging.isNotEmpty) ...[
                  const SizedBox(height: HooSpacing.md),
                  Text(l.checkoutPackaging, style: t.bodyStrong),
                  const SizedBox(height: HooSpacing.xs),
                  for (final p in o.packaging) ...[
                    SelectableCard(
                      selected: p.id == _packagingId,
                      onTap: () => setState(() => _packagingId = p.id),
                      child: Row(
                        children: [
                          if (p.imageUrl != null) ...[
                            SizedBox(
                              width: 56,
                              height: 56,
                              child: HooNetworkImage(url: p.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 160),
                            ),
                            const SizedBox(width: HooSpacing.md),
                          ],
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p.name, style: t.bodyStrong),
                                if (p.description != null) Text(p.description!, style: t.caption.copyWith(color: c.textSecondary)),
                                if (p.lowStock) Text(l.checkoutLowStock, style: t.caption.copyWith(color: c.error)),
                              ],
                            ),
                          ),
                          Text(p.isFree || p.price == 0 ? l.commonFree : HooFormat.money(context, p.price), style: t.bodyStrong),
                        ],
                      ),
                    ),
                    const SizedBox(height: HooSpacing.sm),
                  ],
                ],
                if (o.cardTypes.isNotEmpty) ...[
                  const SizedBox(height: HooSpacing.md),
                  Text(l.checkoutGreetingCard, style: t.bodyStrong),
                  const SizedBox(height: HooSpacing.xs),
                  for (final ct in o.cardTypes) ...[
                    SelectableCard(
                      selected: ct.id == _cardTypeId,
                      onTap: () => setState(() => _cardTypeId = ct.id),
                      child: Row(
                        children: [
                          Expanded(child: Text(ct.name, style: t.bodyStrong)),
                          Text(ct.price == 0 ? l.commonFree : HooFormat.money(context, ct.price), style: t.bodyStrong),
                        ],
                      ),
                    ),
                    const SizedBox(height: HooSpacing.sm),
                  ],
                ],
                if (_hasCard) ...[
                  if (o.cardDesigns.isNotEmpty) ...[
                    const SizedBox(height: HooSpacing.sm),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: o.cardDesigns.length,
                        separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.sm),
                        itemBuilder: (_, i) {
                          final d = o.cardDesigns[i];
                          return SelectableCard(
                            selected: d.id == _designId,
                            onTap: () => setState(() => _designId = d.id),
                            padding: const EdgeInsets.all(HooSpacing.xs),
                            child: SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: HooNetworkImage(url: d.previewUrl, borderRadius: HooRadius.cardAll, cacheWidth: 200),
                                  ),
                                  Text(d.name, style: t.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: HooSpacing.md),
                  HooTextField(
                    controller: _message,
                    label: l.checkoutCardMessage,
                    minLines: 3,
                    maxLines: 6,
                    onChanged: (_) => context.read<GiftMessageCubit>().changed(message: _message.text, fromName: _from.text),
                    errorText:
                        e?.fieldError('message') ?? (_tried && (_cardType?.requiresMessage ?? false) && _message.text.trim().isEmpty ? l.fieldRequired : null),
                    helperText: l.checkoutMessageCounter(_message.text.characters.length, o.rules.maxMessageLength),
                  ),
                  const SizedBox(height: HooSpacing.md),
                  HooTextField(
                    controller: _from,
                    label: '${l.checkoutFromName} (${l.commonOptional.toLowerCase()})',
                    maxLength: o.rules.fromNameMaxLength,
                    onChanged: (_) => context.read<GiftMessageCubit>().changed(message: _message.text, fromName: _from.text),
                  ),
                  for (final issue in moderation.check?.issues ?? const <GiftIssue>[])
                    Padding(
                      padding: const EdgeInsets.only(top: HooSpacing.xs),
                      child: Text(issue.message, style: t.caption.copyWith(color: c.error)),
                    ),
                ],
              ],
              const SizedBox(height: HooSpacing.lg),
              PrimaryButton(
                label: _isGift ? l.commonContinue : l.checkoutNoGift,
                loading: widget.busy,
                onPressed: widget.busy || moderation.checking ? null : () => _submit(moderation),
              ),
            ],
          );
        },
      ),
    );
  }
}
