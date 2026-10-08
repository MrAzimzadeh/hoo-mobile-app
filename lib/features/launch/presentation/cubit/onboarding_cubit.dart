import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../core/storage/preferences.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';

/// Where onboarding hands over.
enum OnboardingExit { welcome, main }

@immutable
class OnboardingState extends Equatable {
  const OnboardingState({required this.language, this.page = 0});

  final AppLanguage language;

  /// 0 = language, 1…[slideCount] = editorial slides.
  final int page;

  static const slideCount = 3;
  static const pageCount = slideCount + 1;

  bool get isLanguageStep => page == 0;
  bool get isLast => page == pageCount - 1;

  OnboardingState copyWith({AppLanguage? language, int? page}) => OnboardingState(language: language ?? this.language, page: page ?? this.page);

  @override
  List<Object?> get props => [language, page];
}

/// First launch: language choice (applied live through [AppSettingsCubit]) + three slides, then the flag in
/// [Preferences] so it never shows again.
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._settings, this._prefs, this._auth, this._links, {String? deviceLanguageCode})
    : super(OnboardingState(language: _initial(_settings, deviceLanguageCode))) {
    if (state.language != _settings.state.language) _settings.setLanguage(state.language);
  }

  final AppSettingsCubit _settings;
  final Preferences _prefs;
  final AuthGate _auth;
  final DeepLinkService _links;

  /// The saved choice, else the device language when HOO supports it, else az.
  static AppLanguage _initial(AppSettingsCubit settings, String? device) {
    if (settings.hasChosenLanguage || device == null) return settings.state.language;
    return AppLanguage.values.firstWhere((l) => l.wire == device, orElse: () => settings.state.language);
  }

  Future<void> selectLanguage(AppLanguage language) async {
    if (language == state.language) return;
    emit(state.copyWith(language: language));
    await _settings.setLanguage(language);
  }

  void pageChanged(int page) {
    if (page != state.page) emit(state.copyWith(page: page.clamp(0, OnboardingState.pageCount - 1)));
  }

  /// Persists the onboarding flag (and the language, so it counts as chosen). Signed-in users, and links waiting
  /// to be opened, go straight into the app; everyone else meets Welcome (sign in / create account / guest).
  Future<OnboardingExit> complete() async {
    await _settings.setLanguage(state.language);
    await _prefs.setOnboardingDone();
    return _auth.isSignedIn || _links.pendingLink != null ? OnboardingExit.main : OnboardingExit.welcome;
  }
}
