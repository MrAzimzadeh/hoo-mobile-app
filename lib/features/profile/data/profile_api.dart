import '../../../core/network/api_client.dart';
import '../../../shared/domain/models.dart';
import '../domain/profile_models.dart';

/// HTTP calls of the profile feature. Paths and verbs mirror `AccountEndpoints` / `AuthEndpoints`.
class ProfileApi {
  ProfileApi(this._api);

  final ApiClient _api;

  Future<Object?> overviewJson() => _api.get<Object?>('/account/overview');

  Future<void> updateProfile(UpdateProfileRequest request) => _api.put<Object?>('/account/profile', body: request.toJson());

  Future<void> changePassword({String? currentPassword, required String newPassword}) =>
      _api.post<Object?>('/auth/password/change', body: {'currentPassword': currentPassword, 'newPassword': newPassword});

  Future<Object?> addressesJson() => _api.get<Object?>('/account/addresses');

  Future<SavedAddress> createAddress(Map<String, dynamic> body) =>
      _api.post('/account/addresses', body: body, decode: (j) => SavedAddress.fromJson(Decoders.map(j)));

  Future<SavedAddress> updateAddress(String id, Map<String, dynamic> body) =>
      _api.put('/account/addresses/$id', body: body, decode: (j) => SavedAddress.fromJson(Decoders.map(j)));

  Future<void> deleteAddress(String id) => _api.delete<Object?>('/account/addresses/$id');

  Future<List<SavedCard>> cards() => _api.get('/account/payment-methods', decode: (j) => Decoders.list(j, SavedCard.fromJson));

  Future<void> deleteCard(String id) => _api.delete<Object?>('/account/payment-methods/$id');

  Future<List<ActiveSession>> sessions() => _api.get('/auth/sessions', decode: (j) => Decoders.list(j, ActiveSession.fromJson));

  Future<void> revokeSession(String id) => _api.delete<Object?>('/auth/sessions/$id');

  Future<List<NotificationPreference>> notificationPreferences() =>
      _api.get('/account/notification-preferences', decode: (j) => Decoders.list(j, NotificationPreference.fromJson));

  Future<List<NotificationPreference>> saveNotificationPreferences(List<NotificationPreference> items) => _api.put(
    '/account/notification-preferences',
    body: [for (final p in items) p.toJson()],
    decode: (j) => Decoders.list(j, NotificationPreference.fromJson),
  );

  /// 204 (no profile yet) arrives as an empty body → null.
  Future<StyleProfile?> styleProfile() => _api.get('/account/style-profile', decode: (j) => j is Map ? StyleProfile.fromJson(j.cast<String, dynamic>()) : null);

  Future<StyleProfile> saveStyleProfile(StyleProfile profile) =>
      _api.put('/account/style-profile', body: profile.toJson(), decode: (j) => StyleProfile.fromJson(Decoders.map(j)));
}
