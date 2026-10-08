import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/spec_defaults.dart';

String surchargeLabel(BuildContext context, double amount, {bool included = false}) {
  if (included) return context.l10n.studioIncluded;
  if (amount == 0) return context.l10n.studioNoExtraCost;
  return '+${HooFormat.money(context, amount)}';
}

String leadTimeLabel(BuildContext context, int minDays, int maxDays) {
  final l = context.l10n;
  if (maxDays <= 0) return '';
  return minDays == maxDays ? l.studioLeadTimeDays(minDays) : l.studioLeadTimeRange(minDays, maxDays);
}

class StepTitle extends StatelessWidget {
  const StepTitle({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: HooSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.hoo.text.h2),
          if (subtitle != null) Text(subtitle!, style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary)),
        ],
      ),
    );
  }
}

/// Step 1 — pick the garment.
class ProductStep extends StatelessWidget {
  const ProductStep({super.key, required this.config, required this.selected, required this.onSelect});

  final StudioConfig config;
  final String? selected;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepTitle(title: l.studioStepProduct, subtitle: l.studioStepProductHint),
        for (final b in config.baseProducts) ...[
          SelectableCard(
            selected: b.code == selected,
            onTap: () => onSelect(b.code),
            child: Row(
              children: [
                SizedBox(width: 72, height: 72, child: HooNetworkImage(url: b.product?.imageUrl, borderRadius: HooRadius.cardAll, cacheWidth: 200)),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(b.name, style: t.bodyStrong),
                      Text(l.studioFromPrice(HooFormat.money(context, b.price)), style: t.caption.copyWith(color: c.textSecondary)),
                      Text(leadTimeLabel(context, b.leadTimeMinDays, b.leadTimeMaxDays), style: t.caption.copyWith(color: c.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: HooSpacing.sm),
        ],
      ],
    );
  }
}

/// Step 2 — fabric and features.
class FabricStep extends StatelessWidget {
  const FabricStep({super.key, required this.config, required this.base, required this.spec, required this.onFabric, required this.onFeature});

  final StudioConfig config;
  final StudioBase base;
  final DesignSpec spec;
  final ValueChanged<String> onFabric;
  final ValueChanged<String> onFeature;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final fabrics = [for (final code in base.fabricCodes) ?config.fabric(code)];
    final features = [for (final code in base.featureCodes) ?config.feature(code)];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepTitle(title: l.studioStepFabric, subtitle: l.studioStepFabricHint),
        for (final f in fabrics) ...[
          SelectableCard(
            selected: f.code == spec.fabricCode,
            onTap: () => onFabric(f.code),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(f.name, style: t.bodyStrong), if (f.gsm != null) Text(l.studioGsm(f.gsm!), style: t.caption.copyWith(color: c.textSecondary))],
                  ),
                ),
                Text(surchargeLabel(context, f.surcharge, included: f.included && f.surcharge == 0), style: t.caption.copyWith(color: c.textSecondary)),
              ],
            ),
          ),
          const SizedBox(height: HooSpacing.sm),
        ],
        if (features.isNotEmpty) ...[
          const SizedBox(height: HooSpacing.md),
          Text(l.studioFeatures, style: t.h3),
          const SizedBox(height: HooSpacing.sm),
          Wrap(
            spacing: HooSpacing.xs,
            runSpacing: HooSpacing.xs,
            children: [
              for (final f in features)
                OptionChip(label: f.name, uppercase: false, trailing: f.surcharge == 0 ? null : '+${HooFormat.money(context, f.surcharge)}', selected: spec.featureCodes.contains(f.code), onTap: () => onFeature(f.code)),
            ],
          ),
        ],
      ],
    );
  }
}

/// Step 3 — fit, size and optional custom measurements.
class SizeFitStep extends StatefulWidget {
  const SizeFitStep({super.key, required this.config, required this.base, required this.spec, required this.onFit, required this.onSize, required this.onMeasurements});

  final StudioConfig config;
  final StudioBase base;
  final DesignSpec spec;
  final ValueChanged<Fit> onFit;
  final ValueChanged<Size> onSize;
  final ValueChanged<CustomMeasurements?> onMeasurements;

  @override
  State<SizeFitStep> createState() => _SizeFitStepState();
}

class _SizeFitStepState extends State<SizeFitStep> {
  late bool _custom = widget.spec.customMeasurements != null;
  late final _chest = TextEditingController(text: widget.spec.customMeasurements?.chestCm.toString());
  late final _length = TextEditingController(text: widget.spec.customMeasurements?.lengthCm.toString());
  late final _sleeve = TextEditingController(text: widget.spec.customMeasurements?.sleeveCm.toString());

  @override
  void dispose() {
    _chest.dispose();
    _length.dispose();
    _sleeve.dispose();
    super.dispose();
  }

  void _emitMeasurements() {
    final chest = int.tryParse(_chest.text), length = int.tryParse(_length.text), sleeve = int.tryParse(_sleeve.text);
    if (chest == null || length == null || sleeve == null) return;
    widget.onMeasurements(CustomMeasurements(chestCm: chest, lengthCm: length, sleeveCm: sleeve));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final base = widget.base;
    final fee = widget.config.extras.customMeasurementsFee;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepTitle(title: l.studioStepSize, subtitle: l.studioStepSizeHint),
        Text(l.studioFit, style: t.bodyStrong),
        const SizedBox(height: HooSpacing.xs),
        Wrap(
          spacing: HooSpacing.xs,
          runSpacing: HooSpacing.xs,
          children: [
            for (final fit in base.fits)
              OptionChip(label: fit.label(l), uppercase: false, trailing: widget.config.fitSurcharge(fit) == 0 ? null : '+${HooFormat.money(context, widget.config.fitSurcharge(fit))}', selected: fit == widget.spec.fit, onTap: () => widget.onFit(fit)),
          ],
        ),
        const SizedBox(height: HooSpacing.lg),
        Text(l.studioSize, style: t.bodyStrong),
        const SizedBox(height: HooSpacing.xs),
        Wrap(
          spacing: HooSpacing.xs,
          runSpacing: HooSpacing.xs,
          children: [
            for (final s in base.sizes)
              OptionChip(
                label: s.label,
                minWidth: 48,
                trailing: widget.config.sizeSurcharge(s) == 0 ? null : '+${HooFormat.money(context, widget.config.sizeSurcharge(s))}',
                selected: s == widget.spec.size,
                unavailable: !SpecDefaults.variantAvailable(base, widget.spec.colorId, s),
                onTap: SpecDefaults.variantAvailable(base, widget.spec.colorId, s) ? () => widget.onSize(s) : null,
              ),
          ],
        ),
        const SizedBox(height: HooSpacing.lg),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          value: _custom,
          onChanged: (v) {
            setState(() => _custom = v);
            if (!v) widget.onMeasurements(null);
          },
          title: Text(l.studioCustomMeasurements, style: t.bodyStrong),
          subtitle: Text(fee > 0 ? l.studioCustomMeasurementsFee(HooFormat.money(context, fee)) : l.studioCustomMeasurementsHint, style: t.caption.copyWith(color: c.textSecondary)),
        ),
        if (_custom)
          Row(
            children: [
              for (final (label, ctrl) in [(l.studioChest, _chest), (l.studioLength, _length), (l.studioSleeve, _sleeve)]) ...[
                Expanded(child: HooTextField(controller: ctrl, label: label, keyboardType: TextInputType.number, onChanged: (_) => _emitMeasurements())),
                const SizedBox(width: HooSpacing.xs),
              ],
            ],
          ),
      ],
    );
  }
}

/// Step 4 — colour.
class ColorStep extends StatelessWidget {
  const ColorStep({super.key, required this.base, required this.spec, required this.onColor});

  final StudioBase base;
  final DesignSpec spec;
  final ValueChanged<String> onColor;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final selected = base.colors.where((c) => c.id == spec.colorId).firstOrNull;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepTitle(title: l.studioStepColor, subtitle: selected?.name),
        Wrap(
          spacing: HooSpacing.sm,
          runSpacing: HooSpacing.sm,
          children: [
            for (final color in base.colors)
              HooColorSwatch(hex: color.hex, name: color.name, selected: color.id == spec.colorId, available: SpecDefaults.colorAvailable(base, color.id), onTap: () => onColor(color.id)),
          ],
        ),
      ],
    );
  }
}
