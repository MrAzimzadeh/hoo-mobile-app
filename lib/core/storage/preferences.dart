import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Non-sensitive per-device preferences (language, appearance, onboarding flag, guest id, cached strings).
class Preferences {
  Preferences(this._prefs);

  final SharedPreferences _prefs;

  static Future<Preferences> create() async => Preferences(await SharedPreferences.getInstance());

  static const _guestId = 'hoo.guestId';
  static const _language = 'hoo.language';
  static const _themeMode = 'hoo.themeMode';
  static const _onboardingDone = 'hoo.onboardingDone';
  static const _contentStrings = 'hoo.contentStrings';
  static const _contentEtag = 'hoo.contentStrings.etag';
  static const _studioProgress = 'hoo.studio.progress';
  static const _pendingUtm = 'hoo.utm';

  String? get guestId => _prefs.getString(_guestId);
  Future<void> setGuestId(String id) => _prefs.setString(_guestId, id);

  String? get languageCode => _prefs.getString(_language);
  Future<void> setLanguageCode(String code) => _prefs.setString(_language, code);

  /// `system` | `light` | `dark`.
  String get themeMode => _prefs.getString(_themeMode) ?? 'system';
  Future<void> setThemeMode(String mode) => _prefs.setString(_themeMode, mode);

  bool get onboardingDone => _prefs.getBool(_onboardingDone) ?? false;
  Future<void> setOnboardingDone() => _prefs.setBool(_onboardingDone, true);

  Map<String, String>? contentStrings(String lang) {
    final raw = _prefs.getString('$_contentStrings.$lang');
    if (raw == null) return null;
    return (jsonDecode(raw) as Map<String, dynamic>).map((k, v) => MapEntry(k, v.toString()));
  }

  String? contentEtag(String lang) => _prefs.getString('$_contentEtag.$lang');

  Future<void> setContentStrings(String lang, Map<String, String> strings, String? etag) async {
    await _prefs.setString('$_contentStrings.$lang', jsonEncode(strings));
    if (etag != null) await _prefs.setString('$_contentEtag.$lang', etag);
  }

  /// Studio stepper progress (last step / design id) so the customer resumes where they left off.
  Map<String, dynamic>? get studioProgress {
    final raw = _prefs.getString(_studioProgress);
    return raw == null ? null : jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> setStudioProgress(Map<String, dynamic>? value) =>
      value == null ? _prefs.remove(_studioProgress) : _prefs.setString(_studioProgress, jsonEncode(value));

  /// UTM parameters captured from the last deep link, attached to analytics.
  Map<String, String>? get pendingUtm {
    final raw = _prefs.getString(_pendingUtm);
    return raw == null ? null : (jsonDecode(raw) as Map<String, dynamic>).cast<String, String>();
  }

  Future<void> setPendingUtm(Map<String, String> utm) => _prefs.setString(_pendingUtm, jsonEncode(utm));
}
