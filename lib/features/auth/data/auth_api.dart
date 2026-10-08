import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/domain/models.dart';
import '../domain/auth_models.dart';

/// `/auth/*` endpoints. `X-Session-Transport: header` is added to every request by `SessionInterceptor`, so the
/// sign-in endpoints return the session token in the body instead of a cookie.
class AuthApi {
  const AuthApi(this._api);

  final ApiClient _api;

  Future<AuthResponse> login(LoginRequest request) => _api.post('/auth/login', body: request.toJson(), decode: _auth);

  Future<AuthResponse> register(RegisterRequest request) => _api.post('/auth/register', body: request.toJson(), decode: _auth);

  Future<OtpSent> sendOtp(SendOtpRequest request) => _api.post('/auth/otp/send', body: request.toJson(), decode: (j) => OtpSent.fromJson(Decoders.map(j)));

  Future<AuthResponse> verifyOtp(VerifyOtpRequest request) => _api.post('/auth/otp/verify', body: request.toJson(), decode: _auth);

  Future<AuthResponse> google(GoogleLoginRequest request) => _api.post('/auth/google', body: request.toJson(), decode: _auth);

  Future<AuthResponse> apple(AppleLoginRequest request) => _api.post('/auth/apple', body: request.toJson(), decode: _auth);

  Future<Me> session() => _api.get('/auth/session', decode: (j) => Me.fromJson(Decoders.map(j)));

  /// A 401 here only means the session was already gone — it must not raise the global "unauthorized" event.
  Future<void> logout({bool allDevices = false}) => _api.post<Object?>(
    '/auth/logout',
    query: {if (allDevices) 'allDevices': true},
    options: Options(extra: {'skipSessionReset': true}),
  );

  Future<void> forgotPassword(String identifier) => _api.post<Object?>('/auth/password/forgot', body: {'identifier': identifier});

  Future<void> resetPassword(ResetPasswordRequest request) => _api.post<Object?>('/auth/password/reset', body: request.toJson());

  static AuthResponse _auth(Object? json) => AuthResponse.fromJson(Decoders.map(json));
}
