import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/splash_cubit.dart';
import '../launch_navigation.dart';

/// Brand reveal (SPEC §13.4): black, white `HOo` whose tracking animates into place with a subtle 1.00→1.02→1.00
/// settle, a brief hold, then the wordmark slips away behind a mask while the next screen opens with the circular
/// reveal. Start-up work runs in parallel in [SplashCubit]; the minimum display time is the animation itself, and a
/// progress line appears only when init outlasts it.
@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HooThemeData.dark(),
      child: BlocProvider(create: (_) => sl<SplashCubit>()..start(), child: const _SplashView()),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView> with TickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(vsync: this, duration: HooDurations.cinematic);
  late final AnimationController _exit = AnimationController(vsync: this, duration: HooDurations.medium);

  /// Final −2% tracking is reached from a wide, airy setting.
  static const _fromTrackingEm = 0.32;
  static const _wordmarkSize = HooSpacing.xxxl;

  late final Animation<double> _opacity = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0, 0.45, curve: HooCurves.standard),
  );
  late final Animation<double> _tracking = Tween(begin: _fromTrackingEm, end: HooType.wordmarkTracking).animate(
    CurvedAnimation(
      parent: _intro,
      curve: const Interval(0, 0.85, curve: HooCurves.cinematic),
    ),
  );
  late final Animation<double> _scale = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.02).chain(CurveTween(curve: HooCurves.standard)), weight: 55),
    TweenSequenceItem(tween: Tween(begin: 1.02, end: 1.0).chain(CurveTween(curve: HooCurves.cinematic)), weight: 45),
  ]).animate(CurvedAnimation(parent: _intro, curve: const Interval(0.35, 1)));
  late final Animation<double> _exitT = CurvedAnimation(parent: _exit, curve: HooCurves.exit);

  bool _started = false;
  bool _minShown = false;
  bool _leaving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (context.hoo.reducedMotion) {
      _intro.value = 1;
      _minShown = true;
      return;
    }
    unawaited(_playIntro());
  }

  Future<void> _playIntro() async {
    await _intro.forward().orCancel.catchError((Object _) {});
    await Future<void>.delayed(HooDurations.medium); // brief hold on the settled wordmark
    if (!mounted) return;
    _minShown = true;
    unawaited(_maybeLeave(context.read<SplashCubit>().state));
  }

  Future<void> _maybeLeave(SplashState state) async {
    final destination = state.destination;
    if (!_minShown || destination == null || _leaving || !mounted) return;
    _leaving = true;
    final router = context.router;
    if (!context.hoo.reducedMotion) await _exit.forward().orCancel.catchError((Object _) {});
    if (!mounted) return;
    switch (destination) {
      case LaunchDestination.comingSoon:
        await LaunchNavigation.toComingSoon(router);
      case LaunchDestination.onboarding:
        await LaunchNavigation.toOnboarding(router);
      case LaunchDestination.main:
        await LaunchNavigation.enterApp(router, sl<DeepLinkService>());
    }
  }

  @override
  void dispose() {
    _intro.dispose();
    _exit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (a, b) => !a.isReady && b.isReady,
        listener: (context, state) => _maybeLeave(state),
        child: Scaffold(
          backgroundColor: colors.background,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRect(
                  child: AnimatedBuilder(
                    animation: Listenable.merge([_intro, _exit]),
                    builder: (context, _) => FractionalTranslation(
                      translation: Offset(0, -_exitT.value),
                      child: Opacity(
                        opacity: (_opacity.value * (1 - _exitT.value)).clamp(0.0, 1.0),
                        child: Transform.scale(
                          scale: _scale.value,
                          child: HooLogo(variant: HooLogoVariant.light, size: _wordmarkSize, letterSpacingEm: _tracking.value),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: HooSpacing.xl),
                BlocBuilder<SplashCubit, SplashState>(
                  buildWhen: (a, b) => a.slow != b.slow || a.isReady != b.isReady,
                  builder: (context, state) => _SlowIndicator(visible: state.slow && !state.isReady),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A thin line instead of a spinner — only when start-up is slower than the brand animation.
class _SlowIndicator extends StatelessWidget {
  const _SlowIndicator({required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: context.hoo.motion(HooDurations.slow),
      curve: HooCurves.standard,
      child: Semantics(
        label: visible ? context.l10n.stateLoading : null,
        child: SizedBox(
          width: HooSpacing.xxl,
          height: HooSize.selectedRing,
          child: visible
              ? LinearProgressIndicator(color: colors.textPrimary, backgroundColor: colors.border, minHeight: HooSize.selectedRing)
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
