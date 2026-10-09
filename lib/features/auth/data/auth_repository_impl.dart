import '../../../core/network/api_client.dart';
import '../../../core/session/session_store.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/auth_models.dart';
import '../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api, this._session);

  final ApiClient _api;
  final SessionStore _session;

  Future<AuthResult> _auth(String path, Map<String, dynamic> body) async {
    final result = await _api.post(path, body: body, decode: (j) => AuthResult.fromJson(Decoders.map(j)));
    final token = result.sessionToken;
    if (token != null && token.isNotEmpty) await _session.saveToken(token, result.expiresAt);
    return result;
  }

  @override
  Future<AuthResult> register({
    required String fullName,
    required String email,
    required String password,
    String? phone,
    required bool marketingConsent,
    required bool acceptTerms,
  }) =>
      _auth('/auth/register', {
        'fullName': fullName.trim(),
        'email': email.trim(),
        'password': password,
        'phone': phone,
        'language': _session.language,
        'marketingConsent': marketingConsent,
        'acceptTerms': acceptTerms,
        'rememberMe': true,
      });

  @override
  Future<AuthResult> login({required String identifier, required String password, bool rememberMe = true}) =>
      _auth('/auth/login', {'identifier': identifier.trim(), 'password': password, 'rememberMe': rememberMe});

  @override
  Future<OtpSent> sendOtp({required String phone, OtpPurpose purpose = OtpPurpose.login, OtpChannel channel = OtpChannel.sms}) => _api.post(
        '/auth/otp/send',
        body: {'phone': phone, 'purpose': purpose.wire, 'channel': channel.wire},
        decode: (j) => OtpSent.fromJson(Decoders.map(j)),
      );

  @override
  Future<AuthResult> verifyOtp({required String phone, required String code, String? fullName, required bool acceptTerms, bool marketingConsent = false}) =>
      _auth('/auth/otp/verify', {
        'phone': phone,
        'code': code,
        'fullName': (fullName?.trim().isEmpty ?? true) ? null : fullName!.trim(),
        'acceptTerms': acceptTerms,
        'marketingConsent': marketingConsent,
        'rememberMe': true,
      });

  @override
  Future<AuthResult> google({required String idToken, required bool acceptTerms}) =>
      _auth('/auth/google', {'idToken': idToken, 'rememberMe': true, 'acceptTerms': acceptTerms});

  @override
  Future<AuthResult> apple({required String identityToken, String? fullName, required bool acceptTerms}) =>
      _auth('/auth/apple', {'identityToken': identityToken, 'fullName': fullName, 'rememberMe': true, 'acceptTerms': acceptTerms});

  @override
  Future<void> logout({bool allDevices = false}) async {
    try {
      await _api.post<Object?>('/auth/logout', query: {'allDevices': allDevices ? true : null});
    } finally {
      await _session.clearToken();
    }
  }

  @override
  Future<Me> me() => _api.get('/auth/session', decode: (j) => Me.fromJson(Decoders.map(j)));

  @override
  Future<MessageResponse> forgotPassword(String identifier) =>
      _api.post('/auth/password/forgot', body: {'identifier': identifier.trim()}, decode: (j) => MessageResponse.fromJson(Decoders.map(j)));

  @override
  Future<MessageResponse> resetPassword({required String identifier, required String token, required String newPassword}) => _api.post(
        '/auth/password/reset',
        body: {'identifier': identifier.trim(), 'token': token.trim(), 'newPassword': newPassword},
        decode: (j) => MessageResponse.fromJson(Decoders.map(j)),
      );
}
