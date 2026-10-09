import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'catalog_models.freezed.dart';
part 'catalog_models.g.dart';

/// Catalog view models — 1:1 with `Hoo.Application/Catalog/Storefront/Contracts` (camelCase JSON, enums as
/// strings). Product cards and colors are shared (`shared/domain/models.dart`).

/// `CategoryResponse`.
@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String slug,
    required String name,
    String? parentId,
    @Default(0) int productCount,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

/// `CollectionResponse`.
@freezed
abstract class Collection with _$Collection {
  const factory Collection({
    required String id,
    required String slug,
    required String name,
    String? description,
    DateTime? releasedAt,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

/// `FacetValue` — a filter option with its product count. [value] goes back to the API verbatim.
@freezed
abstract class FacetValue with _$FacetValue {
  const factory FacetValue({required String value, required String label, @Default(0) int count}) = _FacetValue;

  factory FacetValue.fromJson(Map<String, dynamic> json) => _$FacetValueFromJson(json);
}

/// `ProductFacets` — computed by the server for the current scope (category / collection / chip).
@freezed
abstract class ProductFacets with _$ProductFacets {
  const factory ProductFacets({
    @Default(<FacetValue>[]) List<FacetValue> categories,
    @Default(<FacetValue>[]) List<FacetValue> sizes,
    @Default(<FacetValue>[]) List<FacetValue> colors,
    @Default(<FacetValue>[]) List<FacetValue> fits,
    @Default(<FacetValue>[]) List<FacetValue> fabrics,
    double? minPrice,
    double? maxPrice,
  }) = _ProductFacets;

  factory ProductFacets.fromJson(Map<String, dynamic> json) => _$ProductFacetsFromJson(json);
}

/// `ProductListResponse` — one page of `GET /catalog/products` plus facets.
@freezed
abstract class ProductListPage with _$ProductListPage {
  const factory ProductListPage({
    @Default(<ProductCard>[]) List<ProductCard> items,
    @Default(1) int page,
    @Default(12) int pageSize,
    @Default(0) int totalCount,
    @Default(false) bool hasMore,
    @Default(ProductFacets()) ProductFacets facets,
  }) = _ProductListPage;

  factory ProductListPage.fromJson(Map<String, dynamic> json) => _$ProductListPageFromJson(json);
}

/// `VariantResponse` — one size within a color. [price] is the server's effective price for this variant.
@freezed
abstract class ProductVariant with _$ProductVariant {
  const ProductVariant._();

  const factory ProductVariant({
    required String id,
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    @Default('') String sku,
    required double price,
    @Default(false) bool inStock,
    int? lowStockLeft,
    @Default(false) bool preorder,
  }) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);

  /// Can be added to the bag (in stock, or out of stock with pre-order allowed).
  bool get purchasable => inStock || preorder;
}

/// `ProductColorResponse` — a color with its own gallery and sizes.
@freezed
abstract class ProductColor with _$ProductColor {
  const ProductColor._();

  const factory ProductColor({
    required ColorInfo color,
    @Default(<String>[]) List<String> images,
    @Default(<ProductVariant>[]) List<ProductVariant> variants,
  }) = _ProductColor;

  factory ProductColor.fromJson(Map<String, dynamic> json) => _$ProductColorFromJson(json);

  bool get purchasable => variants.any((v) => v.purchasable);

  ProductVariant? variantFor(Size size) {
    for (final v in variants) {
      if (v.size == size) return v;
    }
    return null;
  }
}

/// `SizeChartRowResponse` — garment measurements in cm and inches.
@freezed
abstract class SizeChartRow with _$SizeChartRow {
  const factory SizeChartRow({
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    required double chestCm,
    required double lengthCm,
    required double sleeveCm,
    required double chestIn,
    required double lengthIn,
    required double sleeveIn,
  }) = _SizeChartRow;

  factory SizeChartRow.fromJson(Map<String, dynamic> json) => _$SizeChartRowFromJson(json);
}

/// `SizeRecommendationResponse` — from the customer's style profile.
@freezed
abstract class SizeRecommendation with _$SizeRecommendation {
  const factory SizeRecommendation({
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    @JsonKey(unknownEnumValue: RecommendationBasis.unknown) @Default(RecommendationBasis.unknown) RecommendationBasis basis,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(Fit.unknown) Fit fit,
  }) = _SizeRecommendation;

  factory SizeRecommendation.fromJson(Map<String, dynamic> json) => _$SizeRecommendationFromJson(json);
}

/// `DeliveryPromiseResponse` — "order within 3 h 20 min — delivered tomorrow". [deliveryDate] is a `DateOnly`
/// (`2026-10-09`), decoded as local midnight.
@freezed
abstract class DeliveryPromise with _$DeliveryPromise {
  const factory DeliveryPromise({
    required int orderWithinMinutes,
    required DateTime deliveryDate,
    @Default('') String zoneCode,
  }) = _DeliveryPromise;

  factory DeliveryPromise.fromJson(Map<String, dynamic> json) => _$DeliveryPromiseFromJson(json);
}

/// `ProductModel3DResponse` — GLB path (backend-relative), real height and whether it can be tinted.
@freezed
abstract class ProductModel3D with _$ProductModel3D {
  const factory ProductModel3D({required String modelUrl, required double heightCm, @Default(false) bool tintable}) = _ProductModel3D;

  factory ProductModel3D.fromJson(Map<String, dynamic> json) => _$ProductModel3DFromJson(json);
}

/// `ProductDetailResponse`.
@freezed
abstract class ProductDetail with _$ProductDetail {
  const ProductDetail._();

  const factory ProductDetail({
    required String id,
    required String slug,
    required String name,
    @Default('') String description,
    String? fabricAndCare,
    String? sizeAndFit,
    Category? category,
    Collection? collection,
    @JsonKey(unknownEnumValue: ProductType.unknown) @Default(ProductType.unknown) ProductType productType,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(Fit.unknown) Fit fit,
    String? fabric,
    required double price,
    double? compareAtPrice,
    int? discountPercent,
    @Default(<String>[]) List<String> badges,
    @Default(<String>[]) List<String> tags,
    @Default(<ProductColor>[]) List<ProductColor> colors,
    @Default(<SizeChartRow>[]) List<SizeChartRow> sizeChart,
    double? rating,
    @Default(0) int reviewCount,
    SizeRecommendation? recommendedSize,
    DeliveryPromise? deliveryPromise,
    @Default(false) bool availableInStudio,
    @Default(false) bool isWishlisted,
    @JsonKey(name: 'model3D') ProductModel3D? model3D,
  }) = _ProductDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => _$ProductDetailFromJson(json);

  List<ProductBadge> get badgeList => badges.map(ProductBadge.fromWire).where((b) => b != ProductBadge.unknown).toList();

  bool get purchasable => colors.any((c) => c.purchasable);

  ProductColor? colorById(String? id) {
    for (final c in colors) {
      if (c.color.id == id) return c;
    }
    return null;
  }

  /// The card shown in rails and passed to the next PDP (instant first frame).
  ProductCard toCard({String? imageUrl}) => ProductCard(
        id: id,
        slug: slug,
        name: name,
        price: price,
        compareAtPrice: compareAtPrice,
        discountPercent: discountPercent,
        badges: badges,
        colorsCount: colors.length,
        defaultColor: colors.isEmpty ? null : colors.first.color,
        colorHexes: [for (final c in colors) c.color.hex],
        imageUrl: imageUrl ?? colors.expand((c) => c.images).firstOrNull,
        rating: rating,
        reviewCount: reviewCount,
        inStock: purchasable,
      );
}

/// `RecommendationsResponse` — "You may also like" and "Complete the look".
@freezed
abstract class Recommendations with _$Recommendations {
  const Recommendations._();

  const factory Recommendations({
    @Default(<ProductCard>[]) List<ProductCard> youMayAlsoLike,
    @Default(<ProductCard>[]) List<ProductCard> completeTheLook,
  }) = _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) => _$RecommendationsFromJson(json);

  bool get isEmpty => youMayAlsoLike.isEmpty && completeTheLook.isEmpty;
}

/// `ReviewResponse`.
@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    @Default('') String authorName,
    required int rating,
    String? title,
    @Default('') String body,
    required DateTime createdAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
