import 'dart:async';

import '../../../core/error/api_exception.dart';
import '../../../core/session/session_store.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/auth_models.dart';
import '../domain/auth_repository.dart';
import 'auth_api.dart';
import 'auth_user_cache.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api, this._session, this._cache);

  final AuthApi _api;
  final SessionStore _session;
  final AuthUserCache _cache;
  final _users = StreamController<Me?>.broadcast();
  Me? _user;

  @override
  Me? get currentUser => _user;

  @override
  Stream<Me?> get userChanges => _users.stream;

  @override
  Future<Me?> restore() async {
    if (!_session.hasSession) {
      await _cache.clear();
      return null;
    }
    final cached = await _cache.read();
    // a sign-in may have finished while the cache was being read — never overwrite a fresher user
    if (cached != null && _user == null && _session.hasSession) _publish(cached);
    return _user;
  }

  @override
  Future<AuthResponse> login({required String identifier, required String password}) async =>
      _accept(await _api.login(LoginRequest(identifier: identifier.trim(), password: password)));

  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    final withLanguage = request.language == null ? request.copyWith(language: AppLanguage.fromCode(_session.language)) : request;
    return _accept(await _api.register(withLanguage));
  }

  @override
  Future<OtpSent> sendOtp({required String phone, OtpPurpose purpose = OtpPurpose.login, OtpChannel channel = OtpChannel.sms}) =>
      _api.sendOtp(SendOtpRequest(phone: phone, purpose: purpose, channel: channel));

  @override
  Future<AuthResponse> verifyOtp(VerifyOtpRequest request) async => _accept(await _api.verifyOtp(request));

  @override
  Future<AuthResponse> signInWithSocial(SocialCredential credential, {bool acceptTerms = false}) async {
    final response = switch (credential) {
      GoogleCredential(:final idToken) => await _api.google(GoogleLoginRequest(idToken: idToken, acceptTerms: acceptTerms)),
      AppleCredential(:final identityToken, :final fullName) => await _api.apple(
        AppleLoginRequest(identityToken: identityToken, fullName: fullName, acceptTerms: acceptTerms),
      ),
    };
    return _accept(response);
  }

  @override
  Future<Me?> refreshSession() async {
    if (!_session.hasSession) {
      await clearLocal();
      return null;
    }
    try {
      final me = await _api.session();
      await _cache.write(me);
      _publish(me);
      return me;
    } on ApiException catch (e) {
      if (e.isUnauthorized) {
        // the interceptor already dropped the token
        await clearLocal();
        return null;
      }
      if (e.isNetwork) return _user ?? await restore();
      rethrow;
    }
  }

  @override
  Future<void> logout({bool allDevices = false}) async {
    try {
      if (_session.hasSession) await _api.logout(allDevices: allDevices);
    } on ApiException {
      // offline or already expired: the local session is cleared regardless
    } finally {
      await _session.clearToken();
      await clearLocal();
    }
  }

  @override
  Future<void> clearLocal() async {
    await _cache.clear();
    _publish(null);
  }

  @override
  Future<void> forgotPassword(String identifier) => _api.forgotPassword(identifier.trim());

  @override
  Future<void> resetPassword(ResetPasswordRequest request) => _api.resetPassword(request);

  Future<AuthResponse> _accept(AuthResponse response) async {
    final token = response.sessionToken;
    if (token == null || token.isEmpty) {
      // the server answered in cookie mode — X-Session-Transport did not reach it (proxy stripping headers?)
      throw const ApiException(statusCode: 500, code: ErrorCodes.unknown);
    }
    await _session.saveToken(token, response.expiresAt);
    await _cache.write(response.user);
    _publish(response.user);
    return response;
  }

  void _publish(Me? user) {
    if (user == _user) return;
    _user = user;
    _users.add(user);
  }

  Future<void> dispose() => _users.close();
}
