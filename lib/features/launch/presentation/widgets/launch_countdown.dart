import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';

/// Days · hours · minutes · seconds until [launchAt]. Calls [onReached] once when it hits zero (the page then
/// re-checks the store mode).
class LaunchCountdown extends StatefulWidget {
  const LaunchCountdown({super.key, required this.launchAt, this.onReached, this.now = DateTime.now});

  final DateTime launchAt;
  final VoidCallback? onReached;

  /// Injectable clock for tests.
  final DateTime Function() now;

  @override
  State<LaunchCountdown> createState() => _LaunchCountdownState();
}

class _LaunchCountdownState extends State<LaunchCountdown> {
  static const _tick = Duration(seconds: 1);
  Timer? _timer;
  late Duration _left = _remaining();
  bool _reached = false;

  Duration _remaining() {
    final d = widget.launchAt.difference(widget.now());
    return d.isNegative ? Duration.zero : d;
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_tick, (_) => _update());
    if (_left == Duration.zero) WidgetsBinding.instance.addPostFrameCallback((_) => _update());
  }

  @override
  void didUpdateWidget(LaunchCountdown old) {
    super.didUpdateWidget(old);
    if (old.launchAt != widget.launchAt) {
      _reached = false;
      _update();
    }
  }

  void _update() {
    if (!mounted) return;
    setState(() => _left = _remaining());
    if (_left == Duration.zero && !_reached) {
      _reached = true;
      widget.onReached?.call();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final days = _left.inDays;
    final hours = _left.inHours % 24;
    final minutes = _left.inMinutes % 60;
    final seconds = _left.inSeconds % 60;
    return Semantics(
      label: l.launchCountdownA11y(days, hours, minutes),
      excludeSemantics: true,
      child: Row(
        children: [
          _Unit(value: days, label: l.launchCountdownDays, pad: false),
          const _Gap(),
          _Unit(value: hours, label: l.launchCountdownHours),
          const _Gap(),
          _Unit(value: minutes, label: l.launchCountdownMinutes),
          const _Gap(),
          _Unit(value: seconds, label: l.launchCountdownSeconds),
        ],
      ),
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(BuildContext context) => const SizedBox(width: HooSpacing.xs);
}

class _Unit extends StatelessWidget {
  const _Unit({required this.value, required this.label, this.pad = true});

  final int value;
  final String label;
  final bool pad;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    final text = pad ? value.toString().padLeft(2, '0') : value.toString();
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: HooRadius.cardAll,
          border: Border.all(color: colors.border),
        ),
        child: Column(
          children: [
            ClipRect(
              child: AnimatedSwitcher(
                duration: context.hoo.motion(HooDurations.normal),
                switchInCurve: HooCurves.enter,
                switchOutCurve: HooCurves.exit,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween(begin: const Offset(0, -0.35), end: Offset.zero).animate(animation),
                    child: child,
                  ),
                ),
                child: Text(
                  text,
                  key: ValueKey(text),
                  style: context.hoo.text.h1.copyWith(fontFeatures: const [FontFeature.tabularFigures()]),
                ),
              ),
            ),
            const SizedBox(height: HooSpacing.xxs),
            Text(label, style: context.hoo.text.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
