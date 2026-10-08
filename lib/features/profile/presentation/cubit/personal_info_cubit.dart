import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';

enum PersonalInfoNameError { required, tooLong }

class PersonalInfoState extends Equatable {
  const PersonalInfoState({
    required this.fullName,
    required this.language,
    required this.marketingConsent,
    this.showErrors = false,
    this.saving = false,
    this.serverNameError,
    this.error,
    this.saved = false,
  });

  final String fullName;
  final AppLanguage language;
  final bool marketingConsent;
  final bool showErrors;
  final bool saving;
  final String? serverNameError;
  final ApiException? error;
  final bool saved;

  /// `UpdateProfileRequestValidator`: required, ≤ 100.
  static const maxNameLength = 100;

  PersonalInfoNameError? get nameError {
    if (!showErrors) return null;
    final n = fullName.trim();
    if (n.isEmpty) return PersonalInfoNameError.required;
    if (n.length > maxNameLength) return PersonalInfoNameError.tooLong;
    return null;
  }

  PersonalInfoState copyWith({
    String? fullName,
    AppLanguage? language,
    bool? marketingConsent,
    bool? showErrors,
    bool? saving,
    String? serverNameError,
    bool clearServerNameError = false,
    ApiException? error,
    bool clearError = false,
    bool? saved,
  }) => PersonalInfoState(
    fullName: fullName ?? this.fullName,
    language: language ?? this.language,
    marketingConsent: marketingConsent ?? this.marketingConsent,
    showErrors: showErrors ?? this.showErrors,
    saving: saving ?? this.saving,
    serverNameError: clearServerNameError ? null : (serverNameError ?? this.serverNameError),
    error: clearError ? null : (error ?? this.error),
    saved: saved ?? this.saved,
  );

  @override
  List<Object?> get props => [fullName, language, marketingConsent, showErrors, saving, serverNameError, error, saved];
}

/// Personal info (`PUT /account/profile`: name, language, marketing consent). A language change is applied to the
/// app too — after the session is refreshed, so the language sync sees no difference and doesn't PUT twice.
// TODO(backend): UpdateProfileRequest has no email/phone — they are shown read-only until an endpoint exists.
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit(this._account, this._auth, this._settings)
    : super(
        PersonalInfoState(
          fullName: _auth.currentUser?.fullName ?? '',
          language: _auth.currentUser?.language ?? _settings.state.language,
          marketingConsent: _auth.currentUser?.marketingConsent ?? false,
        ),
      );

  final AccountRepository _account;
  final AuthGate _auth;
  final AppSettingsCubit _settings;

  void setName(String v) => emit(state.copyWith(fullName: v, saved: false, clearServerNameError: true, clearError: true));
  void setLanguage(AppLanguage v) => emit(state.copyWith(language: v, saved: false, clearError: true));
  void setMarketingConsent(bool v) => emit(state.copyWith(marketingConsent: v, saved: false, clearError: true));

  Future<void> submit() async {
    if (state.saving) return;
    emit(state.copyWith(showErrors: true));
    if (state.nameError != null) return;
    emit(state.copyWith(saving: true, clearError: true, clearServerNameError: true));
    try {
      await _account.updateProfile(UpdateProfileRequest(fullName: state.fullName.trim(), language: state.language, marketingConsent: state.marketingConsent));
      await _auth.refreshUser().catchError((Object _) {});
      if (_settings.state.language != state.language) await _settings.setLanguage(state.language);
      if (!isClosed) emit(state.copyWith(saving: false, saved: true));
    } on ApiException catch (e) {
      if (isClosed) return;
      final nameMsg = e.fieldError('fullName');
      emit(state.copyWith(saving: false, serverNameError: nameMsg, error: nameMsg == null ? e : null));
    }
  }
}
