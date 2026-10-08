// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studio_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudioConfig {

 String get pricingVersionId; int get pricingVersion; List<StudioBase> get baseProducts; List<StudioFitOption> get fits; List<StudioFeature> get features; List<StudioFabric> get fabrics; List<SizeSurcharge> get sizeSurcharges; List<StudioPrintMethod> get printMethods; StudioExtras get extras; List<String> get fonts; int get maxUploadMegabytes; int get recommendedDpi; int get maxLayers;
/// Create a copy of StudioConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioConfigCopyWith<StudioConfig> get copyWith => _$StudioConfigCopyWithImpl<StudioConfig>(this as StudioConfig, _$identity);

  /// Serializes this StudioConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioConfig&&(identical(other.pricingVersionId, pricingVersionId) || other.pricingVersionId == pricingVersionId)&&(identical(other.pricingVersion, pricingVersion) || other.pricingVersion == pricingVersion)&&const DeepCollectionEquality().equals(other.baseProducts, baseProducts)&&const DeepCollectionEquality().equals(other.fits, fits)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.fabrics, fabrics)&&const DeepCollectionEquality().equals(other.sizeSurcharges, sizeSurcharges)&&const DeepCollectionEquality().equals(other.printMethods, printMethods)&&(identical(other.extras, extras) || other.extras == extras)&&const DeepCollectionEquality().equals(other.fonts, fonts)&&(identical(other.maxUploadMegabytes, maxUploadMegabytes) || other.maxUploadMegabytes == maxUploadMegabytes)&&(identical(other.recommendedDpi, recommendedDpi) || other.recommendedDpi == recommendedDpi)&&(identical(other.maxLayers, maxLayers) || other.maxLayers == maxLayers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pricingVersionId,pricingVersion,const DeepCollectionEquality().hash(baseProducts),const DeepCollectionEquality().hash(fits),const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(fabrics),const DeepCollectionEquality().hash(sizeSurcharges),const DeepCollectionEquality().hash(printMethods),extras,const DeepCollectionEquality().hash(fonts),maxUploadMegabytes,recommendedDpi,maxLayers);

@override
String toString() {
  return 'StudioConfig(pricingVersionId: $pricingVersionId, pricingVersion: $pricingVersion, baseProducts: $baseProducts, fits: $fits, features: $features, fabrics: $fabrics, sizeSurcharges: $sizeSurcharges, printMethods: $printMethods, extras: $extras, fonts: $fonts, maxUploadMegabytes: $maxUploadMegabytes, recommendedDpi: $recommendedDpi, maxLayers: $maxLayers)';
}


}

/// @nodoc
abstract mixin class $StudioConfigCopyWith<$Res>  {
  factory $StudioConfigCopyWith(StudioConfig value, $Res Function(StudioConfig) _then) = _$StudioConfigCopyWithImpl;
@useResult
$Res call({
 String pricingVersionId, int pricingVersion, List<StudioBase> baseProducts, List<StudioFitOption> fits, List<StudioFeature> features, List<StudioFabric> fabrics, List<SizeSurcharge> sizeSurcharges, List<StudioPrintMethod> printMethods, StudioExtras extras, List<String> fonts, int maxUploadMegabytes, int recommendedDpi, int maxLayers
});


$StudioExtrasCopyWith<$Res> get extras;

}
/// @nodoc
class _$StudioConfigCopyWithImpl<$Res>
    implements $StudioConfigCopyWith<$Res> {
  _$StudioConfigCopyWithImpl(this._self, this._then);

  final StudioConfig _self;
  final $Res Function(StudioConfig) _then;

/// Create a copy of StudioConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pricingVersionId = null,Object? pricingVersion = null,Object? baseProducts = null,Object? fits = null,Object? features = null,Object? fabrics = null,Object? sizeSurcharges = null,Object? printMethods = null,Object? extras = null,Object? fonts = null,Object? maxUploadMegabytes = null,Object? recommendedDpi = null,Object? maxLayers = null,}) {
  return _then(_self.copyWith(
pricingVersionId: null == pricingVersionId ? _self.pricingVersionId : pricingVersionId // ignore: cast_nullable_to_non_nullable
as String,pricingVersion: null == pricingVersion ? _self.pricingVersion : pricingVersion // ignore: cast_nullable_to_non_nullable
as int,baseProducts: null == baseProducts ? _self.baseProducts : baseProducts // ignore: cast_nullable_to_non_nullable
as List<StudioBase>,fits: null == fits ? _self.fits : fits // ignore: cast_nullable_to_non_nullable
as List<StudioFitOption>,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<StudioFeature>,fabrics: null == fabrics ? _self.fabrics : fabrics // ignore: cast_nullable_to_non_nullable
as List<StudioFabric>,sizeSurcharges: null == sizeSurcharges ? _self.sizeSurcharges : sizeSurcharges // ignore: cast_nullable_to_non_nullable
as List<SizeSurcharge>,printMethods: null == printMethods ? _self.printMethods : printMethods // ignore: cast_nullable_to_non_nullable
as List<StudioPrintMethod>,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as StudioExtras,fonts: null == fonts ? _self.fonts : fonts // ignore: cast_nullable_to_non_nullable
as List<String>,maxUploadMegabytes: null == maxUploadMegabytes ? _self.maxUploadMegabytes : maxUploadMegabytes // ignore: cast_nullable_to_non_nullable
as int,recommendedDpi: null == recommendedDpi ? _self.recommendedDpi : recommendedDpi // ignore: cast_nullable_to_non_nullable
as int,maxLayers: null == maxLayers ? _self.maxLayers : maxLayers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of StudioConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioExtrasCopyWith<$Res> get extras {
  
  return $StudioExtrasCopyWith<$Res>(_self.extras, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudioConfig].
extension StudioConfigPatterns on StudioConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioConfig value)  $default,){
final _that = this;
switch (_that) {
case _StudioConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioConfig value)?  $default,){
final _that = this;
switch (_that) {
case _StudioConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pricingVersionId,  int pricingVersion,  List<StudioBase> baseProducts,  List<StudioFitOption> fits,  List<StudioFeature> features,  List<StudioFabric> fabrics,  List<SizeSurcharge> sizeSurcharges,  List<StudioPrintMethod> printMethods,  StudioExtras extras,  List<String> fonts,  int maxUploadMegabytes,  int recommendedDpi,  int maxLayers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioConfig() when $default != null:
return $default(_that.pricingVersionId,_that.pricingVersion,_that.baseProducts,_that.fits,_that.features,_that.fabrics,_that.sizeSurcharges,_that.printMethods,_that.extras,_that.fonts,_that.maxUploadMegabytes,_that.recommendedDpi,_that.maxLayers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pricingVersionId,  int pricingVersion,  List<StudioBase> baseProducts,  List<StudioFitOption> fits,  List<StudioFeature> features,  List<StudioFabric> fabrics,  List<SizeSurcharge> sizeSurcharges,  List<StudioPrintMethod> printMethods,  StudioExtras extras,  List<String> fonts,  int maxUploadMegabytes,  int recommendedDpi,  int maxLayers)  $default,) {final _that = this;
switch (_that) {
case _StudioConfig():
return $default(_that.pricingVersionId,_that.pricingVersion,_that.baseProducts,_that.fits,_that.features,_that.fabrics,_that.sizeSurcharges,_that.printMethods,_that.extras,_that.fonts,_that.maxUploadMegabytes,_that.recommendedDpi,_that.maxLayers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pricingVersionId,  int pricingVersion,  List<StudioBase> baseProducts,  List<StudioFitOption> fits,  List<StudioFeature> features,  List<StudioFabric> fabrics,  List<SizeSurcharge> sizeSurcharges,  List<StudioPrintMethod> printMethods,  StudioExtras extras,  List<String> fonts,  int maxUploadMegabytes,  int recommendedDpi,  int maxLayers)?  $default,) {final _that = this;
switch (_that) {
case _StudioConfig() when $default != null:
return $default(_that.pricingVersionId,_that.pricingVersion,_that.baseProducts,_that.fits,_that.features,_that.fabrics,_that.sizeSurcharges,_that.printMethods,_that.extras,_that.fonts,_that.maxUploadMegabytes,_that.recommendedDpi,_that.maxLayers);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioConfig extends StudioConfig {
  const _StudioConfig({required this.pricingVersionId, this.pricingVersion = 0, final  List<StudioBase> baseProducts = const <StudioBase>[], final  List<StudioFitOption> fits = const <StudioFitOption>[], final  List<StudioFeature> features = const <StudioFeature>[], final  List<StudioFabric> fabrics = const <StudioFabric>[], final  List<SizeSurcharge> sizeSurcharges = const <SizeSurcharge>[], final  List<StudioPrintMethod> printMethods = const <StudioPrintMethod>[], this.extras = const StudioExtras(), final  List<String> fonts = const <String>[], this.maxUploadMegabytes = 20, this.recommendedDpi = 300, this.maxLayers = 10}): _baseProducts = baseProducts,_fits = fits,_features = features,_fabrics = fabrics,_sizeSurcharges = sizeSurcharges,_printMethods = printMethods,_fonts = fonts,super._();
  factory _StudioConfig.fromJson(Map<String, dynamic> json) => _$StudioConfigFromJson(json);

@override final  String pricingVersionId;
@override@JsonKey() final  int pricingVersion;
 final  List<StudioBase> _baseProducts;
@override@JsonKey() List<StudioBase> get baseProducts {
  if (_baseProducts is EqualUnmodifiableListView) return _baseProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_baseProducts);
}

 final  List<StudioFitOption> _fits;
@override@JsonKey() List<StudioFitOption> get fits {
  if (_fits is EqualUnmodifiableListView) return _fits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fits);
}

 final  List<StudioFeature> _features;
@override@JsonKey() List<StudioFeature> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

 final  List<StudioFabric> _fabrics;
@override@JsonKey() List<StudioFabric> get fabrics {
  if (_fabrics is EqualUnmodifiableListView) return _fabrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fabrics);
}

 final  List<SizeSurcharge> _sizeSurcharges;
@override@JsonKey() List<SizeSurcharge> get sizeSurcharges {
  if (_sizeSurcharges is EqualUnmodifiableListView) return _sizeSurcharges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeSurcharges);
}

 final  List<StudioPrintMethod> _printMethods;
@override@JsonKey() List<StudioPrintMethod> get printMethods {
  if (_printMethods is EqualUnmodifiableListView) return _printMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_printMethods);
}

@override@JsonKey() final  StudioExtras extras;
 final  List<String> _fonts;
@override@JsonKey() List<String> get fonts {
  if (_fonts is EqualUnmodifiableListView) return _fonts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fonts);
}

@override@JsonKey() final  int maxUploadMegabytes;
@override@JsonKey() final  int recommendedDpi;
@override@JsonKey() final  int maxLayers;

/// Create a copy of StudioConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioConfigCopyWith<_StudioConfig> get copyWith => __$StudioConfigCopyWithImpl<_StudioConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioConfig&&(identical(other.pricingVersionId, pricingVersionId) || other.pricingVersionId == pricingVersionId)&&(identical(other.pricingVersion, pricingVersion) || other.pricingVersion == pricingVersion)&&const DeepCollectionEquality().equals(other._baseProducts, _baseProducts)&&const DeepCollectionEquality().equals(other._fits, _fits)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._fabrics, _fabrics)&&const DeepCollectionEquality().equals(other._sizeSurcharges, _sizeSurcharges)&&const DeepCollectionEquality().equals(other._printMethods, _printMethods)&&(identical(other.extras, extras) || other.extras == extras)&&const DeepCollectionEquality().equals(other._fonts, _fonts)&&(identical(other.maxUploadMegabytes, maxUploadMegabytes) || other.maxUploadMegabytes == maxUploadMegabytes)&&(identical(other.recommendedDpi, recommendedDpi) || other.recommendedDpi == recommendedDpi)&&(identical(other.maxLayers, maxLayers) || other.maxLayers == maxLayers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pricingVersionId,pricingVersion,const DeepCollectionEquality().hash(_baseProducts),const DeepCollectionEquality().hash(_fits),const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_fabrics),const DeepCollectionEquality().hash(_sizeSurcharges),const DeepCollectionEquality().hash(_printMethods),extras,const DeepCollectionEquality().hash(_fonts),maxUploadMegabytes,recommendedDpi,maxLayers);

@override
String toString() {
  return 'StudioConfig(pricingVersionId: $pricingVersionId, pricingVersion: $pricingVersion, baseProducts: $baseProducts, fits: $fits, features: $features, fabrics: $fabrics, sizeSurcharges: $sizeSurcharges, printMethods: $printMethods, extras: $extras, fonts: $fonts, maxUploadMegabytes: $maxUploadMegabytes, recommendedDpi: $recommendedDpi, maxLayers: $maxLayers)';
}


}

/// @nodoc
abstract mixin class _$StudioConfigCopyWith<$Res> implements $StudioConfigCopyWith<$Res> {
  factory _$StudioConfigCopyWith(_StudioConfig value, $Res Function(_StudioConfig) _then) = __$StudioConfigCopyWithImpl;
@override @useResult
$Res call({
 String pricingVersionId, int pricingVersion, List<StudioBase> baseProducts, List<StudioFitOption> fits, List<StudioFeature> features, List<StudioFabric> fabrics, List<SizeSurcharge> sizeSurcharges, List<StudioPrintMethod> printMethods, StudioExtras extras, List<String> fonts, int maxUploadMegabytes, int recommendedDpi, int maxLayers
});


@override $StudioExtrasCopyWith<$Res> get extras;

}
/// @nodoc
class __$StudioConfigCopyWithImpl<$Res>
    implements _$StudioConfigCopyWith<$Res> {
  __$StudioConfigCopyWithImpl(this._self, this._then);

  final _StudioConfig _self;
  final $Res Function(_StudioConfig) _then;

/// Create a copy of StudioConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pricingVersionId = null,Object? pricingVersion = null,Object? baseProducts = null,Object? fits = null,Object? features = null,Object? fabrics = null,Object? sizeSurcharges = null,Object? printMethods = null,Object? extras = null,Object? fonts = null,Object? maxUploadMegabytes = null,Object? recommendedDpi = null,Object? maxLayers = null,}) {
  return _then(_StudioConfig(
pricingVersionId: null == pricingVersionId ? _self.pricingVersionId : pricingVersionId // ignore: cast_nullable_to_non_nullable
as String,pricingVersion: null == pricingVersion ? _self.pricingVersion : pricingVersion // ignore: cast_nullable_to_non_nullable
as int,baseProducts: null == baseProducts ? _self._baseProducts : baseProducts // ignore: cast_nullable_to_non_nullable
as List<StudioBase>,fits: null == fits ? _self._fits : fits // ignore: cast_nullable_to_non_nullable
as List<StudioFitOption>,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<StudioFeature>,fabrics: null == fabrics ? _self._fabrics : fabrics // ignore: cast_nullable_to_non_nullable
as List<StudioFabric>,sizeSurcharges: null == sizeSurcharges ? _self._sizeSurcharges : sizeSurcharges // ignore: cast_nullable_to_non_nullable
as List<SizeSurcharge>,printMethods: null == printMethods ? _self._printMethods : printMethods // ignore: cast_nullable_to_non_nullable
as List<StudioPrintMethod>,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as StudioExtras,fonts: null == fonts ? _self._fonts : fonts // ignore: cast_nullable_to_non_nullable
as List<String>,maxUploadMegabytes: null == maxUploadMegabytes ? _self.maxUploadMegabytes : maxUploadMegabytes // ignore: cast_nullable_to_non_nullable
as int,recommendedDpi: null == recommendedDpi ? _self.recommendedDpi : recommendedDpi // ignore: cast_nullable_to_non_nullable
as int,maxLayers: null == maxLayers ? _self.maxLayers : maxLayers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of StudioConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioExtrasCopyWith<$Res> get extras {
  
  return $StudioExtrasCopyWith<$Res>(_self.extras, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// @nodoc
mixin _$StudioBase {

 String get code;@JsonKey(unknownEnumValue: ProductType.unknown) ProductType get productType; String get name; double get price; int get leadTimeMinDays; int get leadTimeMaxDays; List<Fit> get fits; List<String> get featureCodes; List<String> get fabricCodes; List<ColorInfo> get colors; List<Size> get sizes; List<PrintArea> get printAreas;@JsonKey(unknownEnumValue: GarmentModel.unknown) GarmentModel? get model; StudioTemplate? get template; int? get maxQuantity; StudioBaseProductRef? get product; List<StudioBaseVariant>? get variants;
/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioBaseCopyWith<StudioBase> get copyWith => _$StudioBaseCopyWithImpl<StudioBase>(this as StudioBase, _$identity);

  /// Serializes this StudioBase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioBase&&(identical(other.code, code) || other.code == code)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.leadTimeMinDays, leadTimeMinDays) || other.leadTimeMinDays == leadTimeMinDays)&&(identical(other.leadTimeMaxDays, leadTimeMaxDays) || other.leadTimeMaxDays == leadTimeMaxDays)&&const DeepCollectionEquality().equals(other.fits, fits)&&const DeepCollectionEquality().equals(other.featureCodes, featureCodes)&&const DeepCollectionEquality().equals(other.fabricCodes, fabricCodes)&&const DeepCollectionEquality().equals(other.colors, colors)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&const DeepCollectionEquality().equals(other.printAreas, printAreas)&&(identical(other.model, model) || other.model == model)&&(identical(other.template, template) || other.template == template)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,productType,name,price,leadTimeMinDays,leadTimeMaxDays,const DeepCollectionEquality().hash(fits),const DeepCollectionEquality().hash(featureCodes),const DeepCollectionEquality().hash(fabricCodes),const DeepCollectionEquality().hash(colors),const DeepCollectionEquality().hash(sizes),const DeepCollectionEquality().hash(printAreas),model,template,maxQuantity,product,const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'StudioBase(code: $code, productType: $productType, name: $name, price: $price, leadTimeMinDays: $leadTimeMinDays, leadTimeMaxDays: $leadTimeMaxDays, fits: $fits, featureCodes: $featureCodes, fabricCodes: $fabricCodes, colors: $colors, sizes: $sizes, printAreas: $printAreas, model: $model, template: $template, maxQuantity: $maxQuantity, product: $product, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $StudioBaseCopyWith<$Res>  {
  factory $StudioBaseCopyWith(StudioBase value, $Res Function(StudioBase) _then) = _$StudioBaseCopyWithImpl;
@useResult
$Res call({
 String code,@JsonKey(unknownEnumValue: ProductType.unknown) ProductType productType, String name, double price, int leadTimeMinDays, int leadTimeMaxDays, List<Fit> fits, List<String> featureCodes, List<String> fabricCodes, List<ColorInfo> colors, List<Size> sizes, List<PrintArea> printAreas,@JsonKey(unknownEnumValue: GarmentModel.unknown) GarmentModel? model, StudioTemplate? template, int? maxQuantity, StudioBaseProductRef? product, List<StudioBaseVariant>? variants
});


$StudioTemplateCopyWith<$Res>? get template;$StudioBaseProductRefCopyWith<$Res>? get product;

}
/// @nodoc
class _$StudioBaseCopyWithImpl<$Res>
    implements $StudioBaseCopyWith<$Res> {
  _$StudioBaseCopyWithImpl(this._self, this._then);

  final StudioBase _self;
  final $Res Function(StudioBase) _then;

/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? productType = null,Object? name = null,Object? price = null,Object? leadTimeMinDays = null,Object? leadTimeMaxDays = null,Object? fits = null,Object? featureCodes = null,Object? fabricCodes = null,Object? colors = null,Object? sizes = null,Object? printAreas = null,Object? model = freezed,Object? template = freezed,Object? maxQuantity = freezed,Object? product = freezed,Object? variants = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as ProductType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,leadTimeMinDays: null == leadTimeMinDays ? _self.leadTimeMinDays : leadTimeMinDays // ignore: cast_nullable_to_non_nullable
as int,leadTimeMaxDays: null == leadTimeMaxDays ? _self.leadTimeMaxDays : leadTimeMaxDays // ignore: cast_nullable_to_non_nullable
as int,fits: null == fits ? _self.fits : fits // ignore: cast_nullable_to_non_nullable
as List<Fit>,featureCodes: null == featureCodes ? _self.featureCodes : featureCodes // ignore: cast_nullable_to_non_nullable
as List<String>,fabricCodes: null == fabricCodes ? _self.fabricCodes : fabricCodes // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<ColorInfo>,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<Size>,printAreas: null == printAreas ? _self.printAreas : printAreas // ignore: cast_nullable_to_non_nullable
as List<PrintArea>,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as GarmentModel?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as StudioTemplate?,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as StudioBaseProductRef?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<StudioBaseVariant>?,
  ));
}
/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioTemplateCopyWith<$Res>? get template {
    if (_self.template == null) {
    return null;
  }

  return $StudioTemplateCopyWith<$Res>(_self.template!, (value) {
    return _then(_self.copyWith(template: value));
  });
}/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioBaseProductRefCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $StudioBaseProductRefCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudioBase].
extension StudioBasePatterns on StudioBase {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioBase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioBase() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioBase value)  $default,){
final _that = this;
switch (_that) {
case _StudioBase():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioBase value)?  $default,){
final _that = this;
switch (_that) {
case _StudioBase() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code, @JsonKey(unknownEnumValue: ProductType.unknown)  ProductType productType,  String name,  double price,  int leadTimeMinDays,  int leadTimeMaxDays,  List<Fit> fits,  List<String> featureCodes,  List<String> fabricCodes,  List<ColorInfo> colors,  List<Size> sizes,  List<PrintArea> printAreas, @JsonKey(unknownEnumValue: GarmentModel.unknown)  GarmentModel? model,  StudioTemplate? template,  int? maxQuantity,  StudioBaseProductRef? product,  List<StudioBaseVariant>? variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioBase() when $default != null:
return $default(_that.code,_that.productType,_that.name,_that.price,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.fits,_that.featureCodes,_that.fabricCodes,_that.colors,_that.sizes,_that.printAreas,_that.model,_that.template,_that.maxQuantity,_that.product,_that.variants);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code, @JsonKey(unknownEnumValue: ProductType.unknown)  ProductType productType,  String name,  double price,  int leadTimeMinDays,  int leadTimeMaxDays,  List<Fit> fits,  List<String> featureCodes,  List<String> fabricCodes,  List<ColorInfo> colors,  List<Size> sizes,  List<PrintArea> printAreas, @JsonKey(unknownEnumValue: GarmentModel.unknown)  GarmentModel? model,  StudioTemplate? template,  int? maxQuantity,  StudioBaseProductRef? product,  List<StudioBaseVariant>? variants)  $default,) {final _that = this;
switch (_that) {
case _StudioBase():
return $default(_that.code,_that.productType,_that.name,_that.price,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.fits,_that.featureCodes,_that.fabricCodes,_that.colors,_that.sizes,_that.printAreas,_that.model,_that.template,_that.maxQuantity,_that.product,_that.variants);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code, @JsonKey(unknownEnumValue: ProductType.unknown)  ProductType productType,  String name,  double price,  int leadTimeMinDays,  int leadTimeMaxDays,  List<Fit> fits,  List<String> featureCodes,  List<String> fabricCodes,  List<ColorInfo> colors,  List<Size> sizes,  List<PrintArea> printAreas, @JsonKey(unknownEnumValue: GarmentModel.unknown)  GarmentModel? model,  StudioTemplate? template,  int? maxQuantity,  StudioBaseProductRef? product,  List<StudioBaseVariant>? variants)?  $default,) {final _that = this;
switch (_that) {
case _StudioBase() when $default != null:
return $default(_that.code,_that.productType,_that.name,_that.price,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.fits,_that.featureCodes,_that.fabricCodes,_that.colors,_that.sizes,_that.printAreas,_that.model,_that.template,_that.maxQuantity,_that.product,_that.variants);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioBase extends StudioBase {
  const _StudioBase({required this.code, @JsonKey(unknownEnumValue: ProductType.unknown) this.productType = ProductType.unknown, required this.name, required this.price, this.leadTimeMinDays = 0, this.leadTimeMaxDays = 0, final  List<Fit> fits = const <Fit>[], final  List<String> featureCodes = const <String>[], final  List<String> fabricCodes = const <String>[], final  List<ColorInfo> colors = const <ColorInfo>[], final  List<Size> sizes = const <Size>[], final  List<PrintArea> printAreas = const <PrintArea>[], @JsonKey(unknownEnumValue: GarmentModel.unknown) this.model, this.template, this.maxQuantity, this.product, final  List<StudioBaseVariant>? variants}): _fits = fits,_featureCodes = featureCodes,_fabricCodes = fabricCodes,_colors = colors,_sizes = sizes,_printAreas = printAreas,_variants = variants,super._();
  factory _StudioBase.fromJson(Map<String, dynamic> json) => _$StudioBaseFromJson(json);

@override final  String code;
@override@JsonKey(unknownEnumValue: ProductType.unknown) final  ProductType productType;
@override final  String name;
@override final  double price;
@override@JsonKey() final  int leadTimeMinDays;
@override@JsonKey() final  int leadTimeMaxDays;
 final  List<Fit> _fits;
@override@JsonKey() List<Fit> get fits {
  if (_fits is EqualUnmodifiableListView) return _fits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fits);
}

 final  List<String> _featureCodes;
@override@JsonKey() List<String> get featureCodes {
  if (_featureCodes is EqualUnmodifiableListView) return _featureCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featureCodes);
}

 final  List<String> _fabricCodes;
@override@JsonKey() List<String> get fabricCodes {
  if (_fabricCodes is EqualUnmodifiableListView) return _fabricCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fabricCodes);
}

 final  List<ColorInfo> _colors;
@override@JsonKey() List<ColorInfo> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

 final  List<Size> _sizes;
@override@JsonKey() List<Size> get sizes {
  if (_sizes is EqualUnmodifiableListView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizes);
}

 final  List<PrintArea> _printAreas;
@override@JsonKey() List<PrintArea> get printAreas {
  if (_printAreas is EqualUnmodifiableListView) return _printAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_printAreas);
}

@override@JsonKey(unknownEnumValue: GarmentModel.unknown) final  GarmentModel? model;
@override final  StudioTemplate? template;
@override final  int? maxQuantity;
@override final  StudioBaseProductRef? product;
 final  List<StudioBaseVariant>? _variants;
@override List<StudioBaseVariant>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioBaseCopyWith<_StudioBase> get copyWith => __$StudioBaseCopyWithImpl<_StudioBase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioBaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioBase&&(identical(other.code, code) || other.code == code)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.leadTimeMinDays, leadTimeMinDays) || other.leadTimeMinDays == leadTimeMinDays)&&(identical(other.leadTimeMaxDays, leadTimeMaxDays) || other.leadTimeMaxDays == leadTimeMaxDays)&&const DeepCollectionEquality().equals(other._fits, _fits)&&const DeepCollectionEquality().equals(other._featureCodes, _featureCodes)&&const DeepCollectionEquality().equals(other._fabricCodes, _fabricCodes)&&const DeepCollectionEquality().equals(other._colors, _colors)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&const DeepCollectionEquality().equals(other._printAreas, _printAreas)&&(identical(other.model, model) || other.model == model)&&(identical(other.template, template) || other.template == template)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,productType,name,price,leadTimeMinDays,leadTimeMaxDays,const DeepCollectionEquality().hash(_fits),const DeepCollectionEquality().hash(_featureCodes),const DeepCollectionEquality().hash(_fabricCodes),const DeepCollectionEquality().hash(_colors),const DeepCollectionEquality().hash(_sizes),const DeepCollectionEquality().hash(_printAreas),model,template,maxQuantity,product,const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'StudioBase(code: $code, productType: $productType, name: $name, price: $price, leadTimeMinDays: $leadTimeMinDays, leadTimeMaxDays: $leadTimeMaxDays, fits: $fits, featureCodes: $featureCodes, fabricCodes: $fabricCodes, colors: $colors, sizes: $sizes, printAreas: $printAreas, model: $model, template: $template, maxQuantity: $maxQuantity, product: $product, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$StudioBaseCopyWith<$Res> implements $StudioBaseCopyWith<$Res> {
  factory _$StudioBaseCopyWith(_StudioBase value, $Res Function(_StudioBase) _then) = __$StudioBaseCopyWithImpl;
@override @useResult
$Res call({
 String code,@JsonKey(unknownEnumValue: ProductType.unknown) ProductType productType, String name, double price, int leadTimeMinDays, int leadTimeMaxDays, List<Fit> fits, List<String> featureCodes, List<String> fabricCodes, List<ColorInfo> colors, List<Size> sizes, List<PrintArea> printAreas,@JsonKey(unknownEnumValue: GarmentModel.unknown) GarmentModel? model, StudioTemplate? template, int? maxQuantity, StudioBaseProductRef? product, List<StudioBaseVariant>? variants
});


@override $StudioTemplateCopyWith<$Res>? get template;@override $StudioBaseProductRefCopyWith<$Res>? get product;

}
/// @nodoc
class __$StudioBaseCopyWithImpl<$Res>
    implements _$StudioBaseCopyWith<$Res> {
  __$StudioBaseCopyWithImpl(this._self, this._then);

  final _StudioBase _self;
  final $Res Function(_StudioBase) _then;

/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? productType = null,Object? name = null,Object? price = null,Object? leadTimeMinDays = null,Object? leadTimeMaxDays = null,Object? fits = null,Object? featureCodes = null,Object? fabricCodes = null,Object? colors = null,Object? sizes = null,Object? printAreas = null,Object? model = freezed,Object? template = freezed,Object? maxQuantity = freezed,Object? product = freezed,Object? variants = freezed,}) {
  return _then(_StudioBase(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as ProductType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,leadTimeMinDays: null == leadTimeMinDays ? _self.leadTimeMinDays : leadTimeMinDays // ignore: cast_nullable_to_non_nullable
as int,leadTimeMaxDays: null == leadTimeMaxDays ? _self.leadTimeMaxDays : leadTimeMaxDays // ignore: cast_nullable_to_non_nullable
as int,fits: null == fits ? _self._fits : fits // ignore: cast_nullable_to_non_nullable
as List<Fit>,featureCodes: null == featureCodes ? _self._featureCodes : featureCodes // ignore: cast_nullable_to_non_nullable
as List<String>,fabricCodes: null == fabricCodes ? _self._fabricCodes : fabricCodes // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<ColorInfo>,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<Size>,printAreas: null == printAreas ? _self._printAreas : printAreas // ignore: cast_nullable_to_non_nullable
as List<PrintArea>,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as GarmentModel?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as StudioTemplate?,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as StudioBaseProductRef?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<StudioBaseVariant>?,
  ));
}

/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioTemplateCopyWith<$Res>? get template {
    if (_self.template == null) {
    return null;
  }

  return $StudioTemplateCopyWith<$Res>(_self.template!, (value) {
    return _then(_self.copyWith(template: value));
  });
}/// Create a copy of StudioBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioBaseProductRefCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $StudioBaseProductRefCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$StudioBaseProductRef {

 String get id; String get slug; String? get imageUrl;
/// Create a copy of StudioBaseProductRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioBaseProductRefCopyWith<StudioBaseProductRef> get copyWith => _$StudioBaseProductRefCopyWithImpl<StudioBaseProductRef>(this as StudioBaseProductRef, _$identity);

  /// Serializes this StudioBaseProductRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioBaseProductRef&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,imageUrl);

@override
String toString() {
  return 'StudioBaseProductRef(id: $id, slug: $slug, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $StudioBaseProductRefCopyWith<$Res>  {
  factory $StudioBaseProductRefCopyWith(StudioBaseProductRef value, $Res Function(StudioBaseProductRef) _then) = _$StudioBaseProductRefCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String? imageUrl
});




}
/// @nodoc
class _$StudioBaseProductRefCopyWithImpl<$Res>
    implements $StudioBaseProductRefCopyWith<$Res> {
  _$StudioBaseProductRefCopyWithImpl(this._self, this._then);

  final StudioBaseProductRef _self;
  final $Res Function(StudioBaseProductRef) _then;

/// Create a copy of StudioBaseProductRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioBaseProductRef].
extension StudioBaseProductRefPatterns on StudioBaseProductRef {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioBaseProductRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioBaseProductRef() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioBaseProductRef value)  $default,){
final _that = this;
switch (_that) {
case _StudioBaseProductRef():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioBaseProductRef value)?  $default,){
final _that = this;
switch (_that) {
case _StudioBaseProductRef() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioBaseProductRef() when $default != null:
return $default(_that.id,_that.slug,_that.imageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _StudioBaseProductRef():
return $default(_that.id,_that.slug,_that.imageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _StudioBaseProductRef() when $default != null:
return $default(_that.id,_that.slug,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioBaseProductRef implements StudioBaseProductRef {
  const _StudioBaseProductRef({required this.id, required this.slug, this.imageUrl});
  factory _StudioBaseProductRef.fromJson(Map<String, dynamic> json) => _$StudioBaseProductRefFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String? imageUrl;

/// Create a copy of StudioBaseProductRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioBaseProductRefCopyWith<_StudioBaseProductRef> get copyWith => __$StudioBaseProductRefCopyWithImpl<_StudioBaseProductRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioBaseProductRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioBaseProductRef&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,imageUrl);

@override
String toString() {
  return 'StudioBaseProductRef(id: $id, slug: $slug, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$StudioBaseProductRefCopyWith<$Res> implements $StudioBaseProductRefCopyWith<$Res> {
  factory _$StudioBaseProductRefCopyWith(_StudioBaseProductRef value, $Res Function(_StudioBaseProductRef) _then) = __$StudioBaseProductRefCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String? imageUrl
});




}
/// @nodoc
class __$StudioBaseProductRefCopyWithImpl<$Res>
    implements _$StudioBaseProductRefCopyWith<$Res> {
  __$StudioBaseProductRefCopyWithImpl(this._self, this._then);

  final _StudioBaseProductRef _self;
  final $Res Function(_StudioBaseProductRef) _then;

/// Create a copy of StudioBaseProductRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? imageUrl = freezed,}) {
  return _then(_StudioBaseProductRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StudioBaseVariant {

 String get colorId;@JsonKey(unknownEnumValue: Size.unknown) Size get size; double get price; bool get available;
/// Create a copy of StudioBaseVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioBaseVariantCopyWith<StudioBaseVariant> get copyWith => _$StudioBaseVariantCopyWithImpl<StudioBaseVariant>(this as StudioBaseVariant, _$identity);

  /// Serializes this StudioBaseVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioBaseVariant&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.size, size) || other.size == size)&&(identical(other.price, price) || other.price == price)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,colorId,size,price,available);

@override
String toString() {
  return 'StudioBaseVariant(colorId: $colorId, size: $size, price: $price, available: $available)';
}


}

/// @nodoc
abstract mixin class $StudioBaseVariantCopyWith<$Res>  {
  factory $StudioBaseVariantCopyWith(StudioBaseVariant value, $Res Function(StudioBaseVariant) _then) = _$StudioBaseVariantCopyWithImpl;
@useResult
$Res call({
 String colorId,@JsonKey(unknownEnumValue: Size.unknown) Size size, double price, bool available
});




}
/// @nodoc
class _$StudioBaseVariantCopyWithImpl<$Res>
    implements $StudioBaseVariantCopyWith<$Res> {
  _$StudioBaseVariantCopyWithImpl(this._self, this._then);

  final StudioBaseVariant _self;
  final $Res Function(StudioBaseVariant) _then;

/// Create a copy of StudioBaseVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? colorId = null,Object? size = null,Object? price = null,Object? available = null,}) {
  return _then(_self.copyWith(
colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioBaseVariant].
extension StudioBaseVariantPatterns on StudioBaseVariant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioBaseVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioBaseVariant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioBaseVariant value)  $default,){
final _that = this;
switch (_that) {
case _StudioBaseVariant():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioBaseVariant value)?  $default,){
final _that = this;
switch (_that) {
case _StudioBaseVariant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String colorId, @JsonKey(unknownEnumValue: Size.unknown)  Size size,  double price,  bool available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioBaseVariant() when $default != null:
return $default(_that.colorId,_that.size,_that.price,_that.available);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String colorId, @JsonKey(unknownEnumValue: Size.unknown)  Size size,  double price,  bool available)  $default,) {final _that = this;
switch (_that) {
case _StudioBaseVariant():
return $default(_that.colorId,_that.size,_that.price,_that.available);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String colorId, @JsonKey(unknownEnumValue: Size.unknown)  Size size,  double price,  bool available)?  $default,) {final _that = this;
switch (_that) {
case _StudioBaseVariant() when $default != null:
return $default(_that.colorId,_that.size,_that.price,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioBaseVariant implements StudioBaseVariant {
  const _StudioBaseVariant({required this.colorId, @JsonKey(unknownEnumValue: Size.unknown) required this.size, this.price = 0, this.available = true});
  factory _StudioBaseVariant.fromJson(Map<String, dynamic> json) => _$StudioBaseVariantFromJson(json);

@override final  String colorId;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size size;
@override@JsonKey() final  double price;
@override@JsonKey() final  bool available;

/// Create a copy of StudioBaseVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioBaseVariantCopyWith<_StudioBaseVariant> get copyWith => __$StudioBaseVariantCopyWithImpl<_StudioBaseVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioBaseVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioBaseVariant&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.size, size) || other.size == size)&&(identical(other.price, price) || other.price == price)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,colorId,size,price,available);

@override
String toString() {
  return 'StudioBaseVariant(colorId: $colorId, size: $size, price: $price, available: $available)';
}


}

/// @nodoc
abstract mixin class _$StudioBaseVariantCopyWith<$Res> implements $StudioBaseVariantCopyWith<$Res> {
  factory _$StudioBaseVariantCopyWith(_StudioBaseVariant value, $Res Function(_StudioBaseVariant) _then) = __$StudioBaseVariantCopyWithImpl;
@override @useResult
$Res call({
 String colorId,@JsonKey(unknownEnumValue: Size.unknown) Size size, double price, bool available
});




}
/// @nodoc
class __$StudioBaseVariantCopyWithImpl<$Res>
    implements _$StudioBaseVariantCopyWith<$Res> {
  __$StudioBaseVariantCopyWithImpl(this._self, this._then);

  final _StudioBaseVariant _self;
  final $Res Function(_StudioBaseVariant) _then;

/// Create a copy of StudioBaseVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? colorId = null,Object? size = null,Object? price = null,Object? available = null,}) {
  return _then(_StudioBaseVariant(
colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$StudioTemplate {

 String get id; String get modelUrl; double get heightCm; bool get tintable; List<StudioTemplateZone> get zones;
/// Create a copy of StudioTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioTemplateCopyWith<StudioTemplate> get copyWith => _$StudioTemplateCopyWithImpl<StudioTemplate>(this as StudioTemplate, _$identity);

  /// Serializes this StudioTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.modelUrl, modelUrl) || other.modelUrl == modelUrl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.tintable, tintable) || other.tintable == tintable)&&const DeepCollectionEquality().equals(other.zones, zones));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,modelUrl,heightCm,tintable,const DeepCollectionEquality().hash(zones));

@override
String toString() {
  return 'StudioTemplate(id: $id, modelUrl: $modelUrl, heightCm: $heightCm, tintable: $tintable, zones: $zones)';
}


}

/// @nodoc
abstract mixin class $StudioTemplateCopyWith<$Res>  {
  factory $StudioTemplateCopyWith(StudioTemplate value, $Res Function(StudioTemplate) _then) = _$StudioTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String modelUrl, double heightCm, bool tintable, List<StudioTemplateZone> zones
});




}
/// @nodoc
class _$StudioTemplateCopyWithImpl<$Res>
    implements $StudioTemplateCopyWith<$Res> {
  _$StudioTemplateCopyWithImpl(this._self, this._then);

  final StudioTemplate _self;
  final $Res Function(StudioTemplate) _then;

/// Create a copy of StudioTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelUrl = null,Object? heightCm = null,Object? tintable = null,Object? zones = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,modelUrl: null == modelUrl ? _self.modelUrl : modelUrl // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,tintable: null == tintable ? _self.tintable : tintable // ignore: cast_nullable_to_non_nullable
as bool,zones: null == zones ? _self.zones : zones // ignore: cast_nullable_to_non_nullable
as List<StudioTemplateZone>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioTemplate].
extension StudioTemplatePatterns on StudioTemplate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioTemplate() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioTemplate value)  $default,){
final _that = this;
switch (_that) {
case _StudioTemplate():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _StudioTemplate() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String modelUrl,  double heightCm,  bool tintable,  List<StudioTemplateZone> zones)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioTemplate() when $default != null:
return $default(_that.id,_that.modelUrl,_that.heightCm,_that.tintable,_that.zones);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String modelUrl,  double heightCm,  bool tintable,  List<StudioTemplateZone> zones)  $default,) {final _that = this;
switch (_that) {
case _StudioTemplate():
return $default(_that.id,_that.modelUrl,_that.heightCm,_that.tintable,_that.zones);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String modelUrl,  double heightCm,  bool tintable,  List<StudioTemplateZone> zones)?  $default,) {final _that = this;
switch (_that) {
case _StudioTemplate() when $default != null:
return $default(_that.id,_that.modelUrl,_that.heightCm,_that.tintable,_that.zones);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioTemplate implements StudioTemplate {
  const _StudioTemplate({required this.id, required this.modelUrl, required this.heightCm, this.tintable = true, final  List<StudioTemplateZone> zones = const <StudioTemplateZone>[]}): _zones = zones;
  factory _StudioTemplate.fromJson(Map<String, dynamic> json) => _$StudioTemplateFromJson(json);

@override final  String id;
@override final  String modelUrl;
@override final  double heightCm;
@override@JsonKey() final  bool tintable;
 final  List<StudioTemplateZone> _zones;
@override@JsonKey() List<StudioTemplateZone> get zones {
  if (_zones is EqualUnmodifiableListView) return _zones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zones);
}


/// Create a copy of StudioTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioTemplateCopyWith<_StudioTemplate> get copyWith => __$StudioTemplateCopyWithImpl<_StudioTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.modelUrl, modelUrl) || other.modelUrl == modelUrl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.tintable, tintable) || other.tintable == tintable)&&const DeepCollectionEquality().equals(other._zones, _zones));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,modelUrl,heightCm,tintable,const DeepCollectionEquality().hash(_zones));

@override
String toString() {
  return 'StudioTemplate(id: $id, modelUrl: $modelUrl, heightCm: $heightCm, tintable: $tintable, zones: $zones)';
}


}

/// @nodoc
abstract mixin class _$StudioTemplateCopyWith<$Res> implements $StudioTemplateCopyWith<$Res> {
  factory _$StudioTemplateCopyWith(_StudioTemplate value, $Res Function(_StudioTemplate) _then) = __$StudioTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String modelUrl, double heightCm, bool tintable, List<StudioTemplateZone> zones
});




}
/// @nodoc
class __$StudioTemplateCopyWithImpl<$Res>
    implements _$StudioTemplateCopyWith<$Res> {
  __$StudioTemplateCopyWithImpl(this._self, this._then);

  final _StudioTemplate _self;
  final $Res Function(_StudioTemplate) _then;

/// Create a copy of StudioTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelUrl = null,Object? heightCm = null,Object? tintable = null,Object? zones = null,}) {
  return _then(_StudioTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,modelUrl: null == modelUrl ? _self.modelUrl : modelUrl // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,tintable: null == tintable ? _self.tintable : tintable // ignore: cast_nullable_to_non_nullable
as bool,zones: null == zones ? _self._zones : zones // ignore: cast_nullable_to_non_nullable
as List<StudioTemplateZone>,
  ));
}


}


/// @nodoc
mixin _$StudioTemplateZone {

 String get code; String get name; ZoneVector get position; ZoneVector get normal; double get rotation; double get widthCm; double get heightCm;
/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioTemplateZoneCopyWith<StudioTemplateZone> get copyWith => _$StudioTemplateZoneCopyWithImpl<StudioTemplateZone>(this as StudioTemplateZone, _$identity);

  /// Serializes this StudioTemplateZone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioTemplateZone&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.normal, normal) || other.normal == normal)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,position,normal,rotation,widthCm,heightCm);

@override
String toString() {
  return 'StudioTemplateZone(code: $code, name: $name, position: $position, normal: $normal, rotation: $rotation, widthCm: $widthCm, heightCm: $heightCm)';
}


}

/// @nodoc
abstract mixin class $StudioTemplateZoneCopyWith<$Res>  {
  factory $StudioTemplateZoneCopyWith(StudioTemplateZone value, $Res Function(StudioTemplateZone) _then) = _$StudioTemplateZoneCopyWithImpl;
@useResult
$Res call({
 String code, String name, ZoneVector position, ZoneVector normal, double rotation, double widthCm, double heightCm
});


$ZoneVectorCopyWith<$Res> get position;$ZoneVectorCopyWith<$Res> get normal;

}
/// @nodoc
class _$StudioTemplateZoneCopyWithImpl<$Res>
    implements $StudioTemplateZoneCopyWith<$Res> {
  _$StudioTemplateZoneCopyWithImpl(this._self, this._then);

  final StudioTemplateZone _self;
  final $Res Function(StudioTemplateZone) _then;

/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? position = null,Object? normal = null,Object? rotation = null,Object? widthCm = null,Object? heightCm = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as ZoneVector,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as ZoneVector,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as double,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get position {
  
  return $ZoneVectorCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get normal {
  
  return $ZoneVectorCopyWith<$Res>(_self.normal, (value) {
    return _then(_self.copyWith(normal: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudioTemplateZone].
extension StudioTemplateZonePatterns on StudioTemplateZone {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioTemplateZone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioTemplateZone() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioTemplateZone value)  $default,){
final _that = this;
switch (_that) {
case _StudioTemplateZone():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioTemplateZone value)?  $default,){
final _that = this;
switch (_that) {
case _StudioTemplateZone() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  ZoneVector position,  ZoneVector normal,  double rotation,  double widthCm,  double heightCm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioTemplateZone() when $default != null:
return $default(_that.code,_that.name,_that.position,_that.normal,_that.rotation,_that.widthCm,_that.heightCm);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  ZoneVector position,  ZoneVector normal,  double rotation,  double widthCm,  double heightCm)  $default,) {final _that = this;
switch (_that) {
case _StudioTemplateZone():
return $default(_that.code,_that.name,_that.position,_that.normal,_that.rotation,_that.widthCm,_that.heightCm);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  ZoneVector position,  ZoneVector normal,  double rotation,  double widthCm,  double heightCm)?  $default,) {final _that = this;
switch (_that) {
case _StudioTemplateZone() when $default != null:
return $default(_that.code,_that.name,_that.position,_that.normal,_that.rotation,_that.widthCm,_that.heightCm);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioTemplateZone implements StudioTemplateZone {
  const _StudioTemplateZone({required this.code, this.name = '', required this.position, required this.normal, this.rotation = 0, required this.widthCm, required this.heightCm});
  factory _StudioTemplateZone.fromJson(Map<String, dynamic> json) => _$StudioTemplateZoneFromJson(json);

@override final  String code;
@override@JsonKey() final  String name;
@override final  ZoneVector position;
@override final  ZoneVector normal;
@override@JsonKey() final  double rotation;
@override final  double widthCm;
@override final  double heightCm;

/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioTemplateZoneCopyWith<_StudioTemplateZone> get copyWith => __$StudioTemplateZoneCopyWithImpl<_StudioTemplateZone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioTemplateZoneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioTemplateZone&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.normal, normal) || other.normal == normal)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,position,normal,rotation,widthCm,heightCm);

@override
String toString() {
  return 'StudioTemplateZone(code: $code, name: $name, position: $position, normal: $normal, rotation: $rotation, widthCm: $widthCm, heightCm: $heightCm)';
}


}

/// @nodoc
abstract mixin class _$StudioTemplateZoneCopyWith<$Res> implements $StudioTemplateZoneCopyWith<$Res> {
  factory _$StudioTemplateZoneCopyWith(_StudioTemplateZone value, $Res Function(_StudioTemplateZone) _then) = __$StudioTemplateZoneCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, ZoneVector position, ZoneVector normal, double rotation, double widthCm, double heightCm
});


@override $ZoneVectorCopyWith<$Res> get position;@override $ZoneVectorCopyWith<$Res> get normal;

}
/// @nodoc
class __$StudioTemplateZoneCopyWithImpl<$Res>
    implements _$StudioTemplateZoneCopyWith<$Res> {
  __$StudioTemplateZoneCopyWithImpl(this._self, this._then);

  final _StudioTemplateZone _self;
  final $Res Function(_StudioTemplateZone) _then;

/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? position = null,Object? normal = null,Object? rotation = null,Object? widthCm = null,Object? heightCm = null,}) {
  return _then(_StudioTemplateZone(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as ZoneVector,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as ZoneVector,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as double,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get position {
  
  return $ZoneVectorCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of StudioTemplateZone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get normal {
  
  return $ZoneVectorCopyWith<$Res>(_self.normal, (value) {
    return _then(_self.copyWith(normal: value));
  });
}
}


/// @nodoc
mixin _$PrintArea {

 String get placement; double get widthCm; double get heightCm;
/// Create a copy of PrintArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrintAreaCopyWith<PrintArea> get copyWith => _$PrintAreaCopyWithImpl<PrintArea>(this as PrintArea, _$identity);

  /// Serializes this PrintArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrintArea&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placement,widthCm,heightCm);

@override
String toString() {
  return 'PrintArea(placement: $placement, widthCm: $widthCm, heightCm: $heightCm)';
}


}

/// @nodoc
abstract mixin class $PrintAreaCopyWith<$Res>  {
  factory $PrintAreaCopyWith(PrintArea value, $Res Function(PrintArea) _then) = _$PrintAreaCopyWithImpl;
@useResult
$Res call({
 String placement, double widthCm, double heightCm
});




}
/// @nodoc
class _$PrintAreaCopyWithImpl<$Res>
    implements $PrintAreaCopyWith<$Res> {
  _$PrintAreaCopyWithImpl(this._self, this._then);

  final PrintArea _self;
  final $Res Function(PrintArea) _then;

/// Create a copy of PrintArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placement = null,Object? widthCm = null,Object? heightCm = null,}) {
  return _then(_self.copyWith(
placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as double,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PrintArea].
extension PrintAreaPatterns on PrintArea {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrintArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrintArea() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrintArea value)  $default,){
final _that = this;
switch (_that) {
case _PrintArea():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrintArea value)?  $default,){
final _that = this;
switch (_that) {
case _PrintArea() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placement,  double widthCm,  double heightCm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrintArea() when $default != null:
return $default(_that.placement,_that.widthCm,_that.heightCm);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placement,  double widthCm,  double heightCm)  $default,) {final _that = this;
switch (_that) {
case _PrintArea():
return $default(_that.placement,_that.widthCm,_that.heightCm);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placement,  double widthCm,  double heightCm)?  $default,) {final _that = this;
switch (_that) {
case _PrintArea() when $default != null:
return $default(_that.placement,_that.widthCm,_that.heightCm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrintArea implements PrintArea {
  const _PrintArea({required this.placement, required this.widthCm, required this.heightCm});
  factory _PrintArea.fromJson(Map<String, dynamic> json) => _$PrintAreaFromJson(json);

@override final  String placement;
@override final  double widthCm;
@override final  double heightCm;

/// Create a copy of PrintArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrintAreaCopyWith<_PrintArea> get copyWith => __$PrintAreaCopyWithImpl<_PrintArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrintAreaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrintArea&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placement,widthCm,heightCm);

@override
String toString() {
  return 'PrintArea(placement: $placement, widthCm: $widthCm, heightCm: $heightCm)';
}


}

/// @nodoc
abstract mixin class _$PrintAreaCopyWith<$Res> implements $PrintAreaCopyWith<$Res> {
  factory _$PrintAreaCopyWith(_PrintArea value, $Res Function(_PrintArea) _then) = __$PrintAreaCopyWithImpl;
@override @useResult
$Res call({
 String placement, double widthCm, double heightCm
});




}
/// @nodoc
class __$PrintAreaCopyWithImpl<$Res>
    implements _$PrintAreaCopyWith<$Res> {
  __$PrintAreaCopyWithImpl(this._self, this._then);

  final _PrintArea _self;
  final $Res Function(_PrintArea) _then;

/// Create a copy of PrintArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placement = null,Object? widthCm = null,Object? heightCm = null,}) {
  return _then(_PrintArea(
placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as double,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StudioFitOption {

@JsonKey(unknownEnumValue: Fit.unknown) Fit get fit; double get surcharge;
/// Create a copy of StudioFitOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioFitOptionCopyWith<StudioFitOption> get copyWith => _$StudioFitOptionCopyWithImpl<StudioFitOption>(this as StudioFitOption, _$identity);

  /// Serializes this StudioFitOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioFitOption&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,surcharge);

@override
String toString() {
  return 'StudioFitOption(fit: $fit, surcharge: $surcharge)';
}


}

/// @nodoc
abstract mixin class $StudioFitOptionCopyWith<$Res>  {
  factory $StudioFitOptionCopyWith(StudioFitOption value, $Res Function(StudioFitOption) _then) = _$StudioFitOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, double surcharge
});




}
/// @nodoc
class _$StudioFitOptionCopyWithImpl<$Res>
    implements $StudioFitOptionCopyWith<$Res> {
  _$StudioFitOptionCopyWithImpl(this._self, this._then);

  final StudioFitOption _self;
  final $Res Function(StudioFitOption) _then;

/// Create a copy of StudioFitOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fit = null,Object? surcharge = null,}) {
  return _then(_self.copyWith(
fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioFitOption].
extension StudioFitOptionPatterns on StudioFitOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioFitOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioFitOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioFitOption value)  $default,){
final _that = this;
switch (_that) {
case _StudioFitOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioFitOption value)?  $default,){
final _that = this;
switch (_that) {
case _StudioFitOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  double surcharge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioFitOption() when $default != null:
return $default(_that.fit,_that.surcharge);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  double surcharge)  $default,) {final _that = this;
switch (_that) {
case _StudioFitOption():
return $default(_that.fit,_that.surcharge);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  double surcharge)?  $default,) {final _that = this;
switch (_that) {
case _StudioFitOption() when $default != null:
return $default(_that.fit,_that.surcharge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioFitOption implements StudioFitOption {
  const _StudioFitOption({@JsonKey(unknownEnumValue: Fit.unknown) required this.fit, this.surcharge = 0});
  factory _StudioFitOption.fromJson(Map<String, dynamic> json) => _$StudioFitOptionFromJson(json);

@override@JsonKey(unknownEnumValue: Fit.unknown) final  Fit fit;
@override@JsonKey() final  double surcharge;

/// Create a copy of StudioFitOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioFitOptionCopyWith<_StudioFitOption> get copyWith => __$StudioFitOptionCopyWithImpl<_StudioFitOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioFitOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioFitOption&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,surcharge);

@override
String toString() {
  return 'StudioFitOption(fit: $fit, surcharge: $surcharge)';
}


}

/// @nodoc
abstract mixin class _$StudioFitOptionCopyWith<$Res> implements $StudioFitOptionCopyWith<$Res> {
  factory _$StudioFitOptionCopyWith(_StudioFitOption value, $Res Function(_StudioFitOption) _then) = __$StudioFitOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, double surcharge
});




}
/// @nodoc
class __$StudioFitOptionCopyWithImpl<$Res>
    implements _$StudioFitOptionCopyWith<$Res> {
  __$StudioFitOptionCopyWithImpl(this._self, this._then);

  final _StudioFitOption _self;
  final $Res Function(_StudioFitOption) _then;

/// Create a copy of StudioFitOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fit = null,Object? surcharge = null,}) {
  return _then(_StudioFitOption(
fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StudioFeature {

 String get code; String get name; double get surcharge;
/// Create a copy of StudioFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioFeatureCopyWith<StudioFeature> get copyWith => _$StudioFeatureCopyWithImpl<StudioFeature>(this as StudioFeature, _$identity);

  /// Serializes this StudioFeature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioFeature&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,surcharge);

@override
String toString() {
  return 'StudioFeature(code: $code, name: $name, surcharge: $surcharge)';
}


}

/// @nodoc
abstract mixin class $StudioFeatureCopyWith<$Res>  {
  factory $StudioFeatureCopyWith(StudioFeature value, $Res Function(StudioFeature) _then) = _$StudioFeatureCopyWithImpl;
@useResult
$Res call({
 String code, String name, double surcharge
});




}
/// @nodoc
class _$StudioFeatureCopyWithImpl<$Res>
    implements $StudioFeatureCopyWith<$Res> {
  _$StudioFeatureCopyWithImpl(this._self, this._then);

  final StudioFeature _self;
  final $Res Function(StudioFeature) _then;

/// Create a copy of StudioFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? surcharge = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioFeature].
extension StudioFeaturePatterns on StudioFeature {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioFeature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioFeature() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioFeature value)  $default,){
final _that = this;
switch (_that) {
case _StudioFeature():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioFeature value)?  $default,){
final _that = this;
switch (_that) {
case _StudioFeature() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  double surcharge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioFeature() when $default != null:
return $default(_that.code,_that.name,_that.surcharge);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  double surcharge)  $default,) {final _that = this;
switch (_that) {
case _StudioFeature():
return $default(_that.code,_that.name,_that.surcharge);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  double surcharge)?  $default,) {final _that = this;
switch (_that) {
case _StudioFeature() when $default != null:
return $default(_that.code,_that.name,_that.surcharge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioFeature implements StudioFeature {
  const _StudioFeature({required this.code, required this.name, this.surcharge = 0});
  factory _StudioFeature.fromJson(Map<String, dynamic> json) => _$StudioFeatureFromJson(json);

@override final  String code;
@override final  String name;
@override@JsonKey() final  double surcharge;

/// Create a copy of StudioFeature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioFeatureCopyWith<_StudioFeature> get copyWith => __$StudioFeatureCopyWithImpl<_StudioFeature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioFeatureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioFeature&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,surcharge);

@override
String toString() {
  return 'StudioFeature(code: $code, name: $name, surcharge: $surcharge)';
}


}

/// @nodoc
abstract mixin class _$StudioFeatureCopyWith<$Res> implements $StudioFeatureCopyWith<$Res> {
  factory _$StudioFeatureCopyWith(_StudioFeature value, $Res Function(_StudioFeature) _then) = __$StudioFeatureCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, double surcharge
});




}
/// @nodoc
class __$StudioFeatureCopyWithImpl<$Res>
    implements _$StudioFeatureCopyWith<$Res> {
  __$StudioFeatureCopyWithImpl(this._self, this._then);

  final _StudioFeature _self;
  final $Res Function(_StudioFeature) _then;

/// Create a copy of StudioFeature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? surcharge = null,}) {
  return _then(_StudioFeature(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StudioFabric {

 String get code; String get name; int? get gsm; double get surcharge; bool get included;
/// Create a copy of StudioFabric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioFabricCopyWith<StudioFabric> get copyWith => _$StudioFabricCopyWithImpl<StudioFabric>(this as StudioFabric, _$identity);

  /// Serializes this StudioFabric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioFabric&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.gsm, gsm) || other.gsm == gsm)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge)&&(identical(other.included, included) || other.included == included));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,gsm,surcharge,included);

@override
String toString() {
  return 'StudioFabric(code: $code, name: $name, gsm: $gsm, surcharge: $surcharge, included: $included)';
}


}

/// @nodoc
abstract mixin class $StudioFabricCopyWith<$Res>  {
  factory $StudioFabricCopyWith(StudioFabric value, $Res Function(StudioFabric) _then) = _$StudioFabricCopyWithImpl;
@useResult
$Res call({
 String code, String name, int? gsm, double surcharge, bool included
});




}
/// @nodoc
class _$StudioFabricCopyWithImpl<$Res>
    implements $StudioFabricCopyWith<$Res> {
  _$StudioFabricCopyWithImpl(this._self, this._then);

  final StudioFabric _self;
  final $Res Function(StudioFabric) _then;

/// Create a copy of StudioFabric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? gsm = freezed,Object? surcharge = null,Object? included = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gsm: freezed == gsm ? _self.gsm : gsm // ignore: cast_nullable_to_non_nullable
as int?,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,included: null == included ? _self.included : included // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioFabric].
extension StudioFabricPatterns on StudioFabric {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioFabric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioFabric() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioFabric value)  $default,){
final _that = this;
switch (_that) {
case _StudioFabric():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioFabric value)?  $default,){
final _that = this;
switch (_that) {
case _StudioFabric() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  int? gsm,  double surcharge,  bool included)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioFabric() when $default != null:
return $default(_that.code,_that.name,_that.gsm,_that.surcharge,_that.included);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  int? gsm,  double surcharge,  bool included)  $default,) {final _that = this;
switch (_that) {
case _StudioFabric():
return $default(_that.code,_that.name,_that.gsm,_that.surcharge,_that.included);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  int? gsm,  double surcharge,  bool included)?  $default,) {final _that = this;
switch (_that) {
case _StudioFabric() when $default != null:
return $default(_that.code,_that.name,_that.gsm,_that.surcharge,_that.included);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioFabric implements StudioFabric {
  const _StudioFabric({required this.code, required this.name, this.gsm, this.surcharge = 0, this.included = false});
  factory _StudioFabric.fromJson(Map<String, dynamic> json) => _$StudioFabricFromJson(json);

@override final  String code;
@override final  String name;
@override final  int? gsm;
@override@JsonKey() final  double surcharge;
@override@JsonKey() final  bool included;

/// Create a copy of StudioFabric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioFabricCopyWith<_StudioFabric> get copyWith => __$StudioFabricCopyWithImpl<_StudioFabric>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioFabricToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioFabric&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.gsm, gsm) || other.gsm == gsm)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge)&&(identical(other.included, included) || other.included == included));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,gsm,surcharge,included);

@override
String toString() {
  return 'StudioFabric(code: $code, name: $name, gsm: $gsm, surcharge: $surcharge, included: $included)';
}


}

/// @nodoc
abstract mixin class _$StudioFabricCopyWith<$Res> implements $StudioFabricCopyWith<$Res> {
  factory _$StudioFabricCopyWith(_StudioFabric value, $Res Function(_StudioFabric) _then) = __$StudioFabricCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, int? gsm, double surcharge, bool included
});




}
/// @nodoc
class __$StudioFabricCopyWithImpl<$Res>
    implements _$StudioFabricCopyWith<$Res> {
  __$StudioFabricCopyWithImpl(this._self, this._then);

  final _StudioFabric _self;
  final $Res Function(_StudioFabric) _then;

/// Create a copy of StudioFabric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? gsm = freezed,Object? surcharge = null,Object? included = null,}) {
  return _then(_StudioFabric(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gsm: freezed == gsm ? _self.gsm : gsm // ignore: cast_nullable_to_non_nullable
as int?,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,included: null == included ? _self.included : included // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SizeSurcharge {

@JsonKey(unknownEnumValue: Size.unknown) Size get size; double get surcharge;
/// Create a copy of SizeSurcharge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeSurchargeCopyWith<SizeSurcharge> get copyWith => _$SizeSurchargeCopyWithImpl<SizeSurcharge>(this as SizeSurcharge, _$identity);

  /// Serializes this SizeSurcharge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeSurcharge&&(identical(other.size, size) || other.size == size)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,surcharge);

@override
String toString() {
  return 'SizeSurcharge(size: $size, surcharge: $surcharge)';
}


}

/// @nodoc
abstract mixin class $SizeSurchargeCopyWith<$Res>  {
  factory $SizeSurchargeCopyWith(SizeSurcharge value, $Res Function(SizeSurcharge) _then) = _$SizeSurchargeCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: Size.unknown) Size size, double surcharge
});




}
/// @nodoc
class _$SizeSurchargeCopyWithImpl<$Res>
    implements $SizeSurchargeCopyWith<$Res> {
  _$SizeSurchargeCopyWithImpl(this._self, this._then);

  final SizeSurcharge _self;
  final $Res Function(SizeSurcharge) _then;

/// Create a copy of SizeSurcharge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? surcharge = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SizeSurcharge].
extension SizeSurchargePatterns on SizeSurcharge {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SizeSurcharge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SizeSurcharge() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SizeSurcharge value)  $default,){
final _that = this;
switch (_that) {
case _SizeSurcharge():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SizeSurcharge value)?  $default,){
final _that = this;
switch (_that) {
case _SizeSurcharge() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size,  double surcharge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SizeSurcharge() when $default != null:
return $default(_that.size,_that.surcharge);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size,  double surcharge)  $default,) {final _that = this;
switch (_that) {
case _SizeSurcharge():
return $default(_that.size,_that.surcharge);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size,  double surcharge)?  $default,) {final _that = this;
switch (_that) {
case _SizeSurcharge() when $default != null:
return $default(_that.size,_that.surcharge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SizeSurcharge implements SizeSurcharge {
  const _SizeSurcharge({@JsonKey(unknownEnumValue: Size.unknown) required this.size, this.surcharge = 0});
  factory _SizeSurcharge.fromJson(Map<String, dynamic> json) => _$SizeSurchargeFromJson(json);

@override@JsonKey(unknownEnumValue: Size.unknown) final  Size size;
@override@JsonKey() final  double surcharge;

/// Create a copy of SizeSurcharge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeSurchargeCopyWith<_SizeSurcharge> get copyWith => __$SizeSurchargeCopyWithImpl<_SizeSurcharge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizeSurchargeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeSurcharge&&(identical(other.size, size) || other.size == size)&&(identical(other.surcharge, surcharge) || other.surcharge == surcharge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,surcharge);

@override
String toString() {
  return 'SizeSurcharge(size: $size, surcharge: $surcharge)';
}


}

/// @nodoc
abstract mixin class _$SizeSurchargeCopyWith<$Res> implements $SizeSurchargeCopyWith<$Res> {
  factory _$SizeSurchargeCopyWith(_SizeSurcharge value, $Res Function(_SizeSurcharge) _then) = __$SizeSurchargeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: Size.unknown) Size size, double surcharge
});




}
/// @nodoc
class __$SizeSurchargeCopyWithImpl<$Res>
    implements _$SizeSurchargeCopyWith<$Res> {
  __$SizeSurchargeCopyWithImpl(this._self, this._then);

  final _SizeSurcharge _self;
  final $Res Function(_SizeSurcharge) _then;

/// Create a copy of SizeSurcharge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? surcharge = null,}) {
  return _then(_SizeSurcharge(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,surcharge: null == surcharge ? _self.surcharge : surcharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StudioPrintMethod {

 String get code; String get name; double get maxWidthCm; double get maxHeightCm; List<StudioTier> get tiers;
/// Create a copy of StudioPrintMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioPrintMethodCopyWith<StudioPrintMethod> get copyWith => _$StudioPrintMethodCopyWithImpl<StudioPrintMethod>(this as StudioPrintMethod, _$identity);

  /// Serializes this StudioPrintMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioPrintMethod&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.maxWidthCm, maxWidthCm) || other.maxWidthCm == maxWidthCm)&&(identical(other.maxHeightCm, maxHeightCm) || other.maxHeightCm == maxHeightCm)&&const DeepCollectionEquality().equals(other.tiers, tiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,maxWidthCm,maxHeightCm,const DeepCollectionEquality().hash(tiers));

@override
String toString() {
  return 'StudioPrintMethod(code: $code, name: $name, maxWidthCm: $maxWidthCm, maxHeightCm: $maxHeightCm, tiers: $tiers)';
}


}

/// @nodoc
abstract mixin class $StudioPrintMethodCopyWith<$Res>  {
  factory $StudioPrintMethodCopyWith(StudioPrintMethod value, $Res Function(StudioPrintMethod) _then) = _$StudioPrintMethodCopyWithImpl;
@useResult
$Res call({
 String code, String name, double maxWidthCm, double maxHeightCm, List<StudioTier> tiers
});




}
/// @nodoc
class _$StudioPrintMethodCopyWithImpl<$Res>
    implements $StudioPrintMethodCopyWith<$Res> {
  _$StudioPrintMethodCopyWithImpl(this._self, this._then);

  final StudioPrintMethod _self;
  final $Res Function(StudioPrintMethod) _then;

/// Create a copy of StudioPrintMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? maxWidthCm = null,Object? maxHeightCm = null,Object? tiers = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,maxWidthCm: null == maxWidthCm ? _self.maxWidthCm : maxWidthCm // ignore: cast_nullable_to_non_nullable
as double,maxHeightCm: null == maxHeightCm ? _self.maxHeightCm : maxHeightCm // ignore: cast_nullable_to_non_nullable
as double,tiers: null == tiers ? _self.tiers : tiers // ignore: cast_nullable_to_non_nullable
as List<StudioTier>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioPrintMethod].
extension StudioPrintMethodPatterns on StudioPrintMethod {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioPrintMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioPrintMethod() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioPrintMethod value)  $default,){
final _that = this;
switch (_that) {
case _StudioPrintMethod():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioPrintMethod value)?  $default,){
final _that = this;
switch (_that) {
case _StudioPrintMethod() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  double maxWidthCm,  double maxHeightCm,  List<StudioTier> tiers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioPrintMethod() when $default != null:
return $default(_that.code,_that.name,_that.maxWidthCm,_that.maxHeightCm,_that.tiers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  double maxWidthCm,  double maxHeightCm,  List<StudioTier> tiers)  $default,) {final _that = this;
switch (_that) {
case _StudioPrintMethod():
return $default(_that.code,_that.name,_that.maxWidthCm,_that.maxHeightCm,_that.tiers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  double maxWidthCm,  double maxHeightCm,  List<StudioTier> tiers)?  $default,) {final _that = this;
switch (_that) {
case _StudioPrintMethod() when $default != null:
return $default(_that.code,_that.name,_that.maxWidthCm,_that.maxHeightCm,_that.tiers);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioPrintMethod implements StudioPrintMethod {
  const _StudioPrintMethod({required this.code, required this.name, required this.maxWidthCm, required this.maxHeightCm, final  List<StudioTier> tiers = const <StudioTier>[]}): _tiers = tiers;
  factory _StudioPrintMethod.fromJson(Map<String, dynamic> json) => _$StudioPrintMethodFromJson(json);

@override final  String code;
@override final  String name;
@override final  double maxWidthCm;
@override final  double maxHeightCm;
 final  List<StudioTier> _tiers;
@override@JsonKey() List<StudioTier> get tiers {
  if (_tiers is EqualUnmodifiableListView) return _tiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tiers);
}


/// Create a copy of StudioPrintMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioPrintMethodCopyWith<_StudioPrintMethod> get copyWith => __$StudioPrintMethodCopyWithImpl<_StudioPrintMethod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioPrintMethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioPrintMethod&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.maxWidthCm, maxWidthCm) || other.maxWidthCm == maxWidthCm)&&(identical(other.maxHeightCm, maxHeightCm) || other.maxHeightCm == maxHeightCm)&&const DeepCollectionEquality().equals(other._tiers, _tiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,maxWidthCm,maxHeightCm,const DeepCollectionEquality().hash(_tiers));

@override
String toString() {
  return 'StudioPrintMethod(code: $code, name: $name, maxWidthCm: $maxWidthCm, maxHeightCm: $maxHeightCm, tiers: $tiers)';
}


}

/// @nodoc
abstract mixin class _$StudioPrintMethodCopyWith<$Res> implements $StudioPrintMethodCopyWith<$Res> {
  factory _$StudioPrintMethodCopyWith(_StudioPrintMethod value, $Res Function(_StudioPrintMethod) _then) = __$StudioPrintMethodCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, double maxWidthCm, double maxHeightCm, List<StudioTier> tiers
});




}
/// @nodoc
class __$StudioPrintMethodCopyWithImpl<$Res>
    implements _$StudioPrintMethodCopyWith<$Res> {
  __$StudioPrintMethodCopyWithImpl(this._self, this._then);

  final _StudioPrintMethod _self;
  final $Res Function(_StudioPrintMethod) _then;

/// Create a copy of StudioPrintMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? maxWidthCm = null,Object? maxHeightCm = null,Object? tiers = null,}) {
  return _then(_StudioPrintMethod(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,maxWidthCm: null == maxWidthCm ? _self.maxWidthCm : maxWidthCm // ignore: cast_nullable_to_non_nullable
as double,maxHeightCm: null == maxHeightCm ? _self.maxHeightCm : maxHeightCm // ignore: cast_nullable_to_non_nullable
as double,tiers: null == tiers ? _self._tiers : tiers // ignore: cast_nullable_to_non_nullable
as List<StudioTier>,
  ));
}


}


/// @nodoc
mixin _$StudioTier {

 String get label; double get maxWidthCm; double get maxHeightCm; double get price;
/// Create a copy of StudioTier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioTierCopyWith<StudioTier> get copyWith => _$StudioTierCopyWithImpl<StudioTier>(this as StudioTier, _$identity);

  /// Serializes this StudioTier to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioTier&&(identical(other.label, label) || other.label == label)&&(identical(other.maxWidthCm, maxWidthCm) || other.maxWidthCm == maxWidthCm)&&(identical(other.maxHeightCm, maxHeightCm) || other.maxHeightCm == maxHeightCm)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,maxWidthCm,maxHeightCm,price);

@override
String toString() {
  return 'StudioTier(label: $label, maxWidthCm: $maxWidthCm, maxHeightCm: $maxHeightCm, price: $price)';
}


}

/// @nodoc
abstract mixin class $StudioTierCopyWith<$Res>  {
  factory $StudioTierCopyWith(StudioTier value, $Res Function(StudioTier) _then) = _$StudioTierCopyWithImpl;
@useResult
$Res call({
 String label, double maxWidthCm, double maxHeightCm, double price
});




}
/// @nodoc
class _$StudioTierCopyWithImpl<$Res>
    implements $StudioTierCopyWith<$Res> {
  _$StudioTierCopyWithImpl(this._self, this._then);

  final StudioTier _self;
  final $Res Function(StudioTier) _then;

/// Create a copy of StudioTier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? maxWidthCm = null,Object? maxHeightCm = null,Object? price = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,maxWidthCm: null == maxWidthCm ? _self.maxWidthCm : maxWidthCm // ignore: cast_nullable_to_non_nullable
as double,maxHeightCm: null == maxHeightCm ? _self.maxHeightCm : maxHeightCm // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioTier].
extension StudioTierPatterns on StudioTier {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioTier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioTier() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioTier value)  $default,){
final _that = this;
switch (_that) {
case _StudioTier():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioTier value)?  $default,){
final _that = this;
switch (_that) {
case _StudioTier() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double maxWidthCm,  double maxHeightCm,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioTier() when $default != null:
return $default(_that.label,_that.maxWidthCm,_that.maxHeightCm,_that.price);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double maxWidthCm,  double maxHeightCm,  double price)  $default,) {final _that = this;
switch (_that) {
case _StudioTier():
return $default(_that.label,_that.maxWidthCm,_that.maxHeightCm,_that.price);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double maxWidthCm,  double maxHeightCm,  double price)?  $default,) {final _that = this;
switch (_that) {
case _StudioTier() when $default != null:
return $default(_that.label,_that.maxWidthCm,_that.maxHeightCm,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioTier implements StudioTier {
  const _StudioTier({required this.label, required this.maxWidthCm, required this.maxHeightCm, this.price = 0});
  factory _StudioTier.fromJson(Map<String, dynamic> json) => _$StudioTierFromJson(json);

@override final  String label;
@override final  double maxWidthCm;
@override final  double maxHeightCm;
@override@JsonKey() final  double price;

/// Create a copy of StudioTier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioTierCopyWith<_StudioTier> get copyWith => __$StudioTierCopyWithImpl<_StudioTier>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioTierToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioTier&&(identical(other.label, label) || other.label == label)&&(identical(other.maxWidthCm, maxWidthCm) || other.maxWidthCm == maxWidthCm)&&(identical(other.maxHeightCm, maxHeightCm) || other.maxHeightCm == maxHeightCm)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,maxWidthCm,maxHeightCm,price);

@override
String toString() {
  return 'StudioTier(label: $label, maxWidthCm: $maxWidthCm, maxHeightCm: $maxHeightCm, price: $price)';
}


}

/// @nodoc
abstract mixin class _$StudioTierCopyWith<$Res> implements $StudioTierCopyWith<$Res> {
  factory _$StudioTierCopyWith(_StudioTier value, $Res Function(_StudioTier) _then) = __$StudioTierCopyWithImpl;
@override @useResult
$Res call({
 String label, double maxWidthCm, double maxHeightCm, double price
});




}
/// @nodoc
class __$StudioTierCopyWithImpl<$Res>
    implements _$StudioTierCopyWith<$Res> {
  __$StudioTierCopyWithImpl(this._self, this._then);

  final _StudioTier _self;
  final $Res Function(_StudioTier) _then;

/// Create a copy of StudioTier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? maxWidthCm = null,Object? maxHeightCm = null,Object? price = null,}) {
  return _then(_StudioTier(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,maxWidthCm: null == maxWidthCm ? _self.maxWidthCm : maxWidthCm // ignore: cast_nullable_to_non_nullable
as double,maxHeightCm: null == maxHeightCm ? _self.maxHeightCm : maxHeightCm // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StudioExtras {

 double get rushFee; int get rushLeadTimeDays; double get customMeasurementsFee; double get setupFee; List<VolumeTier> get volumeTiers;
/// Create a copy of StudioExtras
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioExtrasCopyWith<StudioExtras> get copyWith => _$StudioExtrasCopyWithImpl<StudioExtras>(this as StudioExtras, _$identity);

  /// Serializes this StudioExtras to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioExtras&&(identical(other.rushFee, rushFee) || other.rushFee == rushFee)&&(identical(other.rushLeadTimeDays, rushLeadTimeDays) || other.rushLeadTimeDays == rushLeadTimeDays)&&(identical(other.customMeasurementsFee, customMeasurementsFee) || other.customMeasurementsFee == customMeasurementsFee)&&(identical(other.setupFee, setupFee) || other.setupFee == setupFee)&&const DeepCollectionEquality().equals(other.volumeTiers, volumeTiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rushFee,rushLeadTimeDays,customMeasurementsFee,setupFee,const DeepCollectionEquality().hash(volumeTiers));

@override
String toString() {
  return 'StudioExtras(rushFee: $rushFee, rushLeadTimeDays: $rushLeadTimeDays, customMeasurementsFee: $customMeasurementsFee, setupFee: $setupFee, volumeTiers: $volumeTiers)';
}


}

/// @nodoc
abstract mixin class $StudioExtrasCopyWith<$Res>  {
  factory $StudioExtrasCopyWith(StudioExtras value, $Res Function(StudioExtras) _then) = _$StudioExtrasCopyWithImpl;
@useResult
$Res call({
 double rushFee, int rushLeadTimeDays, double customMeasurementsFee, double setupFee, List<VolumeTier> volumeTiers
});




}
/// @nodoc
class _$StudioExtrasCopyWithImpl<$Res>
    implements $StudioExtrasCopyWith<$Res> {
  _$StudioExtrasCopyWithImpl(this._self, this._then);

  final StudioExtras _self;
  final $Res Function(StudioExtras) _then;

/// Create a copy of StudioExtras
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rushFee = null,Object? rushLeadTimeDays = null,Object? customMeasurementsFee = null,Object? setupFee = null,Object? volumeTiers = null,}) {
  return _then(_self.copyWith(
rushFee: null == rushFee ? _self.rushFee : rushFee // ignore: cast_nullable_to_non_nullable
as double,rushLeadTimeDays: null == rushLeadTimeDays ? _self.rushLeadTimeDays : rushLeadTimeDays // ignore: cast_nullable_to_non_nullable
as int,customMeasurementsFee: null == customMeasurementsFee ? _self.customMeasurementsFee : customMeasurementsFee // ignore: cast_nullable_to_non_nullable
as double,setupFee: null == setupFee ? _self.setupFee : setupFee // ignore: cast_nullable_to_non_nullable
as double,volumeTiers: null == volumeTiers ? _self.volumeTiers : volumeTiers // ignore: cast_nullable_to_non_nullable
as List<VolumeTier>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioExtras].
extension StudioExtrasPatterns on StudioExtras {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioExtras value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioExtras() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioExtras value)  $default,){
final _that = this;
switch (_that) {
case _StudioExtras():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioExtras value)?  $default,){
final _that = this;
switch (_that) {
case _StudioExtras() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double rushFee,  int rushLeadTimeDays,  double customMeasurementsFee,  double setupFee,  List<VolumeTier> volumeTiers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioExtras() when $default != null:
return $default(_that.rushFee,_that.rushLeadTimeDays,_that.customMeasurementsFee,_that.setupFee,_that.volumeTiers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double rushFee,  int rushLeadTimeDays,  double customMeasurementsFee,  double setupFee,  List<VolumeTier> volumeTiers)  $default,) {final _that = this;
switch (_that) {
case _StudioExtras():
return $default(_that.rushFee,_that.rushLeadTimeDays,_that.customMeasurementsFee,_that.setupFee,_that.volumeTiers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double rushFee,  int rushLeadTimeDays,  double customMeasurementsFee,  double setupFee,  List<VolumeTier> volumeTiers)?  $default,) {final _that = this;
switch (_that) {
case _StudioExtras() when $default != null:
return $default(_that.rushFee,_that.rushLeadTimeDays,_that.customMeasurementsFee,_that.setupFee,_that.volumeTiers);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioExtras implements StudioExtras {
  const _StudioExtras({this.rushFee = 0, this.rushLeadTimeDays = 0, this.customMeasurementsFee = 0, this.setupFee = 0, final  List<VolumeTier> volumeTiers = const <VolumeTier>[]}): _volumeTiers = volumeTiers;
  factory _StudioExtras.fromJson(Map<String, dynamic> json) => _$StudioExtrasFromJson(json);

@override@JsonKey() final  double rushFee;
@override@JsonKey() final  int rushLeadTimeDays;
@override@JsonKey() final  double customMeasurementsFee;
@override@JsonKey() final  double setupFee;
 final  List<VolumeTier> _volumeTiers;
@override@JsonKey() List<VolumeTier> get volumeTiers {
  if (_volumeTiers is EqualUnmodifiableListView) return _volumeTiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volumeTiers);
}


/// Create a copy of StudioExtras
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioExtrasCopyWith<_StudioExtras> get copyWith => __$StudioExtrasCopyWithImpl<_StudioExtras>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioExtrasToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioExtras&&(identical(other.rushFee, rushFee) || other.rushFee == rushFee)&&(identical(other.rushLeadTimeDays, rushLeadTimeDays) || other.rushLeadTimeDays == rushLeadTimeDays)&&(identical(other.customMeasurementsFee, customMeasurementsFee) || other.customMeasurementsFee == customMeasurementsFee)&&(identical(other.setupFee, setupFee) || other.setupFee == setupFee)&&const DeepCollectionEquality().equals(other._volumeTiers, _volumeTiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rushFee,rushLeadTimeDays,customMeasurementsFee,setupFee,const DeepCollectionEquality().hash(_volumeTiers));

@override
String toString() {
  return 'StudioExtras(rushFee: $rushFee, rushLeadTimeDays: $rushLeadTimeDays, customMeasurementsFee: $customMeasurementsFee, setupFee: $setupFee, volumeTiers: $volumeTiers)';
}


}

/// @nodoc
abstract mixin class _$StudioExtrasCopyWith<$Res> implements $StudioExtrasCopyWith<$Res> {
  factory _$StudioExtrasCopyWith(_StudioExtras value, $Res Function(_StudioExtras) _then) = __$StudioExtrasCopyWithImpl;
@override @useResult
$Res call({
 double rushFee, int rushLeadTimeDays, double customMeasurementsFee, double setupFee, List<VolumeTier> volumeTiers
});




}
/// @nodoc
class __$StudioExtrasCopyWithImpl<$Res>
    implements _$StudioExtrasCopyWith<$Res> {
  __$StudioExtrasCopyWithImpl(this._self, this._then);

  final _StudioExtras _self;
  final $Res Function(_StudioExtras) _then;

/// Create a copy of StudioExtras
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rushFee = null,Object? rushLeadTimeDays = null,Object? customMeasurementsFee = null,Object? setupFee = null,Object? volumeTiers = null,}) {
  return _then(_StudioExtras(
rushFee: null == rushFee ? _self.rushFee : rushFee // ignore: cast_nullable_to_non_nullable
as double,rushLeadTimeDays: null == rushLeadTimeDays ? _self.rushLeadTimeDays : rushLeadTimeDays // ignore: cast_nullable_to_non_nullable
as int,customMeasurementsFee: null == customMeasurementsFee ? _self.customMeasurementsFee : customMeasurementsFee // ignore: cast_nullable_to_non_nullable
as double,setupFee: null == setupFee ? _self.setupFee : setupFee // ignore: cast_nullable_to_non_nullable
as double,volumeTiers: null == volumeTiers ? _self._volumeTiers : volumeTiers // ignore: cast_nullable_to_non_nullable
as List<VolumeTier>,
  ));
}


}


/// @nodoc
mixin _$VolumeTier {

 int get minQuantity; double get percent;
/// Create a copy of VolumeTier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeTierCopyWith<VolumeTier> get copyWith => _$VolumeTierCopyWithImpl<VolumeTier>(this as VolumeTier, _$identity);

  /// Serializes this VolumeTier to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeTier&&(identical(other.minQuantity, minQuantity) || other.minQuantity == minQuantity)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minQuantity,percent);

@override
String toString() {
  return 'VolumeTier(minQuantity: $minQuantity, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $VolumeTierCopyWith<$Res>  {
  factory $VolumeTierCopyWith(VolumeTier value, $Res Function(VolumeTier) _then) = _$VolumeTierCopyWithImpl;
@useResult
$Res call({
 int minQuantity, double percent
});




}
/// @nodoc
class _$VolumeTierCopyWithImpl<$Res>
    implements $VolumeTierCopyWith<$Res> {
  _$VolumeTierCopyWithImpl(this._self, this._then);

  final VolumeTier _self;
  final $Res Function(VolumeTier) _then;

/// Create a copy of VolumeTier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minQuantity = null,Object? percent = null,}) {
  return _then(_self.copyWith(
minQuantity: null == minQuantity ? _self.minQuantity : minQuantity // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VolumeTier].
extension VolumeTierPatterns on VolumeTier {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolumeTier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolumeTier() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolumeTier value)  $default,){
final _that = this;
switch (_that) {
case _VolumeTier():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolumeTier value)?  $default,){
final _that = this;
switch (_that) {
case _VolumeTier() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minQuantity,  double percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolumeTier() when $default != null:
return $default(_that.minQuantity,_that.percent);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minQuantity,  double percent)  $default,) {final _that = this;
switch (_that) {
case _VolumeTier():
return $default(_that.minQuantity,_that.percent);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minQuantity,  double percent)?  $default,) {final _that = this;
switch (_that) {
case _VolumeTier() when $default != null:
return $default(_that.minQuantity,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolumeTier implements VolumeTier {
  const _VolumeTier({required this.minQuantity, required this.percent});
  factory _VolumeTier.fromJson(Map<String, dynamic> json) => _$VolumeTierFromJson(json);

@override final  int minQuantity;
@override final  double percent;

/// Create a copy of VolumeTier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeTierCopyWith<_VolumeTier> get copyWith => __$VolumeTierCopyWithImpl<_VolumeTier>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolumeTierToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeTier&&(identical(other.minQuantity, minQuantity) || other.minQuantity == minQuantity)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minQuantity,percent);

@override
String toString() {
  return 'VolumeTier(minQuantity: $minQuantity, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$VolumeTierCopyWith<$Res> implements $VolumeTierCopyWith<$Res> {
  factory _$VolumeTierCopyWith(_VolumeTier value, $Res Function(_VolumeTier) _then) = __$VolumeTierCopyWithImpl;
@override @useResult
$Res call({
 int minQuantity, double percent
});




}
/// @nodoc
class __$VolumeTierCopyWithImpl<$Res>
    implements _$VolumeTierCopyWith<$Res> {
  __$VolumeTierCopyWithImpl(this._self, this._then);

  final _VolumeTier _self;
  final $Res Function(_VolumeTier) _then;

/// Create a copy of VolumeTier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minQuantity = null,Object? percent = null,}) {
  return _then(_VolumeTier(
minQuantity: null == minQuantity ? _self.minQuantity : minQuantity // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
