import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../motion/hoo_motion.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_icons.dart';
import 'hoo_product_card.dart' show parseHex;

/// 32px color circle. Selected → 2px green ring with a 2px gap; unavailable → diagonal strike.
/// Announces the color name for screen readers.
class HooColorSwatch extends StatelessWidget {
  const HooColorSwatch({super.key, required this.hex, required this.name, this.selected = false, this.available = true, this.onTap, this.size = HooSize.swatch});

  final String hex;
  final String name;
  final bool selected;
  final bool available;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    const ring = HooSize.selectedRing;
    const gap = 2.0;
    return Semantics(
      button: true,
      selected: selected,
      enabled: available,
      label: [l.a11yColor(name), if (selected) l.a11ySelected, if (!available) l.a11yUnavailable].join(', '),
      excludeSemantics: true,
      child: HooPressable(
        onTap: onTap,
        scale: 0.92,
        child: SizedBox.square(
          dimension: HooSize.touchTarget,
          child: Center(
            child: AnimatedContainer(
              duration: context.hoo.motion(HooDurations.fast),
              curve: HooCurves.standard,
              width: size + (ring + gap) * 2,
              height: size + (ring + gap) * 2,
              padding: const EdgeInsets.all(gap),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? c.accent : Colors.transparent, width: ring),
              ),
              child: CustomPaint(
                foregroundPainter: available ? null : _StrikePainter(c.textSecondary),
                child: Container(
                  decoration: BoxDecoration(
                    color: parseHex(hex),
                    shape: BoxShape.circle,
                    border: Border.all(color: c.border, width: HooSize.borderWidth),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StrikePainter extends CustomPainter {
  _StrikePainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(size.width * 0.15, size.height * 0.85), Offset(size.width * 0.85, size.height * 0.15), Paint()
      ..color = color
      ..strokeWidth = 1.5);
  }

  @override
  bool shouldRepaint(_StrikePainter old) => old.color != color;
}

enum OptionChipStyle {
  /// Selected → black background, white text (sizes).
  primary,

  /// Selected → green tint background (secondary options: filters, fits, features).
  tint,
}

/// Pill chip with label style. Out of stock → tertiary text with a strike, still tappable ("Notify me").
class OptionChip extends StatelessWidget {
  const OptionChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.unavailable = false,
    this.style = OptionChipStyle.primary,
    this.trailing,
    this.leading,
    this.uppercase = true,
    this.minWidth = 56,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final bool unavailable;
  final OptionChipStyle style;

  /// Small secondary text, e.g. a surcharge "+5 ₼".
  final String? trailing;
  final Widget? leading;
  final bool uppercase;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final primarySelected = selected && style == OptionChipStyle.primary;
    final bg = primarySelected ? c.primaryAction : selected ? c.accentTint : c.background;
    final fg = primarySelected ? c.onPrimaryAction : unavailable ? c.textTertiary : c.textPrimary;
    final border = selected ? (primarySelected ? c.primaryAction : c.accent) : c.border;
    final text = uppercase ? label.toUpperCase() : label;
    return Semantics(
      button: true,
      selected: selected,
      label: [label, ?trailing, if (selected) l.a11ySelected, if (unavailable) l.a11yUnavailable].join(', '),
      excludeSemantics: true,
      child: HooPressable(
        onTap: onTap == null
            ? null
            : () {
                HooHaptics.selection();
                onTap!();
              },
        scale: 0.96,
        child: AnimatedContainer(
          duration: context.hoo.motion(HooDurations.fast),
          curve: HooCurves.standard,
          constraints: BoxConstraints(minHeight: 40, minWidth: minWidth),
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.md, vertical: HooSpacing.xs),
          decoration: BoxDecoration(color: bg, borderRadius: HooRadius.pillAll, border: Border.all(color: border, width: HooSize.borderWidth)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: HooSpacing.xs)],
              Flexible(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: (uppercase ? HooType.label : HooType.caption.copyWith(fontWeight: FontWeight.w600)).copyWith(
                    color: fg,
                    decoration: unavailable ? TextDecoration.lineThrough : null,
                    decorationColor: fg,
                  ),
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: HooSpacing.xs),
                Text(trailing!, style: HooType.caption.copyWith(color: primarySelected ? c.onPrimaryAction.withValues(alpha: 0.7) : c.textSecondary, fontSize: 12)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Selectable card (fabric, base product, delivery zone, payment method): 1px border, green when selected.
class SelectableCard extends StatelessWidget {
  const SelectableCard({super.key, required this.child, this.selected = false, this.onTap, this.enabled = true, this.padding = const EdgeInsets.all(HooSpacing.md)});

  final Widget child;
  final bool selected;
  final VoidCallback? onTap;
  final bool enabled;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Semantics(
      selected: selected,
      enabled: enabled,
      button: onTap != null,
      child: HooPressable(
        onTap: enabled ? onTap : null,
        scale: 0.985,
        child: AnimatedContainer(
          duration: context.hoo.motion(HooDurations.fast),
          padding: padding,
          decoration: BoxDecoration(
            color: selected ? c.accentTint : c.surface,
            borderRadius: HooRadius.cardAll,
            border: Border.all(color: selected ? c.accent : c.border, width: selected ? HooSize.selectedRing : HooSize.borderWidth),
          ),
          child: Opacity(opacity: enabled ? 1 : 0.5, child: child),
        ),
      ),
    );
  }
}

/// − value + with min 1 and a max (stock or `maxQuantity`).
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({super.key, required this.value, required this.onChanged, this.min = 1, this.max = 99, this.compact = false, this.enabled = true});

  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final bool compact;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final h = compact ? 36.0 : 44.0;
    Widget button(IconData icon, String label, int next, bool on) => Semantics(
          button: true,
          enabled: on,
          label: label,
          excludeSemantics: true,
          child: HooPressable(
            onTap: on ? () => onChanged(next) : null,
            child: SizedBox(width: h, height: h, child: Icon(icon, size: 18, color: on ? c.textPrimary : c.textTertiary)),
          ),
        );
    return Container(
      height: h,
      decoration: BoxDecoration(borderRadius: HooRadius.pillAll, border: Border.all(color: c.border)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          button(HooIcons.minus, l.a11yDecrease, value - 1, enabled && value > min),
          Semantics(
            label: l.a11yQuantity(value),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 28),
              child: AnimatedSwitcher(
                duration: context.hoo.motion(HooDurations.fast),
                child: Text('$value', key: ValueKey(value), textAlign: TextAlign.center, style: context.hoo.text.bodyStrong),
              ),
            ),
          ),
          button(HooIcons.plus, l.a11yIncrease, value + 1, enabled && value < max),
        ],
      ),
    );
  }
}

/// Read-only star rating (supports halves).
class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating, this.size = 14, this.count});

  final double rating;
  final double size;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Semantics(
      label: context.l10n.a11yRating(rating.toStringAsFixed(1)),
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 1; i <= 5; i++)
            Icon(
              rating >= i ? HooIcons.starFilled : rating >= i - 0.5 ? HooIcons.starHalf : HooIcons.star,
              size: size,
              color: c.textPrimary,
            ),
          if (count != null) ...[const SizedBox(width: HooSpacing.xxs), Text('($count)', style: context.hoo.text.caption)],
        ],
      ),
    );
  }
}

/// Tappable 1–5 star input (write a review).
class RatingInput extends StatelessWidget {
  const RatingInput({super.key, required this.value, required this.onChanged, this.size = 32});

  final int value;
  final ValueChanged<int> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= 5; i++)
          Semantics(
            button: true,
            selected: value == i,
            label: context.l10n.a11yRating('$i'),
            excludeSemantics: true,
            child: HooPressable(
              onTap: () {
                HooHaptics.selection();
                onChanged(i);
              },
              scale: 0.85,
              child: SizedBox.square(
                dimension: HooSize.touchTarget,
                child: Icon(value >= i ? HooIcons.starFilled : HooIcons.star, size: size, color: value >= i ? c.accent : c.textTertiary),
              ),
            ),
          ),
      ],
    );
  }
}
