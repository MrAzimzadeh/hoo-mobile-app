import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'order_models.freezed.dart';
part 'order_models.g.dart';

/// Order read models. Shapes mirror `Hoo.Application/Orders/Contracts` 1:1 (camelCase JSON, enums as strings).
/// Money fields are the server's values — the client only formats them.

/// `OrderListItem` — a row of `GET /account/orders`.
@freezed
abstract class OrderListItem with _$OrderListItem {
  const OrderListItem._();

  const factory OrderListItem({
    required String id,
    required String number,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus status,
    @Default(<String>[]) List<String> types,
    @Default('') String customerName,
    @Default('') String customerPhone,
    @Default(0) double total,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? paymentMethod,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus? paymentStatus,
    @Default('') String zoneCode,
    DateTime? slotDate,
    @Default(0) int itemsCount,
    required DateTime createdAt,
    String? thumbnailUrl,
  }) = _OrderListItem;

  factory OrderListItem.fromJson(Map<String, dynamic> json) => _$OrderListItemFromJson(json);

  bool get isCustom => types.contains(OrderTypes.custom);
  bool get isGift => types.contains(OrderTypes.gift);
}

/// Values of `OrderDetailResponse.types` / `OrderListItem.types`.
abstract final class OrderTypes {
  static const store = 'Store';
  static const custom = 'Custom';
  static const gift = 'Gift';
}

/// `OrderDetailResponse`.
@freezed
abstract class OrderDetail with _$OrderDetail {
  const OrderDetail._();

  const factory OrderDetail({
    required String id,
    required String number,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus status,
    @Default(<String>[]) List<String> types,
    required DateTime createdAt,
    @JsonKey(unknownEnumValue: OrderSource.unknown) @Default(OrderSource.unknown) OrderSource source,
    required ContactInfo contact,
    required OrderDelivery delivery,
    @Default(<OrderLine>[]) List<OrderLine> lines,
    @Default(<OrderAdjustment>[]) List<OrderAdjustment> adjustments,
    OrderTotals? totals,
    OrderPayment? payment,
    OrderGift? gift,
    @Default(<OrderEvent>[]) List<OrderEvent> timeline,
    @Default(false) bool canChangeSlot,
    @Default(false) bool canReturn,
    @Default(false) bool canPay,
  }) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);

  bool get isCustom => types.contains(OrderTypes.custom);
  bool get isGift => types.contains(OrderTypes.gift);
  bool get hasReturnableLines => lines.any((l) => !l.nonReturnable);
}

/// `OrderDeliveryResponse`. Slot times arrive as `HH:mm:ss` (TimeOnly).
@freezed
abstract class OrderDelivery with _$OrderDelivery {
  const OrderDelivery._();

  const factory OrderDelivery({
    @Default('') String zoneCode,
    @Default('') String zoneName,
    @JsonKey(unknownEnumValue: DeliveryKind.unknown) @Default(DeliveryKind.unknown) DeliveryKind kind,
    DeliveryAddress? address,
    DateTime? slotDate,
    String? slotStart,
    String? slotEnd,
    String? courierFirstName,
    int? courierEtaMinutes,
    int? courierStopsAway,
  }) = _OrderDelivery;

  factory OrderDelivery.fromJson(Map<String, dynamic> json) => _$OrderDeliveryFromJson(json);

  bool get hasSlot => slotDate != null && slotStart != null && slotEnd != null;
  bool get hasCourierInfo => courierFirstName != null || courierEtaMinutes != null || courierStopsAway != null;
}

/// `OrderLineResponse`. Prices are null in the gift-recipient view.
@freezed
abstract class OrderLine with _$OrderLine {
  const OrderLine._();

  const factory OrderLine({
    required String id,
    @JsonKey(unknownEnumValue: OrderLineKind.unknown) @Default(OrderLineKind.unknown) OrderLineKind kind,
    String? productId,
    String? designId,
    required String name,
    String? color,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? sku,
    String? imageUrl,
    double? unitPrice,
    @Default(1) int quantity,
    double? lineTotal,
    @Default(false) bool nonReturnable,
    OrderLineDesign? design,
  }) = _OrderLine;

  factory OrderLine.fromJson(Map<String, dynamic> json) => _$OrderLineFromJson(json);

  bool get isCustom => kind == OrderLineKind.custom;

  /// Design mockup first (custom lines), else the product thumbnail.
  String? get previewUrl => (design?.mockupUrls.isNotEmpty ?? false) ? design!.mockupUrls.first : imageUrl;
}

/// `OrderLineDesign` — the read model of a Studio design inside an order. Layers and the admin 3D viewer payload
/// are not needed by the customer app and are ignored.
@freezed
abstract class OrderLineDesign with _$OrderLineDesign {
  const factory OrderLineDesign({
    required String designId,
    @Default('') String name,
    @JsonKey(unknownEnumValue: DesignStatus.unknown) @Default(DesignStatus.unknown) DesignStatus status,
    OrderLineDesignSpec? spec,
    @Default(<String>[]) List<String> mockupUrls,
    String? shareToken,
    String? shareUrl,
  }) = _OrderLineDesign;

  factory OrderLineDesign.fromJson(Map<String, dynamic> json) => _$OrderLineDesignFromJson(json);
}

@freezed
abstract class OrderLineDesignSpec with _$OrderLineDesignSpec {
  const factory OrderLineDesignSpec({
    @Default('') String baseCode,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(Fit.unknown) Fit fit,
    @Default('') String fabricCode,
    String? colorName,
    String? colorHex,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    @Default(1) int quantity,
    @Default(false) bool rush,
  }) = _OrderLineDesignSpec;

  factory OrderLineDesignSpec.fromJson(Map<String, dynamic> json) => _$OrderLineDesignSpecFromJson(json);
}

/// `OrderAdjustmentResponse`.
@freezed
abstract class OrderAdjustment with _$OrderAdjustment {
  const factory OrderAdjustment({
    @JsonKey(unknownEnumValue: AdjustmentType.unknown) @Default(AdjustmentType.unknown) AdjustmentType type,
    required double amount,
    String? label,
    String? orderLineId,
  }) = _OrderAdjustment;

  factory OrderAdjustment.fromJson(Map<String, dynamic> json) => _$OrderAdjustmentFromJson(json);
}

/// `OrderTotalsResponse`: subtotal − discount + delivery + packaging + card = total (VAT included).
@freezed
abstract class OrderTotals with _$OrderTotals {
  const factory OrderTotals({
    required double subtotal,
    @Default(0) double discount,
    @Default(0) double delivery,
    @Default(0) double giftPackaging,
    @Default(0) double greetingCard,
    required double total,
    @Default(0) double vatIncluded,
  }) = _OrderTotals;

  factory OrderTotals.fromJson(Map<String, dynamic> json) => _$OrderTotalsFromJson(json);
}

/// `OrderPaymentResponse`.
@freezed
abstract class OrderPayment with _$OrderPayment {
  const factory OrderPayment({
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) @Default(PaymentMethod.unknown) PaymentMethod method,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.unknown) PaymentStatus status,
    String? cardMask,
    String? transactionId,
  }) = _OrderPayment;

  factory OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);
}

/// `OrderGiftResponse`.
@freezed
abstract class OrderGift with _$OrderGift {
  const factory OrderGift({
    @Default('') String recipientName,
    @Default('') String recipientPhone,
    @JsonKey(unknownEnumValue: Occasion.unknown) @Default(Occasion.unknown) Occasion occasion,
    @Default(false) bool surprise,
    @Default('') String packaging,
    @Default('') String cardType,
    String? cardDesign,
    String? message,
    String? fromName,
    @Default(false) bool hidePrices,
    String? receiptCode,
  }) = _OrderGift;

  factory OrderGift.fromJson(Map<String, dynamic> json) => _$OrderGiftFromJson(json);
}

/// `OrderEventResponse`. Customer views receive `note`/`data` as null (internal only) — the UI explains events
/// from their type and status instead.
@freezed
abstract class OrderEvent with _$OrderEvent {
  const factory OrderEvent({
    @JsonKey(unknownEnumValue: OrderEventType.unknown) @Default(OrderEventType.unknown) OrderEventType type,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus status,
    @JsonKey(unknownEnumValue: ActorKind.unknown) @Default(ActorKind.unknown) ActorKind actor,
    required DateTime occurredAt,
    String? note,
    Map<String, String?>? data,
  }) = _OrderEvent;

  factory OrderEvent.fromJson(Map<String, dynamic> json) => _$OrderEventFromJson(json);
}

/// `TrackingResponse` (`GET /orders/track?number&phone`).
@freezed
abstract class TrackingResult with _$TrackingResult {
  const factory TrackingResult({
    required OrderDetail order,
    @Default(false) bool isRecipientView,
    String? whatsAppUrl,
  }) = _TrackingResult;

  factory TrackingResult.fromJson(Map<String, dynamic> json) => _$TrackingResultFromJson(json);
}

/// `ReturnItem` (Hoo.Domain) — used in requests and in `ReturnResponse`.
@freezed
abstract class ReturnItem with _$ReturnItem {
  const factory ReturnItem({
    required String orderLineId,
    required int quantity,
    @JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true) Size? exchangeSize,
  }) = _ReturnItem;

  factory ReturnItem.fromJson(Map<String, dynamic> json) => _$ReturnItemFromJson(json);
}

/// `ReturnResponse`.
@freezed
abstract class ReturnRecord with _$ReturnRecord {
  const factory ReturnRecord({
    required String id,
    required String orderNumber,
    @Default(ReturnKind.returnItem) ReturnKind kind,
    @JsonKey(unknownEnumValue: ReturnStatus.unknown) @Default(ReturnStatus.unknown) ReturnStatus status,
    @JsonKey(unknownEnumValue: ReturnChannel.unknown) @Default(ReturnChannel.unknown) ReturnChannel channel,
    @Default(<ReturnItem>[]) List<ReturnItem> items,
    String? reason,
    String? resolutionNote,
    required DateTime createdAt,
  }) = _ReturnRecord;

  factory ReturnRecord.fromJson(Map<String, dynamic> json) => _$ReturnRecordFromJson(json);
}

/// `PaymentStatusResponse` (`GET /orders/{number}/payment`, `POST …/payment/retry`).
@freezed
abstract class PaymentStatusInfo with _$PaymentStatusInfo {
  const factory PaymentStatusInfo({
    required String orderNumber,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus orderStatus,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) @Default(PaymentMethod.unknown) PaymentMethod method,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.unknown) PaymentStatus status,
    @Default(0) double amount,
    String? redirectUrl,
    String? failureMessage,
  }) = _PaymentStatusInfo;

  factory PaymentStatusInfo.fromJson(Map<String, dynamic> json) => _$PaymentStatusInfoFromJson(json);
}

/// `SlotDayResponse` / `SlotWindowResponse` (delivery windows; times `HH:mm:ss`).
@freezed
abstract class SlotDay with _$SlotDay {
  const SlotDay._();

  const factory SlotDay({required DateTime date, @Default(<SlotWindow>[]) List<SlotWindow> windows}) = _SlotDay;

  factory SlotDay.fromJson(Map<String, dynamic> json) => _$SlotDayFromJson(json);

  bool get hasSelectable => windows.any((w) => w.selectable);
}

@freezed
abstract class SlotWindow with _$SlotWindow {
  const factory SlotWindow({
    required String windowId,
    required String start,
    required String end,
    @Default(0) int capacity,
    @Default(0) int available,
    @Default(false) bool selectable,
  }) = _SlotWindow;

  factory SlotWindow.fromJson(Map<String, dynamic> json) => _$SlotWindowFromJson(json);
}

/// `GiftReceiptResponse` — the recipient's view of a gift: never carries prices.
@freezed
abstract class GiftReceipt with _$GiftReceipt {
  const GiftReceipt._();

  const factory GiftReceipt({
    required String receiptCode,
    @Default('') String recipientName,
    @JsonKey(unknownEnumValue: Occasion.unknown) @Default(Occasion.unknown) Occasion occasion,
    String? fromName,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus status,
    @Default(<GiftReceiptLine>[]) List<GiftReceiptLine> lines,
    @Default(false) bool exchangeAllowed,
    DateTime? exchangeDeadline,
  }) = _GiftReceipt;

  factory GiftReceipt.fromJson(Map<String, dynamic> json) => _$GiftReceiptFromJson(json);

  bool get hasExchangeableLines => lines.any((l) => l.canExchange);
}

@freezed
abstract class GiftReceiptLine with _$GiftReceiptLine {
  const GiftReceiptLine._();

  const factory GiftReceiptLine({
    required String lineId,
    required String name,
    String? color,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    @Default(1) int quantity,
    @Default(false) bool exchangeable,
    @JsonKey(unknownEnumValue: Size.unknown) @Default(<Size>[]) List<Size> availableSizes,
  }) = _GiftReceiptLine;

  factory GiftReceiptLine.fromJson(Map<String, dynamic> json) => _$GiftReceiptLineFromJson(json);

  /// Sizes the recipient can switch to (the current size is not an exchange).
  List<Size> get exchangeSizes => availableSizes.where((s) => s != size && s != Size.unknown).toList();
  bool get canExchange => exchangeable && exchangeSizes.isNotEmpty;
}
