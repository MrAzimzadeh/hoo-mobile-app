import '../../../core/network/api_client.dart';
import '../../../shared/domain/models.dart';
import '../domain/profile_models.dart';

/// HTTP surface of the profile feature (`/account/*`, `/auth/sessions`, `/auth/password/change`).
class ProfileApi {
  ProfileApi(this._api);

  final ApiClient _api;

  static String? _message(Object? j) => j is Map ? MessageResponse.fromJson(j.cast<String, dynamic>()).message : null;

  Future<AccountOverview> overview() => _api.get('/account/overview', decode: (j) => AccountOverview.fromJson(Decoders.map(j)));

  Future<String?> updateProfile(Map<String, dynamic> body) => _api.put('/account/profile', body: body, decode: _message);

  /// 204 (no profile yet) decodes to null.
  Future<StyleProfile?> styleProfile() =>
      _api.get('/account/style-profile', decode: (j) => j is Map ? StyleProfile.fromJson(j.cast<String, dynamic>()) : null);

  Future<StyleProfile> saveStyleProfile(Map<String, dynamic> body) =>
      _api.put('/account/style-profile', body: body, decode: (j) => StyleProfile.fromJson(Decoders.map(j)));

  Future<List<SavedAddress>> addresses() => _api.get('/account/addresses', decode: (j) => Decoders.list(j, SavedAddress.fromJson));

  Future<SavedAddress> createAddress(Map<String, dynamic> body) =>
      _api.post('/account/addresses', body: body, decode: (j) => SavedAddress.fromJson(Decoders.map(j)));

  Future<SavedAddress> updateAddress(String id, Map<String, dynamic> body) =>
      _api.put('/account/addresses/${Uri.encodeComponent(id)}', body: body, decode: (j) => SavedAddress.fromJson(Decoders.map(j)));

  Future<void> deleteAddress(String id) => _api.delete<void>('/account/addresses/${Uri.encodeComponent(id)}', decode: (_) {});

  Future<List<SavedCard>> cards() => _api.get('/account/payment-methods', decode: (j) => Decoders.list(j, SavedCard.fromJson));

  Future<void> deleteCard(String id) => _api.delete<void>('/account/payment-methods/${Uri.encodeComponent(id)}', decode: (_) {});

  Future<List<NotificationPreference>> notificationPreferences() =>
      _api.get('/account/notification-preferences', decode: (j) => Decoders.list(j, NotificationPreference.fromJson));

  Future<List<NotificationPreference>> saveNotificationPreferences(List<Map<String, dynamic>> body) =>
      _api.put('/account/notification-preferences', body: body, decode: (j) => Decoders.list(j, NotificationPreference.fromJson));

  Future<List<DeviceSession>> sessions() => _api.get('/auth/sessions', decode: (j) => Decoders.list(j, DeviceSession.fromJson));

  Future<void> revokeSession(String id) => _api.delete<void>('/auth/sessions/${Uri.encodeComponent(id)}', decode: (_) {});

  Future<String?> changePassword(Map<String, dynamic> body) => _api.post('/auth/password/change', body: body, decode: _message);
}
