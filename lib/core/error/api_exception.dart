/// Typed API failure built from an RFC 9457 `application/problem+json` body.
///
/// UI and blocs branch on [code] (stable, e.g. `checkout.cod_limit_exceeded`) — never on [title], which is the
/// server's localized message and is only ever displayed.
class ApiException implements Exception {
  const ApiException({
    required this.statusCode,
    required this.code,
    this.title,
    this.detail,
    this.field,
    this.fieldErrors = const {},
    this.fieldErrorCodes = const {},
    this.args = const {},
    this.retryAfter,
  });

  /// No response at all (offline, DNS, timeout).
  const ApiException.network({this.title})
      : statusCode = 0,
        code = ErrorCodes.network,
        detail = null,
        field = null,
        fieldErrors = const {},
        fieldErrorCodes = const {},
        args = const {},
        retryAfter = null;

  /// The request was cancelled by the client (a stale search/price request) — callers usually ignore it.
  const ApiException.cancelled()
      : statusCode = -1,
        code = ErrorCodes.cancelled,
        title = null,
        detail = null,
        field = null,
        fieldErrors = const {},
        fieldErrorCodes = const {},
        args = const {},
        retryAfter = null;

  final int statusCode;
  final String code;
  final String? title;
  final String? detail;
  final String? field;

  /// Field (camelCase, as sent) → localized messages. Map these onto form fields.
  final Map<String, List<String>> fieldErrors;
  final Map<String, List<String>> fieldErrorCodes;
  final Map<String, Object?> args;

  /// From the `Retry-After` header on 429 (OTP / login throttling) — drives the countdown.
  final Duration? retryAfter;

  bool get isNetwork => statusCode == 0;
  bool get isCancelled => statusCode == -1;
  bool get isValidation => statusCode == 400;
  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;

  /// Slot full, last item sold, invalid transition → refresh the data and explain.
  bool get isConflict => statusCode == 409;

  /// Business rule (COD limit, promo condition…).
  bool get isBusinessRule => statusCode == 422;
  bool get isTooManyRequests => statusCode == 429;

  /// External provider down (EPoint, SMS).
  bool get isExternal => statusCode == 502;
  bool get isComingSoon => statusCode == 503 && code == ErrorCodes.storeComingSoon;

  /// First message for a field, matched case-insensitively (server keys may be `Phone` or `phone`).
  String? fieldError(String name) {
    for (final e in fieldErrors.entries) {
      if (e.key.toLowerCase() == name.toLowerCase() || e.key.toLowerCase().endsWith('.${name.toLowerCase()}')) {
        return e.value.isEmpty ? null : e.value.first;
      }
    }
    return null;
  }

  @override
  String toString() => 'ApiException($statusCode, $code)';
}

/// Error codes the client branches on. The full catalog is served by `GET /meta/errors`.
abstract final class ErrorCodes {
  static const network = 'client.network';
  static const cancelled = 'client.cancelled';
  static const unknown = 'general.unexpected';
  static const validation = 'general.validation';
  static const storeComingSoon = 'store.coming_soon';
  static const rateLimited = 'general.rate_limited';
  static const unauthenticated = 'auth.unauthenticated';
  static const termsRequired = 'auth.terms_required';
  static const invalidCredentials = 'auth.invalid_credentials';
  static const otpResendTooSoon = 'auth.otp_resend_too_soon';
  static const otpInvalid = 'auth.otp_invalid';
  static const otpExpired = 'auth.otp_expired';
  static const concurrencyConflict = 'general.concurrency_conflict';
  static const idempotencyInProgress = 'general.idempotency_in_progress';
  static const checkoutSessionExpired = 'checkout.session_expired';
  static const checkoutSessionNotFound = 'checkout.session_not_found';
  static const checkoutSessionCompleted = 'checkout.session_completed';
  static const checkoutCartChanged = 'checkout.cart_changed';
  static const slotFull = 'delivery.slot_full';
  static const codLimitExceeded = 'checkout.cod_limit_exceeded';
  static const outOfStock = 'catalog.out_of_stock';
  static const designNotEditable = 'studio.design_not_editable';
  static const pricingVersionNotFound = 'studio.pricing_version_not_found';
  static const fileTooLarge = 'file.too_large';
  static const fileTypeNotAllowed = 'file.type_not_allowed';
}
