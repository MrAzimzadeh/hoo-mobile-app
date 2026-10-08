import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../shared/domain/models.dart';

/// Last known signed-in user, so an offline start still knows who is signed in. Holds PII (email, phone), so it
/// lives in secure storage next to the session token — never in SharedPreferences or logs.
abstract interface class AuthUserCache {
  Future<Me?> read();
  Future<void> write(Me user);
  Future<void> clear();
}

class SecureAuthUserCache implements AuthUserCache {
  SecureAuthUserCache([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage(iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device));

  final FlutterSecureStorage _storage;
  static const _key = 'hoo.auth.user';

  @override
  Future<Me?> read() async {
    try {
      final raw = await _storage.read(key: _key);
      if (raw == null) return null;
      return Me.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      // corrupt or from an incompatible version — the next session refresh rewrites it
      return null;
    }
  }

  @override
  Future<void> write(Me user) async {
    try {
      await _storage.write(key: _key, value: jsonEncode(user.toJson()));
    } catch (_) {
      // best effort: the cache only speeds up offline starts
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.delete(key: _key);
    } catch (_) {}
  }
}

/// In-memory cache (tests, or platforms without secure storage).
class MemoryAuthUserCache implements AuthUserCache {
  Me? _user;

  @override
  Future<Me?> read() async => _user;

  @override
  Future<void> write(Me user) async => _user = user;

  @override
  Future<void> clear() async => _user = null;
}
