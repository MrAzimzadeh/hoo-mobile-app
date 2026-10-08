import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../motion/hoo_motion.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_buttons.dart';
import 'hoo_icons.dart';

/// h2 title + optional "See all →".
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onSeeAll, this.subtitle, this.padding = const EdgeInsets.symmetric(horizontal: HooSpacing.screen)});

  final String title;
  final String? subtitle;
  final VoidCallback? onSeeAll;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(header: true, child: Text(title, style: context.hoo.text.h2)),
                if (subtitle != null) ...[const SizedBox(height: HooSpacing.xxs), Text(subtitle!, style: context.hoo.text.caption)],
              ],
            ),
          ),
          if (onSeeAll != null) HooTextButton(label: context.l10n.commonSeeAll, trailingArrow: true, onPressed: onSeeAll, style: HooType.caption.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// Standard top bar: back button (when the route can pop), centered title, optional actions. No elevation.
class HooAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HooAppBar({super.key, this.title, this.actions, this.leading, this.showBack = true, this.titleWidget, this.bottom, this.backgroundColor});

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBack;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: leading ??
          (showBack && canPop
              ? HooIconButton(icon: HooIcons.back, semanticLabel: context.l10n.a11yBack, onPressed: () => Navigator.of(context).maybePop())
              : null),
      title: titleWidget ?? (title == null ? null : Text(title!, maxLines: 1, overflow: TextOverflow.ellipsis)),
      actions: [...?actions, const SizedBox(width: HooSpacing.xs)],
      bottom: bottom,
    );
  }
}

/// 1px-bordered surface card (borders over shadows).
class HooCard extends StatelessWidget {
  const HooCard({super.key, required this.child, this.padding = const EdgeInsets.all(HooSpacing.md), this.onTap, this.color});

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final box = Container(
      padding: padding,
      decoration: BoxDecoration(color: color ?? c.surface, borderRadius: HooRadius.cardAll, border: Border.all(color: c.border)),
      child: child,
    );
    return onTap == null ? box : HooPressable(onTap: onTap, scale: 0.985, child: box);
  }
}

/// Settings/profile row: icon, title, optional subtitle/trailing, chevron.
class HooListTile extends StatelessWidget {
  const HooListTile({super.key, required this.title, this.icon, this.subtitle, this.trailing, this.onTap, this.destructive = false, this.showChevron = true});

  final String title;
  final IconData? icon;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool destructive;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final color = destructive ? c.error : c.textPrimary;
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.sm),
          child: Row(
            children: [
              if (icon != null) ...[Icon(icon, color: color), const SizedBox(width: HooSpacing.md)],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.hoo.text.body.copyWith(color: color)),
                    if (subtitle != null) Text(subtitle!, style: context.hoo.text.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              ?trailing,
              if (showChevron && onTap != null) ...[const SizedBox(width: HooSpacing.xs), Icon(HooIcons.chevronRight, size: 18, color: c.textTertiary)],
            ],
          ),
        ),
      ),
    );
  }
}

/// Centers content and caps its width on tablets.
class HooConstrained extends StatelessWidget {
  const HooConstrained({super.key, required this.child, this.maxWidth = HooSize.maxContentWidth});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) => Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: maxWidth), child: child));
}

/// Responsive product grid column count: 2 on phones, 3–4 on tablets.
int productGridColumns(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  if (w >= 1000) return 4;
  if (w >= 600) return 3;
  return 2;
}

/// Thin progress bar with green fill + "Step 2 of 5".
class HooStepper extends StatelessWidget {
  const HooStepper({super.key, required this.current, required this.total, this.title});

  /// 1-based.
  final int current;
  final int total;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(context.l10n.stepOf(current, total).toUpperCase(), style: context.hoo.text.labelSecondary),
            if (title != null) ...[
              const SizedBox(width: HooSpacing.xs),
              Expanded(child: Text(title!, style: context.hoo.text.label, maxLines: 1, overflow: TextOverflow.ellipsis)),
            ],
          ],
        ),
        const SizedBox(height: HooSpacing.xs),
        ClipRRect(
          borderRadius: HooRadius.pillAll,
          child: SizedBox(
            height: 3,
            child: Stack(
              children: [
                Positioned.fill(child: ColoredBox(color: c.border)),
                TweenAnimationBuilder<double>(
                  tween: Tween(end: total == 0 ? 0 : current / total),
                  duration: context.hoo.motion(HooDurations.medium),
                  curve: HooCurves.emphasized,
                  builder: (_, v, _) => FractionallySizedBox(widthFactor: v.clamp(0, 1), child: ColoredBox(color: c.accent)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Expandable section (description · size & fit · fabric & care).
class HooAccordion extends StatefulWidget {
  const HooAccordion({super.key, required this.title, required this.child, this.initiallyExpanded = false});

  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<HooAccordion> createState() => _HooAccordionState();
}

class _HooAccordionState extends State<HooAccordion> {
  late bool _open = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return DecoratedBox(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
      child: Column(
        children: [
          Semantics(
            button: true,
            expanded: _open,
            child: InkWell(
              onTap: () => setState(() => _open = !_open),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 56),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.title, style: context.hoo.text.bodyStrong)),
                    AnimatedRotation(
                      turns: _open ? 0.5 : 0,
                      duration: context.hoo.motion(HooDurations.normal),
                      curve: HooCurves.standard,
                      child: Icon(HooIcons.chevronDown, size: 18, color: c.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: context.hoo.motion(HooDurations.normal),
            curve: HooCurves.standard,
            alignment: Alignment.topCenter,
            child: _open
                ? Padding(padding: const EdgeInsets.only(bottom: HooSpacing.md), child: Align(alignment: Alignment.centerLeft, child: widget.child))
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

/// A timeline entry for [StatusTimeline].
class TimelineEntry {
  const TimelineEntry({required this.label, this.timestamp, this.note, this.highlighted = false, this.isError = false});

  final String label;
  final String? timestamp;
  final String? note;
  final bool highlighted;
  final bool isError;
}

/// Vertical order/status timeline: dot + label + timestamp. Most recent first is up to the caller.
class StatusTimeline extends StatelessWidget {
  const StatusTimeline({super.key, required this.entries});

  final List<TimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Column(
      children: [
        for (var i = 0; i < entries.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 24,
                  child: Column(
                    children: [
                      const SizedBox(height: 4),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: entries[i].isError ? c.error : entries[i].highlighted ? c.accent : c.background,
                          border: Border.all(color: entries[i].isError ? c.error : entries[i].highlighted ? c.accent : c.textTertiary, width: 1.5),
                        ),
                      ),
                      if (i < entries.length - 1) Expanded(child: Container(width: 1, color: c.border)),
                    ],
                  ),
                ),
                const SizedBox(width: HooSpacing.sm),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: HooSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(entries[i].label, style: entries[i].highlighted ? context.hoo.text.bodyStrong : context.hoo.text.body),
                        if (entries[i].note != null && entries[i].note!.isNotEmpty) Text(entries[i].note!, style: context.hoo.text.caption),
                        if (entries[i].timestamp != null) Text(entries[i].timestamp!, style: context.hoo.text.caption.copyWith(color: c.textTertiary)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Key/value row for summaries ("Subtotal ……… 120,00 ₼").
class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key, required this.label, required this.value, this.strong = false, this.valueColor, this.caption = false});

  final String label;
  final String value;
  final bool strong;
  final bool caption;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final t = context.hoo.text;
    final style = strong ? t.bodyStrong : caption ? t.caption : t.body;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: HooSpacing.xxs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(label, style: caption ? t.caption : (strong ? t.bodyStrong : t.bodySecondary))),
          const SizedBox(width: HooSpacing.md),
          Text(value, style: valueColor == null ? style : style.copyWith(color: valueColor)),
        ],
      ),
    );
  }
}
