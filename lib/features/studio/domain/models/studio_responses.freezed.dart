// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studio_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudioQuote {

 double get unitPrice; int get quantity; List<StudioBreakdownItem> get breakdown; double get volumeDiscountPercent; double get volumeDiscount; double get rushFee; double get setupFee; double get total; int get leadTimeMinDays; int get leadTimeMaxDays; DateTime? get estimatedDeliveryFrom; DateTime? get estimatedDeliveryTo; List<LayerQualityWarning> get warnings;
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
 double unitPrice, int quantity, List<StudioBreakdownItem> breakdown, double volumeDiscountPercent, double volumeDiscount, double rushFee, double setupFee, double total, int leadTimeMinDays, int leadTimeMaxDays, DateTime? estimatedDeliveryFrom, DateTime? estimatedDeliveryTo, List<LayerQualityWarning> warnings
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
as List<StudioBreakdownItem>,volumeDiscountPercent: null == volumeDiscountPercent ? _self.volumeDiscountPercent : volumeDiscountPercent // ignore: cast_nullable_to_non_nullable
as double,volumeDiscount: null == volumeDiscount ? _self.volumeDiscount : volumeDiscount // ignore: cast_nullable_to_non_nullable
as double,rushFee: null == rushFee ? _self.rushFee : rushFee // ignore: cast_nullable_to_non_nullable
as double,setupFee: null == setupFee ? _self.setupFee : setupFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,leadTimeMinDays: null == leadTimeMinDays ? _self.leadTimeMinDays : leadTimeMinDays // ignore: cast_nullable_to_non_nullable
as int,leadTimeMaxDays: null == leadTimeMaxDays ? _self.leadTimeMaxDays : leadTimeMaxDays // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryFrom: freezed == estimatedDeliveryFrom ? _self.estimatedDeliveryFrom : estimatedDeliveryFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDeliveryTo: freezed == estimatedDeliveryTo ? _self.estimatedDeliveryTo : estimatedDeliveryTo // ignore: cast_nullable_to_non_nullable
as DateTime?,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<LayerQualityWarning>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double unitPrice,  int quantity,  List<StudioBreakdownItem> breakdown,  double volumeDiscountPercent,  double volumeDiscount,  double rushFee,  double setupFee,  double total,  int leadTimeMinDays,  int leadTimeMaxDays,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<LayerQualityWarning> warnings)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double unitPrice,  int quantity,  List<StudioBreakdownItem> breakdown,  double volumeDiscountPercent,  double volumeDiscount,  double rushFee,  double setupFee,  double total,  int leadTimeMinDays,  int leadTimeMaxDays,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<LayerQualityWarning> warnings)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double unitPrice,  int quantity,  List<StudioBreakdownItem> breakdown,  double volumeDiscountPercent,  double volumeDiscount,  double rushFee,  double setupFee,  double total,  int leadTimeMinDays,  int leadTimeMaxDays,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<LayerQualityWarning> warnings)?  $default,) {final _that = this;
switch (_that) {
case _StudioQuote() when $default != null:
return $default(_that.unitPrice,_that.quantity,_that.breakdown,_that.volumeDiscountPercent,_that.volumeDiscount,_that.rushFee,_that.setupFee,_that.total,_that.leadTimeMinDays,_that.leadTimeMaxDays,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.warnings);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudioQuote extends StudioQuote {
  const _StudioQuote({required this.unitPrice, this.quantity = 1, final  List<StudioBreakdownItem> breakdown = const <StudioBreakdownItem>[], this.volumeDiscountPercent = 0, this.volumeDiscount = 0, this.rushFee = 0, this.setupFee = 0, required this.total, this.leadTimeMinDays = 0, this.leadTimeMaxDays = 0, this.estimatedDeliveryFrom, this.estimatedDeliveryTo, final  List<LayerQualityWarning> warnings = const <LayerQualityWarning>[]}): _breakdown = breakdown,_warnings = warnings,super._();
  factory _StudioQuote.fromJson(Map<String, dynamic> json) => _$StudioQuoteFromJson(json);

@override final  double unitPrice;
@override@JsonKey() final  int quantity;
 final  List<StudioBreakdownItem> _breakdown;
@override@JsonKey() List<StudioBreakdownItem> get breakdown {
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
 final  List<LayerQualityWarning> _warnings;
@override@JsonKey() List<LayerQualityWarning> get warnings {
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
 double unitPrice, int quantity, List<StudioBreakdownItem> breakdown, double volumeDiscountPercent, double volumeDiscount, double rushFee, double setupFee, double total, int leadTimeMinDays, int leadTimeMaxDays, DateTime? estimatedDeliveryFrom, DateTime? estimatedDeliveryTo, List<LayerQualityWarning> warnings
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
as List<StudioBreakdownItem>,volumeDiscountPercent: null == volumeDiscountPercent ? _self.volumeDiscountPercent : volumeDiscountPercent // ignore: cast_nullable_to_non_nullable
as double,volumeDiscount: null == volumeDiscount ? _self.volumeDiscount : volumeDiscount // ignore: cast_nullable_to_non_nullable
as double,rushFee: null == rushFee ? _self.rushFee : rushFee // ignore: cast_nullable_to_non_nullable
as double,setupFee: null == setupFee ? _self.setupFee : setupFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,leadTimeMinDays: null == leadTimeMinDays ? _self.leadTimeMinDays : leadTimeMinDays // ignore: cast_nullable_to_non_nullable
as int,leadTimeMaxDays: null == leadTimeMaxDays ? _self.leadTimeMaxDays : leadTimeMaxDays // ignore: cast_nullable_to_non_nullable
as int,estimatedDeliveryFrom: freezed == estimatedDeliveryFrom ? _self.estimatedDeliveryFrom : estimatedDeliveryFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDeliveryTo: freezed == estimatedDeliveryTo ? _self.estimatedDeliveryTo : estimatedDeliveryTo // ignore: cast_nullable_to_non_nullable
as DateTime?,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<LayerQualityWarning>,
  ));
}


}


/// @nodoc
mixin _$StudioBreakdownItem {

 String get kind; String get code; String get label; String? get detail; double get unitAmount;
/// Create a copy of StudioBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudioBreakdownItemCopyWith<StudioBreakdownItem> get copyWith => _$StudioBreakdownItemCopyWithImpl<StudioBreakdownItem>(this as StudioBreakdownItem, _$identity);

  /// Serializes this StudioBreakdownItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudioBreakdownItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,label,detail,unitAmount);

@override
String toString() {
  return 'StudioBreakdownItem(kind: $kind, code: $code, label: $label, detail: $detail, unitAmount: $unitAmount)';
}


}

/// @nodoc
abstract mixin class $StudioBreakdownItemCopyWith<$Res>  {
  factory $StudioBreakdownItemCopyWith(StudioBreakdownItem value, $Res Function(StudioBreakdownItem) _then) = _$StudioBreakdownItemCopyWithImpl;
@useResult
$Res call({
 String kind, String code, String label, String? detail, double unitAmount
});




}
/// @nodoc
class _$StudioBreakdownItemCopyWithImpl<$Res>
    implements $StudioBreakdownItemCopyWith<$Res> {
  _$StudioBreakdownItemCopyWithImpl(this._self, this._then);

  final StudioBreakdownItem _self;
  final $Res Function(StudioBreakdownItem) _then;

/// Create a copy of StudioBreakdownItem
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


/// Adds pattern-matching-related methods to [StudioBreakdownItem].
extension StudioBreakdownItemPatterns on StudioBreakdownItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudioBreakdownItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudioBreakdownItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudioBreakdownItem value)  $default,){
final _that = this;
switch (_that) {
case _StudioBreakdownItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudioBreakdownItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudioBreakdownItem() when $default != null:
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
case _StudioBreakdownItem() when $default != null:
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
case _StudioBreakdownItem():
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
case _StudioBreakdownItem() when $default != null:
return $default(_that.kind,_that.code,_that.label,_that.detail,_that.unitAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudioBreakdownItem implements StudioBreakdownItem {
  const _StudioBreakdownItem({this.kind = '', this.code = '', required this.label, this.detail, this.unitAmount = 0});
  factory _StudioBreakdownItem.fromJson(Map<String, dynamic> json) => _$StudioBreakdownItemFromJson(json);

@override@JsonKey() final  String kind;
@override@JsonKey() final  String code;
@override final  String label;
@override final  String? detail;
@override@JsonKey() final  double unitAmount;

/// Create a copy of StudioBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudioBreakdownItemCopyWith<_StudioBreakdownItem> get copyWith => __$StudioBreakdownItemCopyWithImpl<_StudioBreakdownItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudioBreakdownItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudioBreakdownItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,label,detail,unitAmount);

@override
String toString() {
  return 'StudioBreakdownItem(kind: $kind, code: $code, label: $label, detail: $detail, unitAmount: $unitAmount)';
}


}

/// @nodoc
abstract mixin class _$StudioBreakdownItemCopyWith<$Res> implements $StudioBreakdownItemCopyWith<$Res> {
  factory _$StudioBreakdownItemCopyWith(_StudioBreakdownItem value, $Res Function(_StudioBreakdownItem) _then) = __$StudioBreakdownItemCopyWithImpl;
@override @useResult
$Res call({
 String kind, String code, String label, String? detail, double unitAmount
});




}
/// @nodoc
class __$StudioBreakdownItemCopyWithImpl<$Res>
    implements _$StudioBreakdownItemCopyWith<$Res> {
  __$StudioBreakdownItemCopyWithImpl(this._self, this._then);

  final _StudioBreakdownItem _self;
  final $Res Function(_StudioBreakdownItem) _then;

/// Create a copy of StudioBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? code = null,Object? label = null,Object? detail = freezed,Object? unitAmount = null,}) {
  return _then(_StudioBreakdownItem(
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
mixin _$LayerQualityWarning {

 String get layerId; int get effectiveDpi; String get level;
/// Create a copy of LayerQualityWarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LayerQualityWarningCopyWith<LayerQualityWarning> get copyWith => _$LayerQualityWarningCopyWithImpl<LayerQualityWarning>(this as LayerQualityWarning, _$identity);

  /// Serializes this LayerQualityWarning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LayerQualityWarning&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.effectiveDpi, effectiveDpi) || other.effectiveDpi == effectiveDpi)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,layerId,effectiveDpi,level);

@override
String toString() {
  return 'LayerQualityWarning(layerId: $layerId, effectiveDpi: $effectiveDpi, level: $level)';
}


}

/// @nodoc
abstract mixin class $LayerQualityWarningCopyWith<$Res>  {
  factory $LayerQualityWarningCopyWith(LayerQualityWarning value, $Res Function(LayerQualityWarning) _then) = _$LayerQualityWarningCopyWithImpl;
@useResult
$Res call({
 String layerId, int effectiveDpi, String level
});




}
/// @nodoc
class _$LayerQualityWarningCopyWithImpl<$Res>
    implements $LayerQualityWarningCopyWith<$Res> {
  _$LayerQualityWarningCopyWithImpl(this._self, this._then);

  final LayerQualityWarning _self;
  final $Res Function(LayerQualityWarning) _then;

/// Create a copy of LayerQualityWarning
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


/// Adds pattern-matching-related methods to [LayerQualityWarning].
extension LayerQualityWarningPatterns on LayerQualityWarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LayerQualityWarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LayerQualityWarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LayerQualityWarning value)  $default,){
final _that = this;
switch (_that) {
case _LayerQualityWarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LayerQualityWarning value)?  $default,){
final _that = this;
switch (_that) {
case _LayerQualityWarning() when $default != null:
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
case _LayerQualityWarning() when $default != null:
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
case _LayerQualityWarning():
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
case _LayerQualityWarning() when $default != null:
return $default(_that.layerId,_that.effectiveDpi,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LayerQualityWarning extends LayerQualityWarning {
  const _LayerQualityWarning({required this.layerId, required this.effectiveDpi, this.level = 'ok'}): super._();
  factory _LayerQualityWarning.fromJson(Map<String, dynamic> json) => _$LayerQualityWarningFromJson(json);

@override final  String layerId;
@override final  int effectiveDpi;
@override@JsonKey() final  String level;

/// Create a copy of LayerQualityWarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LayerQualityWarningCopyWith<_LayerQualityWarning> get copyWith => __$LayerQualityWarningCopyWithImpl<_LayerQualityWarning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LayerQualityWarningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LayerQualityWarning&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.effectiveDpi, effectiveDpi) || other.effectiveDpi == effectiveDpi)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,layerId,effectiveDpi,level);

@override
String toString() {
  return 'LayerQualityWarning(layerId: $layerId, effectiveDpi: $effectiveDpi, level: $level)';
}


}

/// @nodoc
abstract mixin class _$LayerQualityWarningCopyWith<$Res> implements $LayerQualityWarningCopyWith<$Res> {
  factory _$LayerQualityWarningCopyWith(_LayerQualityWarning value, $Res Function(_LayerQualityWarning) _then) = __$LayerQualityWarningCopyWithImpl;
@override @useResult
$Res call({
 String layerId, int effectiveDpi, String level
});




}
/// @nodoc
class __$LayerQualityWarningCopyWithImpl<$Res>
    implements _$LayerQualityWarningCopyWith<$Res> {
  __$LayerQualityWarningCopyWithImpl(this._self, this._then);

  final _LayerQualityWarning _self;
  final $Res Function(_LayerQualityWarning) _then;

/// Create a copy of LayerQualityWarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? layerId = null,Object? effectiveDpi = null,Object? level = null,}) {
  return _then(_LayerQualityWarning(
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

@JsonSerializable(explicitToJson: true)
class _StudioDesign extends StudioDesign {
  const _StudioDesign({required this.id, this.name = '', @JsonKey(unknownEnumValue: DesignStatus.unknown) this.status = DesignStatus.draft, this.editable = false, required this.spec, final  List<DesignLayer> layers = const <DesignLayer>[], required this.pricingVersionId, this.quote, this.quoteErrorCode, final  List<String> mockupUrls = const <String>[], this.shareUrl, this.changeRequestMessage, this.imageRightsConfirmed = false, this.submittedAt, this.approvedAt, this.createdAt, this.updatedAt, final  List<DesignUpload> uploads = const <DesignUpload>[]}): _layers = layers,_mockupUrls = mockupUrls,_uploads = uploads,super._();
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
