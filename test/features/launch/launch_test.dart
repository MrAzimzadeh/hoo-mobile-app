import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/storage/app_database.dart';
import 'package:hoo/features/launch/data/launch_api.dart';
import 'package:hoo/features/launch/data/store_info_repository.dart';
import 'package:hoo/features/launch/presentation/cubit/splash_cubit.dart';
import 'package:hoo/shared/domain/enums.dart';
import 'package:hoo/shared/domain/models.dart';

import '../../helpers/fake_api.dart';

void main() {
  group('LaunchRouting', () {
    test('coming soon for non-staff while store is not live', () {
      expect(LaunchRouting.decide(store: const StoreInfo(mode: StoreMode.comingSoon), user: null, onboardingDone: true), LaunchDestination.comingSoon);
    });

    test('live store: onboarding first, then main', () {
      expect(LaunchRouting.decide(store: const StoreInfo(), user: null, onboardingDone: false), LaunchDestination.onboarding);
      expect(LaunchRouting.decide(store: const StoreInfo(), user: null, onboardingDone: true), LaunchDestination.main);
    });
  });

  group('StoreInfoRepository', () {
    test('load caches and a later offline load falls back to the cache', () async {
      final db = AppDatabase.memory();
      addTearDown(db.close);
      var online = true;
      final api = LaunchApi(
        fakeApiClient({
          'GET /meta/store': (_) => online ? (200, {'mode': 'ComingSoon'}) : (503, {'code': 'general.unavailable', 'title': 'x', 'status': 503}),
        }),
      );
      final first = StoreInfoRepository(api, db);
      final fresh = await first.load();
      expect(fresh.stale, isFalse);
      expect(first.isLive, isFalse);

      online = false;
      final second = StoreInfoRepository(api, db);
      final cached = await second.load();
      expect(cached.stale, isTrue);
      expect(second.info.mode, StoreMode.comingSoon);
    });
  });
}
