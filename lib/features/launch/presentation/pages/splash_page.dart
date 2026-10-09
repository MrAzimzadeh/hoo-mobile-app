import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/router/link_navigator.dart';
import '../../../../core/analytics/analytics.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/localization/content_strings.dart';
import '../../../../core/session/session_store.dart';
import '../../../../core/storage/preferences.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/launch_repository.dart';
import '../../domain/start_destination.dart';

/// Brand intro: the `HOo` wordmark tightens into place on black, settles, holds, then the next screen is revealed.
/// Store meta, guest id, session restore and content strings load in parallel with the animation.
@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: HooDurations.cinematic);
  late final Future<void> _init = _initialise();
  bool _slowHint = false;

  @override
  void initState() {
    super.initState();
    // after the first frame: init notifies app-wide listeners, which must not happen mid-build
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_run()));
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Future<void> _initialise() async {
    final session = sl<SessionStore>();
    await Future.wait<Object?>([
      sl<StoreInfoProvider>().refresh(),
      sl<GuestRepository>().ensureGuestId().catchError((Object _) => ''),
      sl<AuthGate>().refreshUser(),
      sl<ContentStrings>().load(session.language),
    ]);
    sl<Analytics>().visit();
  }

  Future<void> _run() async {
    final reduced = WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.disableAnimations;
    final slow = Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() => _slowHint = true);
    });
    await Future.wait([
      if (reduced) Future<void>.delayed(HooDurations.normal) else _c.forward().then((_) => Future<void>.delayed(const Duration(milliseconds: 280))),
      _init.catchError((Object _) {}),
    ]);
    slow.cancel();
    if (!mounted) return;
    final store = sl<StoreInfoProvider>();
    final destination = decideStart(
      mode: store.info.mode,
      isStaff: sl<AuthGate>().currentUser?.isStaff ?? false,
      onboardingDone: sl<Preferences>().onboardingDone,
    );
    final router = context.router;
    switch (destination) {
      case StartDestination.comingSoon:
        await router.replaceAll([const ComingSoonRoute()]);
      case StartDestination.onboarding:
        await router.replaceAll([const OnboardingRoute()]);
      case StartDestination.main:
        await router.replaceAll([const MainShellRoute()]);
        final pending = sl<DeepLinkService>().takePendingLink();
        if (pending != null) await LinkNavigator.open(router, pending);
    }
  }

  @override
  Widget build(BuildContext context) {
    // tracking −12% → −2%, opacity in, scale 1.00 → 1.02 → 1.00
    final reveal = CurvedAnimation(parent: _c, curve: const Interval(0, 0.7, curve: HooCurves.cinematic));
    final settle = CurvedAnimation(parent: _c, curve: const Interval(0.45, 1, curve: HooCurves.standard));
    return Scaffold(
      backgroundColor: HooPalette.black,
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _c,
              builder: (context, _) {
                final t = settle.value;
                final scale = 1 + 0.02 * (t < 0.5 ? t * 2 : (1 - t) * 2);
                return Opacity(
                  opacity: reveal.value.clamp(0, 1),
                  child: Transform.scale(
                    scale: scale,
                    child: HooLogo(variant: HooLogoVariant.light, size: 56, letterSpacingEm: -0.12 + 0.10 * reveal.value),
                  ),
                );
              },
            ),
          ),
          if (_slowHint)
            const Positioned(
              left: 0,
              right: 0,
              bottom: HooSpacing.xxxl,
              child: Center(child: SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 1.5, color: HooPalette.white))),
            ),
        ],
      ),
    );
  }
}
