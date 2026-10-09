import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/profile_models.dart';
import '../domain/profile_repositories.dart';
import 'profile_api.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(this._api);
  final ProfileApi _api;

  @override
  Future<AccountOverview> overview() => _api.overview();

  @override
  Future<String?> updateProfile({required String fullName, required AppLanguage language, required bool marketingConsent}) =>
      _api.updateProfile({'fullName': fullName.trim(), 'language': language.wire, 'marketingConsent': marketingConsent});
}

class StyleProfileRepositoryImpl implements StyleProfileRepository {
  StyleProfileRepositoryImpl(this._api);
  final ProfileApi _api;

  @override
  Future<StyleProfile?> load() => _api.styleProfile();

  @override
  Future<StyleProfile> save(StyleProfile profile) => _api.saveStyleProfile(profile.toRequest());
}

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._api);
  final ProfileApi _api;

  static Map<String, dynamic> _body(String label, DeliveryAddress a, bool isDefault) {
    String? opt(String? v) => (v == null || v.trim().isEmpty) ? null : v.trim();
    return {
      'label': label.trim(),
      'address': {
        'city': a.city.trim(),
        'district': opt(a.district),
        'street': a.street.trim(),
        'apartment': opt(a.apartment),
        'courierNote': opt(a.courierNote),
      },
      'isDefault': isDefault,
    };
  }

  @override
  Future<List<SavedAddress>> list() => _api.addresses();

  @override
  Future<SavedAddress> create({required String label, required DeliveryAddress address, required bool isDefault}) =>
      _api.createAddress(_body(label, address, isDefault));

  @override
  Future<SavedAddress> update(String id, {required String label, required DeliveryAddress address, required bool isDefault}) =>
      _api.updateAddress(id, _body(label, address, isDefault));

  @override
  Future<void> delete(String id) => _api.deleteAddress(id);
}

class SavedCardsRepositoryImpl implements SavedCardsRepository {
  SavedCardsRepositoryImpl(this._api);
  final ProfileApi _api;

  @override
  Future<List<SavedCard>> list() => _api.cards();

  @override
  Future<void> delete(String id) => _api.deleteCard(id);
}

class SessionsRepositoryImpl implements SessionsRepository {
  SessionsRepositoryImpl(this._api);
  final ProfileApi _api;

  @override
  Future<List<DeviceSession>> list() => _api.sessions();

  @override
  Future<void> revoke(String id) => _api.revokeSession(id);
}

class NotificationPreferencesRepositoryImpl implements NotificationPreferencesRepository {
  NotificationPreferencesRepositoryImpl(this._api);
  final ProfileApi _api;

  @override
  Future<List<NotificationPreference>> load() => _api.notificationPreferences();

  @override
  Future<List<NotificationPreference>> save(List<NotificationPreference> preferences) =>
      _api.saveNotificationPreferences([for (final p in preferences.where((p) => p.isKnown)) p.toRequest()]);
}

class PasswordRepositoryImpl implements PasswordRepository {
  PasswordRepositoryImpl(this._api);
  final ProfileApi _api;

  @override
  Future<String?> change({String? currentPassword, required String newPassword}) =>
      _api.changePassword({'currentPassword': currentPassword, 'newPassword': newPassword});
}
