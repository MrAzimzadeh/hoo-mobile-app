// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignSpec {

 String get baseCode;@JsonKey(unknownEnumValue: Fit.unknown) Fit get fit; List<String> get featureCodes; String get fabricCode; String get colorId;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; CustomMeasurements? get customMeasurements; int get quantity; bool get rush;
/// Create a copy of DesignSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignSpecCopyWith<DesignSpec> get copyWith => _$DesignSpecCopyWithImpl<DesignSpec>(this as DesignSpec, _$identity);

  /// Serializes this DesignSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignSpec&&(identical(other.baseCode, baseCode) || other.baseCode == baseCode)&&(identical(other.fit, fit) || other.fit == fit)&&const DeepCollectionEquality().equals(other.featureCodes, featureCodes)&&(identical(other.fabricCode, fabricCode) || other.fabricCode == fabricCode)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.size, size) || other.size == size)&&(identical(other.customMeasurements, customMeasurements) || other.customMeasurements == customMeasurements)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rush, rush) || other.rush == rush));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseCode,fit,const DeepCollectionEquality().hash(featureCodes),fabricCode,colorId,size,customMeasurements,quantity,rush);

@override
String toString() {
  return 'DesignSpec(baseCode: $baseCode, fit: $fit, featureCodes: $featureCodes, fabricCode: $fabricCode, colorId: $colorId, size: $size, customMeasurements: $customMeasurements, quantity: $quantity, rush: $rush)';
}


}

/// @nodoc
abstract mixin class $DesignSpecCopyWith<$Res>  {
  factory $DesignSpecCopyWith(DesignSpec value, $Res Function(DesignSpec) _then) = _$DesignSpecCopyWithImpl;
@useResult
$Res call({
 String baseCode,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, List<String> featureCodes, String fabricCode, String colorId,@JsonKey(unknownEnumValue: Size.unknown) Size? size, CustomMeasurements? customMeasurements, int quantity, bool rush
});


$CustomMeasurementsCopyWith<$Res>? get customMeasurements;

}
/// @nodoc
class _$DesignSpecCopyWithImpl<$Res>
    implements $DesignSpecCopyWith<$Res> {
  _$DesignSpecCopyWithImpl(this._self, this._then);

  final DesignSpec _self;
  final $Res Function(DesignSpec) _then;

/// Create a copy of DesignSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseCode = null,Object? fit = null,Object? featureCodes = null,Object? fabricCode = null,Object? colorId = null,Object? size = freezed,Object? customMeasurements = freezed,Object? quantity = null,Object? rush = null,}) {
  return _then(_self.copyWith(
baseCode: null == baseCode ? _self.baseCode : baseCode // ignore: cast_nullable_to_non_nullable
as String,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,featureCodes: null == featureCodes ? _self.featureCodes : featureCodes // ignore: cast_nullable_to_non_nullable
as List<String>,fabricCode: null == fabricCode ? _self.fabricCode : fabricCode // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,customMeasurements: freezed == customMeasurements ? _self.customMeasurements : customMeasurements // ignore: cast_nullable_to_non_nullable
as CustomMeasurements?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rush: null == rush ? _self.rush : rush // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DesignSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomMeasurementsCopyWith<$Res>? get customMeasurements {
    if (_self.customMeasurements == null) {
    return null;
  }

  return $CustomMeasurementsCopyWith<$Res>(_self.customMeasurements!, (value) {
    return _then(_self.copyWith(customMeasurements: value));
  });
}
}


/// Adds pattern-matching-related methods to [DesignSpec].
extension DesignSpecPatterns on DesignSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignSpec value)  $default,){
final _that = this;
switch (_that) {
case _DesignSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignSpec value)?  $default,){
final _that = this;
switch (_that) {
case _DesignSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseCode, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  List<String> featureCodes,  String fabricCode,  String colorId, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  CustomMeasurements? customMeasurements,  int quantity,  bool rush)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignSpec() when $default != null:
return $default(_that.baseCode,_that.fit,_that.featureCodes,_that.fabricCode,_that.colorId,_that.size,_that.customMeasurements,_that.quantity,_that.rush);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseCode, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  List<String> featureCodes,  String fabricCode,  String colorId, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  CustomMeasurements? customMeasurements,  int quantity,  bool rush)  $default,) {final _that = this;
switch (_that) {
case _DesignSpec():
return $default(_that.baseCode,_that.fit,_that.featureCodes,_that.fabricCode,_that.colorId,_that.size,_that.customMeasurements,_that.quantity,_that.rush);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseCode, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  List<String> featureCodes,  String fabricCode,  String colorId, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  CustomMeasurements? customMeasurements,  int quantity,  bool rush)?  $default,) {final _that = this;
switch (_that) {
case _DesignSpec() when $default != null:
return $default(_that.baseCode,_that.fit,_that.featureCodes,_that.fabricCode,_that.colorId,_that.size,_that.customMeasurements,_that.quantity,_that.rush);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DesignSpec implements DesignSpec {
  const _DesignSpec({required this.baseCode, @JsonKey(unknownEnumValue: Fit.unknown) required this.fit, final  List<String> featureCodes = const <String>[], required this.fabricCode, required this.colorId, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.customMeasurements, this.quantity = 1, this.rush = false}): _featureCodes = featureCodes;
  factory _DesignSpec.fromJson(Map<String, dynamic> json) => _$DesignSpecFromJson(json);

@override final  String baseCode;
@override@JsonKey(unknownEnumValue: Fit.unknown) final  Fit fit;
 final  List<String> _featureCodes;
@override@JsonKey() List<String> get featureCodes {
  if (_featureCodes is EqualUnmodifiableListView) return _featureCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featureCodes);
}

@override final  String fabricCode;
@override final  String colorId;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override final  CustomMeasurements? customMeasurements;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  bool rush;

/// Create a copy of DesignSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignSpecCopyWith<_DesignSpec> get copyWith => __$DesignSpecCopyWithImpl<_DesignSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignSpec&&(identical(other.baseCode, baseCode) || other.baseCode == baseCode)&&(identical(other.fit, fit) || other.fit == fit)&&const DeepCollectionEquality().equals(other._featureCodes, _featureCodes)&&(identical(other.fabricCode, fabricCode) || other.fabricCode == fabricCode)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.size, size) || other.size == size)&&(identical(other.customMeasurements, customMeasurements) || other.customMeasurements == customMeasurements)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rush, rush) || other.rush == rush));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseCode,fit,const DeepCollectionEquality().hash(_featureCodes),fabricCode,colorId,size,customMeasurements,quantity,rush);

@override
String toString() {
  return 'DesignSpec(baseCode: $baseCode, fit: $fit, featureCodes: $featureCodes, fabricCode: $fabricCode, colorId: $colorId, size: $size, customMeasurements: $customMeasurements, quantity: $quantity, rush: $rush)';
}


}

/// @nodoc
abstract mixin class _$DesignSpecCopyWith<$Res> implements $DesignSpecCopyWith<$Res> {
  factory _$DesignSpecCopyWith(_DesignSpec value, $Res Function(_DesignSpec) _then) = __$DesignSpecCopyWithImpl;
@override @useResult
$Res call({
 String baseCode,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, List<String> featureCodes, String fabricCode, String colorId,@JsonKey(unknownEnumValue: Size.unknown) Size? size, CustomMeasurements? customMeasurements, int quantity, bool rush
});


@override $CustomMeasurementsCopyWith<$Res>? get customMeasurements;

}
/// @nodoc
class __$DesignSpecCopyWithImpl<$Res>
    implements _$DesignSpecCopyWith<$Res> {
  __$DesignSpecCopyWithImpl(this._self, this._then);

  final _DesignSpec _self;
  final $Res Function(_DesignSpec) _then;

/// Create a copy of DesignSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseCode = null,Object? fit = null,Object? featureCodes = null,Object? fabricCode = null,Object? colorId = null,Object? size = freezed,Object? customMeasurements = freezed,Object? quantity = null,Object? rush = null,}) {
  return _then(_DesignSpec(
baseCode: null == baseCode ? _self.baseCode : baseCode // ignore: cast_nullable_to_non_nullable
as String,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,featureCodes: null == featureCodes ? _self._featureCodes : featureCodes // ignore: cast_nullable_to_non_nullable
as List<String>,fabricCode: null == fabricCode ? _self.fabricCode : fabricCode // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,customMeasurements: freezed == customMeasurements ? _self.customMeasurements : customMeasurements // ignore: cast_nullable_to_non_nullable
as CustomMeasurements?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rush: null == rush ? _self.rush : rush // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DesignSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomMeasurementsCopyWith<$Res>? get customMeasurements {
    if (_self.customMeasurements == null) {
    return null;
  }

  return $CustomMeasurementsCopyWith<$Res>(_self.customMeasurements!, (value) {
    return _then(_self.copyWith(customMeasurements: value));
  });
}
}


/// @nodoc
mixin _$CustomMeasurements {

 int get chestCm; int get lengthCm; int get sleeveCm; int? get waistCm; String? get note;
/// Create a copy of CustomMeasurements
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomMeasurementsCopyWith<CustomMeasurements> get copyWith => _$CustomMeasurementsCopyWithImpl<CustomMeasurements>(this as CustomMeasurements, _$identity);

  /// Serializes this CustomMeasurements to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomMeasurements&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.sleeveCm, sleeveCm) || other.sleeveCm == sleeveCm)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chestCm,lengthCm,sleeveCm,waistCm,note);

@override
String toString() {
  return 'CustomMeasurements(chestCm: $chestCm, lengthCm: $lengthCm, sleeveCm: $sleeveCm, waistCm: $waistCm, note: $note)';
}


}

/// @nodoc
abstract mixin class $CustomMeasurementsCopyWith<$Res>  {
  factory $CustomMeasurementsCopyWith(CustomMeasurements value, $Res Function(CustomMeasurements) _then) = _$CustomMeasurementsCopyWithImpl;
@useResult
$Res call({
 int chestCm, int lengthCm, int sleeveCm, int? waistCm, String? note
});




}
/// @nodoc
class _$CustomMeasurementsCopyWithImpl<$Res>
    implements $CustomMeasurementsCopyWith<$Res> {
  _$CustomMeasurementsCopyWithImpl(this._self, this._then);

  final CustomMeasurements _self;
  final $Res Function(CustomMeasurements) _then;

/// Create a copy of CustomMeasurements
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chestCm = null,Object? lengthCm = null,Object? sleeveCm = null,Object? waistCm = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
chestCm: null == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as int,lengthCm: null == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as int,sleeveCm: null == sleeveCm ? _self.sleeveCm : sleeveCm // ignore: cast_nullable_to_non_nullable
as int,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomMeasurements].
extension CustomMeasurementsPatterns on CustomMeasurements {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomMeasurements value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomMeasurements() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomMeasurements value)  $default,){
final _that = this;
switch (_that) {
case _CustomMeasurements():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomMeasurements value)?  $default,){
final _that = this;
switch (_that) {
case _CustomMeasurements() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int chestCm,  int lengthCm,  int sleeveCm,  int? waistCm,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomMeasurements() when $default != null:
return $default(_that.chestCm,_that.lengthCm,_that.sleeveCm,_that.waistCm,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int chestCm,  int lengthCm,  int sleeveCm,  int? waistCm,  String? note)  $default,) {final _that = this;
switch (_that) {
case _CustomMeasurements():
return $default(_that.chestCm,_that.lengthCm,_that.sleeveCm,_that.waistCm,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int chestCm,  int lengthCm,  int sleeveCm,  int? waistCm,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _CustomMeasurements() when $default != null:
return $default(_that.chestCm,_that.lengthCm,_that.sleeveCm,_that.waistCm,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomMeasurements implements CustomMeasurements {
  const _CustomMeasurements({required this.chestCm, required this.lengthCm, required this.sleeveCm, this.waistCm, this.note});
  factory _CustomMeasurements.fromJson(Map<String, dynamic> json) => _$CustomMeasurementsFromJson(json);

@override final  int chestCm;
@override final  int lengthCm;
@override final  int sleeveCm;
@override final  int? waistCm;
@override final  String? note;

/// Create a copy of CustomMeasurements
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomMeasurementsCopyWith<_CustomMeasurements> get copyWith => __$CustomMeasurementsCopyWithImpl<_CustomMeasurements>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomMeasurementsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomMeasurements&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.sleeveCm, sleeveCm) || other.sleeveCm == sleeveCm)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chestCm,lengthCm,sleeveCm,waistCm,note);

@override
String toString() {
  return 'CustomMeasurements(chestCm: $chestCm, lengthCm: $lengthCm, sleeveCm: $sleeveCm, waistCm: $waistCm, note: $note)';
}


}

/// @nodoc
abstract mixin class _$CustomMeasurementsCopyWith<$Res> implements $CustomMeasurementsCopyWith<$Res> {
  factory _$CustomMeasurementsCopyWith(_CustomMeasurements value, $Res Function(_CustomMeasurements) _then) = __$CustomMeasurementsCopyWithImpl;
@override @useResult
$Res call({
 int chestCm, int lengthCm, int sleeveCm, int? waistCm, String? note
});




}
/// @nodoc
class __$CustomMeasurementsCopyWithImpl<$Res>
    implements _$CustomMeasurementsCopyWith<$Res> {
  __$CustomMeasurementsCopyWithImpl(this._self, this._then);

  final _CustomMeasurements _self;
  final $Res Function(_CustomMeasurements) _then;

/// Create a copy of CustomMeasurements
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chestCm = null,Object? lengthCm = null,Object? sleeveCm = null,Object? waistCm = freezed,Object? note = freezed,}) {
  return _then(_CustomMeasurements(
chestCm: null == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as int,lengthCm: null == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as int,sleeveCm: null == sleeveCm ? _self.sleeveCm : sleeveCm // ignore: cast_nullable_to_non_nullable
as int,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DesignLayer {

 String get id; LayerKind get kind; String get placement; int get zIndex; String get printMethodCode; double get widthCm; double get heightCm; double get xCm; double get yCm; double get rotation; String? get text; String? get font; double? get fontSizePt; String? get align; double? get curve; String? get colorHex; String? get uploadId; String? get graphicId; LayerAnchor? get anchor;
/// Create a copy of DesignLayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignLayerCopyWith<DesignLayer> get copyWith => _$DesignLayerCopyWithImpl<DesignLayer>(this as DesignLayer, _$identity);

  /// Serializes this DesignLayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignLayer&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.zIndex, zIndex) || other.zIndex == zIndex)&&(identical(other.printMethodCode, printMethodCode) || other.printMethodCode == printMethodCode)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.xCm, xCm) || other.xCm == xCm)&&(identical(other.yCm, yCm) || other.yCm == yCm)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.text, text) || other.text == text)&&(identical(other.font, font) || other.font == font)&&(identical(other.fontSizePt, fontSizePt) || other.fontSizePt == fontSizePt)&&(identical(other.align, align) || other.align == align)&&(identical(other.curve, curve) || other.curve == curve)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.uploadId, uploadId) || other.uploadId == uploadId)&&(identical(other.graphicId, graphicId) || other.graphicId == graphicId)&&(identical(other.anchor, anchor) || other.anchor == anchor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,kind,placement,zIndex,printMethodCode,widthCm,heightCm,xCm,yCm,rotation,text,font,fontSizePt,align,curve,colorHex,uploadId,graphicId,anchor]);

@override
String toString() {
  return 'DesignLayer(id: $id, kind: $kind, placement: $placement, zIndex: $zIndex, printMethodCode: $printMethodCode, widthCm: $widthCm, heightCm: $heightCm, xCm: $xCm, yCm: $yCm, rotation: $rotation, text: $text, font: $font, fontSizePt: $fontSizePt, align: $align, curve: $curve, colorHex: $colorHex, uploadId: $uploadId, graphicId: $graphicId, anchor: $anchor)';
}


}

/// @nodoc
abstract mixin class $DesignLayerCopyWith<$Res>  {
  factory $DesignLayerCopyWith(DesignLayer value, $Res Function(DesignLayer) _then) = _$DesignLayerCopyWithImpl;
@useResult
$Res call({
 String id, LayerKind kind, String placement, int zIndex, String printMethodCode, double widthCm, double heightCm, double xCm, double yCm, double rotation, String? text, String? font, double? fontSizePt, String? align, double? curve, String? colorHex, String? uploadId, String? graphicId, LayerAnchor? anchor
});


$LayerAnchorCopyWith<$Res>? get anchor;

}
/// @nodoc
class _$DesignLayerCopyWithImpl<$Res>
    implements $DesignLayerCopyWith<$Res> {
  _$DesignLayerCopyWithImpl(this._self, this._then);

  final DesignLayer _self;
  final $Res Function(DesignLayer) _then;

/// Create a copy of DesignLayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? placement = null,Object? zIndex = null,Object? printMethodCode = null,Object? widthCm = null,Object? heightCm = null,Object? xCm = null,Object? yCm = null,Object? rotation = null,Object? text = freezed,Object? font = freezed,Object? fontSizePt = freezed,Object? align = freezed,Object? curve = freezed,Object? colorHex = freezed,Object? uploadId = freezed,Object? graphicId = freezed,Object? anchor = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LayerKind,placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String,zIndex: null == zIndex ? _self.zIndex : zIndex // ignore: cast_nullable_to_non_nullable
as int,printMethodCode: null == printMethodCode ? _self.printMethodCode : printMethodCode // ignore: cast_nullable_to_non_nullable
as String,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as double,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,xCm: null == xCm ? _self.xCm : xCm // ignore: cast_nullable_to_non_nullable
as double,yCm: null == yCm ? _self.yCm : yCm // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,font: freezed == font ? _self.font : font // ignore: cast_nullable_to_non_nullable
as String?,fontSizePt: freezed == fontSizePt ? _self.fontSizePt : fontSizePt // ignore: cast_nullable_to_non_nullable
as double?,align: freezed == align ? _self.align : align // ignore: cast_nullable_to_non_nullable
as String?,curve: freezed == curve ? _self.curve : curve // ignore: cast_nullable_to_non_nullable
as double?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,uploadId: freezed == uploadId ? _self.uploadId : uploadId // ignore: cast_nullable_to_non_nullable
as String?,graphicId: freezed == graphicId ? _self.graphicId : graphicId // ignore: cast_nullable_to_non_nullable
as String?,anchor: freezed == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as LayerAnchor?,
  ));
}
/// Create a copy of DesignLayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LayerAnchorCopyWith<$Res>? get anchor {
    if (_self.anchor == null) {
    return null;
  }

  return $LayerAnchorCopyWith<$Res>(_self.anchor!, (value) {
    return _then(_self.copyWith(anchor: value));
  });
}
}


/// Adds pattern-matching-related methods to [DesignLayer].
extension DesignLayerPatterns on DesignLayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignLayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignLayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignLayer value)  $default,){
final _that = this;
switch (_that) {
case _DesignLayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignLayer value)?  $default,){
final _that = this;
switch (_that) {
case _DesignLayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LayerKind kind,  String placement,  int zIndex,  String printMethodCode,  double widthCm,  double heightCm,  double xCm,  double yCm,  double rotation,  String? text,  String? font,  double? fontSizePt,  String? align,  double? curve,  String? colorHex,  String? uploadId,  String? graphicId,  LayerAnchor? anchor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignLayer() when $default != null:
return $default(_that.id,_that.kind,_that.placement,_that.zIndex,_that.printMethodCode,_that.widthCm,_that.heightCm,_that.xCm,_that.yCm,_that.rotation,_that.text,_that.font,_that.fontSizePt,_that.align,_that.curve,_that.colorHex,_that.uploadId,_that.graphicId,_that.anchor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LayerKind kind,  String placement,  int zIndex,  String printMethodCode,  double widthCm,  double heightCm,  double xCm,  double yCm,  double rotation,  String? text,  String? font,  double? fontSizePt,  String? align,  double? curve,  String? colorHex,  String? uploadId,  String? graphicId,  LayerAnchor? anchor)  $default,) {final _that = this;
switch (_that) {
case _DesignLayer():
return $default(_that.id,_that.kind,_that.placement,_that.zIndex,_that.printMethodCode,_that.widthCm,_that.heightCm,_that.xCm,_that.yCm,_that.rotation,_that.text,_that.font,_that.fontSizePt,_that.align,_that.curve,_that.colorHex,_that.uploadId,_that.graphicId,_that.anchor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LayerKind kind,  String placement,  int zIndex,  String printMethodCode,  double widthCm,  double heightCm,  double xCm,  double yCm,  double rotation,  String? text,  String? font,  double? fontSizePt,  String? align,  double? curve,  String? colorHex,  String? uploadId,  String? graphicId,  LayerAnchor? anchor)?  $default,) {final _that = this;
switch (_that) {
case _DesignLayer() when $default != null:
return $default(_that.id,_that.kind,_that.placement,_that.zIndex,_that.printMethodCode,_that.widthCm,_that.heightCm,_that.xCm,_that.yCm,_that.rotation,_that.text,_that.font,_that.fontSizePt,_that.align,_that.curve,_that.colorHex,_that.uploadId,_that.graphicId,_that.anchor);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DesignLayer implements DesignLayer {
  const _DesignLayer({required this.id, required this.kind, required this.placement, this.zIndex = 0, required this.printMethodCode, required this.widthCm, required this.heightCm, this.xCm = 0, this.yCm = 0, this.rotation = 0, this.text, this.font, this.fontSizePt, this.align, this.curve, this.colorHex, this.uploadId, this.graphicId, this.anchor});
  factory _DesignLayer.fromJson(Map<String, dynamic> json) => _$DesignLayerFromJson(json);

@override final  String id;
@override final  LayerKind kind;
@override final  String placement;
@override@JsonKey() final  int zIndex;
@override final  String printMethodCode;
@override final  double widthCm;
@override final  double heightCm;
@override@JsonKey() final  double xCm;
@override@JsonKey() final  double yCm;
@override@JsonKey() final  double rotation;
@override final  String? text;
@override final  String? font;
@override final  double? fontSizePt;
@override final  String? align;
@override final  double? curve;
@override final  String? colorHex;
@override final  String? uploadId;
@override final  String? graphicId;
@override final  LayerAnchor? anchor;

/// Create a copy of DesignLayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignLayerCopyWith<_DesignLayer> get copyWith => __$DesignLayerCopyWithImpl<_DesignLayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignLayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignLayer&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.zIndex, zIndex) || other.zIndex == zIndex)&&(identical(other.printMethodCode, printMethodCode) || other.printMethodCode == printMethodCode)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.xCm, xCm) || other.xCm == xCm)&&(identical(other.yCm, yCm) || other.yCm == yCm)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.text, text) || other.text == text)&&(identical(other.font, font) || other.font == font)&&(identical(other.fontSizePt, fontSizePt) || other.fontSizePt == fontSizePt)&&(identical(other.align, align) || other.align == align)&&(identical(other.curve, curve) || other.curve == curve)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.uploadId, uploadId) || other.uploadId == uploadId)&&(identical(other.graphicId, graphicId) || other.graphicId == graphicId)&&(identical(other.anchor, anchor) || other.anchor == anchor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,kind,placement,zIndex,printMethodCode,widthCm,heightCm,xCm,yCm,rotation,text,font,fontSizePt,align,curve,colorHex,uploadId,graphicId,anchor]);

@override
String toString() {
  return 'DesignLayer(id: $id, kind: $kind, placement: $placement, zIndex: $zIndex, printMethodCode: $printMethodCode, widthCm: $widthCm, heightCm: $heightCm, xCm: $xCm, yCm: $yCm, rotation: $rotation, text: $text, font: $font, fontSizePt: $fontSizePt, align: $align, curve: $curve, colorHex: $colorHex, uploadId: $uploadId, graphicId: $graphicId, anchor: $anchor)';
}


}

/// @nodoc
abstract mixin class _$DesignLayerCopyWith<$Res> implements $DesignLayerCopyWith<$Res> {
  factory _$DesignLayerCopyWith(_DesignLayer value, $Res Function(_DesignLayer) _then) = __$DesignLayerCopyWithImpl;
@override @useResult
$Res call({
 String id, LayerKind kind, String placement, int zIndex, String printMethodCode, double widthCm, double heightCm, double xCm, double yCm, double rotation, String? text, String? font, double? fontSizePt, String? align, double? curve, String? colorHex, String? uploadId, String? graphicId, LayerAnchor? anchor
});


@override $LayerAnchorCopyWith<$Res>? get anchor;

}
/// @nodoc
class __$DesignLayerCopyWithImpl<$Res>
    implements _$DesignLayerCopyWith<$Res> {
  __$DesignLayerCopyWithImpl(this._self, this._then);

  final _DesignLayer _self;
  final $Res Function(_DesignLayer) _then;

/// Create a copy of DesignLayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? placement = null,Object? zIndex = null,Object? printMethodCode = null,Object? widthCm = null,Object? heightCm = null,Object? xCm = null,Object? yCm = null,Object? rotation = null,Object? text = freezed,Object? font = freezed,Object? fontSizePt = freezed,Object? align = freezed,Object? curve = freezed,Object? colorHex = freezed,Object? uploadId = freezed,Object? graphicId = freezed,Object? anchor = freezed,}) {
  return _then(_DesignLayer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LayerKind,placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String,zIndex: null == zIndex ? _self.zIndex : zIndex // ignore: cast_nullable_to_non_nullable
as int,printMethodCode: null == printMethodCode ? _self.printMethodCode : printMethodCode // ignore: cast_nullable_to_non_nullable
as String,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as double,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,xCm: null == xCm ? _self.xCm : xCm // ignore: cast_nullable_to_non_nullable
as double,yCm: null == yCm ? _self.yCm : yCm // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,font: freezed == font ? _self.font : font // ignore: cast_nullable_to_non_nullable
as String?,fontSizePt: freezed == fontSizePt ? _self.fontSizePt : fontSizePt // ignore: cast_nullable_to_non_nullable
as double?,align: freezed == align ? _self.align : align // ignore: cast_nullable_to_non_nullable
as String?,curve: freezed == curve ? _self.curve : curve // ignore: cast_nullable_to_non_nullable
as double?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,uploadId: freezed == uploadId ? _self.uploadId : uploadId // ignore: cast_nullable_to_non_nullable
as String?,graphicId: freezed == graphicId ? _self.graphicId : graphicId // ignore: cast_nullable_to_non_nullable
as String?,anchor: freezed == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as LayerAnchor?,
  ));
}

/// Create a copy of DesignLayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LayerAnchorCopyWith<$Res>? get anchor {
    if (_self.anchor == null) {
    return null;
  }

  return $LayerAnchorCopyWith<$Res>(_self.anchor!, (value) {
    return _then(_self.copyWith(anchor: value));
  });
}
}


/// @nodoc
mixin _$LayerAnchor {

 ZoneVector get position; ZoneVector get normal;
/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LayerAnchorCopyWith<LayerAnchor> get copyWith => _$LayerAnchorCopyWithImpl<LayerAnchor>(this as LayerAnchor, _$identity);

  /// Serializes this LayerAnchor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LayerAnchor&&(identical(other.position, position) || other.position == position)&&(identical(other.normal, normal) || other.normal == normal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,normal);

@override
String toString() {
  return 'LayerAnchor(position: $position, normal: $normal)';
}


}

/// @nodoc
abstract mixin class $LayerAnchorCopyWith<$Res>  {
  factory $LayerAnchorCopyWith(LayerAnchor value, $Res Function(LayerAnchor) _then) = _$LayerAnchorCopyWithImpl;
@useResult
$Res call({
 ZoneVector position, ZoneVector normal
});


$ZoneVectorCopyWith<$Res> get position;$ZoneVectorCopyWith<$Res> get normal;

}
/// @nodoc
class _$LayerAnchorCopyWithImpl<$Res>
    implements $LayerAnchorCopyWith<$Res> {
  _$LayerAnchorCopyWithImpl(this._self, this._then);

  final LayerAnchor _self;
  final $Res Function(LayerAnchor) _then;

/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? normal = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as ZoneVector,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as ZoneVector,
  ));
}
/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get position {
  
  return $ZoneVectorCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get normal {
  
  return $ZoneVectorCopyWith<$Res>(_self.normal, (value) {
    return _then(_self.copyWith(normal: value));
  });
}
}


/// Adds pattern-matching-related methods to [LayerAnchor].
extension LayerAnchorPatterns on LayerAnchor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LayerAnchor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LayerAnchor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LayerAnchor value)  $default,){
final _that = this;
switch (_that) {
case _LayerAnchor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LayerAnchor value)?  $default,){
final _that = this;
switch (_that) {
case _LayerAnchor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ZoneVector position,  ZoneVector normal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LayerAnchor() when $default != null:
return $default(_that.position,_that.normal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ZoneVector position,  ZoneVector normal)  $default,) {final _that = this;
switch (_that) {
case _LayerAnchor():
return $default(_that.position,_that.normal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ZoneVector position,  ZoneVector normal)?  $default,) {final _that = this;
switch (_that) {
case _LayerAnchor() when $default != null:
return $default(_that.position,_that.normal);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LayerAnchor implements LayerAnchor {
  const _LayerAnchor({required this.position, required this.normal});
  factory _LayerAnchor.fromJson(Map<String, dynamic> json) => _$LayerAnchorFromJson(json);

@override final  ZoneVector position;
@override final  ZoneVector normal;

/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LayerAnchorCopyWith<_LayerAnchor> get copyWith => __$LayerAnchorCopyWithImpl<_LayerAnchor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LayerAnchorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LayerAnchor&&(identical(other.position, position) || other.position == position)&&(identical(other.normal, normal) || other.normal == normal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,normal);

@override
String toString() {
  return 'LayerAnchor(position: $position, normal: $normal)';
}


}

/// @nodoc
abstract mixin class _$LayerAnchorCopyWith<$Res> implements $LayerAnchorCopyWith<$Res> {
  factory _$LayerAnchorCopyWith(_LayerAnchor value, $Res Function(_LayerAnchor) _then) = __$LayerAnchorCopyWithImpl;
@override @useResult
$Res call({
 ZoneVector position, ZoneVector normal
});


@override $ZoneVectorCopyWith<$Res> get position;@override $ZoneVectorCopyWith<$Res> get normal;

}
/// @nodoc
class __$LayerAnchorCopyWithImpl<$Res>
    implements _$LayerAnchorCopyWith<$Res> {
  __$LayerAnchorCopyWithImpl(this._self, this._then);

  final _LayerAnchor _self;
  final $Res Function(_LayerAnchor) _then;

/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? normal = null,}) {
  return _then(_LayerAnchor(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as ZoneVector,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as ZoneVector,
  ));
}

/// Create a copy of LayerAnchor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<$Res> get position {
  
  return $ZoneVectorCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of LayerAnchor
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
mixin _$StudioQuote {

 double get unitPrice; int get quantity; List<QuoteBreakdownItem> get breakdown; double get volumeDiscountPercent; double get volumeDiscount; double get rushFee; double get setupFee; double get total; int get leadTimeMinDays; int get leadTimeMaxDays; DateTime? get estimatedDeliveryFrom; DateTime? get estimatedDeliveryTo; List<QualityWarning> get warnings;
/// Create a copy of StudioQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioQuoteCopyWith<StudioQuote> get copyWith => _$StudioQuoteCopyWithImpl<StudioQuote>(this as StudioQuote, _$identity);

  /// Serializes this StudioQuote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioQuote&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.breakdown, breakdown)&&(identical(other.volumeDiscountPercent, volumeDiscountPercent) || other.volumeDiscountPercent == volumeDiscountPercent)&&(identical(other.volumeDiscount, volumeDiscount) || other.volumeDiscount == volumeDiscount)&&(identical(other.rushFee, rushFee) || other.rushFee == rushFee)&&(identical(other.setupFee, setupFee) || other.setupFee == setupFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.leadTimeMinDays, leadTimeMinDays) || other.leadTimeMinDays == leadTimeMinDays)&&(identical(other.leadTimeMaxDays, leadTimeMaxDays) || other.leadTimeMaxDays == leadTimeMaxDays)&&(identical(other.estimatedDeliveryFrom, estimatedDeliveryFrom) || other.estimatedDeliveryFrom == estimatedDeliveryFrom)&&(identical(other.estimatedDeliveryTo, estimatedDeliveryTo) || other.estimatedDeliveryTo == estimatedDeliveryTo)&&const DeepCollectionEquality().equals(other.warnings, warnings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitPrice,quantity,const DeepCollectionEquality().hash(breakdown),volumeDiscountPercent,volumeDiscount,rushFee,setupFee,total,leadTimeMinDays,leadTimeMaxDays,estimatedDeliveryFrom,estimatedDeliveryTo,const DeepCollectionEquality().hash(warnings));

@override
String toString() {
  return 'StudioQuote(unitPrice: $unitPrice, quantity: $quantity, breakdown: $breakdown, volumeDiscountPercent: $volumeDiscountPercent, volumeDiscount: $volumeDiscount, rushFee: $rushFee, setupFee: $setupFee, total: $total, leadTimeMinDays: $leadTimeMinDays, leadTimeMaxDays: $leadTimeMaxDays, estimatedDeliveryFrom: $estimatedDeliveryFrom, estimatedDeliveryTo: $estimatedDeliveryTo, warnings: $warnings)';
}


}

/// @nodoc
abstract mixin class $StudioQuoteCopyWith<$Res>  {
  factory $StudioQuoteCopyWith(StudioQuote value, $Res Function(StudioQuote) _then) = _$StudioQuoteCopyWithImpl;
@useResult
$Res call({
 double unitPrice, int quantity, List<QuoteBreakdownItem> breakdown, double volumeDiscountPercent, double volumeDiscount, double rushFee, double setupFee, double total, int leadTimeMinDays, int leadTimeMaxDays, DateTime? estimatedDeliveryFrom, DateTime? estimatedDeliveryTo, List<QualityWarning> warnings
});




}
/// @nodoc
class _$StudioQuoteCopyWithImpl<$Res>
    implements $StudioQuoteCopyWith<$Res> {
  _$StudioQuoteCopyWithImpl(this._self, this._then);

  final StudioQuote _self;
  final $Res Function(StudioQuote) _then;

/// Create a copy of StudioQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitPrice = null,Object? quantity = null,Object? breakdown = null,Object? volumeDiscountPercent = null,Object? volumeDiscount = null,Object? rushFee = null,Object? setupFee = null,Object? total = null,Object? leadTimeMinDays = null,Object? leadTimeMaxDays = null,Object? estimatedDeliveryFrom = freezed,Object? estimatedDeliveryTo = freezed,Object? warnings = null,}) {
  return _then(_self.copyWith(
unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as List<QuoteBreakdownItem>,volumeDiscountPercent: null == volumeDiscountPercent ? _self.volumeDiscountPercent : volumeDiscountPercent // ignore: cast_nullable_to_non_nullable
as double,volumeDiscount: null == volumeDiscount ? _self.volumeDiscount : volumeDiscount // ignore: cast_nullable_to_non_nullable
as double,rushFee: null == rushFee ? _self.rushFee : rushFee // ignore: cast_nullable_to_non_nullable
as double,setupFee: null == setupFee ? _self.setupFee : setupFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,leadTimeMinDays: null == leadTimeMinDays ? _self.leadTimeMinDays : leadTimeMinDays // ignore: cast_nullable_to_non_nullable
as int,leadTimeMaxDays: null == leadTimeMaxDays ? _self.leadTimeMaxDays : leadTimeMaxDays // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryFrom: freezed == estimatedDeliveryFrom ? _self.estimatedDeliveryFrom : estimatedDeliveryFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDeliveryTo: freezed == estimatedDeliveryTo ? _self.estimatedDeliveryTo : estimatedDeliveryTo // ignore: cast_nullable_to_non_nullable
as DateTime?,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<QualityWarning>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudioQuote].
extension StudioQuotePatterns on StudioQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioQuote value)  $default,){
final _that = this;
switch (_that) {
case _StudioQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioQuote value)?  $default,){
final _that = this;
switch (_that) {
case _StudioQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double unitPrice,  int quantity,  List<QuoteBreakdownItem> breakdown,  double volumeDiscountPercent,  double volumeDiscount,  double rushFee,  double setupFee,  double total,  int leadTimeMinDays,  int leadTimeMaxDays,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<QualityWarning> warnings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioQuote() when $default != null:
return $default(_that.unitPrice,_that.quantity,_that.breakdown,_that.volumeDiscountPercent,_that.volumeDiscount,_that.rushFee,_that.setupFee,_that.total,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.warnings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double unitPrice,  int quantity,  List<QuoteBreakdownItem> breakdown,  double volumeDiscountPercent,  double volumeDiscount,  double rushFee,  double setupFee,  double total,  int leadTimeMinDays,  int leadTimeMaxDays,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<QualityWarning> warnings)  $default,) {final _that = this;
switch (_that) {
case _StudioQuote():
return $default(_that.unitPrice,_that.quantity,_that.breakdown,_that.volumeDiscountPercent,_that.volumeDiscount,_that.rushFee,_that.setupFee,_that.total,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.warnings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double unitPrice,  int quantity,  List<QuoteBreakdownItem> breakdown,  double volumeDiscountPercent,  double volumeDiscount,  double rushFee,  double setupFee,  double total,  int leadTimeMinDays,  int leadTimeMaxDays,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<QualityWarning> warnings)?  $default,) {final _that = this;
switch (_that) {
case _StudioQuote() when $default != null:
return $default(_that.unitPrice,_that.quantity,_that.breakdown,_that.volumeDiscountPercent,_that.volumeDiscount,_that.rushFee,_that.setupFee,_that.total,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.warnings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioQuote extends StudioQuote {
  const _StudioQuote({required this.unitPrice, this.quantity = 1, final  List<QuoteBreakdownItem> breakdown = const <QuoteBreakdownItem>[], this.volumeDiscountPercent = 0, this.volumeDiscount = 0, this.rushFee = 0, this.setupFee = 0, required this.total, this.leadTimeMinDays = 0, this.leadTimeMaxDays = 0, this.estimatedDeliveryFrom, this.estimatedDeliveryTo, final  List<QualityWarning> warnings = const <QualityWarning>[]}): _breakdown = breakdown,_warnings = warnings,super._();
  factory _StudioQuote.fromJson(Map<String, dynamic> json) => _$StudioQuoteFromJson(json);

@override final  double unitPrice;
@override@JsonKey() final  int quantity;
 final  List<QuoteBreakdownItem> _breakdown;
@override@JsonKey() List<QuoteBreakdownItem> get breakdown {
  if (_breakdown is EqualUnmodifiableListView) return _breakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breakdown);
}

@override@JsonKey() final  double volumeDiscountPercent;
@override@JsonKey() final  double volumeDiscount;
@override@JsonKey() final  double rushFee;
@override@JsonKey() final  double setupFee;
@override final  double total;
@override@JsonKey() final  int leadTimeMinDays;
@override@JsonKey() final  int leadTimeMaxDays;
@override final  DateTime? estimatedDeliveryFrom;
@override final  DateTime? estimatedDeliveryTo;
 final  List<QualityWarning> _warnings;
@override@JsonKey() List<QualityWarning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}


/// Create a copy of StudioQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioQuoteCopyWith<_StudioQuote> get copyWith => __$StudioQuoteCopyWithImpl<_StudioQuote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioQuoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioQuote&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._breakdown, _breakdown)&&(identical(other.volumeDiscountPercent, volumeDiscountPercent) || other.volumeDiscountPercent == volumeDiscountPercent)&&(identical(other.volumeDiscount, volumeDiscount) || other.volumeDiscount == volumeDiscount)&&(identical(other.rushFee, rushFee) || other.rushFee == rushFee)&&(identical(other.setupFee, setupFee) || other.setupFee == setupFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.leadTimeMinDays, leadTimeMinDays) || other.leadTimeMinDays == leadTimeMinDays)&&(identical(other.leadTimeMaxDays, leadTimeMaxDays) || other.leadTimeMaxDays == leadTimeMaxDays)&&(identical(other.estimatedDeliveryFrom, estimatedDeliveryFrom) || other.estimatedDeliveryFrom == estimatedDeliveryFrom)&&(identical(other.estimatedDeliveryTo, estimatedDeliveryTo) || other.estimatedDeliveryTo == estimatedDeliveryTo)&&const DeepCollectionEquality().equals(other._warnings, _warnings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitPrice,quantity,const DeepCollectionEquality().hash(_breakdown),volumeDiscountPercent,volumeDiscount,rushFee,setupFee,total,leadTimeMinDays,leadTimeMaxDays,estimatedDeliveryFrom,estimatedDeliveryTo,const DeepCollectionEquality().hash(_warnings));

@override
String toString() {
  return 'StudioQuote(unitPrice: $unitPrice, quantity: $quantity, breakdown: $breakdown, volumeDiscountPercent: $volumeDiscountPercent, volumeDiscount: $volumeDiscount, rushFee: $rushFee, setupFee: $setupFee, total: $total, leadTimeMinDays: $leadTimeMinDays, leadTimeMaxDays: $leadTimeMaxDays, estimatedDeliveryFrom: $estimatedDeliveryFrom, estimatedDeliveryTo: $estimatedDeliveryTo, warnings: $warnings)';
}


}

/// @nodoc
abstract mixin class _$StudioQuoteCopyWith<$Res> implements $StudioQuoteCopyWith<$Res> {
  factory _$StudioQuoteCopyWith(_StudioQuote value, $Res Function(_StudioQuote) _then) = __$StudioQuoteCopyWithImpl;
@override @useResult
$Res call({
 double unitPrice, int quantity, List<QuoteBreakdownItem> breakdown, double volumeDiscountPercent, double volumeDiscount, double rushFee, double setupFee, double total, int leadTimeMinDays, int leadTimeMaxDays, DateTime? estimatedDeliveryFrom, DateTime? estimatedDeliveryTo, List<QualityWarning> warnings
});




}
/// @nodoc
class __$StudioQuoteCopyWithImpl<$Res>
    implements _$StudioQuoteCopyWith<$Res> {
  __$StudioQuoteCopyWithImpl(this._self, this._then);

  final _StudioQuote _self;
  final $Res Function(_StudioQuote) _then;

/// Create a copy of StudioQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitPrice = null,Object? quantity = null,Object? breakdown = null,Object? volumeDiscountPercent = null,Object? volumeDiscount = null,Object? rushFee = null,Object? setupFee = null,Object? total = null,Object? leadTimeMinDays = null,Object? leadTimeMaxDays = null,Object? estimatedDeliveryFrom = freezed,Object? estimatedDeliveryTo = freezed,Object? warnings = null,}) {
  return _then(_StudioQuote(
unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self._breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as List<QuoteBreakdownItem>,volumeDiscountPercent: null == volumeDiscountPercent ? _self.volumeDiscountPercent : volumeDiscountPercent // ignore: cast_nullable_to_non_nullable
as double,volumeDiscount: null == volumeDiscount ? _self.volumeDiscount : volumeDiscount // ignore: cast_nullable_to_non_nullable
as double,rushFee: null == rushFee ? _self.rushFee : rushFee // ignore: cast_nullable_to_non_nullable
as double,setupFee: null == setupFee ? _self.setupFee : setupFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,leadTimeMinDays: null == leadTimeMinDays ? _self.leadTimeMinDays : leadTimeMinDays // ignore: cast_nullable_to_non_nullable
as int,leadTimeMaxDays: null == leadTimeMaxDays ? _self.leadTimeMaxDays : leadTimeMaxDays // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryFrom: freezed == estimatedDeliveryFrom ? _self.estimatedDeliveryFrom : estimatedDeliveryFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDeliveryTo: freezed == estimatedDeliveryTo ? _self.estimatedDeliveryTo : estimatedDeliveryTo // ignore: cast_nullable_to_non_nullable
as DateTime?,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<QualityWarning>,
  ));
}


}


/// @nodoc
mixin _$QuoteBreakdownItem {

 String get kind; String get code; String get label; String? get detail; double get unitAmount;
/// Create a copy of QuoteBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteBreakdownItemCopyWith<QuoteBreakdownItem> get copyWith => _$QuoteBreakdownItemCopyWithImpl<QuoteBreakdownItem>(this as QuoteBreakdownItem, _$identity);

  /// Serializes this QuoteBreakdownItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteBreakdownItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,label,detail,unitAmount);

@override
String toString() {
  return 'QuoteBreakdownItem(kind: $kind, code: $code, label: $label, detail: $detail, unitAmount: $unitAmount)';
}


}

/// @nodoc
abstract mixin class $QuoteBreakdownItemCopyWith<$Res>  {
  factory $QuoteBreakdownItemCopyWith(QuoteBreakdownItem value, $Res Function(QuoteBreakdownItem) _then) = _$QuoteBreakdownItemCopyWithImpl;
@useResult
$Res call({
 String kind, String code, String label, String? detail, double unitAmount
});




}
/// @nodoc
class _$QuoteBreakdownItemCopyWithImpl<$Res>
    implements $QuoteBreakdownItemCopyWith<$Res> {
  _$QuoteBreakdownItemCopyWithImpl(this._self, this._then);

  final QuoteBreakdownItem _self;
  final $Res Function(QuoteBreakdownItem) _then;

/// Create a copy of QuoteBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? code = null,Object? label = null,Object? detail = freezed,Object? unitAmount = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,unitAmount: null == unitAmount ? _self.unitAmount : unitAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteBreakdownItem].
extension QuoteBreakdownItemPatterns on QuoteBreakdownItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteBreakdownItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteBreakdownItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteBreakdownItem value)  $default,){
final _that = this;
switch (_that) {
case _QuoteBreakdownItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteBreakdownItem value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteBreakdownItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String code,  String label,  String? detail,  double unitAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteBreakdownItem() when $default != null:
return $default(_that.kind,_that.code,_that.label,_that.detail,_that.unitAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String code,  String label,  String? detail,  double unitAmount)  $default,) {final _that = this;
switch (_that) {
case _QuoteBreakdownItem():
return $default(_that.kind,_that.code,_that.label,_that.detail,_that.unitAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String code,  String label,  String? detail,  double unitAmount)?  $default,) {final _that = this;
switch (_that) {
case _QuoteBreakdownItem() when $default != null:
return $default(_that.kind,_that.code,_that.label,_that.detail,_that.unitAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteBreakdownItem implements QuoteBreakdownItem {
  const _QuoteBreakdownItem({required this.kind, required this.code, required this.label, this.detail, required this.unitAmount});
  factory _QuoteBreakdownItem.fromJson(Map<String, dynamic> json) => _$QuoteBreakdownItemFromJson(json);

@override final  String kind;
@override final  String code;
@override final  String label;
@override final  String? detail;
@override final  double unitAmount;

/// Create a copy of QuoteBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteBreakdownItemCopyWith<_QuoteBreakdownItem> get copyWith => __$QuoteBreakdownItemCopyWithImpl<_QuoteBreakdownItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteBreakdownItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteBreakdownItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,label,detail,unitAmount);

@override
String toString() {
  return 'QuoteBreakdownItem(kind: $kind, code: $code, label: $label, detail: $detail, unitAmount: $unitAmount)';
}


}

/// @nodoc
abstract mixin class _$QuoteBreakdownItemCopyWith<$Res> implements $QuoteBreakdownItemCopyWith<$Res> {
  factory _$QuoteBreakdownItemCopyWith(_QuoteBreakdownItem value, $Res Function(_QuoteBreakdownItem) _then) = __$QuoteBreakdownItemCopyWithImpl;
@override @useResult
$Res call({
 String kind, String code, String label, String? detail, double unitAmount
});




}
/// @nodoc
class __$QuoteBreakdownItemCopyWithImpl<$Res>
    implements _$QuoteBreakdownItemCopyWith<$Res> {
  __$QuoteBreakdownItemCopyWithImpl(this._self, this._then);

  final _QuoteBreakdownItem _self;
  final $Res Function(_QuoteBreakdownItem) _then;

/// Create a copy of QuoteBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? code = null,Object? label = null,Object? detail = freezed,Object? unitAmount = null,}) {
  return _then(_QuoteBreakdownItem(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,unitAmount: null == unitAmount ? _self.unitAmount : unitAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$QualityWarning {

 String get layerId; int get effectiveDpi; String get level;
/// Create a copy of QualityWarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QualityWarningCopyWith<QualityWarning> get copyWith => _$QualityWarningCopyWithImpl<QualityWarning>(this as QualityWarning, _$identity);

  /// Serializes this QualityWarning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QualityWarning&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.effectiveDpi, effectiveDpi) || other.effectiveDpi == effectiveDpi)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,layerId,effectiveDpi,level);

@override
String toString() {
  return 'QualityWarning(layerId: $layerId, effectiveDpi: $effectiveDpi, level: $level)';
}


}

/// @nodoc
abstract mixin class $QualityWarningCopyWith<$Res>  {
  factory $QualityWarningCopyWith(QualityWarning value, $Res Function(QualityWarning) _then) = _$QualityWarningCopyWithImpl;
@useResult
$Res call({
 String layerId, int effectiveDpi, String level
});




}
/// @nodoc
class _$QualityWarningCopyWithImpl<$Res>
    implements $QualityWarningCopyWith<$Res> {
  _$QualityWarningCopyWithImpl(this._self, this._then);

  final QualityWarning _self;
  final $Res Function(QualityWarning) _then;

/// Create a copy of QualityWarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? layerId = null,Object? effectiveDpi = null,Object? level = null,}) {
  return _then(_self.copyWith(
layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,effectiveDpi: null == effectiveDpi ? _self.effectiveDpi : effectiveDpi // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QualityWarning].
extension QualityWarningPatterns on QualityWarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QualityWarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QualityWarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QualityWarning value)  $default,){
final _that = this;
switch (_that) {
case _QualityWarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QualityWarning value)?  $default,){
final _that = this;
switch (_that) {
case _QualityWarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String layerId,  int effectiveDpi,  String level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QualityWarning() when $default != null:
return $default(_that.layerId,_that.effectiveDpi,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String layerId,  int effectiveDpi,  String level)  $default,) {final _that = this;
switch (_that) {
case _QualityWarning():
return $default(_that.layerId,_that.effectiveDpi,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String layerId,  int effectiveDpi,  String level)?  $default,) {final _that = this;
switch (_that) {
case _QualityWarning() when $default != null:
return $default(_that.layerId,_that.effectiveDpi,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QualityWarning extends QualityWarning {
  const _QualityWarning({required this.layerId, required this.effectiveDpi, this.level = 'ok'}): super._();
  factory _QualityWarning.fromJson(Map<String, dynamic> json) => _$QualityWarningFromJson(json);

@override final  String layerId;
@override final  int effectiveDpi;
@override@JsonKey() final  String level;

/// Create a copy of QualityWarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QualityWarningCopyWith<_QualityWarning> get copyWith => __$QualityWarningCopyWithImpl<_QualityWarning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QualityWarningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QualityWarning&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.effectiveDpi, effectiveDpi) || other.effectiveDpi == effectiveDpi)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,layerId,effectiveDpi,level);

@override
String toString() {
  return 'QualityWarning(layerId: $layerId, effectiveDpi: $effectiveDpi, level: $level)';
}


}

/// @nodoc
abstract mixin class _$QualityWarningCopyWith<$Res> implements $QualityWarningCopyWith<$Res> {
  factory _$QualityWarningCopyWith(_QualityWarning value, $Res Function(_QualityWarning) _then) = __$QualityWarningCopyWithImpl;
@override @useResult
$Res call({
 String layerId, int effectiveDpi, String level
});




}
/// @nodoc
class __$QualityWarningCopyWithImpl<$Res>
    implements _$QualityWarningCopyWith<$Res> {
  __$QualityWarningCopyWithImpl(this._self, this._then);

  final _QualityWarning _self;
  final $Res Function(_QualityWarning) _then;

/// Create a copy of QualityWarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? layerId = null,Object? effectiveDpi = null,Object? level = null,}) {
  return _then(_QualityWarning(
layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,effectiveDpi: null == effectiveDpi ? _self.effectiveDpi : effectiveDpi // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DesignUpload {

 String get id; String get url; String get contentType; int? get widthPx; int? get heightPx; bool get isVector; int? get maxPrintWidthCmAtRecommendedDpi;
/// Create a copy of DesignUpload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignUploadCopyWith<DesignUpload> get copyWith => _$DesignUploadCopyWithImpl<DesignUpload>(this as DesignUpload, _$identity);

  /// Serializes this DesignUpload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignUpload&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.widthPx, widthPx) || other.widthPx == widthPx)&&(identical(other.heightPx, heightPx) || other.heightPx == heightPx)&&(identical(other.isVector, isVector) || other.isVector == isVector)&&(identical(other.maxPrintWidthCmAtRecommendedDpi, maxPrintWidthCmAtRecommendedDpi) || other.maxPrintWidthCmAtRecommendedDpi == maxPrintWidthCmAtRecommendedDpi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,contentType,widthPx,heightPx,isVector,maxPrintWidthCmAtRecommendedDpi);

@override
String toString() {
  return 'DesignUpload(id: $id, url: $url, contentType: $contentType, widthPx: $widthPx, heightPx: $heightPx, isVector: $isVector, maxPrintWidthCmAtRecommendedDpi: $maxPrintWidthCmAtRecommendedDpi)';
}


}

/// @nodoc
abstract mixin class $DesignUploadCopyWith<$Res>  {
  factory $DesignUploadCopyWith(DesignUpload value, $Res Function(DesignUpload) _then) = _$DesignUploadCopyWithImpl;
@useResult
$Res call({
 String id, String url, String contentType, int? widthPx, int? heightPx, bool isVector, int? maxPrintWidthCmAtRecommendedDpi
});




}
/// @nodoc
class _$DesignUploadCopyWithImpl<$Res>
    implements $DesignUploadCopyWith<$Res> {
  _$DesignUploadCopyWithImpl(this._self, this._then);

  final DesignUpload _self;
  final $Res Function(DesignUpload) _then;

/// Create a copy of DesignUpload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? contentType = null,Object? widthPx = freezed,Object? heightPx = freezed,Object? isVector = null,Object? maxPrintWidthCmAtRecommendedDpi = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,widthPx: freezed == widthPx ? _self.widthPx : widthPx // ignore: cast_nullable_to_non_nullable
as int?,heightPx: freezed == heightPx ? _self.heightPx : heightPx // ignore: cast_nullable_to_non_nullable
as int?,isVector: null == isVector ? _self.isVector : isVector // ignore: cast_nullable_to_non_nullable
as bool,maxPrintWidthCmAtRecommendedDpi: freezed == maxPrintWidthCmAtRecommendedDpi ? _self.maxPrintWidthCmAtRecommendedDpi : maxPrintWidthCmAtRecommendedDpi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignUpload].
extension DesignUploadPatterns on DesignUpload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignUpload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignUpload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignUpload value)  $default,){
final _that = this;
switch (_that) {
case _DesignUpload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignUpload value)?  $default,){
final _that = this;
switch (_that) {
case _DesignUpload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String contentType,  int? widthPx,  int? heightPx,  bool isVector,  int? maxPrintWidthCmAtRecommendedDpi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignUpload() when $default != null:
return $default(_that.id,_that.url,_that.contentType,_that.widthPx,_that.heightPx,_that.isVector,_that.maxPrintWidthCmAtRecommendedDpi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String contentType,  int? widthPx,  int? heightPx,  bool isVector,  int? maxPrintWidthCmAtRecommendedDpi)  $default,) {final _that = this;
switch (_that) {
case _DesignUpload():
return $default(_that.id,_that.url,_that.contentType,_that.widthPx,_that.heightPx,_that.isVector,_that.maxPrintWidthCmAtRecommendedDpi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String contentType,  int? widthPx,  int? heightPx,  bool isVector,  int? maxPrintWidthCmAtRecommendedDpi)?  $default,) {final _that = this;
switch (_that) {
case _DesignUpload() when $default != null:
return $default(_that.id,_that.url,_that.contentType,_that.widthPx,_that.heightPx,_that.isVector,_that.maxPrintWidthCmAtRecommendedDpi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignUpload implements DesignUpload {
  const _DesignUpload({required this.id, required this.url, this.contentType = '', this.widthPx, this.heightPx, this.isVector = false, this.maxPrintWidthCmAtRecommendedDpi});
  factory _DesignUpload.fromJson(Map<String, dynamic> json) => _$DesignUploadFromJson(json);

@override final  String id;
@override final  String url;
@override@JsonKey() final  String contentType;
@override final  int? widthPx;
@override final  int? heightPx;
@override@JsonKey() final  bool isVector;
@override final  int? maxPrintWidthCmAtRecommendedDpi;

/// Create a copy of DesignUpload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignUploadCopyWith<_DesignUpload> get copyWith => __$DesignUploadCopyWithImpl<_DesignUpload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignUploadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignUpload&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.widthPx, widthPx) || other.widthPx == widthPx)&&(identical(other.heightPx, heightPx) || other.heightPx == heightPx)&&(identical(other.isVector, isVector) || other.isVector == isVector)&&(identical(other.maxPrintWidthCmAtRecommendedDpi, maxPrintWidthCmAtRecommendedDpi) || other.maxPrintWidthCmAtRecommendedDpi == maxPrintWidthCmAtRecommendedDpi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,contentType,widthPx,heightPx,isVector,maxPrintWidthCmAtRecommendedDpi);

@override
String toString() {
  return 'DesignUpload(id: $id, url: $url, contentType: $contentType, widthPx: $widthPx, heightPx: $heightPx, isVector: $isVector, maxPrintWidthCmAtRecommendedDpi: $maxPrintWidthCmAtRecommendedDpi)';
}


}

/// @nodoc
abstract mixin class _$DesignUploadCopyWith<$Res> implements $DesignUploadCopyWith<$Res> {
  factory _$DesignUploadCopyWith(_DesignUpload value, $Res Function(_DesignUpload) _then) = __$DesignUploadCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String contentType, int? widthPx, int? heightPx, bool isVector, int? maxPrintWidthCmAtRecommendedDpi
});




}
/// @nodoc
class __$DesignUploadCopyWithImpl<$Res>
    implements _$DesignUploadCopyWith<$Res> {
  __$DesignUploadCopyWithImpl(this._self, this._then);

  final _DesignUpload _self;
  final $Res Function(_DesignUpload) _then;

/// Create a copy of DesignUpload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? contentType = null,Object? widthPx = freezed,Object? heightPx = freezed,Object? isVector = null,Object? maxPrintWidthCmAtRecommendedDpi = freezed,}) {
  return _then(_DesignUpload(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,widthPx: freezed == widthPx ? _self.widthPx : widthPx // ignore: cast_nullable_to_non_nullable
as int?,heightPx: freezed == heightPx ? _self.heightPx : heightPx // ignore: cast_nullable_to_non_nullable
as int?,isVector: null == isVector ? _self.isVector : isVector // ignore: cast_nullable_to_non_nullable
as bool,maxPrintWidthCmAtRecommendedDpi: freezed == maxPrintWidthCmAtRecommendedDpi ? _self.maxPrintWidthCmAtRecommendedDpi : maxPrintWidthCmAtRecommendedDpi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$StudioDesign {

 String get id; String get name;@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus get status; bool get editable; DesignSpec get spec; List<DesignLayer> get layers; String get pricingVersionId; StudioQuote? get quote; String? get quoteErrorCode; List<String> get mockupUrls; String? get shareUrl; String? get changeRequestMessage; bool get imageRightsConfirmed; DateTime? get submittedAt; DateTime? get approvedAt; DateTime? get createdAt; DateTime? get updatedAt; List<DesignUpload> get uploads;
/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioDesignCopyWith<StudioDesign> get copyWith => _$StudioDesignCopyWithImpl<StudioDesign>(this as StudioDesign, _$identity);

  /// Serializes this StudioDesign to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioDesign&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.editable, editable) || other.editable == editable)&&(identical(other.spec, spec) || other.spec == spec)&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.pricingVersionId, pricingVersionId) || other.pricingVersionId == pricingVersionId)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.quoteErrorCode, quoteErrorCode) || other.quoteErrorCode == quoteErrorCode)&&const DeepCollectionEquality().equals(other.mockupUrls, mockupUrls)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.changeRequestMessage, changeRequestMessage) || other.changeRequestMessage == changeRequestMessage)&&(identical(other.imageRightsConfirmed, imageRightsConfirmed) || other.imageRightsConfirmed == imageRightsConfirmed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.uploads, uploads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,editable,spec,const DeepCollectionEquality().hash(layers),pricingVersionId,quote,quoteErrorCode,const DeepCollectionEquality().hash(mockupUrls),shareUrl,changeRequestMessage,imageRightsConfirmed,submittedAt,approvedAt,createdAt,updatedAt,const DeepCollectionEquality().hash(uploads));

@override
String toString() {
  return 'StudioDesign(id: $id, name: $name, status: $status, editable: $editable, spec: $spec, layers: $layers, pricingVersionId: $pricingVersionId, quote: $quote, quoteErrorCode: $quoteErrorCode, mockupUrls: $mockupUrls, shareUrl: $shareUrl, changeRequestMessage: $changeRequestMessage, imageRightsConfirmed: $imageRightsConfirmed, submittedAt: $submittedAt, approvedAt: $approvedAt, createdAt: $createdAt, updatedAt: $updatedAt, uploads: $uploads)';
}


}

/// @nodoc
abstract mixin class $StudioDesignCopyWith<$Res>  {
  factory $StudioDesignCopyWith(StudioDesign value, $Res Function(StudioDesign) _then) = _$StudioDesignCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus status, bool editable, DesignSpec spec, List<DesignLayer> layers, String pricingVersionId, StudioQuote? quote, String? quoteErrorCode, List<String> mockupUrls, String? shareUrl, String? changeRequestMessage, bool imageRightsConfirmed, DateTime? submittedAt, DateTime? approvedAt, DateTime? createdAt, DateTime? updatedAt, List<DesignUpload> uploads
});


$DesignSpecCopyWith<$Res> get spec;$StudioQuoteCopyWith<$Res>? get quote;

}
/// @nodoc
class _$StudioDesignCopyWithImpl<$Res>
    implements $StudioDesignCopyWith<$Res> {
  _$StudioDesignCopyWithImpl(this._self, this._then);

  final StudioDesign _self;
  final $Res Function(StudioDesign) _then;

/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? editable = null,Object? spec = null,Object? layers = null,Object? pricingVersionId = null,Object? quote = freezed,Object? quoteErrorCode = freezed,Object? mockupUrls = null,Object? shareUrl = freezed,Object? changeRequestMessage = freezed,Object? imageRightsConfirmed = null,Object? submittedAt = freezed,Object? approvedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? uploads = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DesignStatus,editable: null == editable ? _self.editable : editable // ignore: cast_nullable_to_non_nullable
as bool,spec: null == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as DesignSpec,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<DesignLayer>,pricingVersionId: null == pricingVersionId ? _self.pricingVersionId : pricingVersionId // ignore: cast_nullable_to_non_nullable
as String,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as StudioQuote?,quoteErrorCode: freezed == quoteErrorCode ? _self.quoteErrorCode : quoteErrorCode // ignore: cast_nullable_to_non_nullable
as String?,mockupUrls: null == mockupUrls ? _self.mockupUrls : mockupUrls // ignore: cast_nullable_to_non_nullable
as List<String>,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,changeRequestMessage: freezed == changeRequestMessage ? _self.changeRequestMessage : changeRequestMessage // ignore: cast_nullable_to_non_nullable
as String?,imageRightsConfirmed: null == imageRightsConfirmed ? _self.imageRightsConfirmed : imageRightsConfirmed // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uploads: null == uploads ? _self.uploads : uploads // ignore: cast_nullable_to_non_nullable
as List<DesignUpload>,
  ));
}
/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignSpecCopyWith<$Res> get spec {
  
  return $DesignSpecCopyWith<$Res>(_self.spec, (value) {
    return _then(_self.copyWith(spec: value));
  });
}/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $StudioQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudioDesign].
extension StudioDesignPatterns on StudioDesign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioDesign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioDesign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioDesign value)  $default,){
final _that = this;
switch (_that) {
case _StudioDesign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioDesign value)?  $default,){
final _that = this;
switch (_that) {
case _StudioDesign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  bool editable,  DesignSpec spec,  List<DesignLayer> layers,  String pricingVersionId,  StudioQuote? quote,  String? quoteErrorCode,  List<String> mockupUrls,  String? shareUrl,  String? changeRequestMessage,  bool imageRightsConfirmed,  DateTime? submittedAt,  DateTime? approvedAt,  DateTime? createdAt,  DateTime? updatedAt,  List<DesignUpload> uploads)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudioDesign() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.editable,_that.spec,_that.layers,_that.pricingVersionId,_that.quote,_that.quoteErrorCode,_that.mockupUrls,_that.shareUrl,_that.changeRequestMessage,_that.imageRightsConfirmed,_that.submittedAt,_that.approvedAt,_that.createdAt,_that.updatedAt,_that.uploads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  bool editable,  DesignSpec spec,  List<DesignLayer> layers,  String pricingVersionId,  StudioQuote? quote,  String? quoteErrorCode,  List<String> mockupUrls,  String? shareUrl,  String? changeRequestMessage,  bool imageRightsConfirmed,  DateTime? submittedAt,  DateTime? approvedAt,  DateTime? createdAt,  DateTime? updatedAt,  List<DesignUpload> uploads)  $default,) {final _that = this;
switch (_that) {
case _StudioDesign():
return $default(_that.id,_that.name,_that.status,_that.editable,_that.spec,_that.layers,_that.pricingVersionId,_that.quote,_that.quoteErrorCode,_that.mockupUrls,_that.shareUrl,_that.changeRequestMessage,_that.imageRightsConfirmed,_that.submittedAt,_that.approvedAt,_that.createdAt,_that.updatedAt,_that.uploads);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  bool editable,  DesignSpec spec,  List<DesignLayer> layers,  String pricingVersionId,  StudioQuote? quote,  String? quoteErrorCode,  List<String> mockupUrls,  String? shareUrl,  String? changeRequestMessage,  bool imageRightsConfirmed,  DateTime? submittedAt,  DateTime? approvedAt,  DateTime? createdAt,  DateTime? updatedAt,  List<DesignUpload> uploads)?  $default,) {final _that = this;
switch (_that) {
case _StudioDesign() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.editable,_that.spec,_that.layers,_that.pricingVersionId,_that.quote,_that.quoteErrorCode,_that.mockupUrls,_that.shareUrl,_that.changeRequestMessage,_that.imageRightsConfirmed,_that.submittedAt,_that.approvedAt,_that.createdAt,_that.updatedAt,_that.uploads);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioDesign extends StudioDesign {
  const _StudioDesign({required this.id, this.name = '', @JsonKey(unknownEnumValue: DesignStatus.unknown) this.status = DesignStatus.draft, this.editable = true, required this.spec, final  List<DesignLayer> layers = const <DesignLayer>[], required this.pricingVersionId, this.quote, this.quoteErrorCode, final  List<String> mockupUrls = const <String>[], this.shareUrl, this.changeRequestMessage, this.imageRightsConfirmed = false, this.submittedAt, this.approvedAt, this.createdAt, this.updatedAt, final  List<DesignUpload> uploads = const <DesignUpload>[]}): _layers = layers,_mockupUrls = mockupUrls,_uploads = uploads,super._();
  factory _StudioDesign.fromJson(Map<String, dynamic> json) => _$StudioDesignFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey(unknownEnumValue: DesignStatus.unknown) final  DesignStatus status;
@override@JsonKey() final  bool editable;
@override final  DesignSpec spec;
 final  List<DesignLayer> _layers;
@override@JsonKey() List<DesignLayer> get layers {
  if (_layers is EqualUnmodifiableListView) return _layers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_layers);
}

@override final  String pricingVersionId;
@override final  StudioQuote? quote;
@override final  String? quoteErrorCode;
 final  List<String> _mockupUrls;
@override@JsonKey() List<String> get mockupUrls {
  if (_mockupUrls is EqualUnmodifiableListView) return _mockupUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mockupUrls);
}

@override final  String? shareUrl;
@override final  String? changeRequestMessage;
@override@JsonKey() final  bool imageRightsConfirmed;
@override final  DateTime? submittedAt;
@override final  DateTime? approvedAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  List<DesignUpload> _uploads;
@override@JsonKey() List<DesignUpload> get uploads {
  if (_uploads is EqualUnmodifiableListView) return _uploads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uploads);
}


/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioDesignCopyWith<_StudioDesign> get copyWith => __$StudioDesignCopyWithImpl<_StudioDesign>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioDesignToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioDesign&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.editable, editable) || other.editable == editable)&&(identical(other.spec, spec) || other.spec == spec)&&const DeepCollectionEquality().equals(other._layers, _layers)&&(identical(other.pricingVersionId, pricingVersionId) || other.pricingVersionId == pricingVersionId)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.quoteErrorCode, quoteErrorCode) || other.quoteErrorCode == quoteErrorCode)&&const DeepCollectionEquality().equals(other._mockupUrls, _mockupUrls)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.changeRequestMessage, changeRequestMessage) || other.changeRequestMessage == changeRequestMessage)&&(identical(other.imageRightsConfirmed, imageRightsConfirmed) || other.imageRightsConfirmed == imageRightsConfirmed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._uploads, _uploads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,editable,spec,const DeepCollectionEquality().hash(_layers),pricingVersionId,quote,quoteErrorCode,const DeepCollectionEquality().hash(_mockupUrls),shareUrl,changeRequestMessage,imageRightsConfirmed,submittedAt,approvedAt,createdAt,updatedAt,const DeepCollectionEquality().hash(_uploads));

@override
String toString() {
  return 'StudioDesign(id: $id, name: $name, status: $status, editable: $editable, spec: $spec, layers: $layers, pricingVersionId: $pricingVersionId, quote: $quote, quoteErrorCode: $quoteErrorCode, mockupUrls: $mockupUrls, shareUrl: $shareUrl, changeRequestMessage: $changeRequestMessage, imageRightsConfirmed: $imageRightsConfirmed, submittedAt: $submittedAt, approvedAt: $approvedAt, createdAt: $createdAt, updatedAt: $updatedAt, uploads: $uploads)';
}


}

/// @nodoc
abstract mixin class _$StudioDesignCopyWith<$Res> implements $StudioDesignCopyWith<$Res> {
  factory _$StudioDesignCopyWith(_StudioDesign value, $Res Function(_StudioDesign) _then) = __$StudioDesignCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus status, bool editable, DesignSpec spec, List<DesignLayer> layers, String pricingVersionId, StudioQuote? quote, String? quoteErrorCode, List<String> mockupUrls, String? shareUrl, String? changeRequestMessage, bool imageRightsConfirmed, DateTime? submittedAt, DateTime? approvedAt, DateTime? createdAt, DateTime? updatedAt, List<DesignUpload> uploads
});


@override $DesignSpecCopyWith<$Res> get spec;@override $StudioQuoteCopyWith<$Res>? get quote;

}
/// @nodoc
class __$StudioDesignCopyWithImpl<$Res>
    implements _$StudioDesignCopyWith<$Res> {
  __$StudioDesignCopyWithImpl(this._self, this._then);

  final _StudioDesign _self;
  final $Res Function(_StudioDesign) _then;

/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? editable = null,Object? spec = null,Object? layers = null,Object? pricingVersionId = null,Object? quote = freezed,Object? quoteErrorCode = freezed,Object? mockupUrls = null,Object? shareUrl = freezed,Object? changeRequestMessage = freezed,Object? imageRightsConfirmed = null,Object? submittedAt = freezed,Object? approvedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? uploads = null,}) {
  return _then(_StudioDesign(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DesignStatus,editable: null == editable ? _self.editable : editable // ignore: cast_nullable_to_non_nullable
as bool,spec: null == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as DesignSpec,layers: null == layers ? _self._layers : layers // ignore: cast_nullable_to_non_nullable
as List<DesignLayer>,pricingVersionId: null == pricingVersionId ? _self.pricingVersionId : pricingVersionId // ignore: cast_nullable_to_non_nullable
as String,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as StudioQuote?,quoteErrorCode: freezed == quoteErrorCode ? _self.quoteErrorCode : quoteErrorCode // ignore: cast_nullable_to_non_nullable
as String?,mockupUrls: null == mockupUrls ? _self._mockupUrls : mockupUrls // ignore: cast_nullable_to_non_nullable
as List<String>,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,changeRequestMessage: freezed == changeRequestMessage ? _self.changeRequestMessage : changeRequestMessage // ignore: cast_nullable_to_non_nullable
as String?,imageRightsConfirmed: null == imageRightsConfirmed ? _self.imageRightsConfirmed : imageRightsConfirmed // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uploads: null == uploads ? _self._uploads : uploads // ignore: cast_nullable_to_non_nullable
as List<DesignUpload>,
  ));
}

/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignSpecCopyWith<$Res> get spec {
  
  return $DesignSpecCopyWith<$Res>(_self.spec, (value) {
    return _then(_self.copyWith(spec: value));
  });
}/// Create a copy of StudioDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudioQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $StudioQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// @nodoc
mixin _$DesignListItem {

 String get id; String get name;@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus get status; String? get mockupUrl; double? get total; DateTime? get updatedAt;
/// Create a copy of DesignListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignListItemCopyWith<DesignListItem> get copyWith => _$DesignListItemCopyWithImpl<DesignListItem>(this as DesignListItem, _$identity);

  /// Serializes this DesignListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.mockupUrl, mockupUrl) || other.mockupUrl == mockupUrl)&&(identical(other.total, total) || other.total == total)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,mockupUrl,total,updatedAt);

@override
String toString() {
  return 'DesignListItem(id: $id, name: $name, status: $status, mockupUrl: $mockupUrl, total: $total, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DesignListItemCopyWith<$Res>  {
  factory $DesignListItemCopyWith(DesignListItem value, $Res Function(DesignListItem) _then) = _$DesignListItemCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus status, String? mockupUrl, double? total, DateTime? updatedAt
});




}
/// @nodoc
class _$DesignListItemCopyWithImpl<$Res>
    implements $DesignListItemCopyWith<$Res> {
  _$DesignListItemCopyWithImpl(this._self, this._then);

  final DesignListItem _self;
  final $Res Function(DesignListItem) _then;

/// Create a copy of DesignListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? mockupUrl = freezed,Object? total = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DesignStatus,mockupUrl: freezed == mockupUrl ? _self.mockupUrl : mockupUrl // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignListItem].
extension DesignListItemPatterns on DesignListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignListItem value)  $default,){
final _that = this;
switch (_that) {
case _DesignListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignListItem value)?  $default,){
final _that = this;
switch (_that) {
case _DesignListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  String? mockupUrl,  double? total,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignListItem() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.mockupUrl,_that.total,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  String? mockupUrl,  double? total,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DesignListItem():
return $default(_that.id,_that.name,_that.status,_that.mockupUrl,_that.total,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  String? mockupUrl,  double? total,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DesignListItem() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.mockupUrl,_that.total,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignListItem extends DesignListItem {
  const _DesignListItem({required this.id, this.name = '', @JsonKey(unknownEnumValue: DesignStatus.unknown) this.status = DesignStatus.draft, this.mockupUrl, this.total, this.updatedAt}): super._();
  factory _DesignListItem.fromJson(Map<String, dynamic> json) => _$DesignListItemFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey(unknownEnumValue: DesignStatus.unknown) final  DesignStatus status;
@override final  String? mockupUrl;
@override final  double? total;
@override final  DateTime? updatedAt;

/// Create a copy of DesignListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignListItemCopyWith<_DesignListItem> get copyWith => __$DesignListItemCopyWithImpl<_DesignListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.mockupUrl, mockupUrl) || other.mockupUrl == mockupUrl)&&(identical(other.total, total) || other.total == total)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,mockupUrl,total,updatedAt);

@override
String toString() {
  return 'DesignListItem(id: $id, name: $name, status: $status, mockupUrl: $mockupUrl, total: $total, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DesignListItemCopyWith<$Res> implements $DesignListItemCopyWith<$Res> {
  factory _$DesignListItemCopyWith(_DesignListItem value, $Res Function(_DesignListItem) _then) = __$DesignListItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus status, String? mockupUrl, double? total, DateTime? updatedAt
});




}
/// @nodoc
class __$DesignListItemCopyWithImpl<$Res>
    implements _$DesignListItemCopyWith<$Res> {
  __$DesignListItemCopyWithImpl(this._self, this._then);

  final _DesignListItem _self;
  final $Res Function(_DesignListItem) _then;

/// Create a copy of DesignListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? mockupUrl = freezed,Object? total = freezed,Object? updatedAt = freezed,}) {
  return _then(_DesignListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DesignStatus,mockupUrl: freezed == mockupUrl ? _self.mockupUrl : mockupUrl // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
