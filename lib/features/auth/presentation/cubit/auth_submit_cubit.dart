import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../application/auth_session.dart';
import '../../domain/auth_models.dart';

/// State of one auth form (sign in, sign up, social, reset): submitting, last error, throttle deadline, result.
class AuthSubmitState extends Equatable {
  const AuthSubmitState({this.submitting = false, this.error, this.retryAt, this.result});

  final bool submitting;
  final Object? error;

  /// 429 → the submit button is disabled until then (countdown).
  final DateTime? retryAt;
  final AuthResult? result;

  ApiException? get apiError => error is ApiException ? error as ApiException : null;
  bool get throttled => retryAt != null && retryAt!.isAfter(DateTime.now());

  String? fieldError(String name) => apiError?.fieldError(name);

  @override
  List<Object?> get props => [submitting, error, retryAt, result];
}

/// Runs an auth call, publishes the signed-in user on success. Sign in, sign up and social logins share it.
class AuthSubmitCubit extends Cubit<AuthSubmitState> {
  AuthSubmitCubit(this._session) : super(const AuthSubmitState());

  final AuthSession _session;

  Future<AuthResult?> submit(Future<AuthResult> Function() call) async {
    if (state.submitting || state.throttled) return null;
    emit(AuthSubmitState(retryAt: state.retryAt, submitting: true));
    try {
      final result = await call();
      _session.signedIn(result);
      emit(AuthSubmitState(result: result));
      return result;
    } on ApiException catch (e) {
      if (e.isCancelled) {
        emit(const AuthSubmitState());
        return null;
      }
      emit(AuthSubmitState(error: e, retryAt: e.isTooManyRequests ? DateTime.now().add(e.retryAfter ?? const Duration(seconds: 60)) : null));
      return null;
    } catch (e) {
      emit(AuthSubmitState(error: e));
      return null;
    }
  }

  /// Non-auth commands on the same form (forgot/reset password) — no user is published.
  Future<bool> run(Future<void> Function() call) async {
    if (state.submitting || state.throttled) return false;
    emit(const AuthSubmitState(submitting: true));
    try {
      await call();
      emit(const AuthSubmitState());
      return true;
    } on ApiException catch (e) {
      emit(AuthSubmitState(error: e, retryAt: e.isTooManyRequests ? DateTime.now().add(e.retryAfter ?? const Duration(seconds: 60)) : null));
      return false;
    }
  }

  void clearError() => emit(AuthSubmitState(retryAt: state.retryAt));

  /// Shows a client-side error (e.g. social sign-in not configured) through the same channel.
  void fail(Object error) => emit(AuthSubmitState(error: error));
}
