import '../../../shared/domain/enums.dart';

/// Where the app goes after the splash.
enum StartDestination { comingSoon, onboarding, main }

/// Pure routing decision (unit-tested): Coming Soon gates everyone but staff; the first launch shows onboarding;
/// otherwise straight into the app — guests can browse, bag and design without an account.
StartDestination decideStart({required StoreMode mode, required bool isStaff, required bool onboardingDone}) {
  if (mode == StoreMode.comingSoon && !isStaff) return StartDestination.comingSoon;
  if (!onboardingDone) return StartDestination.onboarding;
  return StartDestination.main;
}
