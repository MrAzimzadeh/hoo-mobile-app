import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/features/launch/domain/start_destination.dart';
import 'package:hoo/shared/domain/enums.dart';

void main() {
  test('coming soon gates everyone but staff', () {
    expect(decideStart(mode: StoreMode.comingSoon, isStaff: false, onboardingDone: true), StartDestination.comingSoon);
    expect(decideStart(mode: StoreMode.comingSoon, isStaff: true, onboardingDone: true), StartDestination.main);
  });

  test('first launch shows onboarding, later straight into the app', () {
    expect(decideStart(mode: StoreMode.live, isStaff: false, onboardingDone: false), StartDestination.onboarding);
    expect(decideStart(mode: StoreMode.live, isStaff: false, onboardingDone: true), StartDestination.main);
  });
}
