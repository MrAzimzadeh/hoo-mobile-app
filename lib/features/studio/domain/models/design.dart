import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';

part 'design.freezed.dart';
part 'design.g.dart';

/// `Hoo.Domain.Studio.Designs.CustomMeasurements` — optional made-to-measure values (adds the server's fee).
@freezed
abstract class CustomMeasurements with _$CustomMeasurements {
  @JsonSerializable(includeIfNull: false)
  const factory CustomMeasurements({required int chestCm, required int lengthCm, required int sleeveCm, int? waistCm, String? note}) = _CustomMeasurements;

  factory CustomMeasurements.fromJson(Map<String, dynamic> json) => _$CustomMeasurementsFromJson(json);
}

/// `DesignSpec` — the selections that define the price (base, fit, features, fabric, color, size, quantity, rush).
@freezed
abstract class DesignSpec with _$DesignSpec {
  @JsonSerializable(explicitToJson: true)
  const factory DesignSpec({
    required String baseCode,
    @JsonKey(unknownEnumValue: Fit.unknown) @Default(Fit.regular) Fit fit,
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

/// A point in the template's normalized model space (cm).
@freezed
abstract class ZoneVector with _$ZoneVector {
  const factory ZoneVector({@Default(0) double x, @Default(0) double y, @Default(0) double z}) = _ZoneVector;

  factory ZoneVector.fromJson(Map<String, dynamic> json) => _$ZoneVectorFromJson(json);
}

/// Free placement on an uploaded 3D model: surface point + outward normal (`LayerAnchor`).
@freezed
abstract class LayerAnchor with _$LayerAnchor {
  @JsonSerializable(explicitToJson: true)
  const factory LayerAnchor({required ZoneVector position, required ZoneVector normal}) = _LayerAnchor;

  factory LayerAnchor.fromJson(Map<String, dynamic> json) => _$LayerAnchorFromJson(json);
}

/// `DesignLayer` — one text/image print. Sizes and positions are in cm; x/y from the top-left of the print area
/// ([placement]). Text fields only for Text, [uploadId] only for Image.
@freezed
abstract class DesignLayer with _$DesignLayer {
  const DesignLayer._();

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

  bool get isText => kind == LayerKind.text;
  bool get isImage => kind == LayerKind.image;
}

/// The editable document: what autosave persists and what the price depends on.
@freezed
abstract class DesignDoc with _$DesignDoc {
  const factory DesignDoc({@Default('') String name, required DesignSpec spec, @Default(<DesignLayer>[]) List<DesignLayer> layers}) = _DesignDoc;
}
