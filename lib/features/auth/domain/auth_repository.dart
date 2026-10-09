import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'auth_models.dart';

/// `/auth/*`. Every method throws `ApiException`; branch on `code` (`auth.invalid_credentials`, `auth.otp_invalid`,
/// `auth.terms_required`, 429 throttling…). Successful sign-ins persist the session token before returning.
abstract interface class AuthRepository {
  Future<AuthResult> register({
    required String fullName,
    required String email,
    required String password,
    String? phone,
    required bool marketingConsent,
    required bool acceptTerms,
  });

  Future<AuthResult> login({required String identifier, required String password, bool rememberMe = true});

  Future<OtpSent> sendOtp({required String phone, OtpPurpose purpose = OtpPurpose.login, OtpChannel channel = OtpChannel.sms});

  Future<AuthResult> verifyOtp({required String phone, required String code, String? fullName, required bool acceptTerms, bool marketingConsent = false});

  Future<AuthResult> google({required String idToken, required bool acceptTerms});

  Future<AuthResult> apple({required String identityToken, String? fullName, required bool acceptTerms});

  Future<void> logout({bool allDevices = false});

  /// `GET /auth/session`.
  Future<Me> me();

  Future<MessageResponse> forgotPassword(String identifier);

  Future<MessageResponse> resetPassword({required String identifier, required String token, required String newPassword});
}
