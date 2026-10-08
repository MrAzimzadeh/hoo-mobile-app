import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

/// Mirrors `Hoo.Application.Identity` auth contracts 1:1 (names, nullability, wire enums).

/// `AuthResponse` — `sessionToken` is only filled because every request carries `X-Session-Transport: header`.
@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({String? sessionToken, required DateTime expiresAt, @Default(false) bool isNewUser, required Me user}) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

/// `OtpSent` — resend cool-down, code lifetime and the masked phone to show.
@freezed
abstract class OtpSent with _$OtpSent {
  const factory OtpSent({@Default(60) int resendAfterSeconds, @Default(300) int expiresInSeconds, @Default('') String maskedPhone}) = _OtpSent;

  factory OtpSent.fromJson(Map<String, dynamic> json) => _$OtpSentFromJson(json);
}

@Freezed(fromJson: false, toJson: true)
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({required String identifier, required String password, @Default(true) bool rememberMe}) = _LoginRequest;
}

@Freezed(fromJson: false, toJson: true)
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String fullName,
    required String email,
    required String password,
    String? phone,
    AppLanguage? language,
    @Default(false) bool marketingConsent,
    @Default(false) bool acceptTerms,
    @Default(true) bool rememberMe,
  }) = _RegisterRequest;
}

@Freezed(fromJson: false, toJson: true)
abstract class SendOtpRequest with _$SendOtpRequest {
  const factory SendOtpRequest({required String phone, @Default(OtpPurpose.login) OtpPurpose purpose, @Default(OtpChannel.sms) OtpChannel channel}) =
      _SendOtpRequest;
}

@Freezed(fromJson: false, toJson: true)
abstract class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String phone,
    required String code,
    String? fullName,
    @Default(false) bool acceptTerms,
    @Default(false) bool marketingConsent,
    @Default(true) bool rememberMe,
  }) = _VerifyOtpRequest;
}

@Freezed(fromJson: false, toJson: true)
abstract class GoogleLoginRequest with _$GoogleLoginRequest {
  const factory GoogleLoginRequest({required String idToken, @Default(true) bool rememberMe, @Default(false) bool acceptTerms}) = _GoogleLoginRequest;
}

@Freezed(fromJson: false, toJson: true)
abstract class AppleLoginRequest with _$AppleLoginRequest {
  const factory AppleLoginRequest({required String identityToken, String? fullName, @Default(true) bool rememberMe, @Default(false) bool acceptTerms}) =
      _AppleLoginRequest;
}

@Freezed(fromJson: false, toJson: true)
abstract class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({required String identifier, required String token, required String newPassword}) = _ResetPasswordRequest;
}

/// A credential obtained from a native identity provider, ready for `POST /auth/google|apple`.
sealed class SocialCredential {
  const SocialCredential();
}

final class GoogleCredential extends SocialCredential {
  const GoogleCredential(this.idToken);
  final String idToken;
}

final class AppleCredential extends SocialCredential {
  const AppleCredential(this.identityToken, {this.fullName});
  final String identityToken;

  /// Apple only shares the name on the very first authorization — forwarded so the account gets a name.
  final String? fullName;
}
