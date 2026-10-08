// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ColorInfo _$ColorInfoFromJson(Map<String, dynamic> json) => _ColorInfo(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  hex: json['hex'] as String,
  family:
      $enumDecodeNullable(
        _$ColorFamilyEnumMap,
        json['family'],
        unknownValue: ColorFamily.unknown,
      ) ??
      ColorFamily.unknown,
);

Map<String, dynamic> _$ColorInfoToJson(_ColorInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hex': instance.hex,
      'family': _$ColorFamilyEnumMap[instance.family]!,
    };

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

_ProductCard _$ProductCardFromJson(Map<String, dynamic> json) => _ProductCard(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  compareAtPrice: (json['compareAtPrice'] as num?)?.toDouble(),
  discountPercent: (json['discountPercent'] as num?)?.toInt(),
  badges:
      (json['badges'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  colorsCount: (json['colorsCount'] as num?)?.toInt() ?? 0,
  defaultColor: json['defaultColor'] == null
      ? null
      : ColorInfo.fromJson(json['defaultColor'] as Map<String, dynamic>),
  colorHexes:
      (json['colorHexes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  imageUrl: json['imageUrl'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
  inStock: json['inStock'] as bool? ?? true,
);

Map<String, dynamic> _$ProductCardToJson(_ProductCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'price': instance.price,
      'compareAtPrice': instance.compareAtPrice,
      'discountPercent': instance.discountPercent,
      'badges': instance.badges,
      'colorsCount': instance.colorsCount,
      'defaultColor': instance.defaultColor,
      'colorHexes': instance.colorHexes,
      'imageUrl': instance.imageUrl,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'inStock': instance.inStock,
    };

_Paged<T> _$PagedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Paged<T>(
  items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
  page: (json['page'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt(),
  hasMore: json['hasMore'] as bool?,
);

Map<String, dynamic> _$PagedToJson<T>(
  _Paged<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': instance.items.map(toJsonT).toList(),
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
  'hasMore': instance.hasMore,
};

_Me _$MeFromJson(Map<String, dynamic> json) => _Me(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  emailVerified: json['emailVerified'] as bool? ?? false,
  phoneVerified: json['phoneVerified'] as bool? ?? false,
  language:
      $enumDecodeNullable(_$AppLanguageEnumMap, json['language']) ??
      AppLanguage.az,
  marketingConsent: json['marketingConsent'] as bool? ?? false,
  hasPassword: json['hasPassword'] as bool? ?? false,
  hasStyleProfile: json['hasStyleProfile'] as bool? ?? false,
  roles:
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  permissions:
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$MeToJson(_Me instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'emailVerified': instance.emailVerified,
  'phoneVerified': instance.phoneVerified,
  'language': _$AppLanguageEnumMap[instance.language]!,
  'marketingConsent': instance.marketingConsent,
  'hasPassword': instance.hasPassword,
  'hasStyleProfile': instance.hasStyleProfile,
  'roles': instance.roles,
  'permissions': instance.permissions,
};

const _$AppLanguageEnumMap = {
  AppLanguage.az: 'az',
  AppLanguage.ru: 'ru',
  AppLanguage.en: 'en',
  AppLanguage.tr: 'tr',
};

_StoreContacts _$StoreContactsFromJson(Map<String, dynamic> json) =>
    _StoreContacts(
      phone: json['phone'] as String? ?? '',
      whatsApp: json['whatsApp'] as String?,
      email: json['email'] as String?,
      instagram: json['instagram'] as String?,
      tikTok: json['tikTok'] as String?,
      telegram: json['telegram'] as String?,
    );

Map<String, dynamic> _$StoreContactsToJson(_StoreContacts instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'whatsApp': instance.whatsApp,
      'email': instance.email,
      'instagram': instance.instagram,
      'tikTok': instance.tikTok,
      'telegram': instance.telegram,
    };

_StoreInfo _$StoreInfoFromJson(Map<String, dynamic> json) => _StoreInfo(
  mode: $enumDecodeNullable(_$StoreModeEnumMap, json['mode']) ?? StoreMode.live,
  launchAt: json['launchAt'] == null
      ? null
      : DateTime.parse(json['launchAt'] as String),
  contacts: json['contacts'] == null
      ? const StoreContacts()
      : StoreContacts.fromJson(json['contacts'] as Map<String, dynamic>),
  currency: json['currency'] as String? ?? 'AZN',
  defaultLanguage:
      $enumDecodeNullable(_$AppLanguageEnumMap, json['defaultLanguage']) ??
      AppLanguage.az,
  languages:
      (json['languages'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AppLanguageEnumMap, e))
          .toList() ??
      AppLanguage.values,
  vatRate: (json['vatRate'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$StoreInfoToJson(
  _StoreInfo instance,
) => <String, dynamic>{
  'mode': _$StoreModeEnumMap[instance.mode]!,
  'launchAt': instance.launchAt?.toIso8601String(),
  'contacts': instance.contacts,
  'currency': instance.currency,
  'defaultLanguage': _$AppLanguageEnumMap[instance.defaultLanguage]!,
  'languages': instance.languages.map((e) => _$AppLanguageEnumMap[e]!).toList(),
  'vatRate': instance.vatRate,
};

const _$StoreModeEnumMap = {
  StoreMode.comingSoon: 'ComingSoon',
  StoreMode.live: 'Live',
};

_DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    _DeliveryAddress(
      city: json['city'] as String,
      district: json['district'] as String?,
      street: json['street'] as String,
      apartment: json['apartment'] as String?,
      courierNote: json['courierNote'] as String?,
    );

Map<String, dynamic> _$DeliveryAddressToJson(_DeliveryAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'district': instance.district,
      'street': instance.street,
      'apartment': instance.apartment,
      'courierNote': instance.courierNote,
    };

_ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => _ContactInfo(
  fullName: json['fullName'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
);

Map<String, dynamic> _$ContactInfoToJson(_ContactInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
    };

_SavedAddress _$SavedAddressFromJson(Map<String, dynamic> json) =>
    _SavedAddress(
      id: json['id'] as String,
      label: json['label'] as String,
      address: DeliveryAddress.fromJson(
        json['address'] as Map<String, dynamic>,
      ),
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$SavedAddressToJson(_SavedAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'address': instance.address,
      'isDefault': instance.isDefault,
    };

_SavedCard _$SavedCardFromJson(Map<String, dynamic> json) => _SavedCard(
  id: json['id'] as String,
  brand: json['brand'] as String,
  maskedPan: json['maskedPan'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$SavedCardToJson(_SavedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'maskedPan': instance.maskedPan,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    _MessageResponse(
      code: json['code'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$MessageResponseToJson(_MessageResponse instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};

_LineAdjustment _$LineAdjustmentFromJson(Map<String, dynamic> json) =>
    _LineAdjustment(
      type: $enumDecode(
        _$AdjustmentTypeEnumMap,
        json['type'],
        unknownValue: AdjustmentType.unknown,
      ),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$LineAdjustmentToJson(_LineAdjustment instance) =>
    <String, dynamic>{
      'type': _$AdjustmentTypeEnumMap[instance.type]!,
      'amount': instance.amount,
    };

const _$AdjustmentTypeEnumMap = {
  AdjustmentType.promoDiscount: 'PromoDiscount',
  AdjustmentType.delivery: 'Delivery',
  AdjustmentType.giftPackaging: 'GiftPackaging',
  AdjustmentType.greetingCard: 'GreetingCard',
  AdjustmentType.studioVolumeDiscount: 'StudioVolumeDiscount',
  AdjustmentType.studioRushFee: 'StudioRushFee',
  AdjustmentType.studioSetupFee: 'StudioSetupFee',
  AdjustmentType.unknown: '',
};
