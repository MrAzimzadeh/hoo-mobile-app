// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishlistShare _$WishlistShareFromJson(Map<String, dynamic> json) =>
    _WishlistShare(token: json['token'] as String, url: json['url'] as String);

Map<String, dynamic> _$WishlistShareToJson(_WishlistShare instance) =>
    <String, dynamic>{'token': instance.token, 'url': instance.url};

_SharedWishlist _$SharedWishlistFromJson(Map<String, dynamic> json) =>
    _SharedWishlist(
      ownerFirstName: json['ownerFirstName'] as String? ?? '',
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductCard>[],
    );

Map<String, dynamic> _$SharedWishlistToJson(_SharedWishlist instance) =>
    <String, dynamic>{
      'ownerFirstName': instance.ownerFirstName,
      'items': instance.items,
    };

_StockAlert _$StockAlertFromJson(Map<String, dynamic> json) => _StockAlert(
  id: json['id'] as String,
  product: ProductCard.fromJson(json['product'] as Map<String, dynamic>),
  type: $enumDecodeNullable(
    _$StockAlertTypeEnumMap,
    json['type'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  size: $enumDecodeNullable(
    _$SizeEnumMap,
    json['size'],
    unknownValue: Size.unknown,
  ),
  colorId: json['colorId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  notifiedAt: json['notifiedAt'] == null
      ? null
      : DateTime.parse(json['notifiedAt'] as String),
);

Map<String, dynamic> _$StockAlertToJson(_StockAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'type': _$StockAlertTypeEnumMap[instance.type],
      'size': _$SizeEnumMap[instance.size],
      'colorId': instance.colorId,
      'createdAt': instance.createdAt.toIso8601String(),
      'notifiedAt': instance.notifiedAt?.toIso8601String(),
    };

const _$StockAlertTypeEnumMap = {
  StockAlertType.backInStock: 'BackInStock',
  StockAlertType.priceDrop: 'PriceDrop',
};

const _$SizeEnumMap = {
  Size.xs: 'XS',
  Size.s: 'S',
  Size.m: 'M',
  Size.l: 'L',
  Size.xl: 'XL',
  Size.xxl: 'XXL',
  Size.xxxl: '3XL',
  Size.unknown: '',
};

_PickerProduct _$PickerProductFromJson(Map<String, dynamic> json) =>
    _PickerProduct(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      compareAtPrice: (json['compareAtPrice'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toInt(),
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => PickerColor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PickerColor>[],
    );

Map<String, dynamic> _$PickerProductToJson(_PickerProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'price': instance.price,
      'compareAtPrice': instance.compareAtPrice,
      'discountPercent': instance.discountPercent,
      'colors': instance.colors,
    };

_PickerColor _$PickerColorFromJson(Map<String, dynamic> json) => _PickerColor(
  color: ColorInfo.fromJson(json['color'] as Map<String, dynamic>),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => PickerVariant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PickerVariant>[],
);

Map<String, dynamic> _$PickerColorToJson(_PickerColor instance) =>
    <String, dynamic>{
      'color': instance.color,
      'images': instance.images,
      'variants': instance.variants,
    };

_PickerVariant _$PickerVariantFromJson(Map<String, dynamic> json) =>
    _PickerVariant(
      id: json['id'] as String,
      size:
          $enumDecodeNullable(
            _$SizeEnumMap,
            json['size'],
            unknownValue: Size.unknown,
          ) ??
          Size.unknown,
      sku: json['sku'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'] as bool? ?? false,
      lowStockLeft: (json['lowStockLeft'] as num?)?.toInt(),
      preorder: json['preorder'] as bool? ?? false,
    );

Map<String, dynamic> _$PickerVariantToJson(_PickerVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': _$SizeEnumMap[instance.size]!,
      'sku': instance.sku,
      'price': instance.price,
      'inStock': instance.inStock,
      'lowStockLeft': instance.lowStockLeft,
      'preorder': instance.preorder,
    };
