import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'wishlist_models.freezed.dart';
part 'wishlist_models.g.dart';

/// `POST /wishlist/share` → `WishlistShareResponse { token, url }`. One public, read-only token per user.
@freezed
abstract class WishlistShare with _$WishlistShare {
  const factory WishlistShare({required String token, required String url}) = _WishlistShare;

  factory WishlistShare.fromJson(Map<String, dynamic> json) => _$WishlistShareFromJson(json);
}

/// `GET /wishlist/shared/{token}` → `SharedWishlistResponse { ownerFirstName, items }`.
@freezed
abstract class SharedWishlist with _$SharedWishlist {
  const factory SharedWishlist({@Default('') String ownerFirstName, @Default(<ProductCard>[]) List<ProductCard> items}) = _SharedWishlist;

  factory SharedWishlist.fromJson(Map<String, dynamic> json) => _$SharedWishlistFromJson(json);
}

/// `GET /alerts` → `StockAlertResponse`. "Back in stock" (optionally for one size/color) or "price drop".
@freezed
abstract class StockAlert with _$StockAlert {
  const StockAlert._();

  const factory StockAlert({
    required String id,
    required ProductCard product,

    /// Null when the server sends a type this app version does not know yet.
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StockAlertType? type,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? colorId,
    required DateTime createdAt,
    DateTime? notifiedAt,
  }) = _StockAlert;

  factory StockAlert.fromJson(Map<String, dynamic> json) => _$StockAlertFromJson(json);

  /// The alert fired (the customer was notified); it no longer watches the product.
  bool get isNotified => notifiedAt != null;

  /// Color name when it can be resolved from the card.
  // TODO(backend): StockAlertResponse only carries `colorId` — add the color name/hex to show any color.
  String? get colorName => colorId != null && product.defaultColor?.id == colorId ? product.defaultColor!.name : null;
}

/// The parts of `GET /catalog/products/{slug}` (`ProductDetailResponse`) the "move to bag" size picker needs.
@freezed
abstract class PickerProduct with _$PickerProduct {
  const factory PickerProduct({
    required String id,
    required String slug,
    required String name,
    required double price,
    double? compareAtPrice,
    int? discountPercent,
    @Default(<PickerColor>[]) List<PickerColor> colors,
  }) = _PickerProduct;

  factory PickerProduct.fromJson(Map<String, dynamic> json) => _$PickerProductFromJson(json);
}

/// `ProductColorResponse { color, images, variants }`.
@freezed
abstract class PickerColor with _$PickerColor {
  const factory PickerColor({required ColorInfo color, @Default(<String>[]) List<String> images, @Default(<PickerVariant>[]) List<PickerVariant> variants}) =
      _PickerColor;

  factory PickerColor.fromJson(Map<String, dynamic> json) => _$PickerColorFromJson(json);
}

/// `VariantResponse { id, size, sku, price, inStock, lowStockLeft, preorder }`.
@freezed
abstract class PickerVariant with _$PickerVariant {
  const PickerVariant._();

  const factory PickerVariant({
    required String id,
    @JsonKey(unknownEnumValue: Size.unknown) @Default(Size.unknown) Size size,
    @Default('') String sku,
    required double price,
    @Default(false) bool inStock,
    int? lowStockLeft,
    @Default(false) bool preorder,
  }) = _PickerVariant;

  factory PickerVariant.fromJson(Map<String, dynamic> json) => _$PickerVariantFromJson(json);

  /// Can be added to the bag (in stock or available to pre-order).
  bool get purchasable => inStock || preorder;
}
