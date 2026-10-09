import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';
import 'studio_config.dart';

part 'design.freezed.dart';
part 'design.g.dart';

/// `DesignSpec` — the choices that define the price: base, fit, features, fabric, colour, size (or custom
/// measurements), quantity and rush.
@freezed
abstract class DesignSpec with _$DesignSpec {
  @JsonSerializable(explicitToJson: true)
  const factory DesignSpec({
    required String baseCode,
    @JsonKey(unknownEnumValue: Fit.unknown) required Fit fit,
    @Default(<String>[]) List<String> featureCodes,
    required String fabricCode,
    required String colorId,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    CustomMeasurements? customMeasurements,
    @Default(1) int quantity,
    @Default(false) bool rush,
  }) = _DesignSpec;

  factory DesignSpec.fromJson(Map<String, dynamic> json) => _$DesignSpecFromJson(json);
}

/// Made-to-measure (+ `customMeasurementsFee`): chest 60–200, length 40–120, sleeve 10–100 cm.
@freezed
abstract class CustomMeasurements with _$CustomMeasurements {
  const factory CustomMeasurements({required int chestCm, required int lengthCm, required int sleeveCm, int? waistCm, String? note}) =
      _CustomMeasurements;

  factory CustomMeasurements.fromJson(Map<String, dynamic> json) => _$CustomMeasurementsFromJson(json);

  static const chestRange = (min: 60, max: 200);
  static const lengthRange = (min: 40, max: 120);
  static const sleeveRange = (min: 10, max: 100);
}

/// `DesignLayer` — positions in cm from the top-left corner of the print area; sizes are the physical print size
/// (they decide the print tier). A free layer (`placement` = `free-…` + [anchor]) is its own zone on the 3D model.
@freezed
abstract class DesignLayer with _$DesignLayer {
  @JsonSerializable(explicitToJson: true)
  const factory DesignLayer({
    required String id,
    required LayerKind kind,
    required String placement,
    @Default(0) int zIndex,
    required String printMethodCode,
    required double widthCm,
    required double heightCm,
    @Default(0) double xCm,
    @Default(0) double yCm,
    @Default(0) double rotation,
    String? text,
    String? font,
    double? fontSizePt,
    String? align,
    double? curve,
    String? colorHex,
    String? uploadId,
    String? graphicId,
    LayerAnchor? anchor,
  }) = _DesignLayer;

  factory DesignLayer.fromJson(Map<String, dynamic> json) => _$DesignLayerFromJson(json);
}

/// A free layer's spot on the model surface (template space, cm) and the outward normal.
@freezed
abstract class LayerAnchor with _$LayerAnchor {
  @JsonSerializable(explicitToJson: true)
  const factory LayerAnchor({required ZoneVector position, required ZoneVector normal}) = _LayerAnchor;

  factory LayerAnchor.fromJson(Map<String, dynamic> json) => _$LayerAnchorFromJson(json);
}

/// `StudioQuoteResponse` — the only source of every Studio amount on screen.
@freezed
abstract class StudioQuote with _$StudioQuote {
  const StudioQuote._();

  const factory StudioQuote({
    required double unitPrice,
    @Default(1) int quantity,
    @Default(<QuoteBreakdownItem>[]) List<QuoteBreakdownItem> breakdown,
    @Default(0) double volumeDiscountPercent,
    @Default(0) double volumeDiscount,
    @Default(0) double rushFee,
    @Default(0) double setupFee,
    required double total,
    @Default(0) int leadTimeMinDays,
    @Default(0) int leadTimeMaxDays,
    DateTime? estimatedDeliveryFrom,
    DateTime? estimatedDeliveryTo,
    @Default(<QualityWarning>[]) List<QualityWarning> warnings,
  }) = _StudioQuote;

  factory StudioQuote.fromJson(Map<String, dynamic> json) => _$StudioQuoteFromJson(json);

  QualityWarning? warningFor(String layerId) => warnings.where((w) => w.layerId == layerId).firstOrNull;
}

@freezed
abstract class QuoteBreakdownItem with _$QuoteBreakdownItem {
  const factory QuoteBreakdownItem({required String kind, required String code, required String label, String? detail, required double unitAmount}) =
      _QuoteBreakdownItem;

  factory QuoteBreakdownItem.fromJson(Map<String, dynamic> json) => _$QuoteBreakdownItemFromJson(json);
}

enum PrintQuality {
  ok,
  warning,
  poor;

  static PrintQuality fromWire(String level) => switch (level.toLowerCase()) {
        'poor' => poor,
        'warning' => warning,
        _ => ok,
      };
}

/// Effective DPI of an image layer at its print size (`ok` ≥ recommended, `warning`, `poor`).
@freezed
abstract class QualityWarning with _$QualityWarning {
  const QualityWarning._();

  const factory QualityWarning({required String layerId, required int effectiveDpi, @Default('ok') String level}) = _QualityWarning;

  factory QualityWarning.fromJson(Map<String, dynamic> json) => _$QualityWarningFromJson(json);

  PrintQuality get quality => PrintQuality.fromWire(level);
}

/// `DesignUploadResponse` — an uploaded file and what it can print sharply.
@freezed
abstract class DesignUpload with _$DesignUpload {
  const factory DesignUpload({
    required String id,
    required String url,
    @Default('') String contentType,
    int? widthPx,
    int? heightPx,
    @Default(false) bool isVector,
    int? maxPrintWidthCmAtRecommendedDpi,
  }) = _DesignUpload;

  factory DesignUpload.fromJson(Map<String, dynamic> json) => _$DesignUploadFromJson(json);
}

/// `DesignResponse`.
@freezed
abstract class StudioDesign with _$StudioDesign {
  const StudioDesign._();

  const factory StudioDesign({
    required String id,
    @Default('') String name,
    @JsonKey(unknownEnumValue: DesignStatus.unknown) @Default(DesignStatus.draft) DesignStatus status,
    @Default(true) bool editable,
    required DesignSpec spec,
    @Default(<DesignLayer>[]) List<DesignLayer> layers,
    required String pricingVersionId,
    StudioQuote? quote,
    String? quoteErrorCode,
    @Default(<String>[]) List<String> mockupUrls,
    String? shareUrl,
    String? changeRequestMessage,
    @Default(false) bool imageRightsConfirmed,
    DateTime? submittedAt,
    DateTime? approvedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(<DesignUpload>[]) List<DesignUpload> uploads,
  }) = _StudioDesign;

  factory StudioDesign.fromJson(Map<String, dynamic> json) => _$StudioDesignFromJson(json);

  bool get hasImages => layers.any((l) => l.kind == LayerKind.image);
}

/// `DesignListItem` (My designs).
@freezed
abstract class DesignListItem with _$DesignListItem {
  const DesignListItem._();

  const factory DesignListItem({
    required String id,
    @Default('') String name,
    @JsonKey(unknownEnumValue: DesignStatus.unknown) @Default(DesignStatus.draft) DesignStatus status,
    String? mockupUrl,
    double? total,
    DateTime? updatedAt,
  }) = _DesignListItem;

  factory DesignListItem.fromJson(Map<String, dynamic> json) => _$DesignListItemFromJson(json);

  /// Mirrors `Design.IsEditable` on the backend.
  bool get editable => status == DesignStatus.draft || status == DesignStatus.changesRequested;
}
