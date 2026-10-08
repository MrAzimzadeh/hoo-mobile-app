import 'package:auto_route/auto_route.dart';

import '../../../app/router/app_router.dart';
import '../../../app/router/link_navigator.dart';
import '../../../core/deeplinks/deep_link_service.dart';

/// Hand-over from the launch screens into the app. Replaces the stack (no way "back" to splash/onboarding) and opens
/// a deep link that arrived during start-up on top of the shell, so back returns into the app.
abstract final class LaunchNavigation {
  static Future<void> enterApp(StackRouter router, DeepLinkService links) {
    final link = links.takePendingLink();
    final routes = link == null ? null : LinkNavigator.routesFor(link);
    if (routes == null || routes.isEmpty) return router.replaceAll([const MainShellRoute()]);
    return router.replaceAll([if (routes.first.routeName != MainShellRoute.name) const MainShellRoute(), ...routes]);
  }

  static Future<void> toComingSoon(StackRouter router) => router.replaceAll([const ComingSoonRoute()]);

  static Future<void> toOnboarding(StackRouter router) => router.replaceAll([const OnboardingRoute()]);

  static Future<void> toWelcome(StackRouter router) => router.replaceAll([const WelcomeRoute()]);
}
