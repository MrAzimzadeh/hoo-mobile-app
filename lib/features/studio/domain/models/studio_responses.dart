import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';
import 'design.dart';

part 'studio_responses.freezed.dart';
part 'studio_responses.g.dart';

/// `POST /studio/price` → `StudioQuoteResponse`. Rendered as-is; the client never derives money from it.
@freezed
abstract class StudioQuote with _$StudioQuote {
  const StudioQuote._();

  @JsonSerializable(explicitToJson: true)
  const factory StudioQuote({
    required double unitPrice,
    @Default(1) int quantity,
    @Default(<StudioBreakdownItem>[]) List<StudioBreakdownItem> breakdown,
    @Default(0) double volumeDiscountPercent,
    @Default(0) double volumeDiscount,
    @Default(0) double rushFee,
    @Default(0) double setupFee,
    required double total,
    @Default(0) int leadTimeMinDays,
    @Default(0) int leadTimeMaxDays,
    DateTime? estimatedDeliveryFrom,
    DateTime? estimatedDeliveryTo,
    @Default(<LayerQualityWarning>[]) List<LayerQualityWarning> warnings,
  }) = _StudioQuote;

  factory StudioQuote.fromJson(Map<String, dynamic> json) => _$StudioQuoteFromJson(json);

  LayerQualityWarning? warningFor(String layerId) => warnings.where((w) => w.layerId == layerId && w.quality != PrintQuality.ok).firstOrNull;
}

/// One localized row of the price breakdown (`kind`: base / fit / feature / fabric / size / measurements / layer).
@freezed
abstract class StudioBreakdownItem with _$StudioBreakdownItem {
  const factory StudioBreakdownItem({@Default('') String kind, @Default('') String code, required String label, String? detail, @Default(0) double unitAmount}) =
      _StudioBreakdownItem;

  factory StudioBreakdownItem.fromJson(Map<String, dynamic> json) => _$StudioBreakdownItemFromJson(json);
}

enum PrintQuality { ok, warning, poor }

/// DPI warning for an image layer: `level` is `ok | warning | poor`.
@freezed
abstract class LayerQualityWarning with _$LayerQualityWarning {
  const LayerQualityWarning._();

  const factory LayerQualityWarning({required String layerId, required int effectiveDpi, @Default('ok') String level}) = _LayerQualityWarning;

  factory LayerQualityWarning.fromJson(Map<String, dynamic> json) => _$LayerQualityWarningFromJson(json);

  PrintQuality get quality => switch (level.toLowerCase()) {
        'poor' => PrintQuality.poor,
        'warning' => PrintQuality.warning,
        _ => PrintQuality.ok,
      };
}

/// `POST /studio/uploads` → `DesignUploadResponse`.
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

/// `DesignResponse` (owner view; the shared view has `editable=false` and no share/change-request data).
@freezed
abstract class StudioDesign with _$StudioDesign {
  const StudioDesign._();

  @JsonSerializable(explicitToJson: true)
  const factory StudioDesign({
    required String id,
    @Default('') String name,
    @JsonKey(unknownEnumValue: DesignStatus.unknown) @Default(DesignStatus.draft) DesignStatus status,
    @Default(false) bool editable,
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

  DesignDoc get doc => DesignDoc(name: name, spec: spec, layers: layers);
}

/// `GET /studio/designs` row.
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

  /// Drafts and designs sent back by the team can be edited (mirrors `Design.IsEditable`).
  bool get editable => status == DesignStatus.draft || status == DesignStatus.changesRequested;
}
