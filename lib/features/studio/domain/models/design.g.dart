// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignSpec _$DesignSpecFromJson(Map<String, dynamic> json) => _DesignSpec(
  baseCode: json['baseCode'] as String,
  fit: $enumDecode(_$FitEnumMap, json['fit'], unknownValue: Fit.unknown),
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
      'waistCm': instance.waistCm,
      'note': instance.note,
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

_LayerAnchor _$LayerAnchorFromJson(Map<String, dynamic> json) => _LayerAnchor(
  position: ZoneVector.fromJson(json['position'] as Map<String, dynamic>),
  normal: ZoneVector.fromJson(json['normal'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LayerAnchorToJson(_LayerAnchor instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'normal': instance.normal.toJson(),
    };

_StudioQuote _$StudioQuoteFromJson(Map<String, dynamic> json) => _StudioQuote(
  unitPrice: (json['unitPrice'] as num).toDouble(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  breakdown:
      (json['breakdown'] as List<dynamic>?)
          ?.map((e) => QuoteBreakdownItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <QuoteBreakdownItem>[],
  volumeDiscountPercent:
      (json['volumeDiscountPercent'] as num?)?.toDouble() ?? 0,
  volumeDiscount: (json['volumeDiscount'] as num?)?.toDouble() ?? 0,
  rushFee: (json['rushFee'] as num?)?.toDouble() ?? 0,
  setupFee: (json['setupFee'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num).toDouble(),
  leadTimeMinDays: (json['leadTimeMinDays'] as num?)?.toInt() ?? 0,
  leadTimeMaxDays: (json['leadTimeMaxDays'] as num?)?.toInt() ?? 0,
  estimatedDeliveryFrom: json['estimatedDeliveryFrom'] == null
      ? null
      : DateTime.parse(json['estimatedDeliveryFrom'] as String),
  estimatedDeliveryTo: json['estimatedDeliveryTo'] == null
      ? null
      : DateTime.parse(json['estimatedDeliveryTo'] as String),
  warnings:
      (json['warnings'] as List<dynamic>?)
          ?.map((e) => QualityWarning.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <QualityWarning>[],
);

Map<String, dynamic> _$StudioQuoteToJson(
  _StudioQuote instance,
) => <String, dynamic>{
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'breakdown': instance.breakdown,
  'volumeDiscountPercent': instance.volumeDiscountPercent,
  'volumeDiscount': instance.volumeDiscount,
  'rushFee': instance.rushFee,
  'setupFee': instance.setupFee,
  'total': instance.total,
  'leadTimeMinDays': instance.leadTimeMinDays,
  'leadTimeMaxDays': instance.leadTimeMaxDays,
  'estimatedDeliveryFrom': instance.estimatedDeliveryFrom?.toIso8601String(),
  'estimatedDeliveryTo': instance.estimatedDeliveryTo?.toIso8601String(),
  'warnings': instance.warnings,
};

_QuoteBreakdownItem _$QuoteBreakdownItemFromJson(Map<String, dynamic> json) =>
    _QuoteBreakdownItem(
      kind: json['kind'] as String,
      code: json['code'] as String,
      label: json['label'] as String,
      detail: json['detail'] as String?,
      unitAmount: (json['unitAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$QuoteBreakdownItemToJson(_QuoteBreakdownItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'code': instance.code,
      'label': instance.label,
      'detail': instance.detail,
      'unitAmount': instance.unitAmount,
    };

_QualityWarning _$QualityWarningFromJson(Map<String, dynamic> json) =>
    _QualityWarning(
      layerId: json['layerId'] as String,
      effectiveDpi: (json['effectiveDpi'] as num).toInt(),
      level: json['level'] as String? ?? 'ok',
    );

Map<String, dynamic> _$QualityWarningToJson(_QualityWarning instance) =>
    <String, dynamic>{
      'layerId': instance.layerId,
      'effectiveDpi': instance.effectiveDpi,
      'level': instance.level,
    };

_DesignUpload _$DesignUploadFromJson(Map<String, dynamic> json) =>
    _DesignUpload(
      id: json['id'] as String,
      url: json['url'] as String,
      contentType: json['contentType'] as String? ?? '',
      widthPx: (json['widthPx'] as num?)?.toInt(),
      heightPx: (json['heightPx'] as num?)?.toInt(),
      isVector: json['isVector'] as bool? ?? false,
      maxPrintWidthCmAtRecommendedDpi:
          (json['maxPrintWidthCmAtRecommendedDpi'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DesignUploadToJson(
  _DesignUpload instance,
) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'contentType': instance.contentType,
  'widthPx': instance.widthPx,
  'heightPx': instance.heightPx,
  'isVector': instance.isVector,
  'maxPrintWidthCmAtRecommendedDpi': instance.maxPrintWidthCmAtRecommendedDpi,
};

_StudioDesign _$StudioDesignFromJson(Map<String, dynamic> json) =>
    _StudioDesign(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      status:
          $enumDecodeNullable(
            _$DesignStatusEnumMap,
            json['status'],
            unknownValue: DesignStatus.unknown,
          ) ??
          DesignStatus.draft,
      editable: json['editable'] as bool? ?? true,
      spec: DesignSpec.fromJson(json['spec'] as Map<String, dynamic>),
      layers:
          (json['layers'] as List<dynamic>?)
              ?.map((e) => DesignLayer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DesignLayer>[],
      pricingVersionId: json['pricingVersionId'] as String,
      quote: json['quote'] == null
          ? null
          : StudioQuote.fromJson(json['quote'] as Map<String, dynamic>),
      quoteErrorCode: json['quoteErrorCode'] as String?,
      mockupUrls:
          (json['mockupUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      shareUrl: json['shareUrl'] as String?,
      changeRequestMessage: json['changeRequestMessage'] as String?,
      imageRightsConfirmed: json['imageRightsConfirmed'] as bool? ?? false,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      uploads:
          (json['uploads'] as List<dynamic>?)
              ?.map((e) => DesignUpload.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DesignUpload>[],
    );

Map<String, dynamic> _$StudioDesignToJson(_StudioDesign instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$DesignStatusEnumMap[instance.status]!,
      'editable': instance.editable,
      'spec': instance.spec,
      'layers': instance.layers,
      'pricingVersionId': instance.pricingVersionId,
      'quote': instance.quote,
      'quoteErrorCode': instance.quoteErrorCode,
      'mockupUrls': instance.mockupUrls,
      'shareUrl': instance.shareUrl,
      'changeRequestMessage': instance.changeRequestMessage,
      'imageRightsConfirmed': instance.imageRightsConfirmed,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'uploads': instance.uploads,
    };

const _$DesignStatusEnumMap = {
  DesignStatus.draft: 'Draft',
  DesignStatus.submitted: 'Submitted',
  DesignStatus.changesRequested: 'ChangesRequested',
  DesignStatus.approved: 'Approved',
  DesignStatus.inProduction: 'InProduction',
  DesignStatus.ready: 'Ready',
  DesignStatus.cancelled: 'Cancelled',
  DesignStatus.unknown: '',
};

_DesignListItem _$DesignListItemFromJson(Map<String, dynamic> json) =>
    _DesignListItem(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      status:
          $enumDecodeNullable(
            _$DesignStatusEnumMap,
            json['status'],
            unknownValue: DesignStatus.unknown,
          ) ??
          DesignStatus.draft,
      mockupUrl: json['mockupUrl'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DesignListItemToJson(_DesignListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$DesignStatusEnumMap[instance.status]!,
      'mockupUrl': instance.mockupUrl,
      'total': instance.total,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
