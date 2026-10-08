import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import 'design.dart';

part 'studio_config.freezed.dart';
part 'studio_config.g.dart';

/// `GET /studio/config` → `StudioConfigResponse`. Every amount here is a server value shown as-is (surcharges,
/// "from" prices); the total is always `POST /studio/price`.
@freezed
abstract class StudioConfig with _$StudioConfig {
  const StudioConfig._();

  @JsonSerializable(explicitToJson: true)
  const factory StudioConfig({
    required String pricingVersionId,
    @Default(0) int pricingVersion,
    @Default(<StudioBase>[]) List<StudioBase> baseProducts,
    @Default(<StudioFitOption>[]) List<StudioFitOption> fits,
    @Default(<StudioFeature>[]) List<StudioFeature> features,
    @Default(<StudioFabric>[]) List<StudioFabric> fabrics,
    @Default(<SizeSurcharge>[]) List<SizeSurcharge> sizeSurcharges,
    @Default(<StudioPrintMethod>[]) List<StudioPrintMethod> printMethods,
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
  StudioPrintMethod? printMethod(String? code) => printMethods.where((m) => m.code == code).firstOrNull;
  double fitSurcharge(Fit fit) => fits.where((f) => f.fit == fit).firstOrNull?.surcharge ?? 0;
  double sizeSurcharge(Size size) => sizeSurcharges.where((s) => s.size == size).firstOrNull?.surcharge ?? 0;
}

/// `StudioBaseResponse` — a garment you can design on.
@freezed
abstract class StudioBase with _$StudioBase {
  const StudioBase._();

  @JsonSerializable(explicitToJson: true)
  const factory StudioBase({
    required String code,
    @JsonKey(unknownEnumValue: ProductType.unknown) @Default(ProductType.unknown) ProductType productType,
    required String name,
    required double price,
    @Default(0) int leadTimeMinDays,
    @Default(0) int leadTimeMaxDays,
    @Default(<Fit>[]) List<Fit> fits,
    @Default(<String>[]) List<String> featureCodes,
    @Default(<String>[]) List<String> fabricCodes,
    @Default(<ColorInfo>[]) List<ColorInfo> colors,
    @Default(<Size>[]) List<Size> sizes,
    @Default(<PrintArea>[]) List<PrintArea> printAreas,
    @JsonKey(unknownEnumValue: GarmentModel.unknown) GarmentModel? model,
    StudioTemplate? template,
    int? maxQuantity,
    StudioBaseProductRef? product,
    List<StudioBaseVariant>? variants,
  }) = _StudioBase;

  factory StudioBase.fromJson(Map<String, dynamic> json) => _$StudioBaseFromJson(json);

  /// Print areas the customer can work on. Uploaded templates define their own zones (sizes from the matching
  /// price area when one exists); procedural garments use the configured areas.
  List<PrintArea> get areas {
    final t = template;
    if (t == null || t.zones.isEmpty) return printAreas;
    return [
      for (final z in t.zones) printAreas.where((a) => a.placement == z.code).firstOrNull ?? PrintArea(placement: z.code, widthCm: z.widthCm, heightCm: z.heightCm),
    ];
  }

  PrintArea? area(String placement) => areas.where((a) => a.placement == placement).firstOrNull;

  /// Human name of a template zone (custom codes like `left-chest`); built-in placements are localized by the UI.
  String? zoneName(String placement) => template?.zones.where((z) => z.code == placement).firstOrNull?.name;
}

@freezed
abstract class StudioBaseProductRef with _$StudioBaseProductRef {
  const factory StudioBaseProductRef({required String id, required String slug, String? imageUrl}) = _StudioBaseProductRef;

  factory StudioBaseProductRef.fromJson(Map<String, dynamic> json) => _$StudioBaseProductRefFromJson(json);
}

/// Ready catalog products carry color × size stock; plain bases have none (every combination is orderable).
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

/// Admin-uploaded `.glb` and its print zones.
@freezed
abstract class StudioTemplate with _$StudioTemplate {
  @JsonSerializable(explicitToJson: true)
  const factory StudioTemplate({
    required String id,
    required String modelUrl,
    required double heightCm,
    @Default(true) bool tintable,
    @Default(<StudioTemplateZone>[]) List<StudioTemplateZone> zones,
  }) = _StudioTemplate;

  factory StudioTemplate.fromJson(Map<String, dynamic> json) => _$StudioTemplateFromJson(json);
}

@freezed
abstract class StudioTemplateZone with _$StudioTemplateZone {
  @JsonSerializable(explicitToJson: true)
  const factory StudioTemplateZone({
    required String code,
    @Default('') String name,
    required ZoneVector position,
    required ZoneVector normal,
    @Default(0) double rotation,
    required double widthCm,
    required double heightCm,
  }) = _StudioTemplateZone;

  factory StudioTemplateZone.fromJson(Map<String, dynamic> json) => _$StudioTemplateZoneFromJson(json);
}

/// Print area size in cm, e.g. Front 30×40.
@freezed
abstract class PrintArea with _$PrintArea {
  const factory PrintArea({required String placement, required double widthCm, required double heightCm}) = _PrintArea;

  factory PrintArea.fromJson(Map<String, dynamic> json) => _$PrintAreaFromJson(json);
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
  const factory StudioFabric({required String code, required String name, int? gsm, @Default(0) double surcharge, @Default(false) bool included}) = _StudioFabric;

  factory StudioFabric.fromJson(Map<String, dynamic> json) => _$StudioFabricFromJson(json);
}

@freezed
abstract class SizeSurcharge with _$SizeSurcharge {
  const factory SizeSurcharge({@JsonKey(unknownEnumValue: Size.unknown) required Size size, @Default(0) double surcharge}) = _SizeSurcharge;

  factory SizeSurcharge.fromJson(Map<String, dynamic> json) => _$SizeSurchargeFromJson(json);
}

@freezed
abstract class StudioPrintMethod with _$StudioPrintMethod {
  @JsonSerializable(explicitToJson: true)
  const factory StudioPrintMethod({
    required String code,
    required String name,
    required double maxWidthCm,
    required double maxHeightCm,
    @Default(<StudioTier>[]) List<StudioTier> tiers,
  }) = _StudioPrintMethod;

  factory StudioPrintMethod.fromJson(Map<String, dynamic> json) => _$StudioPrintMethodFromJson(json);
}

@freezed
abstract class StudioTier with _$StudioTier {
  const factory StudioTier({required String label, required double maxWidthCm, required double maxHeightCm, @Default(0) double price}) = _StudioTier;

  factory StudioTier.fromJson(Map<String, dynamic> json) => _$StudioTierFromJson(json);
}

@freezed
abstract class StudioExtras with _$StudioExtras {
  @JsonSerializable(explicitToJson: true)
  const factory StudioExtras({
    @Default(0) double rushFee,
    @Default(0) int rushLeadTimeDays,
    @Default(0) double customMeasurementsFee,
    @Default(0) double setupFee,
    @Default(<VolumeTier>[]) List<VolumeTier> volumeTiers,
  }) = _StudioExtras;

  factory StudioExtras.fromJson(Map<String, dynamic> json) => _$StudioExtrasFromJson(json);
}

/// Volume discount tier (5+ → 15%).
@freezed
abstract class VolumeTier with _$VolumeTier {
  const factory VolumeTier({required int minQuantity, required double percent}) = _VolumeTier;

  factory VolumeTier.fromJson(Map<String, dynamic> json) => _$VolumeTierFromJson(json);
}
