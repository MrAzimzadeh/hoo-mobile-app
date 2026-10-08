import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'checkout_models.freezed.dart';
part 'checkout_models.g.dart';

/// Mirrors `Hoo.Application.Checkout` + `Gift` + payment contracts 1:1. Prices are the server's; nothing here adds
/// or multiplies money.

/// The cart line as shown in the order summary (`CartItemResponse`, the fields checkout renders).
@freezed
abstract class CheckoutLine with _$CheckoutLine {
  const factory CheckoutLine({
    required String id,
    @Default('stock') String kind,
    required String name,
    String? color,
    String? colorHex,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? imageUrl,
    @Default(0) double unitPrice,
    @Default(1) int quantity,
    @Default(0) double lineTotal,
    String? errorCode,
    String? errorMessage,
  }) = _CheckoutLine;

  factory CheckoutLine.fromJson(Map<String, dynamic> json) => _$CheckoutLineFromJson(json);
}

@freezed
abstract class CheckoutTotals with _$CheckoutTotals {
  const factory CheckoutTotals({
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double delivery,
    @Default(0) double giftPackaging,
    @Default(0) double giftPackagingSaving,
    @Default(0) double greetingCard,
    @Default(0) double total,
    @Default(0) double vatIncluded,
    double? freeDeliveryRemaining,
  }) = _CheckoutTotals;

  factory CheckoutTotals.fromJson(Map<String, dynamic> json) => _$CheckoutTotalsFromJson(json);
}

@freezed
abstract class DeliveryZone with _$DeliveryZone {
  const factory DeliveryZone({
    required String id,
    @Default('') String code,
    required String name,
    String? description,
    @JsonKey(unknownEnumValue: DeliveryKind.unknown) @Default(DeliveryKind.courier) DeliveryKind kind,
    @Default(0) double price,
    double? freeFrom,
    @Default(0) int etaMinDays,
    @Default(0) int etaMaxDays,
    int? readyInHours,
    String? pickupAddress,
    @Default(false) bool supportsTimeSlots,
    @Default(false) bool cashOnDeliveryAllowed,
  }) = _DeliveryZone;

  factory DeliveryZone.fromJson(Map<String, dynamic> json) => _$DeliveryZoneFromJson(json);
}

@freezed
abstract class SelectedSlot with _$SelectedSlot {
  const factory SelectedSlot({required DateTime date, required String windowId, required String start, required String end}) = _SelectedSlot;

  factory SelectedSlot.fromJson(Map<String, dynamic> json) => _$SelectedSlotFromJson(json);
}

@freezed
abstract class PaymentOption with _$PaymentOption {
  const factory PaymentOption({
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod method,
    @Default(false) bool available,
    String? unavailableReasonCode,
    String? unavailableReason,
  }) = _PaymentOption;

  factory PaymentOption.fromJson(Map<String, dynamic> json) => _$PaymentOptionFromJson(json);
}

@freezed
abstract class GiftSummary with _$GiftSummary {
  const factory GiftSummary({
    @Default('') String recipientName,
    @Default('') String recipientPhone,
    @JsonKey(unknownEnumValue: Occasion.unknown) @Default(Occasion.justBecause) Occasion occasion,
    @Default(true) bool surprise,
    @Default('') String packaging,
    @Default('') String cardType,
    String? cardDesign,
    String? message,
    String? fromName,
    @Default(false) bool hidePrices,
  }) = _GiftSummary;

  factory GiftSummary.fromJson(Map<String, dynamic> json) => _$GiftSummaryFromJson(json);
}

@freezed
abstract class CheckoutSession with _$CheckoutSession {
  const CheckoutSession._();

  const factory CheckoutSession({
    required String id,
    required DateTime expiresAt,
    @Default(<CheckoutLine>[]) List<CheckoutLine> items,
    ContactInfo? contact,
    GiftSummary? gift,
    DeliveryZone? zone,
    DeliveryAddress? address,
    SelectedSlot? slot,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? paymentMethod,
    String? savedCardId,
    String? promoCode,
    String? promoErrorCode,
    String? promoError,
    @Default(CheckoutTotals()) CheckoutTotals totals,
    DateTime? estimatedDeliveryFrom,
    DateTime? estimatedDeliveryTo,
    @Default(<DeliveryZone>[]) List<DeliveryZone> zones,
    @Default(<PaymentOption>[]) List<PaymentOption> paymentMethods,
    @Default(<SavedCard>[]) List<SavedCard> savedCards,
    @Default(<SavedAddress>[]) List<SavedAddress> savedAddresses,
    @Default(false) bool hasCustomItems,
    @Default(<String>[]) List<String> missingSteps,
    @Default(false) bool canPlaceOrder,
    String? orderId,
  }) = _CheckoutSession;

  factory CheckoutSession.fromJson(Map<String, dynamic> json) => _$CheckoutSessionFromJson(json);

  bool missing(String step) => missingSteps.contains(step);
  bool get isGift => gift != null;
  bool get needsAddress => zone != null && zone!.kind != DeliveryKind.pickup;
  bool get hasLineErrors => items.any((i) => i.errorCode != null);
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

@freezed
abstract class SlotDay with _$SlotDay {
  const factory SlotDay({required DateTime date, @Default(<SlotWindow>[]) List<SlotWindow> windows}) = _SlotDay;

  factory SlotDay.fromJson(Map<String, dynamic> json) => _$SlotDayFromJson(json);
}

@freezed
abstract class GiftPackaging with _$GiftPackaging {
  const factory GiftPackaging({
    required String id,
    @Default('') String code,
    required String name,
    String? description,
    String? imageUrl,
    @Default(0) double price,
    @Default(false) bool isFree,
    @Default(false) bool lowStock,
  }) = _GiftPackaging;

  factory GiftPackaging.fromJson(Map<String, dynamic> json) => _$GiftPackagingFromJson(json);
}

@freezed
abstract class GiftCardType with _$GiftCardType {
  const factory GiftCardType({
    required String id,
    @Default('') String code,
    required String name,
    @JsonKey(unknownEnumValue: GreetingCardKind.unknown) @Default(GreetingCardKind.none) GreetingCardKind kind,
    @Default(0) double price,
    @Default(false) bool requiresMessage,
  }) = _GiftCardType;

  factory GiftCardType.fromJson(Map<String, dynamic> json) => _$GiftCardTypeFromJson(json);
}

@freezed
abstract class GiftCardDesign with _$GiftCardDesign {
  const factory GiftCardDesign({required String id, @Default('') String code, required String name, String? previewUrl}) = _GiftCardDesign;

  factory GiftCardDesign.fromJson(Map<String, dynamic> json) => _$GiftCardDesignFromJson(json);
}

@freezed
abstract class GiftRules with _$GiftRules {
  const factory GiftRules({
    @Default(true) bool enabled,
    @Default(false) bool hidePricesByDefault,
    @Default(false) bool allowForCustomOrders,
    @Default(200) int maxMessageLength,
    @Default(40) int fromNameMaxLength,
    double? freePackagingThreshold,
    String? freePackagingOptionId,
  }) = _GiftRules;

  factory GiftRules.fromJson(Map<String, dynamic> json) => _$GiftRulesFromJson(json);
}

@freezed
abstract class GiftOptions with _$GiftOptions {
  const factory GiftOptions({
    @Default(<GiftPackaging>[]) List<GiftPackaging> packaging,
    @Default(<GiftCardType>[]) List<GiftCardType> cardTypes,
    @Default(<GiftCardDesign>[]) List<GiftCardDesign> cardDesigns,
    @JsonKey(unknownEnumValue: Occasion.unknown) @Default(<Occasion>[]) List<Occasion> occasions,
    @Default(GiftRules()) GiftRules rules,
  }) = _GiftOptions;

  factory GiftOptions.fromJson(Map<String, dynamic> json) => _$GiftOptionsFromJson(json);
}

/// `GiftSelectionRequest`.
@Freezed(fromJson: false, toJson: true)
abstract class GiftSelection with _$GiftSelection {
  const factory GiftSelection({
    required bool isGift,
    String? recipientName,
    String? recipientPhone,
    Occasion? occasion,
    @Default(true) bool surprise,
    String? packagingOptionId,
    String? cardTypeId,
    String? cardDesignId,
    String? message,
    String? fromName,
    bool? hidePrices,
  }) = _GiftSelection;
}

@freezed
abstract class GiftIssue with _$GiftIssue {
  const factory GiftIssue({required String code, @Default('') String message, String? field}) = _GiftIssue;

  factory GiftIssue.fromJson(Map<String, dynamic> json) => _$GiftIssueFromJson(json);
}

@freezed
abstract class GiftMessageCheck with _$GiftMessageCheck {
  const factory GiftMessageCheck({
    @Default(true) bool valid,
    @Default(0) int length,
    @Default(0) int maxLength,
    @Default(<GiftIssue>[]) List<GiftIssue> issues,
  }) = _GiftMessageCheck;

  factory GiftMessageCheck.fromJson(Map<String, dynamic> json) => _$GiftMessageCheckFromJson(json);
}

@freezed
abstract class OrderPlaced with _$OrderPlaced {
  const factory OrderPlaced({
    required String orderId,
    required String orderNumber,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.newOrder) OrderStatus status,
    @Default(0) double total,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) @Default(PaymentMethod.card) PaymentMethod paymentMethod,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.pending) PaymentStatus paymentStatus,
    String? paymentRedirectUrl,
    String? giftReceiptCode,
  }) = _OrderPlaced;

  factory OrderPlaced.fromJson(Map<String, dynamic> json) => _$OrderPlacedFromJson(json);
}

/// `PaymentStatusResponse`.
@freezed
abstract class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo({
    required String orderNumber,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.newOrder) OrderStatus orderStatus,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) @Default(PaymentMethod.card) PaymentMethod method,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.pending) PaymentStatus status,
    @Default(0) double amount,
    String? redirectUrl,
    String? failureMessage,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => _$PaymentInfoFromJson(json);
}
