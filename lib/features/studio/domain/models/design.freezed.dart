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

@JsonSerializable(includeIfNull: false)
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
  const _DesignSpec({required this.baseCode, @JsonKey(unknownEnumValue: Fit.unknown) this.fit = Fit.regular, final  List<String> featureCodes = const <String>[], required this.fabricCode, required this.colorId, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.customMeasurements, this.quantity = 1, this.rush = false}): _featureCodes = featureCodes;
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
mixin _$ZoneVector {

 double get x; double get y; double get z;
/// Create a copy of ZoneVector
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneVectorCopyWith<ZoneVector> get copyWith => _$ZoneVectorCopyWithImpl<ZoneVector>(this as ZoneVector, _$identity);

  /// Serializes this ZoneVector to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneVector&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z);

@override
String toString() {
  return 'ZoneVector(x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class $ZoneVectorCopyWith<$Res>  {
  factory $ZoneVectorCopyWith(ZoneVector value, $Res Function(ZoneVector) _then) = _$ZoneVectorCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class _$ZoneVectorCopyWithImpl<$Res>
    implements $ZoneVectorCopyWith<$Res> {
  _$ZoneVectorCopyWithImpl(this._self, this._then);

  final ZoneVector _self;
  final $Res Function(ZoneVector) _then;

/// Create a copy of ZoneVector
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneVector].
extension ZoneVectorPatterns on ZoneVector {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneVector value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneVector() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneVector value)  $default,){
final _that = this;
switch (_that) {
case _ZoneVector():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneVector value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneVector() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  double z)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneVector() when $default != null:
return $default(_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  double z)  $default,) {final _that = this;
switch (_that) {
case _ZoneVector():
return $default(_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  double z)?  $default,) {final _that = this;
switch (_that) {
case _ZoneVector() when $default != null:
return $default(_that.x,_that.y,_that.z);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneVector implements ZoneVector {
  const _ZoneVector({this.x = 0, this.y = 0, this.z = 0});
  factory _ZoneVector.fromJson(Map<String, dynamic> json) => _$ZoneVectorFromJson(json);

@override@JsonKey() final  double x;
@override@JsonKey() final  double y;
@override@JsonKey() final  double z;

/// Create a copy of ZoneVector
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneVectorCopyWith<_ZoneVector> get copyWith => __$ZoneVectorCopyWithImpl<_ZoneVector>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneVectorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneVector&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z);

@override
String toString() {
  return 'ZoneVector(x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class _$ZoneVectorCopyWith<$Res> implements $ZoneVectorCopyWith<$Res> {
  factory _$ZoneVectorCopyWith(_ZoneVector value, $Res Function(_ZoneVector) _then) = __$ZoneVectorCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class __$ZoneVectorCopyWithImpl<$Res>
    implements _$ZoneVectorCopyWith<$Res> {
  __$ZoneVectorCopyWithImpl(this._self, this._then);

  final _ZoneVector _self;
  final $Res Function(_ZoneVector) _then;

/// Create a copy of ZoneVector
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_ZoneVector(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
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
class _DesignLayer extends DesignLayer {
  const _DesignLayer({required this.id, required this.kind, required this.placement, this.zIndex = 0, required this.printMethodCode, required this.widthCm, required this.heightCm, this.xCm = 0, this.yCm = 0, this.rotation = 0, this.text, this.font, this.fontSizePt, this.align, this.curve, this.colorHex, this.uploadId, this.graphicId, this.anchor}): super._();
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
mixin _$DesignDoc {

 String get name; DesignSpec get spec; List<DesignLayer> get layers;
/// Create a copy of DesignDoc
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignDocCopyWith<DesignDoc> get copyWith => _$DesignDocCopyWithImpl<DesignDoc>(this as DesignDoc, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignDoc&&(identical(other.name, name) || other.name == name)&&(identical(other.spec, spec) || other.spec == spec)&&const DeepCollectionEquality().equals(other.layers, layers));
}


@override
int get hashCode => Object.hash(runtimeType,name,spec,const DeepCollectionEquality().hash(layers));

@override
String toString() {
  return 'DesignDoc(name: $name, spec: $spec, layers: $layers)';
}


}

/// @nodoc
abstract mixin class $DesignDocCopyWith<$Res>  {
  factory $DesignDocCopyWith(DesignDoc value, $Res Function(DesignDoc) _then) = _$DesignDocCopyWithImpl;
@useResult
$Res call({
 String name, DesignSpec spec, List<DesignLayer> layers
});


$DesignSpecCopyWith<$Res> get spec;

}
/// @nodoc
class _$DesignDocCopyWithImpl<$Res>
    implements $DesignDocCopyWith<$Res> {
  _$DesignDocCopyWithImpl(this._self, this._then);

  final DesignDoc _self;
  final $Res Function(DesignDoc) _then;

/// Create a copy of DesignDoc
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? spec = null,Object? layers = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,spec: null == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as DesignSpec,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<DesignLayer>,
  ));
}
/// Create a copy of DesignDoc
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignSpecCopyWith<$Res> get spec {
  
  return $DesignSpecCopyWith<$Res>(_self.spec, (value) {
    return _then(_self.copyWith(spec: value));
  });
}
}


/// Adds pattern-matching-related methods to [DesignDoc].
extension DesignDocPatterns on DesignDoc {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignDoc value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignDoc() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignDoc value)  $default,){
final _that = this;
switch (_that) {
case _DesignDoc():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignDoc value)?  $default,){
final _that = this;
switch (_that) {
case _DesignDoc() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  DesignSpec spec,  List<DesignLayer> layers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignDoc() when $default != null:
return $default(_that.name,_that.spec,_that.layers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  DesignSpec spec,  List<DesignLayer> layers)  $default,) {final _that = this;
switch (_that) {
case _DesignDoc():
return $default(_that.name,_that.spec,_that.layers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  DesignSpec spec,  List<DesignLayer> layers)?  $default,) {final _that = this;
switch (_that) {
case _DesignDoc() when $default != null:
return $default(_that.name,_that.spec,_that.layers);case _:
  return null;

}
}

}

/// @nodoc


class _DesignDoc implements DesignDoc {
  const _DesignDoc({this.name = '', required this.spec, final  List<DesignLayer> layers = const <DesignLayer>[]}): _layers = layers;
  

@override@JsonKey() final  String name;
@override final  DesignSpec spec;
 final  List<DesignLayer> _layers;
@override@JsonKey() List<DesignLayer> get layers {
  if (_layers is EqualUnmodifiableListView) return _layers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_layers);
}


/// Create a copy of DesignDoc
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignDocCopyWith<_DesignDoc> get copyWith => __$DesignDocCopyWithImpl<_DesignDoc>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignDoc&&(identical(other.name, name) || other.name == name)&&(identical(other.spec, spec) || other.spec == spec)&&const DeepCollectionEquality().equals(other._layers, _layers));
}


@override
int get hashCode => Object.hash(runtimeType,name,spec,const DeepCollectionEquality().hash(_layers));

@override
String toString() {
  return 'DesignDoc(name: $name, spec: $spec, layers: $layers)';
}


}

/// @nodoc
abstract mixin class _$DesignDocCopyWith<$Res> implements $DesignDocCopyWith<$Res> {
  factory _$DesignDocCopyWith(_DesignDoc value, $Res Function(_DesignDoc) _then) = __$DesignDocCopyWithImpl;
@override @useResult
$Res call({
 String name, DesignSpec spec, List<DesignLayer> layers
});


@override $DesignSpecCopyWith<$Res> get spec;

}
/// @nodoc
class __$DesignDocCopyWithImpl<$Res>
    implements _$DesignDocCopyWith<$Res> {
  __$DesignDocCopyWithImpl(this._self, this._then);

  final _DesignDoc _self;
  final $Res Function(_DesignDoc) _then;

/// Create a copy of DesignDoc
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? spec = null,Object? layers = null,}) {
  return _then(_DesignDoc(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,spec: null == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as DesignSpec,layers: null == layers ? _self._layers : layers // ignore: cast_nullable_to_non_nullable
as List<DesignLayer>,
  ));
}

/// Create a copy of DesignDoc
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignSpecCopyWith<$Res> get spec {
  
  return $DesignSpecCopyWith<$Res>(_self.spec, (value) {
    return _then(_self.copyWith(spec: value));
  });
}
}

// dart format on
