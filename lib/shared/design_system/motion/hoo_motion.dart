import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';

/// HOO Motion Design System — reusable transitions and brand animations.
///
/// Level A (cinematic): [HooImageReveal], [HooTextReveal], [HooSuccessCheck], route reveals.
/// Level B (micro): [HooReveal] for staggered content, [HooRouteTransitions.sheet].
/// Level C (invisible): [HooPressable] press feedback.
/// Every animation collapses to a static end state when the OS asks for reduced motion.

/// Fade + small upward slide, delayed by `index × HooDurations.stagger`. Plays once when first built —
/// slivers and lazy lists build children just before they scroll into view, which gives a scroll reveal for free.
class HooReveal extends StatefulWidget {
  const HooReveal({
    super.key,
    required this.child,
    this.index = 0,
    this.delay = Duration.zero,
    this.duration = HooDurations.medium,
    this.offset = 16,
    this.curve = HooCurves.enter,
  });

  final Widget child;
  final int index;
  final Duration delay;
  final Duration duration;
  final double offset;
  final Curve curve;

  @override
  State<HooReveal> createState() => _HooRevealState();
}

class _HooRevealState extends State<HooReveal> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: widget.duration);
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (context.hoo.reducedMotion) {
      _c.value = 1;
      return;
    }
    final wait = widget.delay + HooDurations.stagger * widget.index;
    if (wait == Duration.zero) {
      _c.forward();
    } else {
      Future<void>.delayed(wait, () {
        if (mounted) _c.forward();
      });
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = CurvedAnimation(parent: _c, curve: widget.curve);
    return AnimatedBuilder(
      animation: a,
      builder: (context, child) => Opacity(
        opacity: a.value,
        child: Transform.translate(offset: Offset(0, widget.offset * (1 - a.value)), child: child),
      ),
      child: widget.child,
    );
  }
}

/// Headline reveal: the text rises from behind a clip line (editorial typography reveal).
class HooTextReveal extends StatefulWidget {
  const HooTextReveal({super.key, required this.child, this.delay = Duration.zero, this.duration = HooDurations.slow});

  final Widget child;
  final Duration delay;
  final Duration duration;

  @override
  State<HooTextReveal> createState() => _HooTextRevealState();
}

class _HooTextRevealState extends State<HooTextReveal> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: widget.duration);
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (context.hoo.reducedMotion) {
      _c.value = 1;
    } else {
      Future<void>.delayed(widget.delay, () {
        if (mounted) _c.forward();
      });
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = CurvedAnimation(parent: _c, curve: HooCurves.emphasized);
    return ClipRect(
      child: AnimatedBuilder(
        animation: a,
        builder: (context, child) => FractionalTranslation(
          translation: Offset(0, 1 - a.value),
          child: Opacity(opacity: math.min(1, a.value * 1.6), child: child),
        ),
        child: widget.child,
      ),
    );
  }
}

/// Image entrance: scale 1.05 → 1.00 with opacity (onboarding, hero, gallery).
class HooImageReveal extends StatefulWidget {
  const HooImageReveal({super.key, required this.child, this.delay = Duration.zero, this.duration = HooDurations.slow, this.fromScale = 1.05});

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double fromScale;

  @override
  State<HooImageReveal> createState() => _HooImageRevealState();
}

class _HooImageRevealState extends State<HooImageReveal> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: widget.duration);
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (context.hoo.reducedMotion) {
      _c.value = 1;
    } else {
      Future<void>.delayed(widget.delay, () {
        if (mounted) _c.forward();
      });
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = CurvedAnimation(parent: _c, curve: HooCurves.standard);
    return AnimatedBuilder(
      animation: a,
      builder: (context, child) => Opacity(
        opacity: a.value,
        child: Transform.scale(scale: widget.fromScale + (1 - widget.fromScale) * a.value, child: child),
      ),
      child: widget.child,
    );
  }
}

/// Level C press feedback: a barely-there scale-down while pressed. Wraps any tappable.
class HooPressable extends StatefulWidget {
  const HooPressable({super.key, required this.child, this.onTap, this.onLongPress, this.scale = 0.97, this.semanticLabel, this.enabled = true});

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double scale;
  final String? semanticLabel;
  final bool enabled;

  @override
  State<HooPressable> createState() => _HooPressableState();
}

class _HooPressableState extends State<HooPressable> {
  bool _down = false;

  void _set(bool v) {
    if (_down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.enabled && (widget.onTap != null || widget.onLongPress != null);
    return Semantics(
      button: active,
      label: widget.semanticLabel,
      enabled: active,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: active ? (_) => _set(true) : null,
        onTapUp: active ? (_) => _set(false) : null,
        onTapCancel: active ? () => _set(false) : null,
        onTap: active ? widget.onTap : null,
        onLongPress: active ? widget.onLongPress : null,
        child: AnimatedScale(
          scale: _down ? widget.scale : 1,
          duration: context.hoo.motion(HooDurations.fast),
          curve: HooCurves.standard,
          child: widget.child,
        ),
      ),
    );
  }
}

/// Animated success check (confirmation screen). Draws a circle, then the tick.
class HooSuccessCheck extends StatefulWidget {
  const HooSuccessCheck({super.key, this.size = 88, this.delay = Duration.zero, this.onCompleted});

  final double size;
  final Duration delay;
  final VoidCallback? onCompleted;

  @override
  State<HooSuccessCheck> createState() => _HooSuccessCheckState();
}

class _HooSuccessCheckState extends State<HooSuccessCheck> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: HooDurations.cinematic);
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (context.hoo.reducedMotion) {
      _c.value = 1;
      widget.onCompleted?.call();
      return;
    }
    Future<void>.delayed(widget.delay, () async {
      if (!mounted) return;
      await _c.forward();
      widget.onCompleted?.call();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return SizedBox.square(
      dimension: widget.size,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) => CustomPaint(painter: _CheckPainter(progress: HooCurves.cinematic.transform(_c.value), color: colors.accent, onColor: colors.onAccent)),
      ),
    );
  }
}

class _CheckPainter extends CustomPainter {
  _CheckPainter({required this.progress, required this.color, required this.onColor});
  final double progress;
  final Color color;
  final Color onColor;

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2;
    final center = Offset(r, r);
    final fill = (progress / 0.55).clamp(0.0, 1.0);
    canvas.drawCircle(center, r * (0.6 + 0.4 * Curves.easeOut.transform(fill)), Paint()..color = color.withValues(alpha: fill));
    final t = ((progress - 0.45) / 0.55).clamp(0.0, 1.0);
    if (t <= 0) return;
    final path = Path()
      ..moveTo(size.width * 0.29, size.height * 0.52)
      ..lineTo(size.width * 0.44, size.height * 0.66)
      ..lineTo(size.width * 0.72, size.height * 0.37);
    final metric = path.computeMetrics().first;
    canvas.drawPath(
      metric.extractPath(0, metric.length * t),
      Paint()
        ..color = onColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.065
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(_CheckPainter old) => old.progress != progress;
}

/// Page/route transitions for auto_route `CustomRoute(transitionsBuilder: …)`.
abstract final class HooRouteTransitions {
  /// Fade-through: outgoing content fades, incoming fades in with a slight scale settle.
  static Widget fadeThrough(BuildContext context, Animation<double> animation, Animation<double> secondary, Widget child) {
    if (context.hoo.reducedMotion) return child;
    final a = CurvedAnimation(parent: animation, curve: HooCurves.standard);
    return FadeTransition(
      opacity: a,
      child: ScaleTransition(scale: Tween(begin: 0.985, end: 1.0).animate(a), child: child),
    );
  }

  /// Modal sheet-like page: slides up from the bottom with fade.
  static Widget sheet(BuildContext context, Animation<double> animation, Animation<double> secondary, Widget child) {
    if (context.hoo.reducedMotion) return child;
    final a = CurvedAnimation(parent: animation, curve: HooCurves.emphasized, reverseCurve: HooCurves.exit);
    return SlideTransition(
      position: Tween(begin: const Offset(0, 0.08), end: Offset.zero).animate(a),
      child: FadeTransition(opacity: a, child: child),
    );
  }

  /// Brand reveal: the next screen is exposed by an expanding circular mask (splash exit, studio entry).
  static Widget reveal(BuildContext context, Animation<double> animation, Animation<double> secondary, Widget child) {
    if (context.hoo.reducedMotion) return FadeTransition(opacity: animation, child: child);
    final a = CurvedAnimation(parent: animation, curve: HooCurves.cinematic);
    return AnimatedBuilder(
      animation: a,
      builder: (context, c) => ClipPath(clipper: _CircleRevealClipper(a.value), child: c),
      child: child,
    );
  }
}

class _CircleRevealClipper extends CustomClipper<Path> {
  _CircleRevealClipper(this.t);
  final double t;

  @override
  Path getClip(Size size) {
    final radius = math.sqrt(size.width * size.width + size.height * size.height) / 2 * t;
    return Path()..addOval(Rect.fromCircle(center: size.center(Offset.zero), radius: radius));
  }

  @override
  bool shouldReclip(_CircleRevealClipper old) => old.t != t;
}

/// Haptics policy (13.11): light impact for meaningful actions, success once for a placed order. Never on every tap.
abstract final class HooHaptics {
  static Future<void> light() => HapticFeedback.lightImpact();
  static Future<void> selection() => HapticFeedback.selectionClick();
  static Future<void> success() async {
    await HapticFeedback.mediumImpact();
    await Future<void>.delayed(const Duration(milliseconds: 90));
    await HapticFeedback.lightImpact();
  }
}
