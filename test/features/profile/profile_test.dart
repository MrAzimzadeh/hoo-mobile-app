import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/error/api_exception.dart';
import 'package:hoo/core/storage/app_database.dart';
import 'package:hoo/features/profile/data/profile_api.dart';
import 'package:hoo/features/profile/data/profile_repositories_impl.dart';
import 'package:hoo/features/profile/domain/address_draft.dart';
import 'package:hoo/features/profile/domain/profile_models.dart';
import 'package:hoo/features/profile/domain/profile_repositories.dart';
import 'package:hoo/features/profile/presentation/cubit/notification_prefs_cubit.dart';
import 'package:hoo/features/profile/presentation/cubit/style_profile_cubit.dart';
import 'package:hoo/shared/application/contracts.dart';
import 'package:hoo/shared/domain/enums.dart';

import '../../helpers/fake_api.dart';

class _Prefs implements NotificationPreferencesRepository {
  _Prefs({this.failSave = false});
  final bool failSave;

  @override
  Future<List<NotificationPreference>> get() async => const [
    NotificationPreference(topic: NotificationTopic.orders, channel: NotificationChannel.email, enabled: true, locked: true),
    NotificationPreference(topic: NotificationTopic.marketing, channel: NotificationChannel.email, enabled: false),
  ];

  @override
  Future<List<NotificationPreference>> save(List<NotificationPreference> changes) async {
    if (failSave) throw const ApiException(statusCode: 500, code: 'general.unknown');
    return [const NotificationPreference(topic: NotificationTopic.orders, channel: NotificationChannel.email, enabled: true, locked: true), ...changes];
  }
}

class _Styles implements StyleProfileRepository {
  @override
  Future<StyleProfile?> get() async => null;
  @override
  Future<StyleProfile> save(StyleProfile profile) async => profile;
}

class _Auth implements AuthGate {
  @override
  dynamic noSuchMethod(Invocation invocation) => invocation.memberName == #refreshUser ? Future<void>.value() : super.noSuchMethod(invocation);
}

void main() {
  test('AddressDraft requires label, city and street', () {
    const empty = AddressDraft();
    expect(empty.isValid, isFalse);
    expect(empty.validate().keys, containsAll([AddressField.label, AddressField.city, AddressField.street]));
    final ok = empty.copyWithField(AddressField.label, 'Home').copyWithField(AddressField.city, 'Baku').copyWithField(AddressField.street, 'Nizami 1');
    expect(ok.isValid, isTrue);
  });

  test('a locked notification cell cannot be toggled; a failed save rolls the switch back', () async {
    final cubit = NotificationPrefsCubit(_Prefs(failSave: true));
    await cubit.load();
    await cubit.toggle(NotificationTopic.orders, NotificationChannel.email, false);
    expect(cubit.state.cell(NotificationTopic.orders, NotificationChannel.email)!.enabled, isTrue);
    await cubit.toggle(NotificationTopic.marketing, NotificationChannel.email, true);
    expect(cubit.state.cell(NotificationTopic.marketing, NotificationChannel.email)!.enabled, isFalse);
    expect(cubit.state.failure, isNotNull);
    await cubit.close();
  });

  test('style profile limits favorite colors and validates measurement ranges', () async {
    final cubit = StyleProfileCubit(_Styles(), _Auth());
    await cubit.load();
    for (final c in [ColorFamily.black, ColorFamily.cream, ColorFamily.olive, ColorFamily.red]) {
      cubit.toggleColor(c);
    }
    expect(cubit.state.profile.favoriteColors.length, 3);
    expect(cubit.state.colorLimitHit, 1);
    cubit.setMeasurement(Measurement.height, '50');
    expect(cubit.state.canSave, isFalse);
    cubit.setMeasurement(Measurement.height, '178');
    expect(cubit.state.canSave, isTrue);
    await cubit.close();
  });

  test('overview and change-password call the account endpoints', () async {
    final db = AppDatabase.memory();
    addTearDown(db.close);
    final adapter = FakeApiAdapter({
      'GET /account/overview': (_) => (200, {'fullName': 'A B', 'ordersCount': 2}),
      'POST /auth/password/change': (_) => (200, {}),
    });
    final repo = AccountRepositoryImpl(
      ProfileApi(fakeApiClient({}, adapter: adapter)),
      ProfileCacheScope(db: () => db, userId: () => 'u1', language: () => 'az'),
    );
    expect((await repo.overview()).data.ordersCount, 2);
    await repo.changePassword(currentPassword: 'old', newPassword: 'New12345!');
    expect((adapter.requests.last.body as Map)['newPassword'], 'New12345!');
  });
}
