import 'package:equatable/equatable.dart';

import '../../../../core/error/api_exception.dart';

/// Client-side validation outcome for one input; resolved to text by the page (blocs have no `BuildContext`).
enum AuthFieldError { required, invalidEmail, invalidPhone, invalidIdentifier, weakPassword, termsRequired, invalidCode }

/// An error shown under one input: a local check or the server's localized field message.
class FieldIssue extends Equatable {
  const FieldIssue.local(AuthFieldError this.code) : message = null;
  const FieldIssue.server(String this.message) : code = null;

  final AuthFieldError? code;
  final String? message;

  @override
  List<Object?> get props => [code, message];
}

/// Auth-specific codes the flows branch on (the rest of the catalog lives in `ErrorCodes`).
abstract final class AuthErrorCodes {
  static const accountLocked = 'auth.account_locked';
  static const accountBlocked = 'auth.account_blocked';
  static const emailTaken = 'auth.email_taken';
  static const phoneTaken = 'auth.phone_taken';
  static const weakPassword = 'auth.weak_password';
  static const otpTooManyAttempts = 'auth.otp_too_many_attempts';
  static const otpDailyLimit = 'auth.otp_daily_limit';
  static const externalTokenInvalid = 'auth.external_token_invalid';
  static const resetTokenInvalid = 'auth.reset_token_invalid';
  static const phoneInvalid = 'phone.invalid';
}

/// Maps the server's field errors (`errors` keyed by camelCase property) onto the form's inputs.
Map<String, FieldIssue> serverFieldIssues(ApiException e, Iterable<String> fields) {
  final out = <String, FieldIssue>{};
  for (final f in fields) {
    final message = e.fieldError(f);
    if (message != null) out[f] = FieldIssue.server(message);
  }
  // single-field problems (`field` + `title`), e.g. `phone.invalid` for "phone"
  final field = e.field;
  if (field != null && e.title != null) {
    for (final f in fields) {
      if (f.toLowerCase() == field.toLowerCase() && !out.containsKey(f)) out[f] = FieldIssue.server(e.title!);
    }
  }
  return out;
}

/// How long to wait after a 429: `Retry-After`, else the problem's `seconds` argument, else [fallback].
Duration throttleOf(ApiException e, {Duration fallback = const Duration(seconds: 60)}) {
  if (e.retryAfter != null && e.retryAfter! > Duration.zero) return e.retryAfter!;
  final seconds = e.args['seconds'];
  if (seconds is num && seconds > 0) return Duration(seconds: seconds.ceil());
  if (seconds is String) {
    final parsed = int.tryParse(seconds);
    if (parsed != null && parsed > 0) return Duration(seconds: parsed);
  }
  return fallback;
}
