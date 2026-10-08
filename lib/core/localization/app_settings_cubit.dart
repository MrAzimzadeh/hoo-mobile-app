import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/domain/enums.dart';
import '../session/session_store.dart';
import '../storage/preferences.dart';

@immutable
class AppSettings {
  const AppSettings({required this.language, required this.themeMode});

  final AppLanguage language;
  final ThemeMode themeMode;

  Locale get locale => Locale(language.wire);

  AppSettings copyWith({AppLanguage? language, ThemeMode? themeMode}) =>
      AppSettings(language: language ?? this.language, themeMode: themeMode ?? this.themeMode);

  @override
  bool operator ==(Object other) => other is AppSettings && other.language == language && other.themeMode == themeMode;

  @override
  int get hashCode => Object.hash(language, themeMode);
}

/// Language + appearance. Language changes also update the `Accept-Language` header immediately; the profile
/// sync (`PUT /account/profile`) is done by the profile feature listening to this cubit when signed in.
class AppSettingsCubit extends Cubit<AppSettings> {
  AppSettingsCubit(this._prefs, this._session)
      : super(AppSettings(language: AppLanguage.fromCode(_prefs.languageCode), themeMode: _parseTheme(_prefs.themeMode))) {
    _session.setLanguage(state.language.wire);
  }

  final Preferences _prefs;
  final SessionStore _session;

  bool get hasChosenLanguage => _prefs.languageCode != null;

  Future<void> setLanguage(AppLanguage language) async {
    _session.setLanguage(language.wire);
    await _prefs.setLanguageCode(language.wire);
    emit(state.copyWith(language: language));
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setThemeMode(mode.name);
    emit(state.copyWith(themeMode: mode));
  }

  static ThemeMode _parseTheme(String v) => ThemeMode.values.firstWhere((m) => m.name == v, orElse: () => ThemeMode.system);
}
