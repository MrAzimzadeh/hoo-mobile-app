import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/error/api_exception.dart';
import '../../../core/localization/app_settings_cubit.dart';
import '../../../shared/application/contracts.dart';
import '../domain/profile_models.dart';
import '../domain/profile_repositories.dart';

/// Keeps the account language in step with the app language: when the user switches language anywhere (Settings,
/// onboarding) while signed in, `PUT /account/profile` so e-mails/SMS/push arrive in that language too.
///
/// [auth] is resolved lazily — the auth module may be registered after this one.
class LanguageSync {
  LanguageSync(this._settings, this._account, this._auth);

  final AppSettingsCubit _settings;
  final AccountRepository _account;
  final AuthGate Function() _auth;
  StreamSubscription<AppSettings>? _sub;
  Future<void>? _inFlight;

  void start() => _sub ??= _settings.stream.listen((_) => unawaited(sync()));

  /// Pushes the app language to the profile when it differs. One PUT at a time; concurrent callers share it.
  Future<void> sync() {
    final running = _inFlight;
    if (running != null) return running;
    final f = _sync().whenComplete(() => _inFlight = null);
    _inFlight = f;
    return f;
  }

  Future<void> _sync() async {
    final auth = _auth();
    // a few rounds in case the language changes again while a save is in flight
    for (var round = 0; round < 3; round++) {
      final user = auth.currentUser;
      final language = _settings.state.language;
      if (user == null || user.language == language) return;
      try {
        await _account.updateProfile(UpdateProfileRequest(fullName: user.fullName, language: language, marketingConsent: user.marketingConsent));
        await auth.refreshUser();
      } on ApiException catch (e) {
        if (kDebugMode) debugPrint('[profile] language sync failed: $e');
        return;
      }
      if (_settings.state.language == language) return;
    }
  }

  Future<void> dispose() async => _sub?.cancel();
}
