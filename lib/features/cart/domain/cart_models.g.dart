// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  id: json['id'] as String,
  items: (json['items'] as List<dynamic>?)?.map((e) => CartItem.fromJson(e as Map<String, dynamic>)).toList() ?? const <CartItem>[],
  itemsCount: (json['itemsCount'] as num?)?.toInt() ?? 0,
  promo: json['promo'] == null ? null : CartPromo.fromJson(json['promo'] as Map<String, dynamic>),
  isGift: json['isGift'] as bool? ?? false,
  totals: json['totals'] == null ? const CartTotals() : CartTotals.fromJson(json['totals'] as Map<String, dynamic>),
  freeDelivery: json['freeDelivery'] == null ? null : FreeDeliveryProgress.fromJson(json['freeDelivery'] as Map<String, dynamic>),
  canCheckout: json['canCheckout'] as bool? ?? false,
  completeTheLook: (json['completeTheLook'] as List<dynamic>?)?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>)).toList() ?? const <ProductCard>[],
  bestsellers: (json['bestsellers'] as List<dynamic>?)?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>)).toList() ?? const <ProductCard>[],
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items,
  'itemsCount': instance.itemsCount,
  'promo': instance.promo,
  'isGift': instance.isGift,
  'totals': instance.totals,
  'freeDelivery': instance.freeDelivery,
  'canCheckout': instance.canCheckout,
  'completeTheLook': instance.completeTheLook,
  'bestsellers': instance.bestsellers,
};

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: json['id'] as String,
  kind: json['kind'] as String? ?? 'stock',
  productId: json['productId'] as String?,
  productSlug: json['productSlug'] as String?,
  variantId: json['variantId'] as String?,
  designId: json['designId'] as String?,
  name: json['name'] as String,
  color: json['color'] as String?,
  colorHex: json['colorHex'] as String?,
  size: $enumDecodeNullable(_$SizeEnumMap, json['size'], unknownValue: Size.unknown),
  sku: json['sku'] as String?,
  imageUrl: json['imageUrl'] as String?,
  unitPrice: (json['unitPrice'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  lineTotal: (json['lineTotal'] as num).toDouble(),
  adjustments: (json['adjustments'] as List<dynamic>?)?.map((e) => LineAdjustment.fromJson(e as Map<String, dynamic>)).toList() ?? const <LineAdjustment>[],
  stock: $enumDecodeNullable(_$StockStateEnumMap, json['stock'], unknownValue: StockState.unknown) ?? StockState.inStock,
  stockLeft: (json['stockLeft'] as num?)?.toInt(),
  leadTimeDays: (json['leadTimeDays'] as num?)?.toInt(),
  errorCode: json['errorCode'] as String?,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'kind': instance.kind,
  'productId': instance.productId,
  'productSlug': instance.productSlug,
  'variantId': instance.variantId,
  'designId': instance.designId,
  'name': instance.name,
  'color': instance.color,
  'colorHex': instance.colorHex,
  'size': _$SizeEnumMap[instance.size],
  'sku': instance.sku,
  'imageUrl': instance.imageUrl,
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'lineTotal': instance.lineTotal,
  'adjustments': instance.adjustments,
  'stock': _$StockStateEnumMap[instance.stock]!,
  'stockLeft': instance.stockLeft,
  'leadTimeDays': instance.leadTimeDays,
  'errorCode': instance.errorCode,
  'errorMessage': instance.errorMessage,
};

const _$SizeEnumMap = {Size.xs: 'XS', Size.s: 'S', Size.m: 'M', Size.l: 'L', Size.xl: 'XL', Size.xxl: 'XXL', Size.xxxl: '3XL', Size.unknown: ''};

const _$StockStateEnumMap = {
  StockState.inStock: 'InStock',
  StockState.lowStock: 'LowStock',
  StockState.preorder: 'Preorder',
  StockState.outOfStock: 'OutOfStock',
  StockState.madeToOrder: 'MadeToOrder',
  StockState.unavailable: 'Unavailable',
  StockState.unknown: '',
};

_CartPromo _$CartPromoFromJson(Map<String, dynamic> json) => _CartPromo(
  code: json['code'] as String,
  valid: json['valid'] as bool? ?? true,
  errorCode: json['errorCode'] as String?,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$CartPromoToJson(_CartPromo instance) => <String, dynamic>{
  'code': instance.code,
  'valid': instance.valid,
  'errorCode': instance.errorCode,
  'errorMessage': instance.errorMessage,
};

_CartTotals _$CartTotalsFromJson(Map<String, dynamic> json) => _CartTotals(
  subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num?)?.toDouble() ?? 0,
  vatIncluded: (json['vatIncluded'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$CartTotalsToJson(_CartTotals instance) => <String, dynamic>{
  'subtotal': instance.subtotal,
  'discount': instance.discount,
  'total': instance.total,
  'vatIncluded': instance.vatIncluded,
};

_FreeDeliveryProgress _$FreeDeliveryProgressFromJson(Map<String, dynamic> json) => _FreeDeliveryProgress(
  zoneCode: json['zoneCode'] as String,
  threshold: (json['threshold'] as num).toDouble(),
  remaining: (json['remaining'] as num).toDouble(),
  qualifies: json['qualifies'] as bool? ?? false,
);

Map<String, dynamic> _$FreeDeliveryProgressToJson(_FreeDeliveryProgress instance) => <String, dynamic>{
  'zoneCode': instance.zoneCode,
  'threshold': instance.threshold,
  'remaining': instance.remaining,
  'qualifies': instance.qualifies,
};
