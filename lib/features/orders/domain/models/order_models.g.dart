// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderListItem _$OrderListItemFromJson(Map<String, dynamic> json) => _OrderListItem(
  id: json['id'] as String,
  number: json['number'] as String,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown) ?? OrderStatus.unknown,
  types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
  customerName: json['customerName'] as String? ?? '',
  customerPhone: json['customerPhone'] as String? ?? '',
  total: (json['total'] as num?)?.toDouble() ?? 0,
  paymentMethod: $enumDecodeNullable(_$PaymentMethodEnumMap, json['paymentMethod'], unknownValue: PaymentMethod.unknown),
  paymentStatus: $enumDecodeNullable(_$PaymentStatusEnumMap, json['paymentStatus'], unknownValue: PaymentStatus.unknown),
  zoneCode: json['zoneCode'] as String? ?? '',
  slotDate: json['slotDate'] == null ? null : DateTime.parse(json['slotDate'] as String),
  itemsCount: (json['itemsCount'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  thumbnailUrl: json['thumbnailUrl'] as String?,
);

Map<String, dynamic> _$OrderListItemToJson(_OrderListItem instance) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'types': instance.types,
  'customerName': instance.customerName,
  'customerPhone': instance.customerPhone,
  'total': instance.total,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod],
  'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus],
  'zoneCode': instance.zoneCode,
  'slotDate': instance.slotDate?.toIso8601String(),
  'itemsCount': instance.itemsCount,
  'createdAt': instance.createdAt.toIso8601String(),
  'thumbnailUrl': instance.thumbnailUrl,
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

const _$PaymentMethodEnumMap = {
  PaymentMethod.applePay: 'ApplePay',
  PaymentMethod.googlePay: 'GooglePay',
  PaymentMethod.card: 'Card',
  PaymentMethod.savedCard: 'SavedCard',
  PaymentMethod.cashOnDelivery: 'CashOnDelivery',
  PaymentMethod.cardOnDelivery: 'CardOnDelivery',
  PaymentMethod.invoice: 'Invoice',
  PaymentMethod.unknown: '',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'Pending',
  PaymentStatus.captured: 'Captured',
  PaymentStatus.failed: 'Failed',
  PaymentStatus.cancelled: 'Cancelled',
  PaymentStatus.refunded: 'Refunded',
  PaymentStatus.partiallyRefunded: 'PartiallyRefunded',
  PaymentStatus.unknown: '',
};

_OrderDelivery _$OrderDeliveryFromJson(Map<String, dynamic> json) => _OrderDelivery(
  zoneCode: json['zoneCode'] as String? ?? '',
  zoneName: json['zoneName'] as String? ?? '',
  kind: $enumDecodeNullable(_$DeliveryKindEnumMap, json['kind'], unknownValue: DeliveryKind.unknown) ?? DeliveryKind.unknown,
  address: json['address'] == null ? null : DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
  slotDate: json['slotDate'] == null ? null : DateTime.parse(json['slotDate'] as String),
  slotStart: json['slotStart'] as String?,
  slotEnd: json['slotEnd'] as String?,
  courierFirstName: json['courierFirstName'] as String?,
  courierEtaMinutes: (json['courierEtaMinutes'] as num?)?.toInt(),
  courierStopsAway: (json['courierStopsAway'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderDeliveryToJson(_OrderDelivery instance) => <String, dynamic>{
  'zoneCode': instance.zoneCode,
  'zoneName': instance.zoneName,
  'kind': _$DeliveryKindEnumMap[instance.kind]!,
  'address': instance.address,
  'slotDate': instance.slotDate?.toIso8601String(),
  'slotStart': instance.slotStart,
  'slotEnd': instance.slotEnd,
  'courierFirstName': instance.courierFirstName,
  'courierEtaMinutes': instance.courierEtaMinutes,
  'courierStopsAway': instance.courierStopsAway,
};

const _$DeliveryKindEnumMap = {DeliveryKind.courier: 'Courier', DeliveryKind.post: 'Post', DeliveryKind.pickup: 'Pickup', DeliveryKind.unknown: ''};

_OrderLineDesignSpec _$OrderLineDesignSpecFromJson(Map<String, dynamic> json) => _OrderLineDesignSpec(
  baseCode: json['baseCode'] as String? ?? '',
  fit: $enumDecodeNullable(_$FitEnumMap, json['fit'], unknownValue: Fit.unknown) ?? Fit.unknown,
  fabricCode: json['fabricCode'] as String? ?? '',
  colorName: json['colorName'] as String?,
  colorHex: json['colorHex'] as String?,
  size: $enumDecodeNullable(_$SizeEnumMap, json['size'], unknownValue: Size.unknown),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  rush: json['rush'] as bool? ?? false,
);

Map<String, dynamic> _$OrderLineDesignSpecToJson(_OrderLineDesignSpec instance) => <String, dynamic>{
  'baseCode': instance.baseCode,
  'fit': _$FitEnumMap[instance.fit]!,
  'fabricCode': instance.fabricCode,
  'colorName': instance.colorName,
  'colorHex': instance.colorHex,
  'size': _$SizeEnumMap[instance.size],
  'quantity': instance.quantity,
  'rush': instance.rush,
};

const _$FitEnumMap = {Fit.oversized: 'Oversized', Fit.boxy: 'Boxy', Fit.regular: 'Regular', Fit.fitted: 'Fitted', Fit.cropped: 'Cropped', Fit.unknown: ''};

const _$SizeEnumMap = {Size.xs: 'XS', Size.s: 'S', Size.m: 'M', Size.l: 'L', Size.xl: 'XL', Size.xxl: 'XXL', Size.xxxl: '3XL', Size.unknown: ''};

_OrderLineDesign _$OrderLineDesignFromJson(Map<String, dynamic> json) => _OrderLineDesign(
  designId: json['designId'] as String,
  name: json['name'] as String? ?? '',
  status: $enumDecodeNullable(_$DesignStatusEnumMap, json['status'], unknownValue: DesignStatus.unknown) ?? DesignStatus.unknown,
  spec: json['spec'] == null ? null : OrderLineDesignSpec.fromJson(json['spec'] as Map<String, dynamic>),
  mockupUrls: (json['mockupUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
  shareToken: json['shareToken'] as String?,
  shareUrl: json['shareUrl'] as String?,
);

Map<String, dynamic> _$OrderLineDesignToJson(_OrderLineDesign instance) => <String, dynamic>{
  'designId': instance.designId,
  'name': instance.name,
  'status': _$DesignStatusEnumMap[instance.status]!,
  'spec': instance.spec,
  'mockupUrls': instance.mockupUrls,
  'shareToken': instance.shareToken,
  'shareUrl': instance.shareUrl,
};

const _$DesignStatusEnumMap = {
  DesignStatus.draft: 'Draft',
  DesignStatus.submitted: 'Submitted',
  DesignStatus.changesRequested: 'ChangesRequested',
  DesignStatus.approved: 'Approved',
  DesignStatus.inProduction: 'InProduction',
  DesignStatus.ready: 'Ready',
  DesignStatus.cancelled: 'Cancelled',
  DesignStatus.unknown: '',
};

_OrderLine _$OrderLineFromJson(Map<String, dynamic> json) => _OrderLine(
  id: json['id'] as String,
  kind: $enumDecodeNullable(_$OrderLineKindEnumMap, json['kind'], unknownValue: OrderLineKind.unknown) ?? OrderLineKind.stock,
  productId: json['productId'] as String?,
  designId: json['designId'] as String?,
  name: json['name'] as String,
  color: json['color'] as String?,
  size: $enumDecodeNullable(_$SizeEnumMap, json['size'], unknownValue: Size.unknown),
  sku: json['sku'] as String?,
  imageUrl: json['imageUrl'] as String?,
  unitPrice: (json['unitPrice'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  lineTotal: (json['lineTotal'] as num?)?.toDouble(),
  nonReturnable: json['nonReturnable'] as bool? ?? false,
  design: json['design'] == null ? null : OrderLineDesign.fromJson(json['design'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderLineToJson(_OrderLine instance) => <String, dynamic>{
  'id': instance.id,
  'kind': _$OrderLineKindEnumMap[instance.kind]!,
  'productId': instance.productId,
  'designId': instance.designId,
  'name': instance.name,
  'color': instance.color,
  'size': _$SizeEnumMap[instance.size],
  'sku': instance.sku,
  'imageUrl': instance.imageUrl,
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'lineTotal': instance.lineTotal,
  'nonReturnable': instance.nonReturnable,
  'design': instance.design,
};

const _$OrderLineKindEnumMap = {OrderLineKind.stock: 'Stock', OrderLineKind.custom: 'Custom', OrderLineKind.unknown: ''};

_OrderAdjustment _$OrderAdjustmentFromJson(Map<String, dynamic> json) => _OrderAdjustment(
  type: $enumDecodeNullable(_$AdjustmentTypeEnumMap, json['type'], unknownValue: AdjustmentType.unknown) ?? AdjustmentType.unknown,
  amount: (json['amount'] as num).toDouble(),
  label: json['label'] as String?,
  orderLineId: json['orderLineId'] as String?,
);

Map<String, dynamic> _$OrderAdjustmentToJson(_OrderAdjustment instance) => <String, dynamic>{
  'type': _$AdjustmentTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'label': instance.label,
  'orderLineId': instance.orderLineId,
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

_OrderTotals _$OrderTotalsFromJson(Map<String, dynamic> json) => _OrderTotals(
  subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
  delivery: (json['delivery'] as num?)?.toDouble() ?? 0,
  giftPackaging: (json['giftPackaging'] as num?)?.toDouble() ?? 0,
  greetingCard: (json['greetingCard'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num?)?.toDouble() ?? 0,
  vatIncluded: (json['vatIncluded'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$OrderTotalsToJson(_OrderTotals instance) => <String, dynamic>{
  'subtotal': instance.subtotal,
  'discount': instance.discount,
  'delivery': instance.delivery,
  'giftPackaging': instance.giftPackaging,
  'greetingCard': instance.greetingCard,
  'total': instance.total,
  'vatIncluded': instance.vatIncluded,
};

_OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) => _OrderPayment(
  method: $enumDecodeNullable(_$PaymentMethodEnumMap, json['method'], unknownValue: PaymentMethod.unknown) ?? PaymentMethod.unknown,
  status: $enumDecodeNullable(_$PaymentStatusEnumMap, json['status'], unknownValue: PaymentStatus.unknown) ?? PaymentStatus.unknown,
  cardMask: json['cardMask'] as String?,
  transactionId: json['transactionId'] as String?,
);

Map<String, dynamic> _$OrderPaymentToJson(_OrderPayment instance) => <String, dynamic>{
  'method': _$PaymentMethodEnumMap[instance.method]!,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'cardMask': instance.cardMask,
  'transactionId': instance.transactionId,
};

_OrderGift _$OrderGiftFromJson(Map<String, dynamic> json) => _OrderGift(
  recipientName: json['recipientName'] as String? ?? '',
  recipientPhone: json['recipientPhone'] as String? ?? '',
  occasion: $enumDecodeNullable(_$OccasionEnumMap, json['occasion'], unknownValue: Occasion.unknown) ?? Occasion.unknown,
  surprise: json['surprise'] as bool? ?? false,
  packaging: json['packaging'] as String? ?? '',
  cardType: json['cardType'] as String? ?? '',
  cardDesign: json['cardDesign'] as String?,
  message: json['message'] as String?,
  fromName: json['fromName'] as String?,
  hidePrices: json['hidePrices'] as bool? ?? false,
  receiptCode: json['receiptCode'] as String?,
);

Map<String, dynamic> _$OrderGiftToJson(_OrderGift instance) => <String, dynamic>{
  'recipientName': instance.recipientName,
  'recipientPhone': instance.recipientPhone,
  'occasion': _$OccasionEnumMap[instance.occasion]!,
  'surprise': instance.surprise,
  'packaging': instance.packaging,
  'cardType': instance.cardType,
  'cardDesign': instance.cardDesign,
  'message': instance.message,
  'fromName': instance.fromName,
  'hidePrices': instance.hidePrices,
  'receiptCode': instance.receiptCode,
};

const _$OccasionEnumMap = {
  Occasion.birthday: 'Birthday',
  Occasion.anniversary: 'Anniversary',
  Occasion.novruz: 'Novruz',
  Occasion.newYear: 'NewYear',
  Occasion.justBecause: 'JustBecause',
  Occasion.unknown: '',
};

_OrderEvent _$OrderEventFromJson(Map<String, dynamic> json) => _OrderEvent(
  type: $enumDecodeNullable(_$OrderEventTypeEnumMap, json['type'], unknownValue: OrderEventType.unknown) ?? OrderEventType.unknown,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown) ?? OrderStatus.unknown,
  actor: $enumDecodeNullable(_$ActorKindEnumMap, json['actor'], unknownValue: ActorKind.unknown) ?? ActorKind.unknown,
  occurredAt: DateTime.parse(json['occurredAt'] as String),
  note: json['note'] as String?,
  data: (json['data'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String?)),
);

Map<String, dynamic> _$OrderEventToJson(_OrderEvent instance) => <String, dynamic>{
  'type': _$OrderEventTypeEnumMap[instance.type]!,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'actor': _$ActorKindEnumMap[instance.actor]!,
  'occurredAt': instance.occurredAt.toIso8601String(),
  'note': instance.note,
  'data': instance.data,
};

const _$OrderEventTypeEnumMap = {
  OrderEventType.placed: 'Placed',
  OrderEventType.statusChanged: 'StatusChanged',
  OrderEventType.paymentCaptured: 'PaymentCaptured',
  OrderEventType.paymentFailed: 'PaymentFailed',
  OrderEventType.courierAssigned: 'CourierAssigned',
  OrderEventType.courierEtaUpdated: 'CourierEtaUpdated',
  OrderEventType.slotChanged: 'SlotChanged',
  OrderEventType.refundIssued: 'RefundIssued',
  OrderEventType.giftMessageEdited: 'GiftMessageEdited',
  OrderEventType.returnRequested: 'ReturnRequested',
  OrderEventType.returnUpdated: 'ReturnUpdated',
  OrderEventType.designApproved: 'DesignApproved',
  OrderEventType.designChangesRequested: 'DesignChangesRequested',
  OrderEventType.unknown: '',
};

const _$ActorKindEnumMap = {
  ActorKind.customer: 'Customer',
  ActorKind.staff: 'Staff',
  ActorKind.courier: 'Courier',
  ActorKind.system: 'System',
  ActorKind.gateway: 'Gateway',
  ActorKind.unknown: '',
};

_OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => _OrderDetail(
  id: json['id'] as String,
  number: json['number'] as String,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown) ?? OrderStatus.unknown,
  types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
  createdAt: DateTime.parse(json['createdAt'] as String),
  source: $enumDecodeNullable(_$OrderSourceEnumMap, json['source'], unknownValue: OrderSource.unknown) ?? OrderSource.unknown,
  contact: ContactInfo.fromJson(json['contact'] as Map<String, dynamic>),
  delivery: OrderDelivery.fromJson(json['delivery'] as Map<String, dynamic>),
  lines: (json['lines'] as List<dynamic>?)?.map((e) => OrderLine.fromJson(e as Map<String, dynamic>)).toList() ?? const <OrderLine>[],
  adjustments: (json['adjustments'] as List<dynamic>?)?.map((e) => OrderAdjustment.fromJson(e as Map<String, dynamic>)).toList() ?? const <OrderAdjustment>[],
  totals: json['totals'] == null ? null : OrderTotals.fromJson(json['totals'] as Map<String, dynamic>),
  payment: json['payment'] == null ? null : OrderPayment.fromJson(json['payment'] as Map<String, dynamic>),
  gift: json['gift'] == null ? null : OrderGift.fromJson(json['gift'] as Map<String, dynamic>),
  timeline: (json['timeline'] as List<dynamic>?)?.map((e) => OrderEvent.fromJson(e as Map<String, dynamic>)).toList() ?? const <OrderEvent>[],
  canChangeSlot: json['canChangeSlot'] as bool? ?? false,
  canReturn: json['canReturn'] as bool? ?? false,
  canPay: json['canPay'] as bool? ?? false,
);

Map<String, dynamic> _$OrderDetailToJson(_OrderDetail instance) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'types': instance.types,
  'createdAt': instance.createdAt.toIso8601String(),
  'source': _$OrderSourceEnumMap[instance.source]!,
  'contact': instance.contact,
  'delivery': instance.delivery,
  'lines': instance.lines,
  'adjustments': instance.adjustments,
  'totals': instance.totals,
  'payment': instance.payment,
  'gift': instance.gift,
  'timeline': instance.timeline,
  'canChangeSlot': instance.canChangeSlot,
  'canReturn': instance.canReturn,
  'canPay': instance.canPay,
};

const _$OrderSourceEnumMap = {OrderSource.web: 'Web', OrderSource.app: 'App', OrderSource.admin: 'Admin', OrderSource.unknown: ''};

_TrackingResult _$TrackingResultFromJson(Map<String, dynamic> json) => _TrackingResult(
  order: OrderDetail.fromJson(json['order'] as Map<String, dynamic>),
  isRecipientView: json['isRecipientView'] as bool? ?? false,
  whatsAppUrl: json['whatsAppUrl'] as String?,
);

Map<String, dynamic> _$TrackingResultToJson(_TrackingResult instance) => <String, dynamic>{
  'order': instance.order,
  'isRecipientView': instance.isRecipientView,
  'whatsAppUrl': instance.whatsAppUrl,
};

_PaymentStatusInfo _$PaymentStatusInfoFromJson(Map<String, dynamic> json) => _PaymentStatusInfo(
  orderNumber: json['orderNumber'] as String? ?? '',
  orderStatus: $enumDecodeNullable(_$OrderStatusEnumMap, json['orderStatus'], unknownValue: OrderStatus.unknown) ?? OrderStatus.unknown,
  method: $enumDecodeNullable(_$PaymentMethodEnumMap, json['method'], unknownValue: PaymentMethod.unknown) ?? PaymentMethod.unknown,
  status: $enumDecodeNullable(_$PaymentStatusEnumMap, json['status'], unknownValue: PaymentStatus.unknown) ?? PaymentStatus.unknown,
  amount: (json['amount'] as num?)?.toDouble() ?? 0,
  redirectUrl: json['redirectUrl'] as String?,
  failureMessage: json['failureMessage'] as String?,
);

Map<String, dynamic> _$PaymentStatusInfoToJson(_PaymentStatusInfo instance) => <String, dynamic>{
  'orderNumber': instance.orderNumber,
  'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
  'method': _$PaymentMethodEnumMap[instance.method]!,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'amount': instance.amount,
  'redirectUrl': instance.redirectUrl,
  'failureMessage': instance.failureMessage,
};

_SlotWindow _$SlotWindowFromJson(Map<String, dynamic> json) => _SlotWindow(
  windowId: json['windowId'] as String,
  start: json['start'] as String,
  end: json['end'] as String,
  capacity: (json['capacity'] as num?)?.toInt() ?? 0,
  available: (json['available'] as num?)?.toInt() ?? 0,
  selectable: json['selectable'] as bool? ?? false,
);

Map<String, dynamic> _$SlotWindowToJson(_SlotWindow instance) => <String, dynamic>{
  'windowId': instance.windowId,
  'start': instance.start,
  'end': instance.end,
  'capacity': instance.capacity,
  'available': instance.available,
  'selectable': instance.selectable,
};

_SlotDay _$SlotDayFromJson(Map<String, dynamic> json) => _SlotDay(
  date: DateTime.parse(json['date'] as String),
  windows: (json['windows'] as List<dynamic>?)?.map((e) => SlotWindow.fromJson(e as Map<String, dynamic>)).toList() ?? const <SlotWindow>[],
);

Map<String, dynamic> _$SlotDayToJson(_SlotDay instance) => <String, dynamic>{'date': instance.date.toIso8601String(), 'windows': instance.windows};
