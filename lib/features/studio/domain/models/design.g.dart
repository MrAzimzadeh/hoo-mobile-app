// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomMeasurements _$CustomMeasurementsFromJson(Map<String, dynamic> json) =>
    _CustomMeasurements(
      chestCm: (json['chestCm'] as num).toInt(),
      lengthCm: (json['lengthCm'] as num).toInt(),
      sleeveCm: (json['sleeveCm'] as num).toInt(),
      waistCm: (json['waistCm'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CustomMeasurementsToJson(_CustomMeasurements instance) =>
    <String, dynamic>{
      'chestCm': instance.chestCm,
      'lengthCm': instance.lengthCm,
      'sleeveCm': instance.sleeveCm,
      'waistCm': ?instance.waistCm,
      'note': ?instance.note,
    };

_DesignSpec _$DesignSpecFromJson(Map<String, dynamic> json) => _DesignSpec(
  baseCode: json['baseCode'] as String,
  fit:
      $enumDecodeNullable(
        _$FitEnumMap,
        json['fit'],
        unknownValue: Fit.unknown,
      ) ??
      Fit.regular,
  featureCodes:
      (json['featureCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  fabricCode: json['fabricCode'] as String,
  colorId: json['colorId'] as String,
  size: $enumDecodeNullable(
    _$SizeEnumMap,
    json['size'],
    unknownValue: Size.unknown,
  ),
  customMeasurements: json['customMeasurements'] == null
      ? null
      : CustomMeasurements.fromJson(
          json['customMeasurements'] as Map<String, dynamic>,
        ),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  rush: json['rush'] as bool? ?? false,
);

Map<String, dynamic> _$DesignSpecToJson(_DesignSpec instance) =>
    <String, dynamic>{
      'baseCode': instance.baseCode,
      'fit': _$FitEnumMap[instance.fit]!,
      'featureCodes': instance.featureCodes,
      'fabricCode': instance.fabricCode,
      'colorId': instance.colorId,
      'size': _$SizeEnumMap[instance.size],
      'customMeasurements': instance.customMeasurements?.toJson(),
      'quantity': instance.quantity,
      'rush': instance.rush,
    };

const _$FitEnumMap = {
  Fit.oversized: 'Oversized',
  Fit.boxy: 'Boxy',
  Fit.regular: 'Regular',
  Fit.fitted: 'Fitted',
  Fit.cropped: 'Cropped',
  Fit.unknown: '',
};

const _$SizeEnumMap = {
  Size.xs: 'XS',
  Size.s: 'S',
  Size.m: 'M',
  Size.l: 'L',
  Size.xl: 'XL',
  Size.xxl: 'XXL',
  Size.xxxl: '3XL',
  Size.unknown: '',
};

_ZoneVector _$ZoneVectorFromJson(Map<String, dynamic> json) => _ZoneVector(
  x: (json['x'] as num?)?.toDouble() ?? 0,
  y: (json['y'] as num?)?.toDouble() ?? 0,
  z: (json['z'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ZoneVectorToJson(_ZoneVector instance) =>
    <String, dynamic>{'x': instance.x, 'y': instance.y, 'z': instance.z};

_LayerAnchor _$LayerAnchorFromJson(Map<String, dynamic> json) => _LayerAnchor(
  position: ZoneVector.fromJson(json['position'] as Map<String, dynamic>),
  normal: ZoneVector.fromJson(json['normal'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LayerAnchorToJson(_LayerAnchor instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'normal': instance.normal.toJson(),
    };

_DesignLayer _$DesignLayerFromJson(Map<String, dynamic> json) => _DesignLayer(
  id: json['id'] as String,
  kind: $enumDecode(_$LayerKindEnumMap, json['kind']),
  placement: json['placement'] as String,
  zIndex: (json['zIndex'] as num?)?.toInt() ?? 0,
  printMethodCode: json['printMethodCode'] as String,
  widthCm: (json['widthCm'] as num).toDouble(),
  heightCm: (json['heightCm'] as num).toDouble(),
  xCm: (json['xCm'] as num?)?.toDouble() ?? 0,
  yCm: (json['yCm'] as num?)?.toDouble() ?? 0,
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0,
  text: json['text'] as String?,
  font: json['font'] as String?,
  fontSizePt: (json['fontSizePt'] as num?)?.toDouble(),
  align: json['align'] as String?,
  curve: (json['curve'] as num?)?.toDouble(),
  colorHex: json['colorHex'] as String?,
  uploadId: json['uploadId'] as String?,
  graphicId: json['graphicId'] as String?,
  anchor: json['anchor'] == null
      ? null
      : LayerAnchor.fromJson(json['anchor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DesignLayerToJson(_DesignLayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$LayerKindEnumMap[instance.kind]!,
      'placement': instance.placement,
      'zIndex': instance.zIndex,
      'printMethodCode': instance.printMethodCode,
      'widthCm': instance.widthCm,
      'heightCm': instance.heightCm,
      'xCm': instance.xCm,
      'yCm': instance.yCm,
      'rotation': instance.rotation,
      'text': instance.text,
      'font': instance.font,
      'fontSizePt': instance.fontSizePt,
      'align': instance.align,
      'curve': instance.curve,
      'colorHex': instance.colorHex,
      'uploadId': instance.uploadId,
      'graphicId': instance.graphicId,
      'anchor': instance.anchor?.toJson(),
    };

const _$LayerKindEnumMap = {
  LayerKind.text: 'Text',
  LayerKind.image: 'Image',
  LayerKind.graphic: 'Graphic',
};
