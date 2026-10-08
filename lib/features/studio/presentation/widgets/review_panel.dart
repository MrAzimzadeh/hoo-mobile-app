import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../bloc/add_to_bag_cubit.dart';
import '../bloc/pricing_cubit.dart';
import '../bloc/studio_editor_bloc.dart';
import 'studio_steps.dart';

/// Step 6 — review: spec summary, name, quantity (volume tiers), rush, delivery estimate, rights, order notes.
class ReviewPanel extends StatefulWidget {
  const ReviewPanel({super.key});

  @override
  State<ReviewPanel> createState() => _ReviewPanelState();
}

class _ReviewPanelState extends State<ReviewPanel> {
  late final _name = TextEditingController(text: context.read<StudioEditorBloc>().state.doc?.name);

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final editor = context.read<StudioEditorBloc>();
    return BlocBuilder<StudioEditorBloc, StudioEditorState>(
      builder: (context, state) {
        final config = state.config;
        final base = state.base;
        final spec = state.spec;
        if (config == null || base == null || spec == null) return const SizedBox.shrink();
        final pricing = context.watch<PricingCubit>().state;
        final quote = pricing.quote;
        final hasImages = state.layers.any((x) => x.isImage);
        final fabric = config.fabric(spec.fabricCode);
        final features = [for (final code in spec.featureCodes) ?config.feature(code)?.name];
        final max = base.maxQuantity ?? 99;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepTitle(title: l.studioStepReview),
            if (state.changeRequestMessage != null) Padding(padding: const EdgeInsets.only(bottom: HooSpacing.md), child: InlineAlert(title: l.studioChangesRequested, message: state.changeRequestMessage!, kind: HooAlertKind.warning)),
            HooTextField(controller: _name, label: '${l.studioDesignName} (${l.commonOptional.toLowerCase()})', onChanged: (v) => editor.add(NameChanged(v)), enabled: !state.readOnly),
            const SizedBox(height: HooSpacing.md),
            HooCard(
              child: Column(
                children: [
                  SummaryRow(label: l.studioStepProduct, value: base.name),
                  if (fabric != null) SummaryRow(label: l.studioStepFabric, value: fabric.name),
                  if (features.isNotEmpty) SummaryRow(label: l.studioFeatures, value: features.join(', ')),
                  SummaryRow(label: l.studioFit, value: spec.fit.label(l)),
                  if (spec.size != null) SummaryRow(label: l.studioSize, value: spec.customMeasurements != null ? l.studioCustom : spec.size!.label),
                  if (state.color != null) SummaryRow(label: l.studioStepColor, value: state.color!.name),
                  SummaryRow(label: l.studioLayersTitle, value: '${state.layers.length}'),
                ],
              ),
            ),
            const SizedBox(height: HooSpacing.md),
            Row(
              children: [
                Expanded(child: Text(l.studioQuantity, style: t.bodyStrong)),
                QuantityStepper(value: spec.quantity, max: max, enabled: !state.readOnly, onChanged: (q) => editor.add(QuantityChanged(q))),
              ],
            ),
            if (config.extras.volumeTiers.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: HooSpacing.xs),
                child: Text(l.studioVolumeTiers(config.extras.volumeTiers.map((x) => '${x.minQuantity}+ → −${x.percent.toStringAsFixed(0)}%').join(' · ')), style: t.caption.copyWith(color: c.textSecondary)),
              ),
            if (config.extras.rushFee > 0)
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: spec.rush,
                onChanged: state.readOnly ? null : (v) => editor.add(RushToggled(v)),
                title: Text(l.studioRush, style: t.bodyStrong),
                subtitle: Text(l.studioRushHint(HooFormat.money(context, config.extras.rushFee), config.extras.rushLeadTimeDays), style: t.caption.copyWith(color: c.textSecondary)),
              ),
            if (quote != null && quote.estimatedDeliveryFrom != null) ...[
              const SizedBox(height: HooSpacing.sm),
              Row(
                children: [
                  Icon(HooIcons.truck, size: HooSize.iconSmall, color: c.accent),
                  const SizedBox(width: HooSpacing.xs),
                  Expanded(
                    child: Text(
                      quote.estimatedDeliveryTo == null || quote.estimatedDeliveryTo == quote.estimatedDeliveryFrom
                          ? l.studioEstimatedDelivery(HooFormat.date(context, quote.estimatedDeliveryFrom!))
                          : l.studioEstimatedDeliveryRange(HooFormat.date(context, quote.estimatedDeliveryFrom!), HooFormat.date(context, quote.estimatedDeliveryTo!)),
                      style: t.body,
                    ),
                  ),
                ],
              ),
            ],
            if (pricing.error != null) Padding(padding: const EdgeInsets.only(top: HooSpacing.md), child: InlineAlert(message: errorMessage(context, pricing.error!), kind: HooAlertKind.error)),
            const SizedBox(height: HooSpacing.md),
            InlineAlert(message: l.studioApprovalNote),
            if (hasImages) ...[
              const SizedBox(height: HooSpacing.sm),
              HooCheckboxTile(value: state.imageRightsConfirmed, onChanged: state.readOnly ? (_) {} : (v) => editor.add(ImageRightsChanged(v)), label: Text(l.checkoutImageRights, style: t.body)),
            ],
            BlocBuilder<AddToBagCubit, AddToBagState>(
              builder: (context, bag) {
                if (bag.error == null) return const SizedBox.shrink();
                return Padding(padding: const EdgeInsets.only(top: HooSpacing.sm), child: InlineAlert(message: errorMessage(context, bag.error!), kind: HooAlertKind.error));
              },
            ),
          ],
        );
      },
    );
  }
}
