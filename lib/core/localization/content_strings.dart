import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../network/api_client.dart';
import '../storage/preferences.dart';

/// Published UI text overrides from `GET /content/strings` (admin → Content). Bundled ARB strings are the
/// fallback; marketing copy (hero, promos, Coming Soon…) reads through [ContentStrings.text] so the team can
/// change it without an app release. Cached per language with the ETag (`If-None-Match` → 304).
class ContentStrings extends ChangeNotifier {
  ContentStrings(this._api, this._prefs);

  final ApiClient _api;
  final Preferences _prefs;
  Map<String, String> _strings = const {};

  String? operator [](String key) => _strings[key];

  /// Server override for [key], or [fallback] (the ARB string).
  String text(String key, String fallback) {
    final v = _strings[key];
    return v == null || v.trim().isEmpty ? fallback : v;
  }

  /// Loads the cached copy instantly, then refreshes in the background. Never throws.
  Future<void> load(String language) async {
    _strings = _prefs.contentStrings(language) ?? const {};
    notifyListeners();
    try {
      final etag = _prefs.contentEtag(language);
      final res = await _api.dio.get<Object?>(
        '/content/strings',
        options: Options(
          headers: {'Accept-Language': language, 'If-None-Match': ?etag},
          validateStatus: (s) => s != null && (s == 304 || (s >= 200 && s < 300)),
        ),
      );
      if (res.statusCode == 304 || res.data is! Map) return;
      final data = (res.data as Map).cast<String, dynamic>();
      final strings = (data['strings'] as Map? ?? const {}).map((k, v) => MapEntry(k.toString(), v.toString()));
      _strings = strings;
      await _prefs.setContentStrings(language, strings, data['eTag'] as String? ?? res.headers.value('etag'));
      notifyListeners();
    } catch (_) {
      // Offline or no published release: bundled strings are already in use.
    }
  }
}
