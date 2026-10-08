import 'dart:async';

import '../storage/preferences.dart';
import '../storage/secure_store.dart';

/// Events the network layer raises for the app shell to react to.
enum SessionEvent {
  /// A request came back 401 — the token was cleared; route to Welcome (the guest bag is kept).
  unauthorized,

  /// `503 store.coming_soon` — the store switched to Coming Soon mode.
  storeComingSoon,
}

/// In-memory mirror of the credentials the interceptors attach to every request.
/// Token → secure storage, guest id → preferences. Never logged.
class SessionStore {
  SessionStore(this._secure, this._prefs);

  final SecureStore _secure;
  final Preferences _prefs;

  String? _token;
  String? _guestId;
  String _language = 'az';
  final _events = StreamController<SessionEvent>.broadcast();

  String? get token => _token;
  String? get guestId => _guestId;
  String get language => _language;
  bool get hasSession => _token != null;
  Stream<SessionEvent> get events => _events.stream;

  Future<void> restore() async {
    _token = await _secure.readSessionToken();
    final expiry = await _secure.readSessionExpiry();
    if (_token != null && expiry != null && expiry.isBefore(DateTime.now())) {
      await clearToken();
    }
    _guestId = _prefs.guestId;
    _language = _prefs.languageCode ?? 'az';
  }

  Future<void> saveToken(String token, DateTime expiresAt) async {
    _token = token;
    await _secure.writeSession(token, expiresAt);
  }

  Future<void> clearToken() async {
    _token = null;
    await _secure.clearSession();
  }

  Future<void> saveGuestId(String id) async {
    _guestId = id;
    await _prefs.setGuestId(id);
  }

  void setLanguage(String code) => _language = code;

  void emit(SessionEvent event) => _events.add(event);
}
