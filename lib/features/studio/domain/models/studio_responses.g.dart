// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudioQuote _$StudioQuoteFromJson(Map<String, dynamic> json) => _StudioQuote(
  unitPrice: (json['unitPrice'] as num).toDouble(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  breakdown:
      (json['breakdown'] as List<dynamic>?)
          ?.map((e) => StudioBreakdownItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StudioBreakdownItem>[],
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
          ?.map((e) => LayerQualityWarning.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LayerQualityWarning>[],
);

Map<String, dynamic> _$StudioQuoteToJson(
  _StudioQuote instance,
) => <String, dynamic>{
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'breakdown': instance.breakdown.map((e) => e.toJson()).toList(),
  'volumeDiscountPercent': instance.volumeDiscountPercent,
  'volumeDiscount': instance.volumeDiscount,
  'rushFee': instance.rushFee,
  'setupFee': instance.setupFee,
  'total': instance.total,
  'leadTimeMinDays': instance.leadTimeMinDays,
  'leadTimeMaxDays': instance.leadTimeMaxDays,
  'estimatedDeliveryFrom': instance.estimatedDeliveryFrom?.toIso8601String(),
  'estimatedDeliveryTo': instance.estimatedDeliveryTo?.toIso8601String(),
  'warnings': instance.warnings.map((e) => e.toJson()).toList(),
};

_StudioBreakdownItem _$StudioBreakdownItemFromJson(Map<String, dynamic> json) =>
    _StudioBreakdownItem(
      kind: json['kind'] as String? ?? '',
      code: json['code'] as String? ?? '',
      label: json['label'] as String,
      detail: json['detail'] as String?,
      unitAmount: (json['unitAmount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$StudioBreakdownItemToJson(
  _StudioBreakdownItem instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'code': instance.code,
  'label': instance.label,
  'detail': instance.detail,
  'unitAmount': instance.unitAmount,
};

_LayerQualityWarning _$LayerQualityWarningFromJson(Map<String, dynamic> json) =>
    _LayerQualityWarning(
      layerId: json['layerId'] as String,
      effectiveDpi: (json['effectiveDpi'] as num).toInt(),
      level: json['level'] as String? ?? 'ok',
    );

Map<String, dynamic> _$LayerQualityWarningToJson(
  _LayerQualityWarning instance,
) => <String, dynamic>{
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
      editable: json['editable'] as bool? ?? false,
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
      'spec': instance.spec.toJson(),
      'layers': instance.layers.map((e) => e.toJson()).toList(),
      'pricingVersionId': instance.pricingVersionId,
      'quote': instance.quote?.toJson(),
      'quoteErrorCode': instance.quoteErrorCode,
      'mockupUrls': instance.mockupUrls,
      'shareUrl': instance.shareUrl,
      'changeRequestMessage': instance.changeRequestMessage,
      'imageRightsConfirmed': instance.imageRightsConfirmed,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'uploads': instance.uploads.map((e) => e.toJson()).toList(),
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
