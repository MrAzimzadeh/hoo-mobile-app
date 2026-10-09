import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';

part 'studio_config.freezed.dart';
part 'studio_config.g.dart';

/// `GET /studio/config` (`StudioConfigResponse`) — versioned by [pricingVersionId]. Mirrors the backend contract 1:1;
/// costs never reach the client, so there is nothing to compute here: the config only drives the choices on screen.
@freezed
abstract class StudioConfig with _$StudioConfig {
  const StudioConfig._();

  const factory StudioConfig({
    required String pricingVersionId,
    @Default(0) int pricingVersion,
    @Default(<StudioBase>[]) List<StudioBase> baseProducts,
    @Default(<StudioFitOption>[]) List<StudioFitOption> fits,
    @Default(<StudioFeature>[]) List<StudioFeature> features,
    @Default(<StudioFabric>[]) List<StudioFabric> fabrics,
    @Default(<SizeSurcharge>[]) List<SizeSurcharge> sizeSurcharges,
    @Default(<PrintMethod>[]) List<PrintMethod> printMethods,
    @Default(StudioExtras()) StudioExtras extras,
    @Default(<String>[]) List<String> fonts,
    @Default(20) int maxUploadMegabytes,
    @Default(300) int recommendedDpi,
    @Default(10) int maxLayers,
  }) = _StudioConfig;

  factory StudioConfig.fromJson(Map<String, dynamic> json) => _$StudioConfigFromJson(json);

  StudioBase? base(String? code) => baseProducts.where((b) => b.code == code).firstOrNull;
  StudioFabric? fabric(String? code) => fabrics.where((f) => f.code == code).firstOrNull;
  StudioFeature? feature(String code) => features.where((f) => f.code == code).firstOrNull;
  StudioFitOption? fit(Fit fit) => fits.where((f) => f.fit == fit).firstOrNull;
  PrintMethod? printMethod(String code) => printMethods.where((m) => m.code == code).firstOrNull;
  double? sizeSurcharge(Size size) => sizeSurcharges.where((s) => s.size == size).firstOrNull?.surcharge;

  /// Fabrics offered for [base] in the config's order.
  List<StudioFabric> fabricsFor(StudioBase base) => fabrics.where((f) => base.fabricCodes.contains(f.code)).toList();

  /// Features offered for [base] in the config's order.
  List<StudioFeature> featuresFor(StudioBase base) => features.where((f) => base.featureCodes.contains(f.code)).toList();
}

/// A base product (`StudioBaseResponse`). Catalog bases (code `p-<productId>`) carry [product] and [variants].
@freezed
abstract class StudioBase with _$StudioBase {
  const StudioBase._();

  const factory StudioBase({
    required String code,
    @JsonKey(unknownEnumValue: ProductType.unknown) @Default(ProductType.unknown) ProductType productType,
    required String name,
    @Default(0) double price,
    @Default(0) int leadTimeMinDays,
    @Default(0) int leadTimeMaxDays,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(<Fit>[]) List<Fit> fits,
    @Default(<String>[]) List<String> featureCodes,
    @Default(<String>[]) List<String> fabricCodes,
    @Default(<ColorInfo>[]) List<ColorInfo> colors,
    @JsonKey(unknownEnumValue: Size.unknown) @Default(<Size>[]) List<Size> sizes,
    @Default(<PrintArea>[]) List<PrintArea> printAreas,
    @JsonKey(unknownEnumValue: GarmentModel.unknown) GarmentModel? model,
    StudioTemplate? template,
    int? maxQuantity,
    StudioBaseProductRef? product,
    List<StudioBaseVariant>? variants,
  }) = _StudioBase;

  factory StudioBase.fromJson(Map<String, dynamic> json) => _$StudioBaseFromJson(json);

  /// Ready catalog product (fit, fabric and size are part of the product price; no custom measurements).
  bool get isCatalog => product != null || code.startsWith('p-');

  /// Uploaded 3D model: layers may also be placed anywhere on it ("free spots").
  bool get allowsFreePlacement => template != null;

  PrintArea? area(String placement) => printAreas.where((a) => a.placement == placement).firstOrNull;
  ColorInfo? color(String? id) => colors.where((c) => c.id == id).firstOrNull;
}

/// `PrintArea` — size of a print zone in cm (`Front` 30×40). Placement is a free string (template zone codes).
@freezed
abstract class PrintArea with _$PrintArea {
  const factory PrintArea({required String placement, required double widthCm, required double heightCm}) = _PrintArea;

  factory PrintArea.fromJson(Map<String, dynamic> json) => _$PrintAreaFromJson(json);
}

/// Uploaded GLB model and its print zones (coordinates in the normalised model space, cm).
@freezed
abstract class StudioTemplate with _$StudioTemplate {
  const factory StudioTemplate({
    required String id,
    required String modelUrl,
    @Default(70) double heightCm,
    @Default(true) bool tintable,
    @Default(<TemplateZone>[]) List<TemplateZone> zones,
  }) = _StudioTemplate;

  factory StudioTemplate.fromJson(Map<String, dynamic> json) => _$StudioTemplateFromJson(json);
}

@freezed
abstract class TemplateZone with _$TemplateZone {
  @JsonSerializable(explicitToJson: true)
  const factory TemplateZone({
    required String code,
    @Default('') String name,
    required ZoneVector position,
    required ZoneVector normal,
    @Default(0) double rotation,
    required double widthCm,
    required double heightCm,
  }) = _TemplateZone;

  factory TemplateZone.fromJson(Map<String, dynamic> json) => _$TemplateZoneFromJson(json);
}

@freezed
abstract class ZoneVector with _$ZoneVector {
  const factory ZoneVector({@Default(0) double x, @Default(0) double y, @Default(0) double z}) = _ZoneVector;

  factory ZoneVector.fromJson(Map<String, dynamic> json) => _$ZoneVectorFromJson(json);
}

/// The catalog product a base was built from ("you're designing on …").
@freezed
abstract class StudioBaseProductRef with _$StudioBaseProductRef {
  const factory StudioBaseProductRef({required String id, required String slug, String? imageUrl}) = _StudioBaseProductRef;

  factory StudioBaseProductRef.fromJson(Map<String, dynamic> json) => _$StudioBaseProductRefFromJson(json);
}

/// Colour × size of a catalog base with its real price and availability.
@freezed
abstract class StudioBaseVariant with _$StudioBaseVariant {
  const factory StudioBaseVariant({
    required String colorId,
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    @Default(0) double price,
    @Default(true) bool available,
  }) = _StudioBaseVariant;

  factory StudioBaseVariant.fromJson(Map<String, dynamic> json) => _$StudioBaseVariantFromJson(json);
}

@freezed
abstract class StudioFitOption with _$StudioFitOption {
  const factory StudioFitOption({@JsonKey(unknownEnumValue: Fit.unknown) required Fit fit, @Default(0) double surcharge}) = _StudioFitOption;

  factory StudioFitOption.fromJson(Map<String, dynamic> json) => _$StudioFitOptionFromJson(json);
}

@freezed
abstract class StudioFeature with _$StudioFeature {
  const factory StudioFeature({required String code, required String name, @Default(0) double surcharge}) = _StudioFeature;

  factory StudioFeature.fromJson(Map<String, dynamic> json) => _$StudioFeatureFromJson(json);
}

@freezed
abstract class StudioFabric with _$StudioFabric {
  const factory StudioFabric({required String code, required String name, int? gsm, @Default(0) double surcharge, @Default(false) bool included}) =
      _StudioFabric;

  factory StudioFabric.fromJson(Map<String, dynamic> json) => _$StudioFabricFromJson(json);
}

@freezed
abstract class SizeSurcharge with _$SizeSurcharge {
  const factory SizeSurcharge({@JsonKey(unknownEnumValue: Size.unknown) required Size size, @Default(0) double surcharge}) = _SizeSurcharge;

  factory SizeSurcharge.fromJson(Map<String, dynamic> json) => _$SizeSurchargeFromJson(json);
}

@freezed
abstract class PrintMethod with _$PrintMethod {
  const factory PrintMethod({
    required String code,
    required String name,
    required double maxWidthCm,
    required double maxHeightCm,
    @Default(<PrintTier>[]) List<PrintTier> tiers,
  }) = _PrintMethod;

  factory PrintMethod.fromJson(Map<String, dynamic> json) => _$PrintMethodFromJson(json);
}

@freezed
abstract class PrintTier with _$PrintTier {
  const factory PrintTier({required String label, required double maxWidthCm, required double maxHeightCm, @Default(0) double price}) = _PrintTier;

  factory PrintTier.fromJson(Map<String, dynamic> json) => _$PrintTierFromJson(json);
}

@freezed
abstract class StudioExtras with _$StudioExtras {
  const factory StudioExtras({
    @Default(0) double rushFee,
    @Default(0) int rushLeadTimeDays,
    @Default(0) double customMeasurementsFee,
    @Default(0) double setupFee,
    @Default(<VolumeTier>[]) List<VolumeTier> volumeTiers,
  }) = _StudioExtras;

  factory StudioExtras.fromJson(Map<String, dynamic> json) => _$StudioExtrasFromJson(json);
}

/// Volume discount tier ("5+ → 15%"). Shown as information only; the quote applies it.
@freezed
abstract class VolumeTier with _$VolumeTier {
  const factory VolumeTier({required int minQuantity, required double percent}) = _VolumeTier;

  factory VolumeTier.fromJson(Map<String, dynamic> json) => _$VolumeTierFromJson(json);
}

/// `GET /account/size-recommendations` value (per product type).
@freezed
abstract class SizeRecommendation with _$SizeRecommendation {
  const factory SizeRecommendation({
    @JsonKey(unknownEnumValue: Size.unknown) required Size size,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(Fit.unknown) Fit fit,
  }) = _SizeRecommendation;

  factory SizeRecommendation.fromJson(Map<String, dynamic> json) => _$SizeRecommendationFromJson(json);
}
