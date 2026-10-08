import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../error/api_exception.dart';
import '../../session/session_store.dart';
import '../problem_mapper.dart';

/// 1. Session authorization — `Authorization: Session <token>` and `X-Session-Transport: header`
/// (so login/register/OTP/Google/Apple return the token in the body instead of a cookie). No cookies, no CSRF.
class SessionInterceptor extends Interceptor {
  SessionInterceptor(this._session);
  final SessionStore _session;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Session-Transport'] = 'header';
    final token = _session.token;
    if (token != null) options.headers['Authorization'] = 'Session $token';
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;
    final hadToken = err.requestOptions.headers.containsKey('Authorization');
    // 401 with a token → the session died server-side: clear it and let the shell route to Welcome.
    if (status == 401 && hadToken && !(err.requestOptions.extra['skipSessionReset'] == true)) {
      await _session.clearToken();
      _session.emit(SessionEvent.unauthorized);
    }
    if (status == 503) {
      final code = ProblemMapper.codeOf(err.response?.data);
      if (code == ErrorCodes.storeComingSoon) _session.emit(SessionEvent.storeComingSoon);
    }
    handler.next(err);
  }
}

/// 2. Guest id — lets guests keep a bag and Studio designs (`POST /guest` issues it on first launch).
class GuestInterceptor extends Interceptor {
  GuestInterceptor(this._session);
  final SessionStore _session;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final id = _session.guestId;
    if (id != null) options.headers['X-Guest-Id'] = id;
    handler.next(options);
  }
}

/// 3. Language — every server message (errors included) comes back in it.
class LanguageInterceptor extends Interceptor {
  LanguageInterceptor(this._session);
  final SessionStore _session;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = _session.language;
    handler.next(options);
  }
}

/// 4. Idempotency — callers put a per-action UUID in `extra['idempotencyKey']` and reuse it on retry
/// (place-order, payment retry). `IdempotencyInterceptor.newKey()` creates one.
class IdempotencyInterceptor extends Interceptor {
  static const extraKey = 'idempotencyKey';
  static String newKey() => const Uuid().v4();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final key = options.extra[extraKey];
    if (key is String && key.isNotEmpty) options.headers['Idempotency-Key'] = key;
    handler.next(options);
  }
}

/// 5. Development-only request log. Authorization, guest id, idempotency keys and bodies of auth/payment calls
/// are redacted — tokens and payment data never reach logs.
class RedactingLogInterceptor extends Interceptor {
  static const _redactedHeaders = {'authorization', 'x-guest-id', 'idempotency-key', 'cookie', 'set-cookie'};
  static final _sensitivePaths = RegExp(r'/auth/|/payment|/checkout/.+/place-order|/account/payment-methods');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = {
      for (final e in options.headers.entries) e.key: _redactedHeaders.contains(e.key.toLowerCase()) ? '‹redacted›' : e.value,
    };
    final body = _sensitivePaths.hasMatch(options.path) ? '‹redacted›' : options.data is FormData ? '‹multipart›' : options.data;
    debugPrint('[api] → ${options.method} ${options.uri} $headers ${body ?? ''}');
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    debugPrint('[api] ← ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('[api] ✕ ${err.response?.statusCode ?? err.type.name} ${err.requestOptions.method} ${err.requestOptions.path} '
        '${ProblemMapper.codeOf(err.response?.data) ?? ''}');
    handler.next(err);
  }
}
