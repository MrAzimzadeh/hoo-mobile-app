import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../bloc/studio_editor_bloc.dart';
import '../bloc/studio_side_cubits.dart';

/// Sticky price bar: the server quote (unit × quantity, expandable breakdown) and the step CTA.
/// The review step has its own actions, so the bar only shows the price there.
class StudioPriceBar extends StatelessWidget {
  const StudioPriceBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final editor = context.watch<StudioEditorBloc>().state;
    final pricing = context.watch<PricingCubit>().state;
    final q = pricing.quote;
    final step = editor.step;
    final next = switch (step) {
      StudioStep.product => StudioStep.fabric,
      StudioStep.fabric => StudioStep.fit,
      StudioStep.fit => StudioStep.color,
      StudioStep.color => StudioStep.editor,
      StudioStep.editor => StudioStep.review,
      StudioStep.review => null,
    };
    final caption = q == null
        ? null
        : [
            if (q.quantity > 1) '${q.quantity} × ${HooFormat.money(context, q.unitPrice)}',
            if (q.leadTimeMaxDays > 0) l.studioLeadTime(q.leadTimeMinDays, q.leadTimeMaxDays),
          ].join(' · ');
    return PriceSummaryBar(
      total: q?.total,
      updating: pricing.updating,
      caption: caption,
      accentCta: step == StudioStep.editor,
      ctaLabel: step == StudioStep.editor ? l.studioReview : l.commonNext,
      onCta: next == null ? null : () => context.read<StudioEditorBloc>().add(StudioStepChanged(next)),
      breakdown: [
        if (q != null) ...[
          for (final b in q.breakdown) PriceLine(label: b.label, detail: b.detail, amount: b.unitAmount),
          if (q.setupFee > 0) PriceLine(label: l.studioSetupFee, amount: q.setupFee),
          if (q.rushFee > 0) PriceLine(label: l.studioRushFee, amount: q.rushFee),
          if (q.volumeDiscount > 0) PriceLine(label: l.studioVolumeDiscount(q.volumeDiscountPercent.round()), amount: -q.volumeDiscount, signed: true),
        ],
      ],
    );
  }
}
