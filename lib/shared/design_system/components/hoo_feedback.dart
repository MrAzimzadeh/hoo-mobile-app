import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/error/api_exception.dart';
import '../../../l10n/l10n.dart';
import '../motion/hoo_motion.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_buttons.dart';
import 'hoo_icons.dart';

/// User-facing message for an error: the server's localized title when there is one, else a generic one.
/// (Branching happens on `ApiException.code`; this is only for display.)
String errorMessage(BuildContext context, Object error) {
  final l = context.l10n;
  if (error is ApiException) {
    if (error.isNetwork) return l.errorNetwork;
    if (error.isTooManyRequests) return l.errorTooManyRequests(error.retryAfter?.inSeconds ?? 60);
    final title = error.title;
    if (title != null && title.trim().isNotEmpty) return title;
    if (error.isExternal) return l.errorExternal;
    if (error.isConflict) return l.errorConflict;
    if (error.isNotFound) return l.errorNotFound;
  }
  return l.errorGeneric;
}

/// Centered icon + message + optional action.
class HooEmptyState extends StatelessWidget {
  const HooEmptyState({super.key, required this.title, this.message, this.icon, this.actionLabel, this.onAction, this.compact = false});

  final String title;
  final String? message;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: HooSpacing.xl, vertical: compact ? HooSpacing.lg : HooSpacing.xxl),
        child: HooReveal(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 40, color: c.textTertiary), const SizedBox(height: HooSpacing.md)],
              Text(title, textAlign: TextAlign.center, style: context.hoo.text.h3),
              if (message != null) ...[
                const SizedBox(height: HooSpacing.xs),
                Text(message!, textAlign: TextAlign.center, style: context.hoo.text.bodySecondary),
              ],
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: HooSpacing.lg),
                SecondaryButton(label: actionLabel!, onPressed: onAction, expand: false),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Error state with retry. Shows the server's localized message.
class HooErrorState extends StatelessWidget {
  const HooErrorState({super.key, required this.error, this.onRetry, this.compact = false});

  final Object error;
  final VoidCallback? onRetry;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final offline = error is ApiException && (error as ApiException).isNetwork;
    return HooEmptyState(
      icon: offline ? HooIcons.offline : HooIcons.warning,
      title: errorMessage(context, error),
      actionLabel: onRetry == null ? null : context.l10n.commonRetry,
      onAction: onRetry,
      compact: compact,
    );
  }
}

/// Shimmer block in surface.muted — compose skeletons from these.
class HooSkeleton extends StatelessWidget {
  const HooSkeleton({super.key, this.width, this.height = 16, this.radius = HooRadius.card, this.aspectRatio});

  final double? width;
  final double height;
  final double radius;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final box = Container(
      width: width,
      height: aspectRatio == null ? height : null,
      decoration: BoxDecoration(color: c.skeleton, borderRadius: BorderRadius.circular(radius)),
    );
    final child = aspectRatio == null ? box : AspectRatio(aspectRatio: aspectRatio!, child: box);
    if (context.hoo.reducedMotion) return child;
    return Shimmer.fromColors(baseColor: c.skeleton, highlightColor: c.surface, period: const Duration(milliseconds: 1400), child: child);
  }
}

/// Skeleton of a product card (grid/rails while loading).
class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HooSkeleton(aspectRatio: HooSize.productImageAspect),
            SizedBox(height: HooSpacing.sm),
            HooSkeleton(width: 120, height: 14, radius: 4),
            SizedBox(height: HooSpacing.xs),
            HooSkeleton(width: 64, height: 14, radius: 4),
          ],
        ),
      );
}

/// Full-screen loading (rare — prefer skeletons).
class HooLoading extends StatelessWidget {
  const HooLoading({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Semantics(label: context.l10n.stateLoading, child: SizedBox.square(dimension: 24, child: CircularProgressIndicator(strokeWidth: 2, color: context.hoo.colors.textPrimary))),
      );
}

enum HooAlertKind { info, warning, error, success }

/// Inline alert / banner (info, warning, error, success).
class InlineAlert extends StatelessWidget {
  const InlineAlert({super.key, required this.message, this.kind = HooAlertKind.info, this.title, this.action, this.onAction});

  final String message;
  final String? title;
  final HooAlertKind kind;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final (icon, fg, bg) = switch (kind) {
      HooAlertKind.info => (HooIcons.info, c.textPrimary, c.surface),
      HooAlertKind.warning => (HooIcons.warning, c.textPrimary, c.accentTint),
      HooAlertKind.error => (HooIcons.error, c.error, c.error.withValues(alpha: 0.08)),
      HooAlertKind.success => (HooIcons.checkCircle, c.accent, c.accentTint),
    };
    return Semantics(
      liveRegion: kind == HooAlertKind.error,
      child: Container(
        padding: const EdgeInsets.all(HooSpacing.md),
        decoration: BoxDecoration(color: bg, borderRadius: HooRadius.cardAll, border: Border.all(color: kind == HooAlertKind.error ? c.error.withValues(alpha: 0.4) : c.border)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: HooSize.iconSmall, color: fg),
            const SizedBox(width: HooSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) Text(title!, style: context.hoo.text.bodyStrong.copyWith(color: fg)),
                  Text(message, style: context.hoo.text.caption.copyWith(color: kind == HooAlertKind.error ? c.error : c.textPrimary)),
                  if (action != null && onAction != null) HooTextButton(label: action!, onPressed: onAction, style: HooType.caption.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Thin offline banner shown above cached, read-only content.
class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key, this.visible = true});
  final bool visible;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return AnimatedSize(
      duration: context.hoo.motion(HooDurations.normal),
      curve: HooCurves.standard,
      child: visible
          ? Container(
              width: double.infinity,
              color: c.primaryAction,
              padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.xs),
              child: Row(
                children: [
                  Icon(HooIcons.offline, size: 16, color: c.onPrimaryAction),
                  const SizedBox(width: HooSpacing.xs),
                  Expanded(child: Text(context.l10n.stateOffline, style: HooType.caption.copyWith(color: c.onPrimaryAction))),
                ],
              ),
            )
          : const SizedBox(width: double.infinity),
    );
  }
}

/// Toasts / snackbars.
abstract final class HooToast {
  static void show(BuildContext context, String message, {HooAlertKind kind = HooAlertKind.info, String? action, VoidCallback? onAction}) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    final c = context.hoo.colors;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            if (kind == HooAlertKind.error) ...[Icon(HooIcons.error, size: 18, color: c.onPrimaryAction), const SizedBox(width: HooSpacing.xs)],
            if (kind == HooAlertKind.success) ...[Icon(HooIcons.checkCircle, size: 18, color: c.onPrimaryAction), const SizedBox(width: HooSpacing.xs)],
            Expanded(child: Text(message)),
          ],
        ),
        action: action == null ? null : SnackBarAction(label: action, textColor: c.onPrimaryAction, onPressed: onAction ?? () {}),
        margin: const EdgeInsets.fromLTRB(HooSpacing.md, 0, HooSpacing.md, HooSpacing.md),
        duration: const Duration(seconds: 4),
      ));
  }

  static void error(BuildContext context, Object error) => show(context, errorMessage(context, error), kind: HooAlertKind.error);
  static void success(BuildContext context, String message) => show(context, message, kind: HooAlertKind.success);
}

/// Countdown text for 429 throttling (OTP resend, login).
class RetryCountdown extends StatefulWidget {
  const RetryCountdown({super.key, required this.until, required this.builder, this.onDone});

  final DateTime until;
  final Widget Function(BuildContext context, Duration remaining) builder;
  final VoidCallback? onDone;

  @override
  State<RetryCountdown> createState() => _RetryCountdownState();
}

class _RetryCountdownState extends State<RetryCountdown> {
  late Duration _left = _remaining();
  bool _done = false;

  Duration _remaining() {
    final d = widget.until.difference(DateTime.now());
    return d.isNegative ? Duration.zero : d;
  }

  @override
  void initState() {
    super.initState();
    _tick();
  }

  @override
  void didUpdateWidget(RetryCountdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.until != widget.until) {
      _done = false;
      _left = _remaining();
      _tick();
    }
  }

  Future<void> _tick() async {
    while (mounted && _left > Duration.zero) {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      setState(() => _left = _remaining());
    }
    if (mounted && !_done) {
      _done = true;
      widget.onDone?.call();
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _left);
}
