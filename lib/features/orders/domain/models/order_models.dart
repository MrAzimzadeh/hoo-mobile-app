import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';

part 'order_models.freezed.dart';
part 'order_models.g.dart';

/// Order read models. Shapes mirror `Hoo.Application/Orders/Contracts` 1:1 (camelCase JSON, enums by wire value).
/// `DateOnly` arrives as `yyyy-MM-dd` (parsed into a local-midnight [DateTime]); `TimeOnly` stays `HH:mm:ss`.

/// `OrderListItem` — one row of `GET /account/orders`.
@freezed
abstract class OrderListItem with _$OrderListItem {
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
}

/// `OrderDeliveryResponse`.
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
}

/// `OrderLineDesignSpec` (the parts the customer app shows).
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

/// `OrderLineDesign` — the Studio design behind a Custom line (mockups, approval status).
/// Layers and the 3D viewer payload are not needed by the customer app and are ignored.
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

/// `OrderLineResponse`. Prices are null in the gift-recipient (price-less) view.
@freezed
abstract class OrderLine with _$OrderLine {
  const OrderLine._();

  const factory OrderLine({
    required String id,
    @JsonKey(unknownEnumValue: OrderLineKind.unknown) @Default(OrderLineKind.stock) OrderLineKind kind,
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

  /// Custom lines show the design mockup; stock lines the product image.
  String? get previewUrl {
    final mockups = design?.mockupUrls ?? const <String>[];
    return mockups.isNotEmpty ? mockups.first : imageUrl;
  }

  /// Studio pieces are made to order and never returnable; the server flags the rest.
  bool get returnable => !nonReturnable && !isCustom;
}

/// `OrderAdjustmentResponse` — promo, delivery, gift packaging, studio fees… (server-calculated, signed).
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
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double delivery,
    @Default(0) double giftPackaging,
    @Default(0) double greetingCard,
    @Default(0) double total,
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

/// `OrderGiftResponse` ("GIFT · Birthday").
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

/// `OrderEventResponse` — one timeline entry.
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

  bool get hasCustomLines => lines.any((l) => l.isCustom);
  List<OrderLine> get returnableLines => lines.where((l) => l.returnable).toList();
  int get itemsCount => lines.fold(0, (sum, l) => sum + l.quantity);

  /// Timeline newest first.
  List<OrderEvent> get timelineNewestFirst => [...timeline]..sort((a, b) => b.occurredAt.compareTo(a.occurredAt));
}

/// `TrackingResponse` — public tracking by number + phone. `isRecipientView` → the gift recipient's price-less view.
@freezed
abstract class TrackingResult with _$TrackingResult {
  const factory TrackingResult({required OrderDetail order, @Default(false) bool isRecipientView, String? whatsAppUrl}) = _TrackingResult;

  factory TrackingResult.fromJson(Map<String, dynamic> json) => _$TrackingResultFromJson(json);
}

/// `PaymentStatusResponse` — after a retry and while polling `GET /orders/{number}/payment`.
@freezed
abstract class PaymentStatusInfo with _$PaymentStatusInfo {
  const factory PaymentStatusInfo({
    @Default('') String orderNumber,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus orderStatus,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) @Default(PaymentMethod.unknown) PaymentMethod method,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.unknown) PaymentStatus status,
    @Default(0) double amount,
    String? redirectUrl,
    String? failureMessage,
  }) = _PaymentStatusInfo;

  factory PaymentStatusInfo.fromJson(Map<String, dynamic> json) => _$PaymentStatusInfoFromJson(json);
}

/// `SlotWindowResponse`.
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

/// `SlotDayResponse`.
@freezed
abstract class SlotDay with _$SlotDay {
  const SlotDay._();

  const factory SlotDay({required DateTime date, @Default(<SlotWindow>[]) List<SlotWindow> windows}) = _SlotDay;

  factory SlotDay.fromJson(Map<String, dynamic> json) => _$SlotDayFromJson(json);

  bool get hasSelectable => windows.any((w) => w.selectable);
}

/// How an order is opened: the signed-in customer's own order, or guest tracking by number + phone (wire format).
class OrderAccess {
  const OrderAccess.account(this.number) : phone = null;
  const OrderAccess.guest(this.number, String this.phone);

  final String number;
  final String? phone;

  bool get isGuest => phone != null;

  @override
  bool operator ==(Object other) => other is OrderAccess && other.number == number && other.phone == phone;

  @override
  int get hashCode => Object.hash(number, phone);
}

/// An order as loaded for the detail screen, with provenance.
class LoadedOrder {
  const LoadedOrder({required this.order, this.stale = false, this.isRecipientView = false, this.whatsAppUrl});

  final OrderDetail order;

  /// Served from the offline cache → read-only.
  final bool stale;

  /// Gift recipient's price-less tracking view.
  final bool isRecipientView;
  final String? whatsAppUrl;
}

/// `yyyy-MM-dd` for `DateOnly` request fields.
String dateOnlyWire(DateTime d) => '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
