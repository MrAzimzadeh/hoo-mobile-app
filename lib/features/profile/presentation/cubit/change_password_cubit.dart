import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/profile_repositories.dart';

enum PasswordFieldError { required, weak, mismatch }

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.current = '',
    this.next = '',
    this.confirm = '',
    this.showErrors = false,
    this.saving = false,
    this.serverCurrentError,
    this.serverNextError,
    this.error,
    this.done = false,
  });

  final String current;
  final String next;
  final String confirm;
  final bool showErrors;
  final bool saving;
  final String? serverCurrentError;
  final String? serverNextError;
  final ApiException? error;
  final bool done;

  /// Mirrors the server's `StrongPassword` rule: 8+ characters, a digit and a symbol.
  static bool isStrong(String p) => p.length >= 8 && p.contains(RegExp(r'\d')) && p.contains(RegExp(r'[^A-Za-z0-9\s]'));

  PasswordFieldError? currentError({required bool hasPassword}) => showErrors && hasPassword && current.isEmpty ? PasswordFieldError.required : null;

  PasswordFieldError? get nextError {
    if (!showErrors) return null;
    if (next.isEmpty) return PasswordFieldError.required;
    if (!isStrong(next)) return PasswordFieldError.weak;
    return null;
  }

  PasswordFieldError? get confirmError {
    if (!showErrors) return null;
    if (confirm.isEmpty) return PasswordFieldError.required;
    if (confirm != next) return PasswordFieldError.mismatch;
    return null;
  }

  ChangePasswordState copyWith({
    String? current,
    String? next,
    String? confirm,
    bool? showErrors,
    bool? saving,
    String? serverCurrentError,
    String? serverNextError,
    bool clearServer = false,
    ApiException? error,
    bool clearError = false,
    bool? done,
  }) => ChangePasswordState(
    current: current ?? this.current,
    next: next ?? this.next,
    confirm: confirm ?? this.confirm,
    showErrors: showErrors ?? this.showErrors,
    saving: saving ?? this.saving,
    serverCurrentError: clearServer ? null : (serverCurrentError ?? this.serverCurrentError),
    serverNextError: clearServer ? null : (serverNextError ?? this.serverNextError),
    error: clearError ? null : (error ?? this.error),
    done: done ?? this.done,
  );

  @override
  List<Object?> get props => [current, next, confirm, showErrors, saving, serverCurrentError, serverNextError, error, done];
}

/// `POST /auth/password/change`. Accounts without a password (social / OTP sign-up) set their first one without
/// the current password.
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._account, {required this.hasPassword}) : super(const ChangePasswordState());

  final AccountRepository _account;
  final bool hasPassword;

  static const currentPasswordInvalid = 'auth.current_password_invalid';

  void setCurrent(String v) => emit(state.copyWith(current: v, clearServer: true, clearError: true));
  void setNext(String v) => emit(state.copyWith(next: v, clearServer: true, clearError: true));
  void setConfirm(String v) => emit(state.copyWith(confirm: v, clearError: true));

  Future<void> submit() async {
    if (state.saving) return;
    emit(state.copyWith(showErrors: true));
    if (state.currentError(hasPassword: hasPassword) != null || state.nextError != null || state.confirmError != null) return;
    emit(state.copyWith(saving: true, clearServer: true, clearError: true));
    try {
      await _account.changePassword(currentPassword: hasPassword ? state.current : null, newPassword: state.next);
      if (!isClosed) emit(state.copyWith(saving: false, done: true));
    } on ApiException catch (e) {
      if (isClosed) return;
      final current = e.code == currentPasswordInvalid ? (e.fieldError('currentPassword') ?? e.title ?? '') : e.fieldError('currentPassword');
      final next = e.fieldError('newPassword');
      emit(state.copyWith(saving: false, serverCurrentError: current, serverNextError: next, error: current == null && next == null ? e : null));
    }
  }
}
