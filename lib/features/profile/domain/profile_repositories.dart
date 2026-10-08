import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import 'address_draft.dart';
import 'profile_models.dart';

/// Account basics: overview counters, profile edits, password. All methods throw `ApiException`.
abstract interface class AccountRepository {
  /// `GET /account/overview`; served from cache (stale) when offline.
  Future<Cached<AccountOverview>> overview();

  /// `PUT /account/profile`.
  Future<void> updateProfile(UpdateProfileRequest request);

  /// `POST /auth/password/change`. [currentPassword] is null for accounts without a password (social / OTP).
  /// Other sessions are signed out by the server.
  Future<void> changePassword({String? currentPassword, required String newPassword});
}

/// Saved delivery addresses (`/account/addresses`).
abstract interface class AddressRepository {
  /// Served from cache (stale) when offline.
  Future<Cached<List<SavedAddress>>> list();
  Future<SavedAddress> create(AddressDraft draft);
  Future<SavedAddress> update(String id, AddressDraft draft);
  Future<void> delete(String id);
}

/// Saved cards (`/account/payment-methods`) — masks only.
abstract interface class SavedCardRepository {
  Future<List<SavedCard>> list();
  Future<void> delete(String id);
}

/// Active devices (`/auth/sessions`).
abstract interface class SessionRepository {
  Future<List<ActiveSession>> list();
  Future<void> revoke(String id);
}

/// Topic × channel grid (`/account/notification-preferences`).
abstract interface class NotificationPreferencesRepository {
  Future<List<NotificationPreference>> get();

  /// Saves the given cells (only changed cells need to be sent) and returns the full, authoritative grid.
  Future<List<NotificationPreference>> save(List<NotificationPreference> changes);
}

/// `/account/style-profile`.
abstract interface class StyleProfileRepository {
  /// Null when the user has none yet (204).
  Future<StyleProfile?> get();
  Future<StyleProfile> save(StyleProfile profile);
}
