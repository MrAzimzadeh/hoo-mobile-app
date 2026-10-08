import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../data/social_identity_provider.dart';
import '../../domain/auth_models.dart';
import '../../domain/auth_repository.dart';
import '../../domain/auth_validation.dart';
import 'auth_errors.dart';

enum SocialProvider { google, apple }

sealed class AuthFormEvent {
  const AuthFormEvent();
}

/// Email or phone + password.
final class SignInSubmitted extends AuthFormEvent {
  const SignInSubmitted({required this.identifier, required this.password});
  final String identifier;
  final String password;
}

final class SignUpSubmitted extends AuthFormEvent {
  const SignUpSubmitted({
    required this.fullName,
    required this.email,
    required this.password,
    this.phone = '',
    this.marketingConsent = false,
    this.acceptTerms = false,
  });

  final String fullName;
  final String email;
  final String password;

  /// National digits as typed (the field has a fixed +994 prefix); empty → not sent.
  final String phone;
  final bool marketingConsent;
  final bool acceptTerms;
}

/// Google / Apple. [acceptTerms] is the sign-up checkbox; sign-in sends false and asks only when the server
/// needs it (a new account → `auth.terms_required`).
final class SocialSignInRequested extends AuthFormEvent {
  const SocialSignInRequested(this.provider, {this.acceptTerms = false});
  final SocialProvider provider;
  final bool acceptTerms;
}

/// The user accepted the terms in the prompt shown for `auth.terms_required` — retry with the same credential.
final class SocialTermsAccepted extends AuthFormEvent {
  const SocialTermsAccepted();
}

final class SocialTermsDeclined extends AuthFormEvent {
  const SocialTermsDeclined();
}

/// A field was edited — its error goes away.
final class AuthFieldEdited extends AuthFormEvent {
  const AuthFieldEdited(this.field);
  final String field;
}

enum AuthFormStatus { idle, submitting, success, failure }

class AuthFormState extends Equatable {
  const AuthFormState({
    this.status = AuthFormStatus.idle,
    this.social,
    this.fieldErrors = const {},
    this.error,
    this.socialFailed = false,
    this.termsPending,
    this.isNewUser = false,
    this.lockedUntil,
  });

  final AuthFormStatus status;

  /// The social provider in flight (its button shows the spinner).
  final SocialProvider? social;
  final Map<String, FieldIssue> fieldErrors;

  /// Form-level failure (server's localized title is displayed; flows branch on its code).
  final ApiException? error;

  /// The native provider failed (not a cancellation).
  final bool socialFailed;

  /// A social credential waiting for the user to accept the terms (new account).
  final SocialCredential? termsPending;
  final bool isNewUser;

  /// Too many attempts (429 on login): the submit button counts down until then.
  final DateTime? lockedUntil;

  bool get busy => status == AuthFormStatus.submitting;
  bool get succeeded => status == AuthFormStatus.success;

  AuthFormState copyWith({
    AuthFormStatus? status,
    SocialProvider? Function()? social,
    Map<String, FieldIssue>? fieldErrors,
    ApiException? Function()? error,
    bool? socialFailed,
    SocialCredential? Function()? termsPending,
    bool? isNewUser,
    DateTime? Function()? lockedUntil,
  }) => AuthFormState(
    status: status ?? this.status,
    social: social != null ? social() : this.social,
    fieldErrors: fieldErrors ?? this.fieldErrors,
    error: error != null ? error() : this.error,
    socialFailed: socialFailed ?? this.socialFailed,
    termsPending: termsPending != null ? termsPending() : this.termsPending,
    isNewUser: isNewUser ?? this.isNewUser,
    lockedUntil: lockedUntil != null ? lockedUntil() : this.lockedUntil,
  );

  @override
  List<Object?> get props => [status, social, fieldErrors, error, socialFailed, termsPending, isNewUser, lockedUntil];
}

/// Sign in, sign up and Google/Apple. One machine because they share the social + terms branch.
class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc(this._repository, this._social, {DateTime Function()? now}) : _now = now ?? DateTime.now, super(const AuthFormState()) {
    on<SignInSubmitted>(_onSignIn);
    on<SignUpSubmitted>(_onSignUp);
    on<SocialSignInRequested>(_onSocial);
    on<SocialTermsAccepted>(_onTermsAccepted);
    on<SocialTermsDeclined>((_, emit) => emit(state.copyWith(status: AuthFormStatus.idle, termsPending: () => null, social: () => null)));
    on<AuthFieldEdited>(_onEdited);
  }

  final AuthRepository _repository;
  final SocialIdentityProvider _social;
  final DateTime Function() _now;

  static const signInFields = ['identifier', 'password'];
  static const signUpFields = ['fullName', 'email', 'password', 'phone', 'acceptTerms'];

  bool get _locked => state.lockedUntil != null && state.lockedUntil!.isAfter(_now());

  Future<void> _onSignIn(SignInSubmitted event, Emitter<AuthFormState> emit) async {
    if (state.busy || _locked) return;
    final errors = <String, FieldIssue>{};
    final identifier = AuthValidation.normalizeIdentifier(event.identifier);
    if (event.identifier.trim().isEmpty) {
      errors['identifier'] = const FieldIssue.local(AuthFieldError.required);
    } else if (identifier == null) {
      errors['identifier'] = const FieldIssue.local(AuthFieldError.invalidIdentifier);
    }
    if (event.password.isEmpty) errors['password'] = const FieldIssue.local(AuthFieldError.required);
    if (errors.isNotEmpty) {
      emit(AuthFormState(status: AuthFormStatus.failure, fieldErrors: errors));
      return;
    }
    emit(const AuthFormState(status: AuthFormStatus.submitting));
    try {
      final r = await _repository.login(identifier: identifier!, password: event.password);
      emit(AuthFormState(status: AuthFormStatus.success, isNewUser: r.isNewUser));
    } on ApiException catch (e) {
      emit(_failure(e, signInFields));
    }
  }

  Future<void> _onSignUp(SignUpSubmitted event, Emitter<AuthFormState> emit) async {
    if (state.busy) return;
    final errors = <String, FieldIssue>{};
    final name = event.fullName.trim();
    final email = event.email.trim();
    final phone = event.phone.trim();
    if (name.isEmpty) errors['fullName'] = const FieldIssue.local(AuthFieldError.required);
    if (email.isEmpty) {
      errors['email'] = const FieldIssue.local(AuthFieldError.required);
    } else if (!AuthValidation.isEmail(email)) {
      errors['email'] = const FieldIssue.local(AuthFieldError.invalidEmail);
    }
    if (event.password.isEmpty) {
      errors['password'] = const FieldIssue.local(AuthFieldError.required);
    } else if (!AuthValidation.isStrongPassword(event.password)) {
      errors['password'] = const FieldIssue.local(AuthFieldError.weakPassword);
    }
    if (phone.isNotEmpty && !AuthValidation.isAzPhone(phone)) errors['phone'] = const FieldIssue.local(AuthFieldError.invalidPhone);
    if (!event.acceptTerms) errors['acceptTerms'] = const FieldIssue.local(AuthFieldError.termsRequired);
    if (errors.isNotEmpty) {
      emit(AuthFormState(status: AuthFormStatus.failure, fieldErrors: errors));
      return;
    }
    emit(const AuthFormState(status: AuthFormStatus.submitting));
    try {
      final r = await _repository.register(
        RegisterRequest(
          fullName: name,
          email: email,
          password: event.password,
          phone: phone.isEmpty ? null : HooFormat.phoneWire(phone),
          marketingConsent: event.marketingConsent,
          acceptTerms: event.acceptTerms,
        ),
      );
      emit(AuthFormState(status: AuthFormStatus.success, isNewUser: r.isNewUser));
    } on ApiException catch (e) {
      emit(_failure(e, signUpFields));
    }
  }

  Future<void> _onSocial(SocialSignInRequested event, Emitter<AuthFormState> emit) async {
    if (state.busy) return;
    emit(AuthFormState(status: AuthFormStatus.submitting, social: event.provider));
    final SocialCredential? credential;
    try {
      credential = switch (event.provider) {
        SocialProvider.google => await _social.google(),
        SocialProvider.apple => await _social.apple(),
      };
    } on SocialSignInException {
      emit(const AuthFormState(status: AuthFormStatus.failure, socialFailed: true));
      return;
    }
    if (credential == null) {
      // cancelled by the user — back to idle, no error
      emit(const AuthFormState());
      return;
    }
    await _exchange(credential, event.acceptTerms, emit);
  }

  Future<void> _onTermsAccepted(SocialTermsAccepted event, Emitter<AuthFormState> emit) async {
    final credential = state.termsPending;
    if (credential == null || state.busy) return;
    emit(AuthFormState(status: AuthFormStatus.submitting, social: credential is GoogleCredential ? SocialProvider.google : SocialProvider.apple));
    await _exchange(credential, true, emit);
  }

  Future<void> _exchange(SocialCredential credential, bool acceptTerms, Emitter<AuthFormState> emit) async {
    try {
      final r = await _repository.signInWithSocial(credential, acceptTerms: acceptTerms);
      emit(AuthFormState(status: AuthFormStatus.success, isNewUser: r.isNewUser));
    } on ApiException catch (e) {
      if (e.code == ErrorCodes.termsRequired && !acceptTerms) {
        emit(AuthFormState(termsPending: credential));
        return;
      }
      emit(_failure(e, const []));
    }
  }

  void _onEdited(AuthFieldEdited event, Emitter<AuthFormState> emit) {
    if (!state.fieldErrors.containsKey(event.field) && state.error == null) return;
    emit(state.copyWith(fieldErrors: Map.of(state.fieldErrors)..remove(event.field), error: () => null));
  }

  AuthFormState _failure(ApiException e, List<String> fields) {
    final fieldErrors = serverFieldIssues(e, fields);
    if (e.code == ErrorCodes.termsRequired && fields.contains('acceptTerms')) {
      fieldErrors['acceptTerms'] = const FieldIssue.local(AuthFieldError.termsRequired);
    }
    // 409s that belong to one input
    final title = e.title;
    final conflictField = switch (e.code) {
      AuthErrorCodes.emailTaken => 'email',
      AuthErrorCodes.phoneTaken => 'phone',
      AuthErrorCodes.weakPassword => 'password',
      _ => null,
    };
    if (conflictField != null && title != null && fields.contains(conflictField)) fieldErrors.putIfAbsent(conflictField, () => FieldIssue.server(title));
    return AuthFormState(
      status: AuthFormStatus.failure,
      fieldErrors: fieldErrors,
      // field errors already explain the failure; anything else is shown above the form
      error: fieldErrors.isNotEmpty && (e.isValidation || conflictField != null) ? null : e,
      lockedUntil: e.isTooManyRequests ? _now().add(throttleOf(e)) : null,
    );
  }
}
