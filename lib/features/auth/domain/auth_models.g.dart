// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResult _$AuthResultFromJson(Map<String, dynamic> json) => _AuthResult(
  sessionToken: json['sessionToken'] as String?,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  isNewUser: json['isNewUser'] as bool? ?? false,
  user: Me.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthResultToJson(_AuthResult instance) =>
    <String, dynamic>{
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
