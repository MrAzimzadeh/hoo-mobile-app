import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/models.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

/// `AuthResponse` — the mobile transport (`X-Session-Transport: header`) returns the session token in the body.
@freezed
abstract class AuthResult with _$AuthResult {
  const factory AuthResult({String? sessionToken, required DateTime expiresAt, @Default(false) bool isNewUser, required Me user}) = _AuthResult;

  factory AuthResult.fromJson(Map<String, dynamic> json) => _$AuthResultFromJson(json);
}

/// `OtpSent`.
@freezed
abstract class OtpSent with _$OtpSent {
  const factory OtpSent({@Default(60) int resendAfterSeconds, @Default(300) int expiresInSeconds, @Default('') String maskedPhone}) = _OtpSent;

  factory OtpSent.fromJson(Map<String, dynamic> json) => _$OtpSentFromJson(json);
}
