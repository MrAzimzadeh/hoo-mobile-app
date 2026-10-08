// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => _AuthResponse(
  sessionToken: json['sessionToken'] as String?,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  isNewUser: json['isNewUser'] as bool? ?? false,
  user: Me.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) => <String, dynamic>{
  'sessionToken': instance.sessionToken,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'isNewUser': instance.isNewUser,
  'user': instance.user,
};

_OtpSent _$OtpSentFromJson(Map<String, dynamic> json) => _OtpSent(
  resendAfterSeconds: (json['resendAfterSeconds'] as num?)?.toInt() ?? 60,
  expiresInSeconds: (json['expiresInSeconds'] as num?)?.toInt() ?? 300,
  maskedPhone: json['maskedPhone'] as String? ?? '',
);

Map<String, dynamic> _$OtpSentToJson(_OtpSent instance) => <String, dynamic>{
  'resendAfterSeconds': instance.resendAfterSeconds,
  'expiresInSeconds': instance.expiresInSeconds,
  'maskedPhone': instance.maskedPhone,
};

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) => <String, dynamic>{
  'identifier': instance.identifier,
  'password': instance.password,
  'rememberMe': instance.rememberMe,
};

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'email': instance.email,
  'password': instance.password,
  'phone': instance.phone,
  'language': _$AppLanguageEnumMap[instance.language],
  'marketingConsent': instance.marketingConsent,
  'acceptTerms': instance.acceptTerms,
  'rememberMe': instance.rememberMe,
};

const _$AppLanguageEnumMap = {AppLanguage.az: 'az', AppLanguage.ru: 'ru', AppLanguage.en: 'en', AppLanguage.tr: 'tr'};

Map<String, dynamic> _$SendOtpRequestToJson(_SendOtpRequest instance) => <String, dynamic>{
  'phone': instance.phone,
  'purpose': _$OtpPurposeEnumMap[instance.purpose]!,
  'channel': _$OtpChannelEnumMap[instance.channel]!,
};

const _$OtpPurposeEnumMap = {OtpPurpose.login: 'Login', OtpPurpose.resetPassword: 'ResetPassword', OtpPurpose.verifyPhone: 'VerifyPhone'};

const _$OtpChannelEnumMap = {OtpChannel.sms: 'Sms', OtpChannel.whatsApp: 'WhatsApp'};

Map<String, dynamic> _$VerifyOtpRequestToJson(_VerifyOtpRequest instance) => <String, dynamic>{
  'phone': instance.phone,
  'code': instance.code,
  'fullName': instance.fullName,
  'acceptTerms': instance.acceptTerms,
  'marketingConsent': instance.marketingConsent,
  'rememberMe': instance.rememberMe,
};

Map<String, dynamic> _$GoogleLoginRequestToJson(_GoogleLoginRequest instance) => <String, dynamic>{
  'idToken': instance.idToken,
  'rememberMe': instance.rememberMe,
  'acceptTerms': instance.acceptTerms,
};

Map<String, dynamic> _$AppleLoginRequestToJson(_AppleLoginRequest instance) => <String, dynamic>{
  'identityToken': instance.identityToken,
  'fullName': instance.fullName,
  'rememberMe': instance.rememberMe,
  'acceptTerms': instance.acceptTerms,
};

Map<String, dynamic> _$ResetPasswordRequestToJson(_ResetPasswordRequest instance) => <String, dynamic>{
  'identifier': instance.identifier,
  'token': instance.token,
  'newPassword': instance.newPassword,
};
