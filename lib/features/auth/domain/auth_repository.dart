import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'auth_models.dart';

/// Sessions and the signed-in user. Every successful sign-in stores the session token through `SessionStore`
/// and publishes the user on [userChanges]. All methods throw `ApiException`.
abstract interface class AuthRepository {
  Me? get currentUser;
  Stream<Me?> get userChanges;

  /// Restores the last known user from the secure cache (offline start). No network.
  Future<Me?> restore();

  Future<AuthResponse> login({required String identifier, required String password});

  Future<AuthResponse> register(RegisterRequest request);

  Future<OtpSent> sendOtp({required String phone, OtpPurpose purpose = OtpPurpose.login, OtpChannel channel = OtpChannel.sms});

  Future<AuthResponse> verifyOtp(VerifyOtpRequest request);

  Future<AuthResponse> signInWithSocial(SocialCredential credential, {bool acceptTerms = false});

  /// `GET /auth/session`. Clears the local user on 401; keeps it on network errors.
  Future<Me?> refreshSession();

  /// `POST /auth/logout`. The local session is cleared even when the call fails (offline, already expired).
  Future<void> logout({bool allDevices = false});

  /// The server already cleared the session (a 401 elsewhere) — drop the local user only.
  Future<void> clearLocal();

  Future<void> forgotPassword(String identifier);

  Future<void> resetPassword(ResetPasswordRequest request);
}
