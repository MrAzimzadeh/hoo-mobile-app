// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutLine _$CheckoutLineFromJson(Map<String, dynamic> json) =>
    _CheckoutLine(
      id: json['id'] as String,
      kind: json['kind'] as String? ?? 'stock',
      name: json['name'] as String,
      color: json['color'] as String?,
      colorHex: json['colorHex'] as String?,
      size: $enumDecodeNullable(
        _$SizeEnumMap,
        json['size'],
        unknownValue: Size.unknown,
      ),
      imageUrl: json['imageUrl'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      lineTotal: (json['lineTotal'] as num?)?.toDouble() ?? 0,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$CheckoutLineToJson(_CheckoutLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'name': instance.name,
      'color': instance.color,
      'colorHex': instance.colorHex,
      'size': _$SizeEnumMap[instance.size],
      'imageUrl': instance.imageUrl,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'lineTotal': instance.lineTotal,
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
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

_CheckoutTotals _$CheckoutTotalsFromJson(
  Map<String, dynamic> json,
) => _CheckoutTotals(
  subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
  delivery: (json['delivery'] as num?)?.toDouble() ?? 0,
  giftPackaging: (json['giftPackaging'] as num?)?.toDouble() ?? 0,
  giftPackagingSaving: (json['giftPackagingSaving'] as num?)?.toDouble() ?? 0,
  greetingCard: (json['greetingCard'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num?)?.toDouble() ?? 0,
  vatIncluded: (json['vatIncluded'] as num?)?.toDouble() ?? 0,
  freeDeliveryRemaining: (json['freeDeliveryRemaining'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CheckoutTotalsToJson(_CheckoutTotals instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'delivery': instance.delivery,
      'giftPackaging': instance.giftPackaging,
      'giftPackagingSaving': instance.giftPackagingSaving,
      'greetingCard': instance.greetingCard,
      'total': instance.total,
      'vatIncluded': instance.vatIncluded,
      'freeDeliveryRemaining': instance.freeDeliveryRemaining,
    };

_DeliveryZone _$DeliveryZoneFromJson(Map<String, dynamic> json) =>
    _DeliveryZone(
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      name: json['name'] as String,
      description: json['description'] as String?,
      kind:
          $enumDecodeNullable(
            _$DeliveryKindEnumMap,
            json['kind'],
            unknownValue: DeliveryKind.unknown,
          ) ??
          DeliveryKind.courier,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      freeFrom: (json['freeFrom'] as num?)?.toDouble(),
      etaMinDays: (json['etaMinDays'] as num?)?.toInt() ?? 0,
      etaMaxDays: (json['etaMaxDays'] as num?)?.toInt() ?? 0,
      readyInHours: (json['readyInHours'] as num?)?.toInt(),
      pickupAddress: json['pickupAddress'] as String?,
      supportsTimeSlots: json['supportsTimeSlots'] as bool? ?? false,
      cashOnDeliveryAllowed: json['cashOnDeliveryAllowed'] as bool? ?? false,
    );

Map<String, dynamic> _$DeliveryZoneToJson(_DeliveryZone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'kind': _$DeliveryKindEnumMap[instance.kind]!,
      'price': instance.price,
      'freeFrom': instance.freeFrom,
      'etaMinDays': instance.etaMinDays,
      'etaMaxDays': instance.etaMaxDays,
      'readyInHours': instance.readyInHours,
      'pickupAddress': instance.pickupAddress,
      'supportsTimeSlots': instance.supportsTimeSlots,
      'cashOnDeliveryAllowed': instance.cashOnDeliveryAllowed,
    };

const _$DeliveryKindEnumMap = {
  DeliveryKind.courier: 'Courier',
  DeliveryKind.post: 'Post',
  DeliveryKind.pickup: 'Pickup',
  DeliveryKind.unknown: '',
};

_SelectedSlot _$SelectedSlotFromJson(Map<String, dynamic> json) =>
    _SelectedSlot(
      date: DateTime.parse(json['date'] as String),
      windowId: json['windowId'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$SelectedSlotToJson(_SelectedSlot instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'windowId': instance.windowId,
      'start': instance.start,
      'end': instance.end,
    };

_PaymentOption _$PaymentOptionFromJson(Map<String, dynamic> json) =>
    _PaymentOption(
      method: $enumDecode(
        _$PaymentMethodEnumMap,
        json['method'],
        unknownValue: PaymentMethod.unknown,
      ),
      available: json['available'] as bool? ?? false,
      unavailableReasonCode: json['unavailableReasonCode'] as String?,
      unavailableReason: json['unavailableReason'] as String?,
    );

Map<String, dynamic> _$PaymentOptionToJson(_PaymentOption instance) =>
    <String, dynamic>{
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'available': instance.available,
      'unavailableReasonCode': instance.unavailableReasonCode,
      'unavailableReason': instance.unavailableReason,
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

_GiftSummary _$GiftSummaryFromJson(Map<String, dynamic> json) => _GiftSummary(
  recipientName: json['recipientName'] as String? ?? '',
  recipientPhone: json['recipientPhone'] as String? ?? '',
  occasion:
      $enumDecodeNullable(
        _$OccasionEnumMap,
        json['occasion'],
        unknownValue: Occasion.unknown,
      ) ??
      Occasion.justBecause,
  surprise: json['surprise'] as bool? ?? true,
  packaging: json['packaging'] as String? ?? '',
  cardType: json['cardType'] as String? ?? '',
  cardDesign: json['cardDesign'] as String?,
  message: json['message'] as String?,
  fromName: json['fromName'] as String?,
  hidePrices: json['hidePrices'] as bool? ?? false,
);

Map<String, dynamic> _$GiftSummaryToJson(_GiftSummary instance) =>
    <String, dynamic>{
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
    };

const _$OccasionEnumMap = {
  Occasion.birthday: 'Birthday',
  Occasion.anniversary: 'Anniversary',
  Occasion.novruz: 'Novruz',
  Occasion.newYear: 'NewYear',
  Occasion.justBecause: 'JustBecause',
  Occasion.unknown: '',
};

_CheckoutSession _$CheckoutSessionFromJson(Map<String, dynamic> json) =>
    _CheckoutSession(
      id: json['id'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CheckoutLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CheckoutLine>[],
      contact: json['contact'] == null
          ? null
          : ContactInfo.fromJson(json['contact'] as Map<String, dynamic>),
      gift: json['gift'] == null
          ? null
          : GiftSummary.fromJson(json['gift'] as Map<String, dynamic>),
      zone: json['zone'] == null
          ? null
          : DeliveryZone.fromJson(json['zone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
      slot: json['slot'] == null
          ? null
          : SelectedSlot.fromJson(json['slot'] as Map<String, dynamic>),
      paymentMethod: $enumDecodeNullable(
        _$PaymentMethodEnumMap,
        json['paymentMethod'],
        unknownValue: PaymentMethod.unknown,
      ),
      savedCardId: json['savedCardId'] as String?,
      promoCode: json['promoCode'] as String?,
      promoErrorCode: json['promoErrorCode'] as String?,
      promoError: json['promoError'] as String?,
      totals: json['totals'] == null
          ? const CheckoutTotals()
          : CheckoutTotals.fromJson(json['totals'] as Map<String, dynamic>),
      estimatedDeliveryFrom: json['estimatedDeliveryFrom'] == null
          ? null
          : DateTime.parse(json['estimatedDeliveryFrom'] as String),
      estimatedDeliveryTo: json['estimatedDeliveryTo'] == null
          ? null
          : DateTime.parse(json['estimatedDeliveryTo'] as String),
      zones:
          (json['zones'] as List<dynamic>?)
              ?.map((e) => DeliveryZone.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DeliveryZone>[],
      paymentMethods:
          (json['paymentMethods'] as List<dynamic>?)
              ?.map((e) => PaymentOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PaymentOption>[],
      savedCards:
          (json['savedCards'] as List<dynamic>?)
              ?.map((e) => SavedCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SavedCard>[],
      savedAddresses:
          (json['savedAddresses'] as List<dynamic>?)
              ?.map((e) => SavedAddress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SavedAddress>[],
      hasCustomItems: json['hasCustomItems'] as bool? ?? false,
      missingSteps:
          (json['missingSteps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      canPlaceOrder: json['canPlaceOrder'] as bool? ?? false,
      orderId: json['orderId'] as String?,
    );

Map<String, dynamic> _$CheckoutSessionToJson(
  _CheckoutSession instance,
) => <String, dynamic>{
  'id': instance.id,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'items': instance.items,
  'contact': instance.contact,
  'gift': instance.gift,
  'zone': instance.zone,
  'address': instance.address,
  'slot': instance.slot,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod],
  'savedCardId': instance.savedCardId,
  'promoCode': instance.promoCode,
  'promoErrorCode': instance.promoErrorCode,
  'promoError': instance.promoError,
  'totals': instance.totals,
  'estimatedDeliveryFrom': instance.estimatedDeliveryFrom?.toIso8601String(),
  'estimatedDeliveryTo': instance.estimatedDeliveryTo?.toIso8601String(),
  'zones': instance.zones,
  'paymentMethods': instance.paymentMethods,
  'savedCards': instance.savedCards,
  'savedAddresses': instance.savedAddresses,
  'hasCustomItems': instance.hasCustomItems,
  'missingSteps': instance.missingSteps,
  'canPlaceOrder': instance.canPlaceOrder,
  'orderId': instance.orderId,
};

_SlotWindow _$SlotWindowFromJson(Map<String, dynamic> json) => _SlotWindow(
  windowId: json['windowId'] as String,
  start: json['start'] as String,
  end: json['end'] as String,
  capacity: (json['capacity'] as num?)?.toInt() ?? 0,
  available: (json['available'] as num?)?.toInt() ?? 0,
  selectable: json['selectable'] as bool? ?? false,
);

Map<String, dynamic> _$SlotWindowToJson(_SlotWindow instance) =>
    <String, dynamic>{
      'windowId': instance.windowId,
      'start': instance.start,
      'end': instance.end,
      'capacity': instance.capacity,
      'available': instance.available,
      'selectable': instance.selectable,
    };

_SlotDay _$SlotDayFromJson(Map<String, dynamic> json) => _SlotDay(
  date: DateTime.parse(json['date'] as String),
  windows:
      (json['windows'] as List<dynamic>?)
          ?.map((e) => SlotWindow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SlotWindow>[],
);

Map<String, dynamic> _$SlotDayToJson(_SlotDay instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'windows': instance.windows,
};

_GiftPackaging _$GiftPackagingFromJson(Map<String, dynamic> json) =>
    _GiftPackaging(
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isFree: json['isFree'] as bool? ?? false,
      lowStock: json['lowStock'] as bool? ?? false,
    );

Map<String, dynamic> _$GiftPackagingToJson(_GiftPackaging instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'isFree': instance.isFree,
      'lowStock': instance.lowStock,
    };

_GiftCardType _$GiftCardTypeFromJson(Map<String, dynamic> json) =>
    _GiftCardType(
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      name: json['name'] as String,
      kind:
          $enumDecodeNullable(
            _$GreetingCardKindEnumMap,
            json['kind'],
            unknownValue: GreetingCardKind.unknown,
          ) ??
          GreetingCardKind.none,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      requiresMessage: json['requiresMessage'] as bool? ?? false,
    );

Map<String, dynamic> _$GiftCardTypeToJson(_GiftCardType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'kind': _$GreetingCardKindEnumMap[instance.kind]!,
      'price': instance.price,
      'requiresMessage': instance.requiresMessage,
    };

const _$GreetingCardKindEnumMap = {
  GreetingCardKind.none: 'None',
  GreetingCardKind.printed: 'Printed',
  GreetingCardKind.handwritten: 'Handwritten',
  GreetingCardKind.unknown: '',
};

_GiftCardDesign _$GiftCardDesignFromJson(Map<String, dynamic> json) =>
    _GiftCardDesign(
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      name: json['name'] as String,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$GiftCardDesignToJson(_GiftCardDesign instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'previewUrl': instance.previewUrl,
    };

_GiftRules _$GiftRulesFromJson(Map<String, dynamic> json) => _GiftRules(
  enabled: json['enabled'] as bool? ?? true,
  hidePricesByDefault: json['hidePricesByDefault'] as bool? ?? false,
  allowForCustomOrders: json['allowForCustomOrders'] as bool? ?? false,
  maxMessageLength: (json['maxMessageLength'] as num?)?.toInt() ?? 200,
  fromNameMaxLength: (json['fromNameMaxLength'] as num?)?.toInt() ?? 40,
  freePackagingThreshold: (json['freePackagingThreshold'] as num?)?.toDouble(),
  freePackagingOptionId: json['freePackagingOptionId'] as String?,
);

Map<String, dynamic> _$GiftRulesToJson(_GiftRules instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'hidePricesByDefault': instance.hidePricesByDefault,
      'allowForCustomOrders': instance.allowForCustomOrders,
      'maxMessageLength': instance.maxMessageLength,
      'fromNameMaxLength': instance.fromNameMaxLength,
      'freePackagingThreshold': instance.freePackagingThreshold,
      'freePackagingOptionId': instance.freePackagingOptionId,
    };

_GiftOptions _$GiftOptionsFromJson(Map<String, dynamic> json) => _GiftOptions(
  packaging:
      (json['packaging'] as List<dynamic>?)
          ?.map((e) => GiftPackaging.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <GiftPackaging>[],
  cardTypes:
      (json['cardTypes'] as List<dynamic>?)
          ?.map((e) => GiftCardType.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <GiftCardType>[],
  cardDesigns:
      (json['cardDesigns'] as List<dynamic>?)
          ?.map((e) => GiftCardDesign.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <GiftCardDesign>[],
  occasions:
      (json['occasions'] as List<dynamic>?)
          ?.map(
            (e) => $enumDecode(
              _$OccasionEnumMap,
              e,
              unknownValue: Occasion.unknown,
            ),
          )
          .toList() ??
      const <Occasion>[],
  rules: json['rules'] == null
      ? const GiftRules()
      : GiftRules.fromJson(json['rules'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GiftOptionsToJson(
  _GiftOptions instance,
) => <String, dynamic>{
  'packaging': instance.packaging,
  'cardTypes': instance.cardTypes,
  'cardDesigns': instance.cardDesigns,
  'occasions': instance.occasions.map((e) => _$OccasionEnumMap[e]!).toList(),
  'rules': instance.rules,
};

Map<String, dynamic> _$GiftSelectionToJson(_GiftSelection instance) =>
    <String, dynamic>{
      'isGift': instance.isGift,
      'recipientName': instance.recipientName,
      'recipientPhone': instance.recipientPhone,
      'occasion': _$OccasionEnumMap[instance.occasion],
      'surprise': instance.surprise,
      'packagingOptionId': instance.packagingOptionId,
      'cardTypeId': instance.cardTypeId,
      'cardDesignId': instance.cardDesignId,
      'message': instance.message,
      'fromName': instance.fromName,
      'hidePrices': instance.hidePrices,
    };

_GiftIssue _$GiftIssueFromJson(Map<String, dynamic> json) => _GiftIssue(
  code: json['code'] as String,
  message: json['message'] as String? ?? '',
  field: json['field'] as String?,
);

Map<String, dynamic> _$GiftIssueToJson(_GiftIssue instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'field': instance.field,
    };

_GiftMessageCheck _$GiftMessageCheckFromJson(Map<String, dynamic> json) =>
    _GiftMessageCheck(
      valid: json['valid'] as bool? ?? true,
      length: (json['length'] as num?)?.toInt() ?? 0,
      maxLength: (json['maxLength'] as num?)?.toInt() ?? 0,
      issues:
          (json['issues'] as List<dynamic>?)
              ?.map((e) => GiftIssue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GiftIssue>[],
    );

Map<String, dynamic> _$GiftMessageCheckToJson(_GiftMessageCheck instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'length': instance.length,
      'maxLength': instance.maxLength,
      'issues': instance.issues,
    };

_OrderPlaced _$OrderPlacedFromJson(Map<String, dynamic> json) => _OrderPlaced(
  orderId: json['orderId'] as String,
  orderNumber: json['orderNumber'] as String,
  status:
      $enumDecodeNullable(
        _$OrderStatusEnumMap,
        json['status'],
        unknownValue: OrderStatus.unknown,
      ) ??
      OrderStatus.newOrder,
  total: (json['total'] as num?)?.toDouble() ?? 0,
  paymentMethod:
      $enumDecodeNullable(
        _$PaymentMethodEnumMap,
        json['paymentMethod'],
        unknownValue: PaymentMethod.unknown,
      ) ??
      PaymentMethod.card,
  paymentStatus:
      $enumDecodeNullable(
        _$PaymentStatusEnumMap,
        json['paymentStatus'],
        unknownValue: PaymentStatus.unknown,
      ) ??
      PaymentStatus.pending,
  paymentRedirectUrl: json['paymentRedirectUrl'] as String?,
  giftReceiptCode: json['giftReceiptCode'] as String?,
);

Map<String, dynamic> _$OrderPlacedToJson(_OrderPlaced instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNumber': instance.orderNumber,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'total': instance.total,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'paymentRedirectUrl': instance.paymentRedirectUrl,
      'giftReceiptCode': instance.giftReceiptCode,
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

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'Pending',
  PaymentStatus.captured: 'Captured',
  PaymentStatus.failed: 'Failed',
  PaymentStatus.cancelled: 'Cancelled',
  PaymentStatus.refunded: 'Refunded',
  PaymentStatus.partiallyRefunded: 'PartiallyRefunded',
  PaymentStatus.unknown: '',
};

_PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) => _PaymentInfo(
  orderNumber: json['orderNumber'] as String,
  orderStatus:
      $enumDecodeNullable(
        _$OrderStatusEnumMap,
        json['orderStatus'],
        unknownValue: OrderStatus.unknown,
      ) ??
      OrderStatus.newOrder,
  method:
      $enumDecodeNullable(
        _$PaymentMethodEnumMap,
        json['method'],
        unknownValue: PaymentMethod.unknown,
      ) ??
      PaymentMethod.card,
  status:
      $enumDecodeNullable(
        _$PaymentStatusEnumMap,
        json['status'],
        unknownValue: PaymentStatus.unknown,
      ) ??
      PaymentStatus.pending,
  amount: (json['amount'] as num?)?.toDouble() ?? 0,
  redirectUrl: json['redirectUrl'] as String?,
  failureMessage: json['failureMessage'] as String?,
);

Map<String, dynamic> _$PaymentInfoToJson(_PaymentInfo instance) =>
    <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'amount': instance.amount,
      'redirectUrl': instance.redirectUrl,
      'failureMessage': instance.failureMessage,
    };
