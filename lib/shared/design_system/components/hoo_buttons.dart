import 'package:flutter/material.dart';

import '../motion/hoo_motion.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';

enum HooButtonVariant {
  /// Black (white in dark mode) — the default primary action.
  primary,

  /// Brand green — key CTAs ("Design Your Own", "Checkout"). At most one per screen.
  accent,
}

/// Full-width 52px primary button with loading and disabled states. Labels may wrap to two lines for long
/// Russian/Turkish strings instead of overflowing.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = HooButtonVariant.primary,
    this.loading = false,
    this.icon,
    this.expand = true,
    this.semanticLabel,
  });

  /// Brand-green variant.
  const PrimaryButton.accent({super.key, required this.label, this.onPressed, this.loading = false, this.icon, this.expand = true, this.semanticLabel})
      : variant = HooButtonVariant.accent;

  final String label;
  final VoidCallback? onPressed;
  final HooButtonVariant variant;
  final bool loading;
  final IconData? icon;
  final bool expand;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final enabled = onPressed != null && !loading;
    final bg = variant == HooButtonVariant.accent ? c.accent : c.primaryAction;
    final fg = variant == HooButtonVariant.accent ? c.onAccent : c.onPrimaryAction;
    return _ButtonFrame(
      label: label,
      semanticLabel: semanticLabel,
      enabled: enabled,
      expand: expand,
      onPressed: onPressed,
      loading: loading,
      decoration: BoxDecoration(color: enabled || loading ? bg : c.border, borderRadius: HooRadius.buttonAll),
      foreground: enabled || loading ? fg : c.textTertiary,
      icon: icon,
    );
  }
}

/// Outlined 1px button with transparent background.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.label, this.onPressed, this.loading = false, this.icon, this.expand = true, this.semanticLabel});

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final IconData? icon;
  final bool expand;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final enabled = onPressed != null && !loading;
    return _ButtonFrame(
      label: label,
      semanticLabel: semanticLabel,
      enabled: enabled,
      expand: expand,
      onPressed: onPressed,
      loading: loading,
      decoration: BoxDecoration(
        borderRadius: HooRadius.buttonAll,
        border: Border.all(color: enabled ? c.textPrimary : c.border, width: HooSize.borderWidth),
      ),
      foreground: enabled || loading ? c.textPrimary : c.textTertiary,
      icon: icon,
    );
  }
}

class _ButtonFrame extends StatelessWidget {
  const _ButtonFrame({
    required this.label,
    required this.enabled,
    required this.expand,
    required this.onPressed,
    required this.loading,
    required this.decoration,
    required this.foreground,
    this.icon,
    this.semanticLabel,
  });

  final String label;
  final bool enabled;
  final bool expand;
  final VoidCallback? onPressed;
  final bool loading;
  final BoxDecoration decoration;
  final Color foreground;
  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final style = HooType.bodyStrong.copyWith(color: foreground);
    final content = AnimatedSwitcher(
      duration: context.hoo.motion(HooDurations.fast),
      child: loading
          ? SizedBox.square(key: const ValueKey('loading'), dimension: 20, child: CircularProgressIndicator(strokeWidth: 2, color: foreground))
          : Row(
              key: const ValueKey('label'),
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[Icon(icon, size: HooSize.iconSmall, color: foreground), const SizedBox(width: HooSpacing.xs)],
                Flexible(child: Text(label, style: style, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis)),
              ],
            ),
    );
    return Semantics(
      button: true,
      enabled: enabled,
      label: semanticLabel ?? label,
      excludeSemantics: true,
      child: HooPressable(
        onTap: enabled ? onPressed : null,
        child: AnimatedContainer(
          duration: context.hoo.motion(HooDurations.normal),
          curve: HooCurves.standard,
          constraints: const BoxConstraints(minHeight: HooSize.buttonHeight),
          width: expand ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.lg, vertical: HooSpacing.xs),
          alignment: Alignment.center,
          decoration: decoration,
          child: content,
        ),
      ),
    );
  }
}

/// Text button / link: underlines while pressed.
class HooTextButton extends StatefulWidget {
  const HooTextButton({super.key, required this.label, this.onPressed, this.color, this.style, this.trailingArrow = false});

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final TextStyle? style;
  final bool trailingArrow;

  @override
  State<HooTextButton> createState() => _HooTextButtonState();
}

class _HooTextButtonState extends State<HooTextButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final color = widget.onPressed == null ? c.textTertiary : (widget.color ?? c.textPrimary);
    final base = (widget.style ?? HooType.bodyStrong).copyWith(color: color);
    return Semantics(
      button: true,
      enabled: widget.onPressed != null,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _down = true),
        onTapUp: (_) => setState(() => _down = false),
        onTapCancel: () => setState(() => _down = false),
        onTap: widget.onPressed,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: HooSize.touchTarget),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  widget.label + (widget.trailingArrow ? ' →' : ''),
                  style: base.copyWith(decoration: _down ? TextDecoration.underline : TextDecoration.none, decorationColor: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 48×48 icon button with a semantic label (required — icons must be announced).
class HooIconButton extends StatelessWidget {
  const HooIconButton({super.key, required this.icon, required this.semanticLabel, this.onPressed, this.color, this.size = HooSize.icon, this.badge});

  final IconData icon;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final Color? color;
  final double size;

  /// Optional count badge (bag).
  final int? badge;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Semantics(
      button: true,
      label: semanticLabel,
      excludeSemantics: true,
      child: HooPressable(
        onTap: onPressed,
        scale: 0.9,
        child: SizedBox.square(
          dimension: HooSize.touchTarget,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Icon(icon, size: size, color: color ?? c.textPrimary),
              if (badge != null && badge! > 0)
                Positioned(top: 8, right: 6, child: CountBadge(count: badge!)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small green count badge.
class CountBadge extends StatelessWidget {
  const CountBadge({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return AnimatedSwitcher(
      duration: context.hoo.motion(HooDurations.normal),
      transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
      child: Container(
        key: ValueKey(count),
        constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: c.accent, borderRadius: HooRadius.pillAll),
        child: Text(count > 99 ? '99+' : '$count', textScaler: TextScaler.noScaling, style: HooType.label.copyWith(color: c.onAccent, fontSize: 10, height: 1.2, letterSpacing: 0)),
      ),
    );
  }
}
