import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

/// `CartResponse` (`Hoo.Application/Cart/Contracts`). Every amount is calculated by the server — the client only
/// renders it and re-renders from the next response after each mutation.
@freezed
abstract class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    required String id,
    @Default(<CartItem>[]) List<CartItem> items,
    @Default(0) int itemsCount,
    CartPromo? promo,
    @Default(false) bool isGift,
    @Default(CartTotals()) CartTotals totals,
    FreeDeliveryProgress? freeDelivery,
    @Default(false) bool canCheckout,
    @Default(<ProductCard>[]) List<ProductCard> completeTheLook,
    @Default(<ProductCard>[]) List<ProductCard> bestsellers,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  bool get isEmpty => items.isEmpty;
  bool get hasLineErrors => items.any((i) => i.hasProblem);

  CartItem? itemById(String id) => items.where((i) => i.id == id).firstOrNull;
  CartItem? itemForVariant(String variantId) => items.where((i) => i.variantId == variantId).firstOrNull;
  CartItem? itemForDesign(String designId) => items.where((i) => i.designId == designId).firstOrNull;
}

/// `CartItemResponse`. A stock variant or a Studio design ("made to order").
@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required String id,
    @JsonKey(fromJson: cartLineKindFromJson, toJson: cartLineKindToJson) @Default(OrderLineKind.stock) OrderLineKind kind,
    String? productId,
    String? productSlug,
    String? variantId,
    String? designId,
    @Default('') String name,
    String? color,
    String? colorHex,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? sku,
    String? imageUrl,
    @Default(0) double unitPrice,
    @Default(1) int quantity,
    @Default(0) double lineTotal,
    @Default(<LineAdjustment>[]) List<LineAdjustment> adjustments,
    @JsonKey(unknownEnumValue: StockState.unknown) @Default(StockState.unknown) StockState stock,
    int? stockLeft,
    int? leadTimeDays,
    String? errorCode,
    String? errorMessage,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  /// Studio design line (mockup thumbnail, "Made to order", production lead time).
  bool get isCustom => kind == OrderLineKind.custom || designId != null;

  /// The line blocks checkout (server error, sold out or no longer available).
  bool get hasProblem => errorCode != null || stock == StockState.outOfStock || stock == StockState.unavailable;

  /// Upper bound for the quantity stepper. Stock lines are capped by what is left when the server reports it; the
  /// server still enforces its own per-line maximum (`cart.max_quantity_exceeded`).
  int get maxQuantity {
    final left = stockLeft;
    if (!isCustom && left != null && stock != StockState.preorder && left > 0) return left.clamp(1, maxLineQuantity);
    return maxLineQuantity;
  }

  /// UI cap of the quantity stepper.
  static const maxLineQuantity = 99;
}

@freezed
abstract class CartPromo with _$CartPromo {
  const factory CartPromo({required String code, @Default(true) bool valid, String? errorCode, String? errorMessage}) = _CartPromo;

  factory CartPromo.fromJson(Map<String, dynamic> json) => _$CartPromoFromJson(json);
}

/// `CartTotals` — delivery is not known before checkout.
@freezed
abstract class CartTotals with _$CartTotals {
  const factory CartTotals({@Default(0) double subtotal, @Default(0) double discount, @Default(0) double total, @Default(0) double vatIncluded}) =
      _CartTotals;

  factory CartTotals.fromJson(Map<String, dynamic> json) => _$CartTotalsFromJson(json);
}

/// "Add X more for free delivery" for the default zone.
@freezed
abstract class FreeDeliveryProgress with _$FreeDeliveryProgress {
  const FreeDeliveryProgress._();

  const factory FreeDeliveryProgress({
    @Default('') String zoneCode,
    @Default(0) double threshold,
    @Default(0) double remaining,
    @Default(false) bool qualifies,
  }) = _FreeDeliveryProgress;

  factory FreeDeliveryProgress.fromJson(Map<String, dynamic> json) => _$FreeDeliveryProgressFromJson(json);

  /// 0..1 fill of the progress bar — a display ratio of two server values, not a price.
  double get progress {
    if (qualifies || threshold <= 0) return 1;
    return ((threshold - remaining) / threshold).clamp(0.0, 1.0);
  }
}

/// `CartService` serializes the kind lowercase (`"stock"` / `"custom"`) while the order contracts use
/// `Stock` / `Custom` — accept both.
OrderLineKind cartLineKindFromJson(Object? value) {
  final v = value?.toString().toLowerCase();
  return switch (v) {
    'stock' => OrderLineKind.stock,
    'custom' => OrderLineKind.custom,
    _ => OrderLineKind.unknown,
  };
}

String cartLineKindToJson(OrderLineKind kind) => kind.wire;
