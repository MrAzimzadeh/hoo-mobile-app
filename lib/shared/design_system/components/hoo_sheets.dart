import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../l10n/l10n.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_buttons.dart';
import 'hoo_icons.dart';

/// Bottom sheet chrome: 20px top radius, 36×4 grey drag handle, floating shadow.
class HooSheetFrame extends StatelessWidget {
  const HooSheetFrame({super.key, required this.child, this.title, this.padding = const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.lg), this.trailing});

  final Widget child;
  final String? title;
  final Widget? trailing;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final bottom = MediaQuery.viewInsetsOf(context).bottom + MediaQuery.paddingOf(context).bottom;
    return Container(
      decoration: BoxDecoration(color: c.background, borderRadius: HooRadius.sheetTop, boxShadow: HooElevation.floating(c.shadow)),
      padding: EdgeInsets.only(bottom: bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: HooSpacing.xs),
          Center(
            child: Container(
              width: HooSize.sheetHandleWidth,
              height: HooSize.sheetHandleHeight,
              decoration: BoxDecoration(color: c.border, borderRadius: HooRadius.pillAll),
            ),
          ),
          if (title != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.xs, HooSpacing.xs),
              child: Row(
                children: [
                  Expanded(child: Semantics(header: true, child: Text(title!, style: context.hoo.text.h2))),
                  trailing ?? HooIconButton(icon: HooIcons.close, semanticLabel: context.l10n.a11yClose, onPressed: () => Navigator.of(context).maybePop()),
                ],
              ),
            )
          else
            const SizedBox(height: HooSpacing.md),
          Flexible(child: Padding(padding: padding, child: child)),
        ],
      ),
    );
  }
}

/// Shows a HOO bottom sheet with the controlled slide/fade and sheet radius.
Future<T?> showHooSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  String? title,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  EdgeInsets? padding,
  double maxHeightFactor = 0.9,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    backgroundColor: Colors.transparent,
    elevation: 0,
    sheetAnimationStyle: AnimationStyle(
      duration: context.hoo.motion(HooDurations.medium),
      reverseDuration: context.hoo.motion(HooDurations.normal),
      curve: HooCurves.emphasized,
      reverseCurve: HooCurves.exit,
    ),
    constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * maxHeightFactor, maxWidth: HooSize.maxContentWidth),
    builder: (ctx) => HooSheetFrame(
      title: title,
      padding: padding ?? const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.lg),
      child: builder(ctx),
    ),
  );
}

/// Confirmation dialog (destructive actions).
Future<bool> showHooConfirm(BuildContext context, {required String title, String? message, required String confirmLabel, bool destructive = false}) async {
  final l = context.l10n;
  final r = await showHooSheet<bool>(
    context,
    title: title,
    builder: (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (message != null) ...[Text(message, style: ctx.hoo.text.bodySecondary), const SizedBox(height: HooSpacing.lg)],
        PrimaryButton(label: confirmLabel, onPressed: () => Navigator.of(ctx).pop(true)),
        const SizedBox(height: HooSpacing.sm),
        SecondaryButton(label: l.commonCancel, onPressed: () => Navigator.of(ctx).pop(false)),
      ],
    ),
  );
  return r ?? false;
}

/// One row of the expandable price breakdown.
class PriceLine {
  const PriceLine({required this.label, required this.amount, this.detail, this.signed = false, this.emphasize = false});

  final String label;
  final String? detail;
  final double amount;

  /// Show as ±amount (discounts, surcharges).
  final bool signed;
  final bool emphasize;
}

/// Sticky bottom bar: server total on the left (tap to expand the breakdown), CTA on the right.
/// [updating] shows a subtle in-flight state while the server recalculates.
class PriceSummaryBar extends StatefulWidget {
  const PriceSummaryBar({
    super.key,
    required this.total,
    required this.ctaLabel,
    this.onCta,
    this.ctaLoading = false,
    this.caption,
    this.breakdown = const [],
    this.updating = false,
    this.accentCta = true,
    this.totalLabel,
  });

  final double? total;
  final String ctaLabel;
  final VoidCallback? onCta;
  final bool ctaLoading;
  final String? caption;
  final String? totalLabel;
  final List<PriceLine> breakdown;
  final bool updating;
  final bool accentCta;

  @override
  State<PriceSummaryBar> createState() => _PriceSummaryBarState();
}

class _PriceSummaryBarState extends State<PriceSummaryBar> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final canExpand = widget.breakdown.isNotEmpty;
    return Container(
      decoration: BoxDecoration(color: c.background, border: Border(top: BorderSide(color: c.border))),
      padding: EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.sm + MediaQuery.paddingOf(context).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            duration: context.hoo.motion(HooDurations.normal),
            curve: HooCurves.standard,
            alignment: Alignment.bottomCenter,
            child: _open && canExpand
                ? Padding(
                    padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                    child: Column(
                      children: [
                        for (final line in widget.breakdown)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(children: [
                                      TextSpan(text: line.label, style: line.emphasize ? context.hoo.text.captionPrimary.copyWith(fontWeight: FontWeight.w600) : context.hoo.text.captionPrimary),
                                      if (line.detail != null) TextSpan(text: ' · ${line.detail}', style: context.hoo.text.caption),
                                    ]),
                                  ),
                                ),
                                Text(
                                  line.signed ? HooFormat.signedMoney(context, line.amount) : HooFormat.money(context, line.amount),
                                  style: context.hoo.text.captionPrimary.copyWith(color: line.amount < 0 ? c.accent : null),
                                ),
                              ],
                            ),
                          ),
                        Divider(color: c.border, height: HooSpacing.md),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
          Row(
            children: [
              Expanded(
                child: Semantics(
                  button: canExpand,
                  expanded: canExpand ? _open : null,
                  label: canExpand ? l.summaryShowBreakdown : null,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: canExpand ? () => setState(() => _open = !_open) : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text((widget.totalLabel ?? l.summaryTotal).toUpperCase(), style: context.hoo.text.labelSecondary),
                            if (canExpand) ...[
                              const SizedBox(width: HooSpacing.xxs),
                              AnimatedRotation(
                                turns: _open ? 0.5 : 0,
                                duration: context.hoo.motion(HooDurations.normal),
                                child: Icon(HooIcons.chevronUp, size: 14, color: c.textSecondary),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 2),
                        AnimatedOpacity(
                          opacity: widget.updating ? 0.45 : 1,
                          duration: context.hoo.motion(HooDurations.fast),
                          child: widget.total == null
                              ? Text('—', style: context.hoo.text.h2)
                              : AnimatedMoney(amount: widget.total!, style: context.hoo.text.h2),
                        ),
                        if (widget.caption != null) Text(widget.caption!, style: context.hoo.text.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: HooSpacing.md),
              Flexible(
                child: widget.accentCta
                    ? PrimaryButton.accent(label: widget.ctaLabel, onPressed: widget.onCta, loading: widget.ctaLoading)
                    : PrimaryButton(label: widget.ctaLabel, onPressed: widget.onCta, loading: widget.ctaLoading),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Money text that tweens between server values (it never computes a price — it animates the display only).
class AnimatedMoney extends StatelessWidget {
  const AnimatedMoney({super.key, required this.amount, this.style});

  final double amount;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: amount),
      duration: context.hoo.motion(HooDurations.medium),
      curve: HooCurves.standard,
      builder: (context, v, _) => Text(HooFormat.money(context, v), style: style, semanticsLabel: HooFormat.money(context, amount)),
    );
  }
}
