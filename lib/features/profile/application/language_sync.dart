import 'dart:async';

import '../../../core/localization/app_settings_cubit.dart';
import '../../../shared/application/contracts.dart';
import '../domain/profile_repositories.dart';

/// Keeps the account language in sync: when the app language changes while signed in, `PUT /account/profile`
/// so e-mails, SMS and push arrive in the same language.
class LanguageSync {
  LanguageSync(this._settings, this._auth, this._account);

  final AppSettingsCubit _settings;
  final AuthGate _auth;
  final AccountRepository _account;
  StreamSubscription<Object?>? _sub;

  void start() {
    var last = _settings.state.language;
    _sub ??= _settings.stream.listen((s) {
      if (s.language == last) return;
      last = s.language;
      final user = _auth.currentUser;
      if (user == null || user.language == s.language) return;
      unawaited(_account
          .updateProfile(fullName: user.fullName, language: s.language, marketingConsent: user.marketingConsent)
          .then((_) => _auth.refreshUser())
          .catchError((Object _) {}));
    });
  }
}
