import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/auth_models.dart';
import '../../domain/auth_repository.dart';
import '../../domain/auth_validation.dart';
import 'auth_errors.dart';

sealed class PasswordEvent {
  const PasswordEvent();
}

/// "Forgot password": email → link, phone → SMS code.
final class ForgotPasswordSubmitted extends PasswordEvent {
  const ForgotPasswordSubmitted(this.identifier);
  final String identifier;
}

/// New password with the e-mail token or the SMS code.
final class ResetPasswordSubmitted extends PasswordEvent {
  const ResetPasswordSubmitted({required this.identifier, required this.token, required this.newPassword});
  final String identifier;
  final String token;
  final String newPassword;
}

final class PasswordFieldEdited extends PasswordEvent {
  const PasswordFieldEdited(this.field);
  final String field;
}

enum PasswordStatus { idle, submitting, sent, reset, failure }

class PasswordState extends Equatable {
  const PasswordState({this.status = PasswordStatus.idle, this.identifier, this.isPhone = false, this.fieldErrors = const {}, this.error, this.throttledUntil});

  final PasswordStatus status;

  /// Normalized identifier the request was sent for (phone in `+994…` form).
  final String? identifier;
  final bool isPhone;
  final Map<String, FieldIssue> fieldErrors;
  final ApiException? error;
  final DateTime? throttledUntil;

  bool get busy => status == PasswordStatus.submitting;

  @override
  List<Object?> get props => [status, identifier, isPhone, fieldErrors, error, throttledUntil];
}

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc(this._repository, {DateTime Function()? now}) : _now = now ?? DateTime.now, super(const PasswordState()) {
    on<ForgotPasswordSubmitted>(_onForgot);
    on<ResetPasswordSubmitted>(_onReset);
    on<PasswordFieldEdited>((event, emit) {
      if (!state.fieldErrors.containsKey(event.field) && state.error == null) return;
      emit(
        PasswordState(
          status: state.status == PasswordStatus.failure ? PasswordStatus.idle : state.status,
          identifier: state.identifier,
          isPhone: state.isPhone,
          fieldErrors: Map.of(state.fieldErrors)..remove(event.field),
          throttledUntil: state.throttledUntil,
        ),
      );
    });
  }

  final AuthRepository _repository;
  final DateTime Function() _now;

  static const fields = ['identifier', 'token', 'newPassword'];

  Future<void> _onForgot(ForgotPasswordSubmitted event, Emitter<PasswordState> emit) async {
    if (state.busy) return;
    if (state.throttledUntil != null && state.throttledUntil!.isAfter(_now())) return;
    final raw = event.identifier.trim();
    final identifier = AuthValidation.normalizeIdentifier(raw);
    if (raw.isEmpty || identifier == null) {
      emit(
        PasswordState(
          status: PasswordStatus.failure,
          fieldErrors: {'identifier': FieldIssue.local(raw.isEmpty ? AuthFieldError.required : AuthFieldError.invalidIdentifier)},
        ),
      );
      return;
    }
    final isPhone = !identifier.contains('@');
    emit(PasswordState(status: PasswordStatus.submitting, identifier: identifier, isPhone: isPhone));
    try {
      await _repository.forgotPassword(identifier);
      emit(PasswordState(status: PasswordStatus.sent, identifier: identifier, isPhone: isPhone));
    } on ApiException catch (e) {
      emit(_failure(e, identifier: identifier, isPhone: isPhone));
    }
  }

  Future<void> _onReset(ResetPasswordSubmitted event, Emitter<PasswordState> emit) async {
    if (state.busy) return;
    final errors = <String, FieldIssue>{};
    final identifier = AuthValidation.normalizeIdentifier(event.identifier);
    if (event.identifier.trim().isEmpty) {
      errors['identifier'] = const FieldIssue.local(AuthFieldError.required);
    } else if (identifier == null) {
      errors['identifier'] = const FieldIssue.local(AuthFieldError.invalidIdentifier);
    }
    final token = event.token.trim();
    if (token.isEmpty) errors['token'] = const FieldIssue.local(AuthFieldError.required);
    if (event.newPassword.isEmpty) {
      errors['newPassword'] = const FieldIssue.local(AuthFieldError.required);
    } else if (!AuthValidation.isStrongPassword(event.newPassword)) {
      errors['newPassword'] = const FieldIssue.local(AuthFieldError.weakPassword);
    }
    final isPhone = identifier != null && !identifier.contains('@');
    if (errors.isNotEmpty) {
      emit(PasswordState(status: PasswordStatus.failure, identifier: identifier, isPhone: isPhone, fieldErrors: errors));
      return;
    }
    emit(PasswordState(status: PasswordStatus.submitting, identifier: identifier, isPhone: isPhone));
    try {
      await _repository.resetPassword(ResetPasswordRequest(identifier: identifier!, token: token, newPassword: event.newPassword));
      emit(PasswordState(status: PasswordStatus.reset, identifier: identifier, isPhone: isPhone));
    } on ApiException catch (e) {
      emit(_failure(e, identifier: identifier, isPhone: isPhone));
    }
  }

  PasswordState _failure(ApiException e, {String? identifier, required bool isPhone}) {
    final fieldErrors = serverFieldIssues(e, fields);
    final title = e.title;
    // wrong / expired code or link → under the code input
    if (title != null && (e.code == ErrorCodes.otpInvalid || e.code == ErrorCodes.otpExpired || e.code == AuthErrorCodes.resetTokenInvalid)) {
      fieldErrors.putIfAbsent('token', () => FieldIssue.server(title));
    }
    if (title != null && e.code == AuthErrorCodes.weakPassword) fieldErrors.putIfAbsent('newPassword', () => FieldIssue.server(title));
    return PasswordState(
      status: PasswordStatus.failure,
      identifier: identifier,
      isPhone: isPhone,
      fieldErrors: fieldErrors,
      error: fieldErrors.isEmpty ? e : null,
      throttledUntil: e.isTooManyRequests ? _now().add(throttleOf(e)) : null,
    );
  }

  /// Display form of the identifier (`+994 50 123 45 67`).
  static String display(String identifier) => identifier.contains('@') ? identifier : HooFormat.phone(identifier);
}
