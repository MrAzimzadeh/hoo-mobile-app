// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudioConfig _$StudioConfigFromJson(Map<String, dynamic> json) =>
    _StudioConfig(
      pricingVersionId: json['pricingVersionId'] as String,
      pricingVersion: (json['pricingVersion'] as num?)?.toInt() ?? 0,
      baseProducts:
          (json['baseProducts'] as List<dynamic>?)
              ?.map((e) => StudioBase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StudioBase>[],
      fits:
          (json['fits'] as List<dynamic>?)
              ?.map((e) => StudioFitOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StudioFitOption>[],
      features:
          (json['features'] as List<dynamic>?)
              ?.map((e) => StudioFeature.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StudioFeature>[],
      fabrics:
          (json['fabrics'] as List<dynamic>?)
              ?.map((e) => StudioFabric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StudioFabric>[],
      sizeSurcharges:
          (json['sizeSurcharges'] as List<dynamic>?)
              ?.map((e) => SizeSurcharge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SizeSurcharge>[],
      printMethods:
          (json['printMethods'] as List<dynamic>?)
              ?.map(
                (e) => StudioPrintMethod.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <StudioPrintMethod>[],
      extras: json['extras'] == null
          ? const StudioExtras()
          : StudioExtras.fromJson(json['extras'] as Map<String, dynamic>),
      fonts:
          (json['fonts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      maxUploadMegabytes: (json['maxUploadMegabytes'] as num?)?.toInt() ?? 20,
      recommendedDpi: (json['recommendedDpi'] as num?)?.toInt() ?? 300,
      maxLayers: (json['maxLayers'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$StudioConfigToJson(_StudioConfig instance) =>
    <String, dynamic>{
      'pricingVersionId': instance.pricingVersionId,
      'pricingVersion': instance.pricingVersion,
      'baseProducts': instance.baseProducts.map((e) => e.toJson()).toList(),
      'fits': instance.fits.map((e) => e.toJson()).toList(),
      'features': instance.features.map((e) => e.toJson()).toList(),
      'fabrics': instance.fabrics.map((e) => e.toJson()).toList(),
      'sizeSurcharges': instance.sizeSurcharges.map((e) => e.toJson()).toList(),
      'printMethods': instance.printMethods.map((e) => e.toJson()).toList(),
      'extras': instance.extras.toJson(),
      'fonts': instance.fonts,
      'maxUploadMegabytes': instance.maxUploadMegabytes,
      'recommendedDpi': instance.recommendedDpi,
      'maxLayers': instance.maxLayers,
    };

_StudioBase _$StudioBaseFromJson(Map<String, dynamic> json) => _StudioBase(
  code: json['code'] as String,
  productType:
      $enumDecodeNullable(
        _$ProductTypeEnumMap,
        json['productType'],
        unknownValue: ProductType.unknown,
      ) ??
      ProductType.unknown,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  leadTimeMinDays: (json['leadTimeMinDays'] as num?)?.toInt() ?? 0,
  leadTimeMaxDays: (json['leadTimeMaxDays'] as num?)?.toInt() ?? 0,
  fits:
      (json['fits'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FitEnumMap, e))
          .toList() ??
      const <Fit>[],
  featureCodes:
      (json['featureCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  fabricCodes:
      (json['fabricCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  colors:
      (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ColorInfo>[],
  sizes:
      (json['sizes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SizeEnumMap, e))
          .toList() ??
      const <Size>[],
  printAreas:
      (json['printAreas'] as List<dynamic>?)
          ?.map((e) => PrintArea.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PrintArea>[],
  model: $enumDecodeNullable(
    _$GarmentModelEnumMap,
    json['model'],
    unknownValue: GarmentModel.unknown,
  ),
  template: json['template'] == null
      ? null
      : StudioTemplate.fromJson(json['template'] as Map<String, dynamic>),
  maxQuantity: (json['maxQuantity'] as num?)?.toInt(),
  product: json['product'] == null
      ? null
      : StudioBaseProductRef.fromJson(json['product'] as Map<String, dynamic>),
  variants: (json['variants'] as List<dynamic>?)
      ?.map((e) => StudioBaseVariant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StudioBaseToJson(_StudioBase instance) =>
    <String, dynamic>{
      'code': instance.code,
      'productType': _$ProductTypeEnumMap[instance.productType]!,
      'name': instance.name,
      'price': instance.price,
      'leadTimeMinDays': instance.leadTimeMinDays,
      'leadTimeMaxDays': instance.leadTimeMaxDays,
      'fits': instance.fits.map((e) => _$FitEnumMap[e]!).toList(),
      'featureCodes': instance.featureCodes,
      'fabricCodes': instance.fabricCodes,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
      'sizes': instance.sizes.map((e) => _$SizeEnumMap[e]!).toList(),
      'printAreas': instance.printAreas.map((e) => e.toJson()).toList(),
      'model': _$GarmentModelEnumMap[instance.model],
      'template': instance.template?.toJson(),
      'maxQuantity': instance.maxQuantity,
      'product': instance.product?.toJson(),
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
    };

const _$ProductTypeEnumMap = {
  ProductType.hoodie: 'Hoodie',
  ProductType.zipHoodie: 'ZipHoodie',
  ProductType.tShirt: 'TShirt',
  ProductType.sweatshirt: 'Sweatshirt',
  ProductType.sweatpants: 'Sweatpants',
  ProductType.shorts: 'Shorts',
  ProductType.unknown: '',
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

const _$GarmentModelEnumMap = {
  GarmentModel.tShirt: 'TShirt',
  GarmentModel.hoodie: 'Hoodie',
  GarmentModel.sweatshirt: 'Sweatshirt',
  GarmentModel.longSleeve: 'LongSleeve',
  GarmentModel.unknown: '',
};

_StudioBaseProductRef _$StudioBaseProductRefFromJson(
  Map<String, dynamic> json,
) => _StudioBaseProductRef(
  id: json['id'] as String,
  slug: json['slug'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$StudioBaseProductRefToJson(
  _StudioBaseProductRef instance,
) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'imageUrl': instance.imageUrl,
};

_StudioBaseVariant _$StudioBaseVariantFromJson(Map<String, dynamic> json) =>
    _StudioBaseVariant(
      colorId: json['colorId'] as String,
      size: $enumDecode(
        _$SizeEnumMap,
        json['size'],
        unknownValue: Size.unknown,
      ),
      price: (json['price'] as num?)?.toDouble() ?? 0,
      available: json['available'] as bool? ?? true,
    );

Map<String, dynamic> _$StudioBaseVariantToJson(_StudioBaseVariant instance) =>
    <String, dynamic>{
      'colorId': instance.colorId,
      'size': _$SizeEnumMap[instance.size]!,
      'price': instance.price,
      'available': instance.available,
    };

_StudioTemplate _$StudioTemplateFromJson(Map<String, dynamic> json) =>
    _StudioTemplate(
      id: json['id'] as String,
      modelUrl: json['modelUrl'] as String,
      heightCm: (json['heightCm'] as num).toDouble(),
      tintable: json['tintable'] as bool? ?? true,
      zones:
          (json['zones'] as List<dynamic>?)
              ?.map(
                (e) => StudioTemplateZone.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <StudioTemplateZone>[],
    );

Map<String, dynamic> _$StudioTemplateToJson(_StudioTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelUrl': instance.modelUrl,
      'heightCm': instance.heightCm,
      'tintable': instance.tintable,
      'zones': instance.zones.map((e) => e.toJson()).toList(),
    };

_StudioTemplateZone _$StudioTemplateZoneFromJson(Map<String, dynamic> json) =>
    _StudioTemplateZone(
      code: json['code'] as String,
      name: json['name'] as String? ?? '',
      position: ZoneVector.fromJson(json['position'] as Map<String, dynamic>),
      normal: ZoneVector.fromJson(json['normal'] as Map<String, dynamic>),
      rotation: (json['rotation'] as num?)?.toDouble() ?? 0,
      widthCm: (json['widthCm'] as num).toDouble(),
      heightCm: (json['heightCm'] as num).toDouble(),
    );

Map<String, dynamic> _$StudioTemplateZoneToJson(_StudioTemplateZone instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'position': instance.position.toJson(),
      'normal': instance.normal.toJson(),
      'rotation': instance.rotation,
      'widthCm': instance.widthCm,
      'heightCm': instance.heightCm,
    };

_PrintArea _$PrintAreaFromJson(Map<String, dynamic> json) => _PrintArea(
  placement: json['placement'] as String,
  widthCm: (json['widthCm'] as num).toDouble(),
  heightCm: (json['heightCm'] as num).toDouble(),
);

Map<String, dynamic> _$PrintAreaToJson(_PrintArea instance) =>
    <String, dynamic>{
      'placement': instance.placement,
      'widthCm': instance.widthCm,
      'heightCm': instance.heightCm,
    };

_StudioFitOption _$StudioFitOptionFromJson(Map<String, dynamic> json) =>
    _StudioFitOption(
      fit: $enumDecode(_$FitEnumMap, json['fit'], unknownValue: Fit.unknown),
      surcharge: (json['surcharge'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$StudioFitOptionToJson(_StudioFitOption instance) =>
    <String, dynamic>{
      'fit': _$FitEnumMap[instance.fit]!,
      'surcharge': instance.surcharge,
    };

_StudioFeature _$StudioFeatureFromJson(Map<String, dynamic> json) =>
    _StudioFeature(
      code: json['code'] as String,
      name: json['name'] as String,
      surcharge: (json['surcharge'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$StudioFeatureToJson(_StudioFeature instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'surcharge': instance.surcharge,
    };

_StudioFabric _$StudioFabricFromJson(Map<String, dynamic> json) =>
    _StudioFabric(
      code: json['code'] as String,
      name: json['name'] as String,
      gsm: (json['gsm'] as num?)?.toInt(),
      surcharge: (json['surcharge'] as num?)?.toDouble() ?? 0,
      included: json['included'] as bool? ?? false,
    );

Map<String, dynamic> _$StudioFabricToJson(_StudioFabric instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'gsm': instance.gsm,
      'surcharge': instance.surcharge,
      'included': instance.included,
    };

_SizeSurcharge _$SizeSurchargeFromJson(Map<String, dynamic> json) =>
    _SizeSurcharge(
      size: $enumDecode(
        _$SizeEnumMap,
        json['size'],
        unknownValue: Size.unknown,
      ),
      surcharge: (json['surcharge'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$SizeSurchargeToJson(_SizeSurcharge instance) =>
    <String, dynamic>{
      'size': _$SizeEnumMap[instance.size]!,
      'surcharge': instance.surcharge,
    };

_StudioPrintMethod _$StudioPrintMethodFromJson(Map<String, dynamic> json) =>
    _StudioPrintMethod(
      code: json['code'] as String,
      name: json['name'] as String,
      maxWidthCm: (json['maxWidthCm'] as num).toDouble(),
      maxHeightCm: (json['maxHeightCm'] as num).toDouble(),
      tiers:
          (json['tiers'] as List<dynamic>?)
              ?.map((e) => StudioTier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StudioTier>[],
    );

Map<String, dynamic> _$StudioPrintMethodToJson(_StudioPrintMethod instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'maxWidthCm': instance.maxWidthCm,
      'maxHeightCm': instance.maxHeightCm,
      'tiers': instance.tiers.map((e) => e.toJson()).toList(),
    };

_StudioTier _$StudioTierFromJson(Map<String, dynamic> json) => _StudioTier(
  label: json['label'] as String,
  maxWidthCm: (json['maxWidthCm'] as num).toDouble(),
  maxHeightCm: (json['maxHeightCm'] as num).toDouble(),
  price: (json['price'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$StudioTierToJson(_StudioTier instance) =>
    <String, dynamic>{
      'label': instance.label,
      'maxWidthCm': instance.maxWidthCm,
      'maxHeightCm': instance.maxHeightCm,
      'price': instance.price,
    };

_StudioExtras _$StudioExtrasFromJson(Map<String, dynamic> json) =>
    _StudioExtras(
      rushFee: (json['rushFee'] as num?)?.toDouble() ?? 0,
      rushLeadTimeDays: (json['rushLeadTimeDays'] as num?)?.toInt() ?? 0,
      customMeasurementsFee:
          (json['customMeasurementsFee'] as num?)?.toDouble() ?? 0,
      setupFee: (json['setupFee'] as num?)?.toDouble() ?? 0,
      volumeTiers:
          (json['volumeTiers'] as List<dynamic>?)
              ?.map((e) => VolumeTier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <VolumeTier>[],
    );

Map<String, dynamic> _$StudioExtrasToJson(_StudioExtras instance) =>
    <String, dynamic>{
      'rushFee': instance.rushFee,
      'rushLeadTimeDays': instance.rushLeadTimeDays,
      'customMeasurementsFee': instance.customMeasurementsFee,
      'setupFee': instance.setupFee,
      'volumeTiers': instance.volumeTiers.map((e) => e.toJson()).toList(),
    };

_VolumeTier _$VolumeTierFromJson(Map<String, dynamic> json) => _VolumeTier(
  minQuantity: (json['minQuantity'] as num).toInt(),
  percent: (json['percent'] as num).toDouble(),
);

Map<String, dynamic> _$VolumeTierToJson(_VolumeTier instance) =>
    <String, dynamic>{
      'minQuantity': instance.minQuantity,
      'percent': instance.percent,
    };
