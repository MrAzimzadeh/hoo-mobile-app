import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../../app/router/app_router.dart';

/// How an auth page hands control back when it succeeds.
///
/// * Opened by the `AccessGuard` or `AuthGate.requireSignIn` → they pass `onResult`; calling it resumes the
///   original navigation (the guard removes the sign-in route itself).
/// * Opened on top of another auth page (Sign in → Create account / SMS code) → `onResult` pops back to that page,
///   which then finishes its own flow.
/// * Opened on its own (a deep link, Profile → Sign in) → pop back, or land in the app when there is nothing below.
abstract final class AuthFlow {
  static void finish(BuildContext context, {void Function(bool success)? onResult, bool offerStyleProfile = false}) {
    final router = context.router.root;
    if (onResult != null) {
      onResult(true);
    } else if (router.canPop()) {
      router.maybePop(true);
    } else {
      router.replaceAll([const MainShellRoute()]);
    }
    if (offerStyleProfile) {
      // after the caller's navigation (guard resume / replaceAll) has settled
      WidgetsBinding.instance.addPostFrameCallback((_) => router.push(StyleProfileRoute(onboarding: true)));
    }
  }

  /// A sub-flow pushed from [parentRouteName] (e.g. Sign up from Sign in): on success, pop back to the parent and
  /// let it finish.
  static void Function(bool) subFlow(StackRouter router, String parentRouteName, VoidCallback onSuccess) => (ok) {
    if (!ok) return;
    router.popUntilRouteWithName(parentRouteName);
    onSuccess();
  };

  /// From Welcome: any success lands in the app.
  static void Function(bool) intoApp(StackRouter router) => (ok) {
    if (ok) router.replaceAll([const MainShellRoute()]);
  };
}
