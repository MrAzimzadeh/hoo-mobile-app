// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentlyViewed _$RecentlyViewedFromJson(Map<String, dynamic> json) =>
    _RecentlyViewed(
      product: ProductCard.fromJson(json['product'] as Map<String, dynamic>),
      viewedAt: DateTime.parse(json['viewedAt'] as String),
    );

Map<String, dynamic> _$RecentlyViewedToJson(_RecentlyViewed instance) =>
    <String, dynamic>{
      'product': instance.product,
      'viewedAt': instance.viewedAt.toIso8601String(),
    };

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
  type: $enumDecode(_$StockAlertTypeEnumMap, json['type']),
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
      'type': _$StockAlertTypeEnumMap[instance.type]!,
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
