import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'cart_models.freezed.dart';
part 'cart_models.g.dart';

/// `CartResponse` — the bag as the server prices it. The client never recalculates any amount.
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
  bool get hasLineErrors => items.any((i) => i.hasError);
}

/// `CartItemResponse`. `kind` is `stock` | `custom` on the wire (lower-case, unlike `OrderLineKind`).
@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required String id,
    @Default('stock') String kind,
    String? productId,
    String? productSlug,
    String? variantId,
    String? designId,
    required String name,
    String? color,
    String? colorHex,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? sku,
    String? imageUrl,
    required double unitPrice,
    required int quantity,
    required double lineTotal,
    @Default(<LineAdjustment>[]) List<LineAdjustment> adjustments,
    @JsonKey(unknownEnumValue: StockState.unknown) @Default(StockState.inStock) StockState stock,
    int? stockLeft,
    int? leadTimeDays,
    String? errorCode,
    String? errorMessage,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  /// Studio design line (the image is the design mockup).
  bool get isCustom => designId != null || kind.toLowerCase() == 'custom';
  bool get hasError => errorCode != null;

  /// Upper bound for the quantity stepper: what is left in stock for stock lines. Custom lines are capped by the
  /// server (`cart.max_quantity_exceeded`), which is surfaced as an error.
  int get maxQuantity {
    const fallback = 99;
    if (isCustom) return fallback;
    final left = stockLeft;
    if (left == null) return fallback;
    return left < quantity ? quantity : left;
  }

  /// Lines that can't be ordered — the stepper is disabled and the line must be removed.
  bool get isBlocked => stock == StockState.outOfStock || stock == StockState.unavailable;
}

@freezed
abstract class CartPromo with _$CartPromo {
  const factory CartPromo({required String code, @Default(true) bool valid, String? errorCode, String? errorMessage}) = _CartPromo;

  factory CartPromo.fromJson(Map<String, dynamic> json) => _$CartPromoFromJson(json);
}

@freezed
abstract class CartTotals with _$CartTotals {
  const factory CartTotals({@Default(0) double subtotal, @Default(0) double discount, @Default(0) double total, @Default(0) double vatIncluded}) = _CartTotals;

  factory CartTotals.fromJson(Map<String, dynamic> json) => _$CartTotalsFromJson(json);
}

/// "You're X away from free delivery" — every number comes from the server.
@freezed
abstract class FreeDeliveryProgress with _$FreeDeliveryProgress {
  const FreeDeliveryProgress._();

  const factory FreeDeliveryProgress({required String zoneCode, required double threshold, required double remaining, @Default(false) bool qualifies}) =
      _FreeDeliveryProgress;

  factory FreeDeliveryProgress.fromJson(Map<String, dynamic> json) => _$FreeDeliveryProgressFromJson(json);

  /// Visual fill of the progress bar (0..1). A ratio of two server values — display only, not a price.
  double get fraction {
    if (qualifies || threshold <= 0) return 1;
    return ((threshold - remaining) / threshold).clamp(0, 1).toDouble();
  }
}
