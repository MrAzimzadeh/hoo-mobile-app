// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnItem _$ReturnItemFromJson(Map<String, dynamic> json) => _ReturnItem(
  orderLineId: json['orderLineId'] as String,
  quantity: (json['quantity'] as num).toInt(),
  exchangeSize: $enumDecodeNullable(_$SizeEnumMap, json['exchangeSize'], unknownValue: Size.unknown),
);

Map<String, dynamic> _$ReturnItemToJson(_ReturnItem instance) => <String, dynamic>{
  'orderLineId': instance.orderLineId,
  'quantity': instance.quantity,
  'exchangeSize': _$SizeEnumMap[instance.exchangeSize],
};

const _$SizeEnumMap = {Size.xs: 'XS', Size.s: 'S', Size.m: 'M', Size.l: 'L', Size.xl: 'XL', Size.xxl: 'XXL', Size.xxxl: '3XL', Size.unknown: ''};

_ReturnInfo _$ReturnInfoFromJson(Map<String, dynamic> json) => _ReturnInfo(
  id: json['id'] as String,
  orderNumber: json['orderNumber'] as String,
  kind: $enumDecodeNullable(_$ReturnKindEnumMap, json['kind']) ?? ReturnKind.returnItem,
  status: $enumDecodeNullable(_$ReturnStatusEnumMap, json['status'], unknownValue: ReturnStatus.unknown) ?? ReturnStatus.unknown,
  channel: $enumDecodeNullable(_$ReturnChannelEnumMap, json['channel'], unknownValue: ReturnChannel.unknown) ?? ReturnChannel.unknown,
  items: (json['items'] as List<dynamic>?)?.map((e) => ReturnItem.fromJson(e as Map<String, dynamic>)).toList() ?? const <ReturnItem>[],
  reason: json['reason'] as String?,
  resolutionNote: json['resolutionNote'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ReturnInfoToJson(_ReturnInfo instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'kind': _$ReturnKindEnumMap[instance.kind]!,
  'status': _$ReturnStatusEnumMap[instance.status]!,
  'channel': _$ReturnChannelEnumMap[instance.channel]!,
  'items': instance.items,
  'reason': instance.reason,
  'resolutionNote': instance.resolutionNote,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$ReturnKindEnumMap = {ReturnKind.returnItem: 'Return', ReturnKind.exchange: 'Exchange'};

const _$ReturnStatusEnumMap = {
  ReturnStatus.requested: 'Requested',
  ReturnStatus.approved: 'Approved',
  ReturnStatus.rejected: 'Rejected',
  ReturnStatus.received: 'Received',
  ReturnStatus.refunded: 'Refunded',
  ReturnStatus.exchanged: 'Exchanged',
  ReturnStatus.unknown: '',
};

const _$ReturnChannelEnumMap = {
  ReturnChannel.customer: 'Customer',
  ReturnChannel.giftReceipt: 'GiftReceipt',
  ReturnChannel.admin: 'Admin',
  ReturnChannel.unknown: '',
};

_GiftReceiptLine _$GiftReceiptLineFromJson(Map<String, dynamic> json) => _GiftReceiptLine(
  lineId: json['lineId'] as String,
  name: json['name'] as String,
  color: json['color'] as String?,
  size: $enumDecodeNullable(_$SizeEnumMap, json['size'], unknownValue: Size.unknown),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  exchangeable: json['exchangeable'] as bool? ?? false,
  availableSizes: (json['availableSizes'] as List<dynamic>?)?.map((e) => $enumDecode(_$SizeEnumMap, e, unknownValue: Size.unknown)).toList() ?? const <Size>[],
);

Map<String, dynamic> _$GiftReceiptLineToJson(_GiftReceiptLine instance) => <String, dynamic>{
  'lineId': instance.lineId,
  'name': instance.name,
  'color': instance.color,
  'size': _$SizeEnumMap[instance.size],
  'quantity': instance.quantity,
  'exchangeable': instance.exchangeable,
  'availableSizes': instance.availableSizes.map((e) => _$SizeEnumMap[e]!).toList(),
};

_GiftReceipt _$GiftReceiptFromJson(Map<String, dynamic> json) => _GiftReceipt(
  receiptCode: json['receiptCode'] as String,
  recipientName: json['recipientName'] as String? ?? '',
  occasion: $enumDecodeNullable(_$OccasionEnumMap, json['occasion'], unknownValue: Occasion.unknown) ?? Occasion.unknown,
  fromName: json['fromName'] as String?,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown) ?? OrderStatus.unknown,
  lines: (json['lines'] as List<dynamic>?)?.map((e) => GiftReceiptLine.fromJson(e as Map<String, dynamic>)).toList() ?? const <GiftReceiptLine>[],
  exchangeAllowed: json['exchangeAllowed'] as bool? ?? false,
  exchangeDeadline: json['exchangeDeadline'] == null ? null : DateTime.parse(json['exchangeDeadline'] as String),
);

Map<String, dynamic> _$GiftReceiptToJson(_GiftReceipt instance) => <String, dynamic>{
  'receiptCode': instance.receiptCode,
  'recipientName': instance.recipientName,
  'occasion': _$OccasionEnumMap[instance.occasion]!,
  'fromName': instance.fromName,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'lines': instance.lines,
  'exchangeAllowed': instance.exchangeAllowed,
  'exchangeDeadline': instance.exchangeDeadline?.toIso8601String(),
};

const _$OccasionEnumMap = {
  Occasion.birthday: 'Birthday',
  Occasion.anniversary: 'Anniversary',
  Occasion.novruz: 'Novruz',
  Occasion.newYear: 'NewYear',
  Occasion.justBecause: 'JustBecause',
  Occasion.unknown: '',
};

const _$OrderStatusEnumMap = {
  OrderStatus.newOrder: 'New',
  OrderStatus.paid: 'Paid',
  OrderStatus.awaitingApproval: 'AwaitingApproval',
  OrderStatus.inProduction: 'InProduction',
  OrderStatus.packed: 'Packed',
  OrderStatus.outForDelivery: 'OutForDelivery',
  OrderStatus.readyForPickup: 'ReadyForPickup',
  OrderStatus.delivered: 'Delivered',
  OrderStatus.cancelled: 'Cancelled',
  OrderStatus.returnRequested: 'ReturnRequested',
  OrderStatus.returned: 'Returned',
  OrderStatus.refunded: 'Refunded',
  OrderStatus.unknown: '',
};
