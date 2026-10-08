// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountOverview _$AccountOverviewFromJson(Map<String, dynamic> json) => _AccountOverview(
  fullName: json['fullName'] as String? ?? '',
  ordersCount: (json['ordersCount'] as num?)?.toInt() ?? 0,
  designsCount: (json['designsCount'] as num?)?.toInt() ?? 0,
  wishlistCount: (json['wishlistCount'] as num?)?.toInt() ?? 0,
  activeOrders: (json['activeOrders'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AccountOverviewToJson(_AccountOverview instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'ordersCount': instance.ordersCount,
  'designsCount': instance.designsCount,
  'wishlistCount': instance.wishlistCount,
  'activeOrders': instance.activeOrders,
};

_UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) => _UpdateProfileRequest(
  fullName: json['fullName'] as String,
  language: $enumDecode(_$AppLanguageEnumMap, json['language']),
  marketingConsent: json['marketingConsent'] as bool,
);

Map<String, dynamic> _$UpdateProfileRequestToJson(_UpdateProfileRequest instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'language': _$AppLanguageEnumMap[instance.language]!,
  'marketingConsent': instance.marketingConsent,
};

const _$AppLanguageEnumMap = {AppLanguage.az: 'az', AppLanguage.ru: 'ru', AppLanguage.en: 'en', AppLanguage.tr: 'tr'};

_StyleProfile _$StyleProfileFromJson(Map<String, dynamic> json) => _StyleProfile(
  heightCm: (json['heightCm'] as num?)?.toInt(),
  weightKg: (json['weightKg'] as num?)?.toInt(),
  chestCm: (json['chestCm'] as num?)?.toInt(),
  waistCm: (json['waistCm'] as num?)?.toInt(),
  usualSize: $enumDecodeNullable(_$SizeEnumMap, json['usualSize'], unknownValue: Size.unknown),
  preferredFit: $enumDecodeNullable(_$FitEnumMap, json['preferredFit'], unknownValue: Fit.unknown),
  favoriteColors:
      (json['favoriteColors'] as List<dynamic>?)?.map((e) => $enumDecode(_$ColorFamilyEnumMap, e, unknownValue: ColorFamily.unknown)).toList() ??
      const <ColorFamily>[],
  styles: (json['styles'] as List<dynamic>?)?.map((e) => $enumDecode(_$StyleTagEnumMap, e, unknownValue: StyleTag.unknown)).toList() ?? const <StyleTag>[],
);

Map<String, dynamic> _$StyleProfileToJson(_StyleProfile instance) => <String, dynamic>{
  'heightCm': instance.heightCm,
  'weightKg': instance.weightKg,
  'chestCm': instance.chestCm,
  'waistCm': instance.waistCm,
  'usualSize': _$SizeEnumMap[instance.usualSize],
  'preferredFit': _$FitEnumMap[instance.preferredFit],
  'favoriteColors': instance.favoriteColors.map((e) => _$ColorFamilyEnumMap[e]!).toList(),
  'styles': instance.styles.map((e) => _$StyleTagEnumMap[e]!).toList(),
};

const _$SizeEnumMap = {Size.xs: 'XS', Size.s: 'S', Size.m: 'M', Size.l: 'L', Size.xl: 'XL', Size.xxl: 'XXL', Size.xxxl: '3XL', Size.unknown: ''};

const _$FitEnumMap = {Fit.oversized: 'Oversized', Fit.boxy: 'Boxy', Fit.regular: 'Regular', Fit.fitted: 'Fitted', Fit.cropped: 'Cropped', Fit.unknown: ''};

const _$ColorFamilyEnumMap = {
  ColorFamily.black: 'Black',
  ColorFamily.forest: 'Forest',
  ColorFamily.cream: 'Cream',
  ColorFamily.white: 'White',
  ColorFamily.grey: 'Grey',
  ColorFamily.sand: 'Sand',
  ColorFamily.olive: 'Olive',
  ColorFamily.red: 'Red',
  ColorFamily.unknown: '',
};

const _$StyleTagEnumMap = {
  StyleTag.minimal: 'Minimal',
  StyleTag.streetwear: 'Streetwear',
  StyleTag.graphicPrints: 'GraphicPrints',
  StyleTag.monochrome: 'Monochrome',
  StyleTag.sport: 'Sport',
  StyleTag.vintage: 'Vintage',
  StyleTag.unknown: '',
};

_NotificationPreference _$NotificationPreferenceFromJson(Map<String, dynamic> json) => _NotificationPreference(
  topic: $enumDecode(_$NotificationTopicEnumMap, json['topic'], unknownValue: NotificationTopic.unknown),
  channel: $enumDecode(_$NotificationChannelEnumMap, json['channel'], unknownValue: NotificationChannel.unknown),
  enabled: json['enabled'] as bool,
  locked: json['locked'] as bool? ?? false,
);

Map<String, dynamic> _$NotificationPreferenceToJson(_NotificationPreference instance) => <String, dynamic>{
  'topic': _$NotificationTopicEnumMap[instance.topic]!,
  'channel': _$NotificationChannelEnumMap[instance.channel]!,
  'enabled': instance.enabled,
  'locked': instance.locked,
};

const _$NotificationTopicEnumMap = {
  NotificationTopic.orders: 'Orders',
  NotificationTopic.delivery: 'Delivery',
  NotificationTopic.alerts: 'Alerts',
  NotificationTopic.marketing: 'Marketing',
  NotificationTopic.unknown: '',
};

const _$NotificationChannelEnumMap = {
  NotificationChannel.email: 'Email',
  NotificationChannel.sms: 'Sms',
  NotificationChannel.whatsApp: 'WhatsApp',
  NotificationChannel.push: 'Push',
  NotificationChannel.unknown: '',
};

_ActiveSession _$ActiveSessionFromJson(Map<String, dynamic> json) => _ActiveSession(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastSeenAt: DateTime.parse(json['lastSeenAt'] as String),
  ipAddress: json['ipAddress'] as String?,
  userAgent: json['userAgent'] as String?,
  isCurrent: json['isCurrent'] as bool? ?? false,
);

Map<String, dynamic> _$ActiveSessionToJson(_ActiveSession instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastSeenAt': instance.lastSeenAt.toIso8601String(),
  'ipAddress': instance.ipAddress,
  'userAgent': instance.userAgent,
  'isCurrent': instance.isCurrent,
};
