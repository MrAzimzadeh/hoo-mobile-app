import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../domain/contact_input.dart';
import '../../domain/launch_models.dart';
import '../../domain/launch_repository.dart';

enum SubmitStatus { idle, submitting, success, failure }

/// State of a one-field sign-up form (waitlist, newsletter).
@immutable
class SignupFormState<T> extends Equatable {
  const SignupFormState({this.status = SubmitStatus.idle, this.result, this.fieldError, this.fieldMessage, this.error, this.retryUntil});

  final SubmitStatus status;

  /// Server result on success.
  final T? result;

  /// Client-side validation (localized by the page).
  final ContactError? fieldError;

  /// Server-side field error, already localized.
  final String? fieldMessage;

  /// Non-field failure (network, 5xx…) — shown with `errorMessage`.
  final Object? error;

  /// 429: submitting is disabled until then (countdown).
  final DateTime? retryUntil;

  bool get submitting => status == SubmitStatus.submitting;
  bool get throttled => retryUntil != null && retryUntil!.isAfter(DateTime.now());

  @override
  List<Object?> get props => [status, result, fieldError, fieldMessage, error, retryUntil];
}

/// Shared submit flow: validation → request → success/field error/429 countdown/failure.
abstract class _SignupCubit<T> extends Cubit<SignupFormState<T>> {
  _SignupCubit() : super(SignupFormState<T>());

  /// Used when a 429 arrives without `Retry-After`.
  static const defaultRetryAfter = Duration(seconds: 60);

  /// Clears validation errors as soon as the user edits the field.
  void edited() {
    if (state.fieldError != null || state.fieldMessage != null || state.status == SubmitStatus.failure) {
      emit(SignupFormState<T>(result: state.result, retryUntil: state.retryUntil));
    }
  }

  /// The 429 countdown finished.
  void throttleEnded() => emit(SignupFormState<T>(status: state.status == SubmitStatus.failure ? SubmitStatus.idle : state.status, result: state.result));

  Future<void> run({required ContactError? validation, required Future<T> Function() request, T? Function(ApiException e)? recover}) async {
    if (state.submitting || state.throttled) return;
    if (validation != null) {
      emit(SignupFormState<T>(status: SubmitStatus.failure, fieldError: validation));
      return;
    }
    emit(SignupFormState<T>(status: SubmitStatus.submitting));
    try {
      final result = await request();
      if (!isClosed) emit(SignupFormState<T>(status: SubmitStatus.success, result: result));
    } on ApiException catch (e) {
      if (isClosed) return;
      final recovered = recover?.call(e);
      if (recovered != null) {
        emit(SignupFormState<T>(status: SubmitStatus.success, result: recovered));
      } else if (e.isTooManyRequests) {
        emit(SignupFormState<T>(status: SubmitStatus.failure, error: e, retryUntil: DateTime.now().add(e.retryAfter ?? defaultRetryAfter)));
      } else if (e.code == 'launch.contact_required') {
        emit(SignupFormState<T>(status: SubmitStatus.failure, fieldError: ContactError.required));
      } else if (e.isValidation) {
        final field = e.fieldError('email') ?? e.fieldError('phone');
        emit(SignupFormState<T>(status: SubmitStatus.failure, fieldMessage: field ?? e.title, error: field == null && e.title == null ? e : null));
      } else {
        emit(SignupFormState<T>(status: SubmitStatus.failure, error: e));
      }
    }
  }
}

/// "Join the waitlist" (`POST /waitlist`, email or phone in one field).
class WaitlistCubit extends _SignupCubit<WaitlistJoined> {
  WaitlistCubit(this._repo, this._settings);

  final LaunchRepository _repo;
  final AppSettingsCubit _settings;

  Future<void> submit(String input) {
    final parsed = ContactInput.parse(input);
    return run(
      validation: parsed.error,
      request: () => _repo.joinWaitlist(parsed.contact!, language: _settings.state.language),
    );
  }
}

/// Newsletter result: `true` when the address was already subscribed (`launch.already_subscribed`).
class NewsletterCubit extends _SignupCubit<bool> {
  NewsletterCubit(this._repo, this._settings);

  static const alreadySubscribedCode = 'launch.already_subscribed';

  final LaunchRepository _repo;
  final AppSettingsCubit _settings;

  Future<void> submit(String input) => run(
    validation: ContactInput.validateEmail(input),
    request: () async {
      await _repo.subscribeNewsletter(input.trim(), language: _settings.state.language);
      return false;
    },
    recover: (e) => e.code == alreadySubscribedCode ? true : null,
  );
}
