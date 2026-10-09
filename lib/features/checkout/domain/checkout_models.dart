import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'checkout_models.freezed.dart';
part 'checkout_models.g.dart';

/// Checkout line (`CartItemResponse` inside `CheckoutResponse.items`) — only what the review step shows.
@freezed
abstract class CheckoutLine with _$CheckoutLine {
  const factory CheckoutLine({
    required String id,
    @Default('') String kind,
    String? designId,
    @Default('') String name,
    String? color,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? imageUrl,
    @Default(0) double unitPrice,
    @Default(1) int quantity,
    @Default(0) double lineTotal,
    String? errorMessage,
  }) = _CheckoutLine;

  factory CheckoutLine.fromJson(Map<String, dynamic> json) => _$CheckoutLineFromJson(json);
}

@freezed
abstract class DeliveryZone with _$DeliveryZone {
  const factory DeliveryZone({
    required String id,
    @Default('') String code,
    @Default('') String name,
    String? description,
    @JsonKey(unknownEnumValue: DeliveryKind.unknown) @Default(DeliveryKind.courier) DeliveryKind kind,
    @Default(0) double price,
    double? freeFrom,
    @Default(0) int etaMinDays,
    @Default(0) int etaMaxDays,
    int? readyInHours,
    String? pickupAddress,
    @Default(false) bool supportsTimeSlots,
    @Default(true) bool cashOnDeliveryAllowed,
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
    @Default(true) bool available,
    String? unavailableReasonCode,
    String? unavailableReason,
  }) = _PaymentOption;

  factory PaymentOption.fromJson(Map<String, dynamic> json) => _$PaymentOptionFromJson(json);
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

/// `CheckoutResponse` — the whole checkout, re-rendered after every step.
@freezed
abstract class Checkout with _$Checkout {
  const Checkout._();

  const factory Checkout({
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
  }) = _Checkout;

  factory Checkout.fromJson(Map<String, dynamic> json) => _$CheckoutFromJson(json);

  bool get isGift => gift != null;
  bool get needsAddress => zone != null && zone!.kind != DeliveryKind.pickup;
  bool missing(String step) => missingSteps.contains(step);
}

@freezed
abstract class SlotWindow with _$SlotWindow {
  const factory SlotWindow({required String windowId, required String start, required String end, @Default(0) int capacity, @Default(0) int available, @Default(true) bool selectable}) =
      _SlotWindow;

  factory SlotWindow.fromJson(Map<String, dynamic> json) => _$SlotWindowFromJson(json);
}

@freezed
abstract class SlotDay with _$SlotDay {
  const SlotDay._();

  const factory SlotDay({required DateTime date, @Default(<SlotWindow>[]) List<SlotWindow> windows}) = _SlotDay;

  factory SlotDay.fromJson(Map<String, dynamic> json) => _$SlotDayFromJson(json);

  bool get hasSelectable => windows.any((w) => w.selectable);
}

/// `OrderPlacedResponse`.
@freezed
abstract class OrderPlaced with _$OrderPlaced {
  const factory OrderPlaced({
    required String orderId,
    required String orderNumber,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.newOrder) OrderStatus status,
    @Default(0) double total,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod paymentMethod,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.pending) PaymentStatus paymentStatus,
    String? paymentRedirectUrl,
    String? giftReceiptCode,
  }) = _OrderPlaced;

  factory OrderPlaced.fromJson(Map<String, dynamic> json) => _$OrderPlacedFromJson(json);
}

/// `PaymentStatusResponse`.
@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    required String orderNumber,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.newOrder) OrderStatus orderStatus,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod method,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) @Default(PaymentStatus.pending) PaymentStatus status,
    @Default(0) double amount,
    String? redirectUrl,
    String? failureMessage,
  }) = _PaymentState;

  factory PaymentState.fromJson(Map<String, dynamic> json) => _$PaymentStateFromJson(json);
}

// ---- gift options

@freezed
abstract class PackagingOption with _$PackagingOption {
  const factory PackagingOption({required String id, @Default('') String code, @Default('') String name, String? description, String? imageUrl, @Default(0) double price, @Default(false) bool isFree, @Default(false) bool lowStock}) =
      _PackagingOption;

  factory PackagingOption.fromJson(Map<String, dynamic> json) => _$PackagingOptionFromJson(json);
}

@freezed
abstract class CardType with _$CardType {
  const factory CardType({
    required String id,
    @Default('') String code,
    @Default('') String name,
    @JsonKey(unknownEnumValue: GreetingCardKind.unknown) @Default(GreetingCardKind.none) GreetingCardKind kind,
    @Default(0) double price,
    @Default(false) bool requiresMessage,
  }) = _CardType;

  factory CardType.fromJson(Map<String, dynamic> json) => _$CardTypeFromJson(json);
}

@freezed
abstract class CardDesign with _$CardDesign {
  const factory CardDesign({required String id, @Default('') String code, @Default('') String name, String? previewUrl}) = _CardDesign;

  factory CardDesign.fromJson(Map<String, dynamic> json) => _$CardDesignFromJson(json);
}

@freezed
abstract class GiftRules with _$GiftRules {
  const factory GiftRules({
    @Default(true) bool enabled,
    @Default(true) bool hidePricesByDefault,
    @Default(true) bool allowForCustomOrders,
    @Default(300) int maxMessageLength,
    @Default(60) int fromNameMaxLength,
    double? freePackagingThreshold,
    String? freePackagingOptionId,
  }) = _GiftRules;

  factory GiftRules.fromJson(Map<String, dynamic> json) => _$GiftRulesFromJson(json);
}

@freezed
abstract class GiftOptions with _$GiftOptions {
  const factory GiftOptions({
    @Default(<PackagingOption>[]) List<PackagingOption> packaging,
    @Default(<CardType>[]) List<CardType> cardTypes,
    @Default(<CardDesign>[]) List<CardDesign> cardDesigns,
    @Default(<Occasion>[]) List<Occasion> occasions,
    @Default(GiftRules()) GiftRules rules,
  }) = _GiftOptions;

  factory GiftOptions.fromJson(Map<String, dynamic> json) => _$GiftOptionsFromJson(json);
}

@freezed
abstract class GiftMessageCheck with _$GiftMessageCheck {
  const factory GiftMessageCheck({@Default(true) bool valid, @Default(0) int length, @Default(0) int maxLength, @Default(<GiftIssue>[]) List<GiftIssue> issues}) = _GiftMessageCheck;

  factory GiftMessageCheck.fromJson(Map<String, dynamic> json) => _$GiftMessageCheckFromJson(json);
}

@freezed
abstract class GiftIssue with _$GiftIssue {
  const factory GiftIssue({@Default('') String code, @Default('') String message, String? field}) = _GiftIssue;

  factory GiftIssue.fromJson(Map<String, dynamic> json) => _$GiftIssueFromJson(json);
}

/// What the customer picked in the gift step (`GiftSelectionRequest`).
class GiftSelection {
  const GiftSelection({
    required this.recipientName,
    required this.recipientPhone,
    required this.occasion,
    this.surprise = true,
    this.packagingOptionId,
    this.cardTypeId,
    this.cardDesignId,
    this.message,
    this.fromName,
    this.hidePrices,
  });

  final String recipientName;
  final String recipientPhone;
  final Occasion occasion;
  final bool surprise;
  final String? packagingOptionId;
  final String? cardTypeId;
  final String? cardDesignId;
  final String? message;
  final String? fromName;
  final bool? hidePrices;

  Map<String, dynamic> toJson() => {
        'isGift': true,
        'recipientName': recipientName.trim(),
        'recipientPhone': recipientPhone,
        'occasion': occasion.wire,
        'surprise': surprise,
        'packagingOptionId': packagingOptionId,
        'cardTypeId': cardTypeId,
        'cardDesignId': cardDesignId,
        'message': (message?.trim().isEmpty ?? true) ? null : message!.trim(),
        'fromName': (fromName?.trim().isEmpty ?? true) ? null : fromName!.trim(),
        'hidePrices': hidePrices,
      };
}
