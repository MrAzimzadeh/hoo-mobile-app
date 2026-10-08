import '../../../core/network/api_client.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/address_draft.dart';
import '../domain/profile_models.dart';
import '../domain/profile_repositories.dart';
import 'profile_api.dart';

/// Offline cache scope: keys are per user so a stale copy never leaks to another account on the same device.
class ProfileCacheScope {
  const ProfileCacheScope({required this.db, required this.userId, required this.language});

  final AppDatabase Function() db;
  final String? Function() userId;
  final String Function() language;

  String key(String name) => 'profile.$name.${userId() ?? 'anon'}';
}

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(this._api, this._cache);

  final ProfileApi _api;
  final ProfileCacheScope _cache;

  @override
  Future<Cached<AccountOverview>> overview() => cachedFetch(
    db: _cache.db(),
    key: _cache.key('overview'),
    language: _cache.language(),
    fetchJson: _api.overviewJson,
    decode: (j) => AccountOverview.fromJson(Decoders.map(j)),
  );

  @override
  Future<void> updateProfile(UpdateProfileRequest request) => _api.updateProfile(request);

  @override
  Future<void> changePassword({String? currentPassword, required String newPassword}) =>
      _api.changePassword(currentPassword: (currentPassword?.isEmpty ?? true) ? null : currentPassword, newPassword: newPassword);
}

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._api, this._cache);

  final ProfileApi _api;
  final ProfileCacheScope _cache;

  @override
  Future<Cached<List<SavedAddress>>> list() => cachedFetch(
    db: _cache.db(),
    key: _cache.key('addresses'),
    language: '',
    fetchJson: _api.addressesJson,
    decode: (j) => sortAddresses(Decoders.list(j, SavedAddress.fromJson)),
  );

  @override
  Future<SavedAddress> create(AddressDraft draft) => _api.createAddress(draft.toRequest());

  @override
  Future<SavedAddress> update(String id, AddressDraft draft) => _api.updateAddress(id, draft.toRequest());

  @override
  Future<void> delete(String id) => _api.deleteAddress(id);

  /// Default first, otherwise server order.
  static List<SavedAddress> sortAddresses(List<SavedAddress> list) => [...list.where((a) => a.isDefault), ...list.where((a) => !a.isDefault)];
}

class SavedCardRepositoryImpl implements SavedCardRepository {
  SavedCardRepositoryImpl(this._api);

  final ProfileApi _api;

  @override
  Future<List<SavedCard>> list() => _api.cards();

  @override
  Future<void> delete(String id) => _api.deleteCard(id);
}

class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl(this._api);

  final ProfileApi _api;

  /// Current device first, then most recently active.
  @override
  Future<List<ActiveSession>> list() async {
    final list = await _api.sessions();
    return list..sort((a, b) => a.isCurrent != b.isCurrent ? (a.isCurrent ? -1 : 1) : b.lastSeenAt.compareTo(a.lastSeenAt));
  }

  @override
  Future<void> revoke(String id) => _api.revokeSession(id);
}

class NotificationPreferencesRepositoryImpl implements NotificationPreferencesRepository {
  NotificationPreferencesRepositoryImpl(this._api);

  final ProfileApi _api;

  @override
  Future<List<NotificationPreference>> get() => _api.notificationPreferences().then(_knownOnly);

  @override
  Future<List<NotificationPreference>> save(List<NotificationPreference> changes) => _api.saveNotificationPreferences(changes).then(_knownOnly);

  /// Cells for a topic/channel this app version doesn't know are hidden (they keep their server value).
  static List<NotificationPreference> _knownOnly(List<NotificationPreference> list) =>
      list.where((p) => p.topic != NotificationTopic.unknown && p.channel != NotificationChannel.unknown).toList();
}

class StyleProfileRepositoryImpl implements StyleProfileRepository {
  StyleProfileRepositoryImpl(this._api);

  final ProfileApi _api;

  @override
  Future<StyleProfile?> get() => _api.styleProfile();

  @override
  Future<StyleProfile> save(StyleProfile profile) => _api.saveStyleProfile(profile);
}
