import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Credentials only: the session token never touches SharedPreferences, Drift or logs.
class SecureStore {
  SecureStore([FlutterSecureStorage? storage])
      : _storage = storage ??
            const FlutterSecureStorage(
              iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
            );

  final FlutterSecureStorage _storage;

  static const _sessionToken = 'hoo.session.token';
  static const _sessionExpiresAt = 'hoo.session.expiresAt';

  Future<String?> readSessionToken() => _storage.read(key: _sessionToken);

  Future<DateTime?> readSessionExpiry() async {
    final v = await _storage.read(key: _sessionExpiresAt);
    return v == null ? null : DateTime.tryParse(v);
  }

  Future<void> writeSession(String token, DateTime expiresAt) async {
    await _storage.write(key: _sessionToken, value: token);
    await _storage.write(key: _sessionExpiresAt, value: expiresAt.toIso8601String());
  }

  Future<void> clearSession() async {
    await _storage.delete(key: _sessionToken);
    await _storage.delete(key: _sessionExpiresAt);
  }
}
