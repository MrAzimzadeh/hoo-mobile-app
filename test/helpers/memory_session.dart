import 'package:hoo/core/session/session_store.dart';
import 'package:hoo/core/storage/preferences.dart';
import 'package:hoo/core/storage/secure_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemorySecureStore implements SecureStore {
  String? token;
  DateTime? expiry;

  @override
  Future<String?> readSessionToken() async => token;

  @override
  Future<DateTime?> readSessionExpiry() async => expiry;

  @override
  Future<void> writeSession(String token, DateTime expiresAt) async {
    this.token = token;
    expiry = expiresAt;
  }

  @override
  Future<void> clearSession() async {
    token = null;
    expiry = null;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// A [SessionStore] backed by memory (tests).
Future<SessionStore> memorySession() async {
  SharedPreferences.setMockInitialValues({});
  return SessionStore(MemorySecureStore(), Preferences(await SharedPreferences.getInstance()));
}
