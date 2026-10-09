import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'profile_models.dart';

/// Narrow repositories, one per account section (no God repository).

abstract interface class AccountRepository {
  Future<AccountOverview> overview();

  /// `PUT /account/profile` — returns the server's localized confirmation.
  Future<String?> updateProfile({required String fullName, required AppLanguage language, required bool marketingConsent});
}

abstract interface class StyleProfileRepository {
  /// Null when the customer has no style profile yet (204).
  Future<StyleProfile?> load();

  Future<StyleProfile> save(StyleProfile profile);
}

abstract interface class AddressRepository {
  Future<List<SavedAddress>> list();

  Future<SavedAddress> create({required String label, required DeliveryAddress address, required bool isDefault});

  Future<SavedAddress> update(String id, {required String label, required DeliveryAddress address, required bool isDefault});

  Future<void> delete(String id);
}

abstract interface class SavedCardsRepository {
  Future<List<SavedCard>> list();

  Future<void> delete(String id);
}

abstract interface class SessionsRepository {
  Future<List<DeviceSession>> list();

  Future<void> revoke(String id);
}

abstract interface class NotificationPreferencesRepository {
  Future<List<NotificationPreference>> load();

  /// `PUT` takes the full topic × channel list and answers with the stored list.
  Future<List<NotificationPreference>> save(List<NotificationPreference> preferences);
}

abstract interface class PasswordRepository {
  /// `POST /auth/password/change` — `currentPassword` only when the account already has one.
  Future<String?> change({String? currentPassword, required String newPassword});
}
