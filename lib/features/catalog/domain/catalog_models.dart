import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'catalog_models.freezed.dart';
part 'catalog_models.g.dart';

/// Catalog models — mirror `Hoo.Application/Catalog/Storefront/Contracts` 1:1.

/// `CategoryResponse`.
@freezed
abstract class CatalogCategory with _$CatalogCategory {
  const factory CatalogCategory({required String id, required String slug, required String name, String? parentId, @Default(0) int productCount}) =
      _CatalogCategory;

  factory CatalogCategory.fromJson(Map<String, dynamic> json) => _$CatalogCategoryFromJson(json);
}

/// `CollectionResponse`.
@freezed
abstract class CatalogCollection with _$CatalogCollection {
  const factory CatalogCollection({required String id, required String slug, required String name, String? description, DateTime? releasedAt}) =
      _CatalogCollection;

  factory CatalogCollection.fromJson(Map<String, dynamic> json) => _$CatalogCollectionFromJson(json);
}

/// `FacetValue` — `value` is what goes back into the query (category slug, size, color code, fit…).
@freezed
abstract class FacetValue with _$FacetValue {
  const factory FacetValue({required String value, required String label, @Default(0) int count}) = _FacetValue;

  factory FacetValue.fromJson(Map<String, dynamic> json) => _$FacetValueFromJson(json);
}

/// `ProductFacets` — counts within the current scope (category/collection/chip), before the user's filters.
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

/// `ProductListResponse`.
@freezed
abstract class ProductList with _$ProductList {
  const factory ProductList({
    @Default(<ProductCard>[]) List<ProductCard> items,
    @Default(1) int page,
    @Default(12) int pageSize,
    @Default(0) int totalCount,
    @Default(false) bool hasMore,
    @Default(ProductFacets()) ProductFacets facets,
  }) = _ProductList;

  factory ProductList.fromJson(Map<String, dynamic> json) => _$ProductListFromJson(json);
}

/// `VariantResponse` — one size of one color. `price` is the server's effective price for that variant.
@freezed
abstract class Variant with _$Variant {
  const Variant._();

  const factory Variant({
    required String id,
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    @Default('') String sku,
    required double price,
    @Default(false) bool inStock,
    int? lowStockLeft,
    @Default(false) bool preorder,
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  /// Can go into the bag (in stock, or out of stock but open for preorder).
  bool get purchasable => inStock || preorder;
}

/// `ProductColorResponse` — gallery and sizes per color.
@freezed
abstract class ProductColor with _$ProductColor {
  const ProductColor._();

  const factory ProductColor({required ColorInfo color, @Default(<String>[]) List<String> images, @Default(<Variant>[]) List<Variant> variants}) =
      _ProductColor;

  factory ProductColor.fromJson(Map<String, dynamic> json) => _$ProductColorFromJson(json);

  bool get available => variants.any((v) => v.purchasable);
}

/// `SizeChartRowResponse`.
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

/// `SizeRecommendationResponse` — from the style profile ("We recommend M").
@freezed
abstract class SizeRecommendation with _$SizeRecommendation {
  const factory SizeRecommendation({
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    @JsonKey(unknownEnumValue: RecommendationBasis.unknown) @Default(RecommendationBasis.unknown) RecommendationBasis basis,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(Fit.unknown) Fit fit,
  }) = _SizeRecommendation;

  factory SizeRecommendation.fromJson(Map<String, dynamic> json) => _$SizeRecommendationFromJson(json);
}

/// `DeliveryPromiseResponse` — "Order within 3 h 20 min — delivered tomorrow".
@freezed
abstract class DeliveryPromise with _$DeliveryPromise {
  const factory DeliveryPromise({required int orderWithinMinutes, required DateTime deliveryDate, @Default('') String zoneCode}) = _DeliveryPromise;

  factory DeliveryPromise.fromJson(Map<String, dynamic> json) => _$DeliveryPromiseFromJson(json);
}

/// `ProductModel3DResponse`.
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
    required CatalogCategory category,
    CatalogCollection? collection,
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
  bool get inStock => colors.any((c) => c.available);
}

/// `RecommendationsResponse` (`GET /catalog/products/{slug}/recommendations`).
@freezed
abstract class Recommendations with _$Recommendations {
  const factory Recommendations({@Default(<ProductCard>[]) List<ProductCard> youMayAlsoLike, @Default(<ProductCard>[]) List<ProductCard> completeTheLook}) =
      _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) => _$RecommendationsFromJson(json);
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
