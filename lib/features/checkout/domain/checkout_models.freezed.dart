// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutLine {

 String get id; String get kind; String get name; String? get color; String? get colorHex;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; String? get imageUrl; double get unitPrice; int get quantity; double get lineTotal; String? get errorCode; String? get errorMessage;
/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutLineCopyWith<CheckoutLine> get copyWith => _$CheckoutLineCopyWithImpl<CheckoutLine>(this as CheckoutLine, _$identity);

  /// Serializes this CheckoutLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLine&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.size, size) || other.size == size)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,name,color,colorHex,size,imageUrl,unitPrice,quantity,lineTotal,errorCode,errorMessage);

@override
String toString() {
  return 'CheckoutLine(id: $id, kind: $kind, name: $name, color: $color, colorHex: $colorHex, size: $size, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, errorCode: $errorCode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CheckoutLineCopyWith<$Res>  {
  factory $CheckoutLineCopyWith(CheckoutLine value, $Res Function(CheckoutLine) _then) = _$CheckoutLineCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String name, String? color, String? colorHex,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? imageUrl, double unitPrice, int quantity, double lineTotal, String? errorCode, String? errorMessage
});




}
/// @nodoc
class _$CheckoutLineCopyWithImpl<$Res>
    implements $CheckoutLineCopyWith<$Res> {
  _$CheckoutLineCopyWithImpl(this._self, this._then);

  final CheckoutLine _self;
  final $Res Function(CheckoutLine) _then;

/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? name = null,Object? color = freezed,Object? colorHex = freezed,Object? size = freezed,Object? imageUrl = freezed,Object? unitPrice = null,Object? quantity = null,Object? lineTotal = null,Object? errorCode = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutLine].
extension CheckoutLinePatterns on CheckoutLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutLine value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutLine value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String name,  String? color,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? imageUrl,  double unitPrice,  int quantity,  double lineTotal,  String? errorCode,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
return $default(_that.id,_that.kind,_that.name,_that.color,_that.colorHex,_that.size,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.errorCode,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String name,  String? color,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? imageUrl,  double unitPrice,  int quantity,  double lineTotal,  String? errorCode,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CheckoutLine():
return $default(_that.id,_that.kind,_that.name,_that.color,_that.colorHex,_that.size,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.errorCode,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String name,  String? color,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? imageUrl,  double unitPrice,  int quantity,  double lineTotal,  String? errorCode,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
return $default(_that.id,_that.kind,_that.name,_that.color,_that.colorHex,_that.size,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.errorCode,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutLine implements CheckoutLine {
  const _CheckoutLine({required this.id, this.kind = 'stock', required this.name, this.color, this.colorHex, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.imageUrl, this.unitPrice = 0, this.quantity = 1, this.lineTotal = 0, this.errorCode, this.errorMessage});
  factory _CheckoutLine.fromJson(Map<String, dynamic> json) => _$CheckoutLineFromJson(json);

@override final  String id;
@override@JsonKey() final  String kind;
@override final  String name;
@override final  String? color;
@override final  String? colorHex;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override final  String? imageUrl;
@override@JsonKey() final  double unitPrice;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  double lineTotal;
@override final  String? errorCode;
@override final  String? errorMessage;

/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutLineCopyWith<_CheckoutLine> get copyWith => __$CheckoutLineCopyWithImpl<_CheckoutLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutLine&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.size, size) || other.size == size)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,name,color,colorHex,size,imageUrl,unitPrice,quantity,lineTotal,errorCode,errorMessage);

@override
String toString() {
  return 'CheckoutLine(id: $id, kind: $kind, name: $name, color: $color, colorHex: $colorHex, size: $size, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, errorCode: $errorCode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CheckoutLineCopyWith<$Res> implements $CheckoutLineCopyWith<$Res> {
  factory _$CheckoutLineCopyWith(_CheckoutLine value, $Res Function(_CheckoutLine) _then) = __$CheckoutLineCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String name, String? color, String? colorHex,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? imageUrl, double unitPrice, int quantity, double lineTotal, String? errorCode, String? errorMessage
});




}
/// @nodoc
class __$CheckoutLineCopyWithImpl<$Res>
    implements _$CheckoutLineCopyWith<$Res> {
  __$CheckoutLineCopyWithImpl(this._self, this._then);

  final _CheckoutLine _self;
  final $Res Function(_CheckoutLine) _then;

/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? name = null,Object? color = freezed,Object? colorHex = freezed,Object? size = freezed,Object? imageUrl = freezed,Object? unitPrice = null,Object? quantity = null,Object? lineTotal = null,Object? errorCode = freezed,Object? errorMessage = freezed,}) {
  return _then(_CheckoutLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CheckoutTotals {

 double get subtotal; double get discount; double get delivery; double get giftPackaging; double get giftPackagingSaving; double get greetingCard; double get total; double get vatIncluded; double? get freeDeliveryRemaining;
/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutTotalsCopyWith<CheckoutTotals> get copyWith => _$CheckoutTotalsCopyWithImpl<CheckoutTotals>(this as CheckoutTotals, _$identity);

  /// Serializes this CheckoutTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.giftPackaging, giftPackaging) || other.giftPackaging == giftPackaging)&&(identical(other.giftPackagingSaving, giftPackagingSaving) || other.giftPackagingSaving == giftPackagingSaving)&&(identical(other.greetingCard, greetingCard) || other.greetingCard == greetingCard)&&(identical(other.total, total) || other.total == total)&&(identical(other.vatIncluded, vatIncluded) || other.vatIncluded == vatIncluded)&&(identical(other.freeDeliveryRemaining, freeDeliveryRemaining) || other.freeDeliveryRemaining == freeDeliveryRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,delivery,giftPackaging,giftPackagingSaving,greetingCard,total,vatIncluded,freeDeliveryRemaining);

@override
String toString() {
  return 'CheckoutTotals(subtotal: $subtotal, discount: $discount, delivery: $delivery, giftPackaging: $giftPackaging, giftPackagingSaving: $giftPackagingSaving, greetingCard: $greetingCard, total: $total, vatIncluded: $vatIncluded, freeDeliveryRemaining: $freeDeliveryRemaining)';
}


}

/// @nodoc
abstract mixin class $CheckoutTotalsCopyWith<$Res>  {
  factory $CheckoutTotalsCopyWith(CheckoutTotals value, $Res Function(CheckoutTotals) _then) = _$CheckoutTotalsCopyWithImpl;
@useResult
$Res call({
 double subtotal, double discount, double delivery, double giftPackaging, double giftPackagingSaving, double greetingCard, double total, double vatIncluded, double? freeDeliveryRemaining
});




}
/// @nodoc
class _$CheckoutTotalsCopyWithImpl<$Res>
    implements $CheckoutTotalsCopyWith<$Res> {
  _$CheckoutTotalsCopyWithImpl(this._self, this._then);

  final CheckoutTotals _self;
  final $Res Function(CheckoutTotals) _then;

/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? discount = null,Object? delivery = null,Object? giftPackaging = null,Object? giftPackagingSaving = null,Object? greetingCard = null,Object? total = null,Object? vatIncluded = null,Object? freeDeliveryRemaining = freezed,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as double,giftPackaging: null == giftPackaging ? _self.giftPackaging : giftPackaging // ignore: cast_nullable_to_non_nullable
as double,giftPackagingSaving: null == giftPackagingSaving ? _self.giftPackagingSaving : giftPackagingSaving // ignore: cast_nullable_to_non_nullable
as double,greetingCard: null == greetingCard ? _self.greetingCard : greetingCard // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,vatIncluded: null == vatIncluded ? _self.vatIncluded : vatIncluded // ignore: cast_nullable_to_non_nullable
as double,freeDeliveryRemaining: freezed == freeDeliveryRemaining ? _self.freeDeliveryRemaining : freeDeliveryRemaining // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutTotals].
extension CheckoutTotalsPatterns on CheckoutTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutTotals value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutTotals value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double delivery,  double giftPackaging,  double giftPackagingSaving,  double greetingCard,  double total,  double vatIncluded,  double? freeDeliveryRemaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.delivery,_that.giftPackaging,_that.giftPackagingSaving,_that.greetingCard,_that.total,_that.vatIncluded,_that.freeDeliveryRemaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double delivery,  double giftPackaging,  double giftPackagingSaving,  double greetingCard,  double total,  double vatIncluded,  double? freeDeliveryRemaining)  $default,) {final _that = this;
switch (_that) {
case _CheckoutTotals():
return $default(_that.subtotal,_that.discount,_that.delivery,_that.giftPackaging,_that.giftPackagingSaving,_that.greetingCard,_that.total,_that.vatIncluded,_that.freeDeliveryRemaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double subtotal,  double discount,  double delivery,  double giftPackaging,  double giftPackagingSaving,  double greetingCard,  double total,  double vatIncluded,  double? freeDeliveryRemaining)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.delivery,_that.giftPackaging,_that.giftPackagingSaving,_that.greetingCard,_that.total,_that.vatIncluded,_that.freeDeliveryRemaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutTotals implements CheckoutTotals {
  const _CheckoutTotals({this.subtotal = 0, this.discount = 0, this.delivery = 0, this.giftPackaging = 0, this.giftPackagingSaving = 0, this.greetingCard = 0, this.total = 0, this.vatIncluded = 0, this.freeDeliveryRemaining});
  factory _CheckoutTotals.fromJson(Map<String, dynamic> json) => _$CheckoutTotalsFromJson(json);

@override@JsonKey() final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double delivery;
@override@JsonKey() final  double giftPackaging;
@override@JsonKey() final  double giftPackagingSaving;
@override@JsonKey() final  double greetingCard;
@override@JsonKey() final  double total;
@override@JsonKey() final  double vatIncluded;
@override final  double? freeDeliveryRemaining;

/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutTotalsCopyWith<_CheckoutTotals> get copyWith => __$CheckoutTotalsCopyWithImpl<_CheckoutTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.giftPackaging, giftPackaging) || other.giftPackaging == giftPackaging)&&(identical(other.giftPackagingSaving, giftPackagingSaving) || other.giftPackagingSaving == giftPackagingSaving)&&(identical(other.greetingCard, greetingCard) || other.greetingCard == greetingCard)&&(identical(other.total, total) || other.total == total)&&(identical(other.vatIncluded, vatIncluded) || other.vatIncluded == vatIncluded)&&(identical(other.freeDeliveryRemaining, freeDeliveryRemaining) || other.freeDeliveryRemaining == freeDeliveryRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,delivery,giftPackaging,giftPackagingSaving,greetingCard,total,vatIncluded,freeDeliveryRemaining);

@override
String toString() {
  return 'CheckoutTotals(subtotal: $subtotal, discount: $discount, delivery: $delivery, giftPackaging: $giftPackaging, giftPackagingSaving: $giftPackagingSaving, greetingCard: $greetingCard, total: $total, vatIncluded: $vatIncluded, freeDeliveryRemaining: $freeDeliveryRemaining)';
}


}

/// @nodoc
abstract mixin class _$CheckoutTotalsCopyWith<$Res> implements $CheckoutTotalsCopyWith<$Res> {
  factory _$CheckoutTotalsCopyWith(_CheckoutTotals value, $Res Function(_CheckoutTotals) _then) = __$CheckoutTotalsCopyWithImpl;
@override @useResult
$Res call({
 double subtotal, double discount, double delivery, double giftPackaging, double giftPackagingSaving, double greetingCard, double total, double vatIncluded, double? freeDeliveryRemaining
});




}
/// @nodoc
class __$CheckoutTotalsCopyWithImpl<$Res>
    implements _$CheckoutTotalsCopyWith<$Res> {
  __$CheckoutTotalsCopyWithImpl(this._self, this._then);

  final _CheckoutTotals _self;
  final $Res Function(_CheckoutTotals) _then;

/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? discount = null,Object? delivery = null,Object? giftPackaging = null,Object? giftPackagingSaving = null,Object? greetingCard = null,Object? total = null,Object? vatIncluded = null,Object? freeDeliveryRemaining = freezed,}) {
  return _then(_CheckoutTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as double,giftPackaging: null == giftPackaging ? _self.giftPackaging : giftPackaging // ignore: cast_nullable_to_non_nullable
as double,giftPackagingSaving: null == giftPackagingSaving ? _self.giftPackagingSaving : giftPackagingSaving // ignore: cast_nullable_to_non_nullable
as double,greetingCard: null == greetingCard ? _self.greetingCard : greetingCard // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,vatIncluded: null == vatIncluded ? _self.vatIncluded : vatIncluded // ignore: cast_nullable_to_non_nullable
as double,freeDeliveryRemaining: freezed == freeDeliveryRemaining ? _self.freeDeliveryRemaining : freeDeliveryRemaining // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DeliveryZone {

 String get id; String get code; String get name; String? get description;@JsonKey(unknownEnumValue: DeliveryKind.unknown) DeliveryKind get kind; double get price; double? get freeFrom; int get etaMinDays; int get etaMaxDays; int? get readyInHours; String? get pickupAddress; bool get supportsTimeSlots; bool get cashOnDeliveryAllowed;
/// Create a copy of DeliveryZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryZoneCopyWith<DeliveryZone> get copyWith => _$DeliveryZoneCopyWithImpl<DeliveryZone>(this as DeliveryZone, _$identity);

  /// Serializes this DeliveryZone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryZone&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.price, price) || other.price == price)&&(identical(other.freeFrom, freeFrom) || other.freeFrom == freeFrom)&&(identical(other.etaMinDays, etaMinDays) || other.etaMinDays == etaMinDays)&&(identical(other.etaMaxDays, etaMaxDays) || other.etaMaxDays == etaMaxDays)&&(identical(other.readyInHours, readyInHours) || other.readyInHours == readyInHours)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.supportsTimeSlots, supportsTimeSlots) || other.supportsTimeSlots == supportsTimeSlots)&&(identical(other.cashOnDeliveryAllowed, cashOnDeliveryAllowed) || other.cashOnDeliveryAllowed == cashOnDeliveryAllowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,description,kind,price,freeFrom,etaMinDays,etaMaxDays,readyInHours,pickupAddress,supportsTimeSlots,cashOnDeliveryAllowed);

@override
String toString() {
  return 'DeliveryZone(id: $id, code: $code, name: $name, description: $description, kind: $kind, price: $price, freeFrom: $freeFrom, etaMinDays: $etaMinDays, etaMaxDays: $etaMaxDays, readyInHours: $readyInHours, pickupAddress: $pickupAddress, supportsTimeSlots: $supportsTimeSlots, cashOnDeliveryAllowed: $cashOnDeliveryAllowed)';
}


}

/// @nodoc
abstract mixin class $DeliveryZoneCopyWith<$Res>  {
  factory $DeliveryZoneCopyWith(DeliveryZone value, $Res Function(DeliveryZone) _then) = _$DeliveryZoneCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String? description,@JsonKey(unknownEnumValue: DeliveryKind.unknown) DeliveryKind kind, double price, double? freeFrom, int etaMinDays, int etaMaxDays, int? readyInHours, String? pickupAddress, bool supportsTimeSlots, bool cashOnDeliveryAllowed
});




}
/// @nodoc
class _$DeliveryZoneCopyWithImpl<$Res>
    implements $DeliveryZoneCopyWith<$Res> {
  _$DeliveryZoneCopyWithImpl(this._self, this._then);

  final DeliveryZone _self;
  final $Res Function(DeliveryZone) _then;

/// Create a copy of DeliveryZone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? description = freezed,Object? kind = null,Object? price = null,Object? freeFrom = freezed,Object? etaMinDays = null,Object? etaMaxDays = null,Object? readyInHours = freezed,Object? pickupAddress = freezed,Object? supportsTimeSlots = null,Object? cashOnDeliveryAllowed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DeliveryKind,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,freeFrom: freezed == freeFrom ? _self.freeFrom : freeFrom // ignore: cast_nullable_to_non_nullable
as double?,etaMinDays: null == etaMinDays ? _self.etaMinDays : etaMinDays // ignore: cast_nullable_to_non_nullable
as int,etaMaxDays: null == etaMaxDays ? _self.etaMaxDays : etaMaxDays // ignore: cast_nullable_to_non_nullable
as int,readyInHours: freezed == readyInHours ? _self.readyInHours : readyInHours // ignore: cast_nullable_to_non_nullable
as int?,pickupAddress: freezed == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String?,supportsTimeSlots: null == supportsTimeSlots ? _self.supportsTimeSlots : supportsTimeSlots // ignore: cast_nullable_to_non_nullable
as bool,cashOnDeliveryAllowed: null == cashOnDeliveryAllowed ? _self.cashOnDeliveryAllowed : cashOnDeliveryAllowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryZone].
extension DeliveryZonePatterns on DeliveryZone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryZone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryZone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryZone value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryZone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryZone value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryZone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String? description, @JsonKey(unknownEnumValue: DeliveryKind.unknown)  DeliveryKind kind,  double price,  double? freeFrom,  int etaMinDays,  int etaMaxDays,  int? readyInHours,  String? pickupAddress,  bool supportsTimeSlots,  bool cashOnDeliveryAllowed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryZone() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.description,_that.kind,_that.price,_that.freeFrom,_that.etaMinDays,_that.etaMaxDays,_that.readyInHours,_that.pickupAddress,_that.supportsTimeSlots,_that.cashOnDeliveryAllowed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String? description, @JsonKey(unknownEnumValue: DeliveryKind.unknown)  DeliveryKind kind,  double price,  double? freeFrom,  int etaMinDays,  int etaMaxDays,  int? readyInHours,  String? pickupAddress,  bool supportsTimeSlots,  bool cashOnDeliveryAllowed)  $default,) {final _that = this;
switch (_that) {
case _DeliveryZone():
return $default(_that.id,_that.code,_that.name,_that.description,_that.kind,_that.price,_that.freeFrom,_that.etaMinDays,_that.etaMaxDays,_that.readyInHours,_that.pickupAddress,_that.supportsTimeSlots,_that.cashOnDeliveryAllowed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String? description, @JsonKey(unknownEnumValue: DeliveryKind.unknown)  DeliveryKind kind,  double price,  double? freeFrom,  int etaMinDays,  int etaMaxDays,  int? readyInHours,  String? pickupAddress,  bool supportsTimeSlots,  bool cashOnDeliveryAllowed)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryZone() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.description,_that.kind,_that.price,_that.freeFrom,_that.etaMinDays,_that.etaMaxDays,_that.readyInHours,_that.pickupAddress,_that.supportsTimeSlots,_that.cashOnDeliveryAllowed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryZone implements DeliveryZone {
  const _DeliveryZone({required this.id, this.code = '', required this.name, this.description, @JsonKey(unknownEnumValue: DeliveryKind.unknown) this.kind = DeliveryKind.courier, this.price = 0, this.freeFrom, this.etaMinDays = 0, this.etaMaxDays = 0, this.readyInHours, this.pickupAddress, this.supportsTimeSlots = false, this.cashOnDeliveryAllowed = false});
  factory _DeliveryZone.fromJson(Map<String, dynamic> json) => _$DeliveryZoneFromJson(json);

@override final  String id;
@override@JsonKey() final  String code;
@override final  String name;
@override final  String? description;
@override@JsonKey(unknownEnumValue: DeliveryKind.unknown) final  DeliveryKind kind;
@override@JsonKey() final  double price;
@override final  double? freeFrom;
@override@JsonKey() final  int etaMinDays;
@override@JsonKey() final  int etaMaxDays;
@override final  int? readyInHours;
@override final  String? pickupAddress;
@override@JsonKey() final  bool supportsTimeSlots;
@override@JsonKey() final  bool cashOnDeliveryAllowed;

/// Create a copy of DeliveryZone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryZoneCopyWith<_DeliveryZone> get copyWith => __$DeliveryZoneCopyWithImpl<_DeliveryZone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryZoneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryZone&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.price, price) || other.price == price)&&(identical(other.freeFrom, freeFrom) || other.freeFrom == freeFrom)&&(identical(other.etaMinDays, etaMinDays) || other.etaMinDays == etaMinDays)&&(identical(other.etaMaxDays, etaMaxDays) || other.etaMaxDays == etaMaxDays)&&(identical(other.readyInHours, readyInHours) || other.readyInHours == readyInHours)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.supportsTimeSlots, supportsTimeSlots) || other.supportsTimeSlots == supportsTimeSlots)&&(identical(other.cashOnDeliveryAllowed, cashOnDeliveryAllowed) || other.cashOnDeliveryAllowed == cashOnDeliveryAllowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,description,kind,price,freeFrom,etaMinDays,etaMaxDays,readyInHours,pickupAddress,supportsTimeSlots,cashOnDeliveryAllowed);

@override
String toString() {
  return 'DeliveryZone(id: $id, code: $code, name: $name, description: $description, kind: $kind, price: $price, freeFrom: $freeFrom, etaMinDays: $etaMinDays, etaMaxDays: $etaMaxDays, readyInHours: $readyInHours, pickupAddress: $pickupAddress, supportsTimeSlots: $supportsTimeSlots, cashOnDeliveryAllowed: $cashOnDeliveryAllowed)';
}


}

/// @nodoc
abstract mixin class _$DeliveryZoneCopyWith<$Res> implements $DeliveryZoneCopyWith<$Res> {
  factory _$DeliveryZoneCopyWith(_DeliveryZone value, $Res Function(_DeliveryZone) _then) = __$DeliveryZoneCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String? description,@JsonKey(unknownEnumValue: DeliveryKind.unknown) DeliveryKind kind, double price, double? freeFrom, int etaMinDays, int etaMaxDays, int? readyInHours, String? pickupAddress, bool supportsTimeSlots, bool cashOnDeliveryAllowed
});




}
/// @nodoc
class __$DeliveryZoneCopyWithImpl<$Res>
    implements _$DeliveryZoneCopyWith<$Res> {
  __$DeliveryZoneCopyWithImpl(this._self, this._then);

  final _DeliveryZone _self;
  final $Res Function(_DeliveryZone) _then;

/// Create a copy of DeliveryZone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? description = freezed,Object? kind = null,Object? price = null,Object? freeFrom = freezed,Object? etaMinDays = null,Object? etaMaxDays = null,Object? readyInHours = freezed,Object? pickupAddress = freezed,Object? supportsTimeSlots = null,Object? cashOnDeliveryAllowed = null,}) {
  return _then(_DeliveryZone(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DeliveryKind,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,freeFrom: freezed == freeFrom ? _self.freeFrom : freeFrom // ignore: cast_nullable_to_non_nullable
as double?,etaMinDays: null == etaMinDays ? _self.etaMinDays : etaMinDays // ignore: cast_nullable_to_non_nullable
as int,etaMaxDays: null == etaMaxDays ? _self.etaMaxDays : etaMaxDays // ignore: cast_nullable_to_non_nullable
as int,readyInHours: freezed == readyInHours ? _self.readyInHours : readyInHours // ignore: cast_nullable_to_non_nullable
as int?,pickupAddress: freezed == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String?,supportsTimeSlots: null == supportsTimeSlots ? _self.supportsTimeSlots : supportsTimeSlots // ignore: cast_nullable_to_non_nullable
as bool,cashOnDeliveryAllowed: null == cashOnDeliveryAllowed ? _self.cashOnDeliveryAllowed : cashOnDeliveryAllowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SelectedSlot {

 DateTime get date; String get windowId; String get start; String get end;
/// Create a copy of SelectedSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedSlotCopyWith<SelectedSlot> get copyWith => _$SelectedSlotCopyWithImpl<SelectedSlot>(this as SelectedSlot, _$identity);

  /// Serializes this SelectedSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedSlot&&(identical(other.date, date) || other.date == date)&&(identical(other.windowId, windowId) || other.windowId == windowId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,windowId,start,end);

@override
String toString() {
  return 'SelectedSlot(date: $date, windowId: $windowId, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $SelectedSlotCopyWith<$Res>  {
  factory $SelectedSlotCopyWith(SelectedSlot value, $Res Function(SelectedSlot) _then) = _$SelectedSlotCopyWithImpl;
@useResult
$Res call({
 DateTime date, String windowId, String start, String end
});




}
/// @nodoc
class _$SelectedSlotCopyWithImpl<$Res>
    implements $SelectedSlotCopyWith<$Res> {
  _$SelectedSlotCopyWithImpl(this._self, this._then);

  final SelectedSlot _self;
  final $Res Function(SelectedSlot) _then;

/// Create a copy of SelectedSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? windowId = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,windowId: null == windowId ? _self.windowId : windowId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectedSlot].
extension SelectedSlotPatterns on SelectedSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedSlot value)  $default,){
final _that = this;
switch (_that) {
case _SelectedSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedSlot value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String windowId,  String start,  String end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedSlot() when $default != null:
return $default(_that.date,_that.windowId,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String windowId,  String start,  String end)  $default,) {final _that = this;
switch (_that) {
case _SelectedSlot():
return $default(_that.date,_that.windowId,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String windowId,  String start,  String end)?  $default,) {final _that = this;
switch (_that) {
case _SelectedSlot() when $default != null:
return $default(_that.date,_that.windowId,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectedSlot implements SelectedSlot {
  const _SelectedSlot({required this.date, required this.windowId, required this.start, required this.end});
  factory _SelectedSlot.fromJson(Map<String, dynamic> json) => _$SelectedSlotFromJson(json);

@override final  DateTime date;
@override final  String windowId;
@override final  String start;
@override final  String end;

/// Create a copy of SelectedSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedSlotCopyWith<_SelectedSlot> get copyWith => __$SelectedSlotCopyWithImpl<_SelectedSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectedSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedSlot&&(identical(other.date, date) || other.date == date)&&(identical(other.windowId, windowId) || other.windowId == windowId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,windowId,start,end);

@override
String toString() {
  return 'SelectedSlot(date: $date, windowId: $windowId, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$SelectedSlotCopyWith<$Res> implements $SelectedSlotCopyWith<$Res> {
  factory _$SelectedSlotCopyWith(_SelectedSlot value, $Res Function(_SelectedSlot) _then) = __$SelectedSlotCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String windowId, String start, String end
});




}
/// @nodoc
class __$SelectedSlotCopyWithImpl<$Res>
    implements _$SelectedSlotCopyWith<$Res> {
  __$SelectedSlotCopyWithImpl(this._self, this._then);

  final _SelectedSlot _self;
  final $Res Function(_SelectedSlot) _then;

/// Create a copy of SelectedSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? windowId = null,Object? start = null,Object? end = null,}) {
  return _then(_SelectedSlot(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,windowId: null == windowId ? _self.windowId : windowId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaymentOption {

@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get method; bool get available; String? get unavailableReasonCode; String? get unavailableReason;
/// Create a copy of PaymentOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOptionCopyWith<PaymentOption> get copyWith => _$PaymentOptionCopyWithImpl<PaymentOption>(this as PaymentOption, _$identity);

  /// Serializes this PaymentOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOption&&(identical(other.method, method) || other.method == method)&&(identical(other.available, available) || other.available == available)&&(identical(other.unavailableReasonCode, unavailableReasonCode) || other.unavailableReasonCode == unavailableReasonCode)&&(identical(other.unavailableReason, unavailableReason) || other.unavailableReason == unavailableReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,available,unavailableReasonCode,unavailableReason);

@override
String toString() {
  return 'PaymentOption(method: $method, available: $available, unavailableReasonCode: $unavailableReasonCode, unavailableReason: $unavailableReason)';
}


}

/// @nodoc
abstract mixin class $PaymentOptionCopyWith<$Res>  {
  factory $PaymentOptionCopyWith(PaymentOption value, $Res Function(PaymentOption) _then) = _$PaymentOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method, bool available, String? unavailableReasonCode, String? unavailableReason
});




}
/// @nodoc
class _$PaymentOptionCopyWithImpl<$Res>
    implements $PaymentOptionCopyWith<$Res> {
  _$PaymentOptionCopyWithImpl(this._self, this._then);

  final PaymentOption _self;
  final $Res Function(PaymentOption) _then;

/// Create a copy of PaymentOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? available = null,Object? unavailableReasonCode = freezed,Object? unavailableReason = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,unavailableReasonCode: freezed == unavailableReasonCode ? _self.unavailableReasonCode : unavailableReasonCode // ignore: cast_nullable_to_non_nullable
as String?,unavailableReason: freezed == unavailableReason ? _self.unavailableReason : unavailableReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentOption].
extension PaymentOptionPatterns on PaymentOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOption value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOption value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method,  bool available,  String? unavailableReasonCode,  String? unavailableReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOption() when $default != null:
return $default(_that.method,_that.available,_that.unavailableReasonCode,_that.unavailableReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method,  bool available,  String? unavailableReasonCode,  String? unavailableReason)  $default,) {final _that = this;
switch (_that) {
case _PaymentOption():
return $default(_that.method,_that.available,_that.unavailableReasonCode,_that.unavailableReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method,  bool available,  String? unavailableReasonCode,  String? unavailableReason)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOption() when $default != null:
return $default(_that.method,_that.available,_that.unavailableReasonCode,_that.unavailableReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentOption implements PaymentOption {
  const _PaymentOption({@JsonKey(unknownEnumValue: PaymentMethod.unknown) required this.method, this.available = false, this.unavailableReasonCode, this.unavailableReason});
  factory _PaymentOption.fromJson(Map<String, dynamic> json) => _$PaymentOptionFromJson(json);

@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod method;
@override@JsonKey() final  bool available;
@override final  String? unavailableReasonCode;
@override final  String? unavailableReason;

/// Create a copy of PaymentOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOptionCopyWith<_PaymentOption> get copyWith => __$PaymentOptionCopyWithImpl<_PaymentOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOption&&(identical(other.method, method) || other.method == method)&&(identical(other.available, available) || other.available == available)&&(identical(other.unavailableReasonCode, unavailableReasonCode) || other.unavailableReasonCode == unavailableReasonCode)&&(identical(other.unavailableReason, unavailableReason) || other.unavailableReason == unavailableReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,available,unavailableReasonCode,unavailableReason);

@override
String toString() {
  return 'PaymentOption(method: $method, available: $available, unavailableReasonCode: $unavailableReasonCode, unavailableReason: $unavailableReason)';
}


}

/// @nodoc
abstract mixin class _$PaymentOptionCopyWith<$Res> implements $PaymentOptionCopyWith<$Res> {
  factory _$PaymentOptionCopyWith(_PaymentOption value, $Res Function(_PaymentOption) _then) = __$PaymentOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method, bool available, String? unavailableReasonCode, String? unavailableReason
});




}
/// @nodoc
class __$PaymentOptionCopyWithImpl<$Res>
    implements _$PaymentOptionCopyWith<$Res> {
  __$PaymentOptionCopyWithImpl(this._self, this._then);

  final _PaymentOption _self;
  final $Res Function(_PaymentOption) _then;

/// Create a copy of PaymentOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? available = null,Object? unavailableReasonCode = freezed,Object? unavailableReason = freezed,}) {
  return _then(_PaymentOption(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,unavailableReasonCode: freezed == unavailableReasonCode ? _self.unavailableReasonCode : unavailableReasonCode // ignore: cast_nullable_to_non_nullable
as String?,unavailableReason: freezed == unavailableReason ? _self.unavailableReason : unavailableReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GiftSummary {

 String get recipientName; String get recipientPhone;@JsonKey(unknownEnumValue: Occasion.unknown) Occasion get occasion; bool get surprise; String get packaging; String get cardType; String? get cardDesign; String? get message; String? get fromName; bool get hidePrices;
/// Create a copy of GiftSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftSummaryCopyWith<GiftSummary> get copyWith => _$GiftSummaryCopyWithImpl<GiftSummary>(this as GiftSummary, _$identity);

  /// Serializes this GiftSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftSummary&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.surprise, surprise) || other.surprise == surprise)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.cardDesign, cardDesign) || other.cardDesign == cardDesign)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.hidePrices, hidePrices) || other.hidePrices == hidePrices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientName,recipientPhone,occasion,surprise,packaging,cardType,cardDesign,message,fromName,hidePrices);

@override
String toString() {
  return 'GiftSummary(recipientName: $recipientName, recipientPhone: $recipientPhone, occasion: $occasion, surprise: $surprise, packaging: $packaging, cardType: $cardType, cardDesign: $cardDesign, message: $message, fromName: $fromName, hidePrices: $hidePrices)';
}


}

/// @nodoc
abstract mixin class $GiftSummaryCopyWith<$Res>  {
  factory $GiftSummaryCopyWith(GiftSummary value, $Res Function(GiftSummary) _then) = _$GiftSummaryCopyWithImpl;
@useResult
$Res call({
 String recipientName, String recipientPhone,@JsonKey(unknownEnumValue: Occasion.unknown) Occasion occasion, bool surprise, String packaging, String cardType, String? cardDesign, String? message, String? fromName, bool hidePrices
});




}
/// @nodoc
class _$GiftSummaryCopyWithImpl<$Res>
    implements $GiftSummaryCopyWith<$Res> {
  _$GiftSummaryCopyWithImpl(this._self, this._then);

  final GiftSummary _self;
  final $Res Function(GiftSummary) _then;

/// Create a copy of GiftSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientName = null,Object? recipientPhone = null,Object? occasion = null,Object? surprise = null,Object? packaging = null,Object? cardType = null,Object? cardDesign = freezed,Object? message = freezed,Object? fromName = freezed,Object? hidePrices = null,}) {
  return _then(_self.copyWith(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as Occasion,surprise: null == surprise ? _self.surprise : surprise // ignore: cast_nullable_to_non_nullable
as bool,packaging: null == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as String,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as String,cardDesign: freezed == cardDesign ? _self.cardDesign : cardDesign // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,hidePrices: null == hidePrices ? _self.hidePrices : hidePrices // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftSummary].
extension GiftSummaryPatterns on GiftSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftSummary value)  $default,){
final _that = this;
switch (_that) {
case _GiftSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftSummary value)?  $default,){
final _that = this;
switch (_that) {
case _GiftSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipientName,  String recipientPhone, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  bool surprise,  String packaging,  String cardType,  String? cardDesign,  String? message,  String? fromName,  bool hidePrices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftSummary() when $default != null:
return $default(_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packaging,_that.cardType,_that.cardDesign,_that.message,_that.fromName,_that.hidePrices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipientName,  String recipientPhone, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  bool surprise,  String packaging,  String cardType,  String? cardDesign,  String? message,  String? fromName,  bool hidePrices)  $default,) {final _that = this;
switch (_that) {
case _GiftSummary():
return $default(_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packaging,_that.cardType,_that.cardDesign,_that.message,_that.fromName,_that.hidePrices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipientName,  String recipientPhone, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  bool surprise,  String packaging,  String cardType,  String? cardDesign,  String? message,  String? fromName,  bool hidePrices)?  $default,) {final _that = this;
switch (_that) {
case _GiftSummary() when $default != null:
return $default(_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packaging,_that.cardType,_that.cardDesign,_that.message,_that.fromName,_that.hidePrices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftSummary implements GiftSummary {
  const _GiftSummary({this.recipientName = '', this.recipientPhone = '', @JsonKey(unknownEnumValue: Occasion.unknown) this.occasion = Occasion.justBecause, this.surprise = true, this.packaging = '', this.cardType = '', this.cardDesign, this.message, this.fromName, this.hidePrices = false});
  factory _GiftSummary.fromJson(Map<String, dynamic> json) => _$GiftSummaryFromJson(json);

@override@JsonKey() final  String recipientName;
@override@JsonKey() final  String recipientPhone;
@override@JsonKey(unknownEnumValue: Occasion.unknown) final  Occasion occasion;
@override@JsonKey() final  bool surprise;
@override@JsonKey() final  String packaging;
@override@JsonKey() final  String cardType;
@override final  String? cardDesign;
@override final  String? message;
@override final  String? fromName;
@override@JsonKey() final  bool hidePrices;

/// Create a copy of GiftSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftSummaryCopyWith<_GiftSummary> get copyWith => __$GiftSummaryCopyWithImpl<_GiftSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftSummary&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.surprise, surprise) || other.surprise == surprise)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.cardDesign, cardDesign) || other.cardDesign == cardDesign)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.hidePrices, hidePrices) || other.hidePrices == hidePrices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientName,recipientPhone,occasion,surprise,packaging,cardType,cardDesign,message,fromName,hidePrices);

@override
String toString() {
  return 'GiftSummary(recipientName: $recipientName, recipientPhone: $recipientPhone, occasion: $occasion, surprise: $surprise, packaging: $packaging, cardType: $cardType, cardDesign: $cardDesign, message: $message, fromName: $fromName, hidePrices: $hidePrices)';
}


}

/// @nodoc
abstract mixin class _$GiftSummaryCopyWith<$Res> implements $GiftSummaryCopyWith<$Res> {
  factory _$GiftSummaryCopyWith(_GiftSummary value, $Res Function(_GiftSummary) _then) = __$GiftSummaryCopyWithImpl;
@override @useResult
$Res call({
 String recipientName, String recipientPhone,@JsonKey(unknownEnumValue: Occasion.unknown) Occasion occasion, bool surprise, String packaging, String cardType, String? cardDesign, String? message, String? fromName, bool hidePrices
});




}
/// @nodoc
class __$GiftSummaryCopyWithImpl<$Res>
    implements _$GiftSummaryCopyWith<$Res> {
  __$GiftSummaryCopyWithImpl(this._self, this._then);

  final _GiftSummary _self;
  final $Res Function(_GiftSummary) _then;

/// Create a copy of GiftSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientName = null,Object? recipientPhone = null,Object? occasion = null,Object? surprise = null,Object? packaging = null,Object? cardType = null,Object? cardDesign = freezed,Object? message = freezed,Object? fromName = freezed,Object? hidePrices = null,}) {
  return _then(_GiftSummary(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as Occasion,surprise: null == surprise ? _self.surprise : surprise // ignore: cast_nullable_to_non_nullable
as bool,packaging: null == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as String,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as String,cardDesign: freezed == cardDesign ? _self.cardDesign : cardDesign // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,hidePrices: null == hidePrices ? _self.hidePrices : hidePrices // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CheckoutSession {

 String get id; DateTime get expiresAt; List<CheckoutLine> get items; ContactInfo? get contact; GiftSummary? get gift; DeliveryZone? get zone; DeliveryAddress? get address; SelectedSlot? get slot;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? get paymentMethod; String? get savedCardId; String? get promoCode; String? get promoErrorCode; String? get promoError; CheckoutTotals get totals; DateTime? get estimatedDeliveryFrom; DateTime? get estimatedDeliveryTo; List<DeliveryZone> get zones; List<PaymentOption> get paymentMethods; List<SavedCard> get savedCards; List<SavedAddress> get savedAddresses; bool get hasCustomItems; List<String> get missingSteps; bool get canPlaceOrder; String? get orderId;
/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSessionCopyWith<CheckoutSession> get copyWith => _$CheckoutSessionCopyWithImpl<CheckoutSession>(this as CheckoutSession, _$identity);

  /// Serializes this CheckoutSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.address, address) || other.address == address)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.savedCardId, savedCardId) || other.savedCardId == savedCardId)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.promoErrorCode, promoErrorCode) || other.promoErrorCode == promoErrorCode)&&(identical(other.promoError, promoError) || other.promoError == promoError)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.estimatedDeliveryFrom, estimatedDeliveryFrom) || other.estimatedDeliveryFrom == estimatedDeliveryFrom)&&(identical(other.estimatedDeliveryTo, estimatedDeliveryTo) || other.estimatedDeliveryTo == estimatedDeliveryTo)&&const DeepCollectionEquality().equals(other.zones, zones)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods)&&const DeepCollectionEquality().equals(other.savedCards, savedCards)&&const DeepCollectionEquality().equals(other.savedAddresses, savedAddresses)&&(identical(other.hasCustomItems, hasCustomItems) || other.hasCustomItems == hasCustomItems)&&const DeepCollectionEquality().equals(other.missingSteps, missingSteps)&&(identical(other.canPlaceOrder, canPlaceOrder) || other.canPlaceOrder == canPlaceOrder)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,expiresAt,const DeepCollectionEquality().hash(items),contact,gift,zone,address,slot,paymentMethod,savedCardId,promoCode,promoErrorCode,promoError,totals,estimatedDeliveryFrom,estimatedDeliveryTo,const DeepCollectionEquality().hash(zones),const DeepCollectionEquality().hash(paymentMethods),const DeepCollectionEquality().hash(savedCards),const DeepCollectionEquality().hash(savedAddresses),hasCustomItems,const DeepCollectionEquality().hash(missingSteps),canPlaceOrder,orderId]);

@override
String toString() {
  return 'CheckoutSession(id: $id, expiresAt: $expiresAt, items: $items, contact: $contact, gift: $gift, zone: $zone, address: $address, slot: $slot, paymentMethod: $paymentMethod, savedCardId: $savedCardId, promoCode: $promoCode, promoErrorCode: $promoErrorCode, promoError: $promoError, totals: $totals, estimatedDeliveryFrom: $estimatedDeliveryFrom, estimatedDeliveryTo: $estimatedDeliveryTo, zones: $zones, paymentMethods: $paymentMethods, savedCards: $savedCards, savedAddresses: $savedAddresses, hasCustomItems: $hasCustomItems, missingSteps: $missingSteps, canPlaceOrder: $canPlaceOrder, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $CheckoutSessionCopyWith<$Res>  {
  factory $CheckoutSessionCopyWith(CheckoutSession value, $Res Function(CheckoutSession) _then) = _$CheckoutSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime expiresAt, List<CheckoutLine> items, ContactInfo? contact, GiftSummary? gift, DeliveryZone? zone, DeliveryAddress? address, SelectedSlot? slot,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? paymentMethod, String? savedCardId, String? promoCode, String? promoErrorCode, String? promoError, CheckoutTotals totals, DateTime? estimatedDeliveryFrom, DateTime? estimatedDeliveryTo, List<DeliveryZone> zones, List<PaymentOption> paymentMethods, List<SavedCard> savedCards, List<SavedAddress> savedAddresses, bool hasCustomItems, List<String> missingSteps, bool canPlaceOrder, String? orderId
});


$ContactInfoCopyWith<$Res>? get contact;$GiftSummaryCopyWith<$Res>? get gift;$DeliveryZoneCopyWith<$Res>? get zone;$DeliveryAddressCopyWith<$Res>? get address;$SelectedSlotCopyWith<$Res>? get slot;$CheckoutTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$CheckoutSessionCopyWithImpl<$Res>
    implements $CheckoutSessionCopyWith<$Res> {
  _$CheckoutSessionCopyWithImpl(this._self, this._then);

  final CheckoutSession _self;
  final $Res Function(CheckoutSession) _then;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expiresAt = null,Object? items = null,Object? contact = freezed,Object? gift = freezed,Object? zone = freezed,Object? address = freezed,Object? slot = freezed,Object? paymentMethod = freezed,Object? savedCardId = freezed,Object? promoCode = freezed,Object? promoErrorCode = freezed,Object? promoError = freezed,Object? totals = null,Object? estimatedDeliveryFrom = freezed,Object? estimatedDeliveryTo = freezed,Object? zones = null,Object? paymentMethods = null,Object? savedCards = null,Object? savedAddresses = null,Object? hasCustomItems = null,Object? missingSteps = null,Object? canPlaceOrder = null,Object? orderId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutLine>,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactInfo?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftSummary?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as DeliveryZone?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as SelectedSlot?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,savedCardId: freezed == savedCardId ? _self.savedCardId : savedCardId // ignore: cast_nullable_to_non_nullable
as String?,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,promoErrorCode: freezed == promoErrorCode ? _self.promoErrorCode : promoErrorCode // ignore: cast_nullable_to_non_nullable
as String?,promoError: freezed == promoError ? _self.promoError : promoError // ignore: cast_nullable_to_non_nullable
as String?,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CheckoutTotals,estimatedDeliveryFrom: freezed == estimatedDeliveryFrom ? _self.estimatedDeliveryFrom : estimatedDeliveryFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDeliveryTo: freezed == estimatedDeliveryTo ? _self.estimatedDeliveryTo : estimatedDeliveryTo // ignore: cast_nullable_to_non_nullable
as DateTime?,zones: null == zones ? _self.zones : zones // ignore: cast_nullable_to_non_nullable
as List<DeliveryZone>,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentOption>,savedCards: null == savedCards ? _self.savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as List<SavedCard>,savedAddresses: null == savedAddresses ? _self.savedAddresses : savedAddresses // ignore: cast_nullable_to_non_nullable
as List<SavedAddress>,hasCustomItems: null == hasCustomItems ? _self.hasCustomItems : hasCustomItems // ignore: cast_nullable_to_non_nullable
as bool,missingSteps: null == missingSteps ? _self.missingSteps : missingSteps // ignore: cast_nullable_to_non_nullable
as List<String>,canPlaceOrder: null == canPlaceOrder ? _self.canPlaceOrder : canPlaceOrder // ignore: cast_nullable_to_non_nullable
as bool,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $ContactInfoCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftSummaryCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $GiftSummaryCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryZoneCopyWith<$Res>? get zone {
    if (_self.zone == null) {
    return null;
  }

  return $DeliveryZoneCopyWith<$Res>(_self.zone!, (value) {
    return _then(_self.copyWith(zone: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectedSlotCopyWith<$Res>? get slot {
    if (_self.slot == null) {
    return null;
  }

  return $SelectedSlotCopyWith<$Res>(_self.slot!, (value) {
    return _then(_self.copyWith(slot: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutTotalsCopyWith<$Res> get totals {
  
  return $CheckoutTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutSession].
extension CheckoutSessionPatterns on CheckoutSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutSession value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutSession value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime expiresAt,  List<CheckoutLine> items,  ContactInfo? contact,  GiftSummary? gift,  DeliveryZone? zone,  DeliveryAddress? address,  SelectedSlot? slot, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod? paymentMethod,  String? savedCardId,  String? promoCode,  String? promoErrorCode,  String? promoError,  CheckoutTotals totals,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<DeliveryZone> zones,  List<PaymentOption> paymentMethods,  List<SavedCard> savedCards,  List<SavedAddress> savedAddresses,  bool hasCustomItems,  List<String> missingSteps,  bool canPlaceOrder,  String? orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
return $default(_that.id,_that.expiresAt,_that.items,_that.contact,_that.gift,_that.zone,_that.address,_that.slot,_that.paymentMethod,_that.savedCardId,_that.promoCode,_that.promoErrorCode,_that.promoError,_that.totals,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.zones,_that.paymentMethods,_that.savedCards,_that.savedAddresses,_that.hasCustomItems,_that.missingSteps,_that.canPlaceOrder,_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime expiresAt,  List<CheckoutLine> items,  ContactInfo? contact,  GiftSummary? gift,  DeliveryZone? zone,  DeliveryAddress? address,  SelectedSlot? slot, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod? paymentMethod,  String? savedCardId,  String? promoCode,  String? promoErrorCode,  String? promoError,  CheckoutTotals totals,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<DeliveryZone> zones,  List<PaymentOption> paymentMethods,  List<SavedCard> savedCards,  List<SavedAddress> savedAddresses,  bool hasCustomItems,  List<String> missingSteps,  bool canPlaceOrder,  String? orderId)  $default,) {final _that = this;
switch (_that) {
case _CheckoutSession():
return $default(_that.id,_that.expiresAt,_that.items,_that.contact,_that.gift,_that.zone,_that.address,_that.slot,_that.paymentMethod,_that.savedCardId,_that.promoCode,_that.promoErrorCode,_that.promoError,_that.totals,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.zones,_that.paymentMethods,_that.savedCards,_that.savedAddresses,_that.hasCustomItems,_that.missingSteps,_that.canPlaceOrder,_that.orderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime expiresAt,  List<CheckoutLine> items,  ContactInfo? contact,  GiftSummary? gift,  DeliveryZone? zone,  DeliveryAddress? address,  SelectedSlot? slot, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod? paymentMethod,  String? savedCardId,  String? promoCode,  String? promoErrorCode,  String? promoError,  CheckoutTotals totals,  DateTime? estimatedDeliveryFrom,  DateTime? estimatedDeliveryTo,  List<DeliveryZone> zones,  List<PaymentOption> paymentMethods,  List<SavedCard> savedCards,  List<SavedAddress> savedAddresses,  bool hasCustomItems,  List<String> missingSteps,  bool canPlaceOrder,  String? orderId)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
return $default(_that.id,_that.expiresAt,_that.items,_that.contact,_that.gift,_that.zone,_that.address,_that.slot,_that.paymentMethod,_that.savedCardId,_that.promoCode,_that.promoErrorCode,_that.promoError,_that.totals,_that.estimatedDeliveryFrom,_that.estimatedDeliveryTo,_that.zones,_that.paymentMethods,_that.savedCards,_that.savedAddresses,_that.hasCustomItems,_that.missingSteps,_that.canPlaceOrder,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutSession extends CheckoutSession {
  const _CheckoutSession({required this.id, required this.expiresAt, final  List<CheckoutLine> items = const <CheckoutLine>[], this.contact, this.gift, this.zone, this.address, this.slot, @JsonKey(unknownEnumValue: PaymentMethod.unknown) this.paymentMethod, this.savedCardId, this.promoCode, this.promoErrorCode, this.promoError, this.totals = const CheckoutTotals(), this.estimatedDeliveryFrom, this.estimatedDeliveryTo, final  List<DeliveryZone> zones = const <DeliveryZone>[], final  List<PaymentOption> paymentMethods = const <PaymentOption>[], final  List<SavedCard> savedCards = const <SavedCard>[], final  List<SavedAddress> savedAddresses = const <SavedAddress>[], this.hasCustomItems = false, final  List<String> missingSteps = const <String>[], this.canPlaceOrder = false, this.orderId}): _items = items,_zones = zones,_paymentMethods = paymentMethods,_savedCards = savedCards,_savedAddresses = savedAddresses,_missingSteps = missingSteps,super._();
  factory _CheckoutSession.fromJson(Map<String, dynamic> json) => _$CheckoutSessionFromJson(json);

@override final  String id;
@override final  DateTime expiresAt;
 final  List<CheckoutLine> _items;
@override@JsonKey() List<CheckoutLine> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ContactInfo? contact;
@override final  GiftSummary? gift;
@override final  DeliveryZone? zone;
@override final  DeliveryAddress? address;
@override final  SelectedSlot? slot;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod? paymentMethod;
@override final  String? savedCardId;
@override final  String? promoCode;
@override final  String? promoErrorCode;
@override final  String? promoError;
@override@JsonKey() final  CheckoutTotals totals;
@override final  DateTime? estimatedDeliveryFrom;
@override final  DateTime? estimatedDeliveryTo;
 final  List<DeliveryZone> _zones;
@override@JsonKey() List<DeliveryZone> get zones {
  if (_zones is EqualUnmodifiableListView) return _zones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zones);
}

 final  List<PaymentOption> _paymentMethods;
@override@JsonKey() List<PaymentOption> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}

 final  List<SavedCard> _savedCards;
@override@JsonKey() List<SavedCard> get savedCards {
  if (_savedCards is EqualUnmodifiableListView) return _savedCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedCards);
}

 final  List<SavedAddress> _savedAddresses;
@override@JsonKey() List<SavedAddress> get savedAddresses {
  if (_savedAddresses is EqualUnmodifiableListView) return _savedAddresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedAddresses);
}

@override@JsonKey() final  bool hasCustomItems;
 final  List<String> _missingSteps;
@override@JsonKey() List<String> get missingSteps {
  if (_missingSteps is EqualUnmodifiableListView) return _missingSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingSteps);
}

@override@JsonKey() final  bool canPlaceOrder;
@override final  String? orderId;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSessionCopyWith<_CheckoutSession> get copyWith => __$CheckoutSessionCopyWithImpl<_CheckoutSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.address, address) || other.address == address)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.savedCardId, savedCardId) || other.savedCardId == savedCardId)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.promoErrorCode, promoErrorCode) || other.promoErrorCode == promoErrorCode)&&(identical(other.promoError, promoError) || other.promoError == promoError)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.estimatedDeliveryFrom, estimatedDeliveryFrom) || other.estimatedDeliveryFrom == estimatedDeliveryFrom)&&(identical(other.estimatedDeliveryTo, estimatedDeliveryTo) || other.estimatedDeliveryTo == estimatedDeliveryTo)&&const DeepCollectionEquality().equals(other._zones, _zones)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods)&&const DeepCollectionEquality().equals(other._savedCards, _savedCards)&&const DeepCollectionEquality().equals(other._savedAddresses, _savedAddresses)&&(identical(other.hasCustomItems, hasCustomItems) || other.hasCustomItems == hasCustomItems)&&const DeepCollectionEquality().equals(other._missingSteps, _missingSteps)&&(identical(other.canPlaceOrder, canPlaceOrder) || other.canPlaceOrder == canPlaceOrder)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,expiresAt,const DeepCollectionEquality().hash(_items),contact,gift,zone,address,slot,paymentMethod,savedCardId,promoCode,promoErrorCode,promoError,totals,estimatedDeliveryFrom,estimatedDeliveryTo,const DeepCollectionEquality().hash(_zones),const DeepCollectionEquality().hash(_paymentMethods),const DeepCollectionEquality().hash(_savedCards),const DeepCollectionEquality().hash(_savedAddresses),hasCustomItems,const DeepCollectionEquality().hash(_missingSteps),canPlaceOrder,orderId]);

@override
String toString() {
  return 'CheckoutSession(id: $id, expiresAt: $expiresAt, items: $items, contact: $contact, gift: $gift, zone: $zone, address: $address, slot: $slot, paymentMethod: $paymentMethod, savedCardId: $savedCardId, promoCode: $promoCode, promoErrorCode: $promoErrorCode, promoError: $promoError, totals: $totals, estimatedDeliveryFrom: $estimatedDeliveryFrom, estimatedDeliveryTo: $estimatedDeliveryTo, zones: $zones, paymentMethods: $paymentMethods, savedCards: $savedCards, savedAddresses: $savedAddresses, hasCustomItems: $hasCustomItems, missingSteps: $missingSteps, canPlaceOrder: $canPlaceOrder, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSessionCopyWith<$Res> implements $CheckoutSessionCopyWith<$Res> {
  factory _$CheckoutSessionCopyWith(_CheckoutSession value, $Res Function(_CheckoutSession) _then) = __$CheckoutSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime expiresAt, List<CheckoutLine> items, ContactInfo? contact, GiftSummary? gift, DeliveryZone? zone, DeliveryAddress? address, SelectedSlot? slot,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? paymentMethod, String? savedCardId, String? promoCode, String? promoErrorCode, String? promoError, CheckoutTotals totals, DateTime? estimatedDeliveryFrom, DateTime? estimatedDeliveryTo, List<DeliveryZone> zones, List<PaymentOption> paymentMethods, List<SavedCard> savedCards, List<SavedAddress> savedAddresses, bool hasCustomItems, List<String> missingSteps, bool canPlaceOrder, String? orderId
});


@override $ContactInfoCopyWith<$Res>? get contact;@override $GiftSummaryCopyWith<$Res>? get gift;@override $DeliveryZoneCopyWith<$Res>? get zone;@override $DeliveryAddressCopyWith<$Res>? get address;@override $SelectedSlotCopyWith<$Res>? get slot;@override $CheckoutTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$CheckoutSessionCopyWithImpl<$Res>
    implements _$CheckoutSessionCopyWith<$Res> {
  __$CheckoutSessionCopyWithImpl(this._self, this._then);

  final _CheckoutSession _self;
  final $Res Function(_CheckoutSession) _then;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expiresAt = null,Object? items = null,Object? contact = freezed,Object? gift = freezed,Object? zone = freezed,Object? address = freezed,Object? slot = freezed,Object? paymentMethod = freezed,Object? savedCardId = freezed,Object? promoCode = freezed,Object? promoErrorCode = freezed,Object? promoError = freezed,Object? totals = null,Object? estimatedDeliveryFrom = freezed,Object? estimatedDeliveryTo = freezed,Object? zones = null,Object? paymentMethods = null,Object? savedCards = null,Object? savedAddresses = null,Object? hasCustomItems = null,Object? missingSteps = null,Object? canPlaceOrder = null,Object? orderId = freezed,}) {
  return _then(_CheckoutSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutLine>,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactInfo?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftSummary?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as DeliveryZone?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as SelectedSlot?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,savedCardId: freezed == savedCardId ? _self.savedCardId : savedCardId // ignore: cast_nullable_to_non_nullable
as String?,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,promoErrorCode: freezed == promoErrorCode ? _self.promoErrorCode : promoErrorCode // ignore: cast_nullable_to_non_nullable
as String?,promoError: freezed == promoError ? _self.promoError : promoError // ignore: cast_nullable_to_non_nullable
as String?,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CheckoutTotals,estimatedDeliveryFrom: freezed == estimatedDeliveryFrom ? _self.estimatedDeliveryFrom : estimatedDeliveryFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDeliveryTo: freezed == estimatedDeliveryTo ? _self.estimatedDeliveryTo : estimatedDeliveryTo // ignore: cast_nullable_to_non_nullable
as DateTime?,zones: null == zones ? _self._zones : zones // ignore: cast_nullable_to_non_nullable
as List<DeliveryZone>,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentOption>,savedCards: null == savedCards ? _self._savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as List<SavedCard>,savedAddresses: null == savedAddresses ? _self._savedAddresses : savedAddresses // ignore: cast_nullable_to_non_nullable
as List<SavedAddress>,hasCustomItems: null == hasCustomItems ? _self.hasCustomItems : hasCustomItems // ignore: cast_nullable_to_non_nullable
as bool,missingSteps: null == missingSteps ? _self._missingSteps : missingSteps // ignore: cast_nullable_to_non_nullable
as List<String>,canPlaceOrder: null == canPlaceOrder ? _self.canPlaceOrder : canPlaceOrder // ignore: cast_nullable_to_non_nullable
as bool,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $ContactInfoCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftSummaryCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $GiftSummaryCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryZoneCopyWith<$Res>? get zone {
    if (_self.zone == null) {
    return null;
  }

  return $DeliveryZoneCopyWith<$Res>(_self.zone!, (value) {
    return _then(_self.copyWith(zone: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectedSlotCopyWith<$Res>? get slot {
    if (_self.slot == null) {
    return null;
  }

  return $SelectedSlotCopyWith<$Res>(_self.slot!, (value) {
    return _then(_self.copyWith(slot: value));
  });
}/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutTotalsCopyWith<$Res> get totals {
  
  return $CheckoutTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$SlotWindow {

 String get windowId; String get start; String get end; int get capacity; int get available; bool get selectable;
/// Create a copy of SlotWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotWindowCopyWith<SlotWindow> get copyWith => _$SlotWindowCopyWithImpl<SlotWindow>(this as SlotWindow, _$identity);

  /// Serializes this SlotWindow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotWindow&&(identical(other.windowId, windowId) || other.windowId == windowId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.available, available) || other.available == available)&&(identical(other.selectable, selectable) || other.selectable == selectable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,windowId,start,end,capacity,available,selectable);

@override
String toString() {
  return 'SlotWindow(windowId: $windowId, start: $start, end: $end, capacity: $capacity, available: $available, selectable: $selectable)';
}


}

/// @nodoc
abstract mixin class $SlotWindowCopyWith<$Res>  {
  factory $SlotWindowCopyWith(SlotWindow value, $Res Function(SlotWindow) _then) = _$SlotWindowCopyWithImpl;
@useResult
$Res call({
 String windowId, String start, String end, int capacity, int available, bool selectable
});




}
/// @nodoc
class _$SlotWindowCopyWithImpl<$Res>
    implements $SlotWindowCopyWith<$Res> {
  _$SlotWindowCopyWithImpl(this._self, this._then);

  final SlotWindow _self;
  final $Res Function(SlotWindow) _then;

/// Create a copy of SlotWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? windowId = null,Object? start = null,Object? end = null,Object? capacity = null,Object? available = null,Object? selectable = null,}) {
  return _then(_self.copyWith(
windowId: null == windowId ? _self.windowId : windowId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,selectable: null == selectable ? _self.selectable : selectable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SlotWindow].
extension SlotWindowPatterns on SlotWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlotWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlotWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlotWindow value)  $default,){
final _that = this;
switch (_that) {
case _SlotWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlotWindow value)?  $default,){
final _that = this;
switch (_that) {
case _SlotWindow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String windowId,  String start,  String end,  int capacity,  int available,  bool selectable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlotWindow() when $default != null:
return $default(_that.windowId,_that.start,_that.end,_that.capacity,_that.available,_that.selectable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String windowId,  String start,  String end,  int capacity,  int available,  bool selectable)  $default,) {final _that = this;
switch (_that) {
case _SlotWindow():
return $default(_that.windowId,_that.start,_that.end,_that.capacity,_that.available,_that.selectable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String windowId,  String start,  String end,  int capacity,  int available,  bool selectable)?  $default,) {final _that = this;
switch (_that) {
case _SlotWindow() when $default != null:
return $default(_that.windowId,_that.start,_that.end,_that.capacity,_that.available,_that.selectable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SlotWindow implements SlotWindow {
  const _SlotWindow({required this.windowId, required this.start, required this.end, this.capacity = 0, this.available = 0, this.selectable = false});
  factory _SlotWindow.fromJson(Map<String, dynamic> json) => _$SlotWindowFromJson(json);

@override final  String windowId;
@override final  String start;
@override final  String end;
@override@JsonKey() final  int capacity;
@override@JsonKey() final  int available;
@override@JsonKey() final  bool selectable;

/// Create a copy of SlotWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotWindowCopyWith<_SlotWindow> get copyWith => __$SlotWindowCopyWithImpl<_SlotWindow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotWindowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotWindow&&(identical(other.windowId, windowId) || other.windowId == windowId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.available, available) || other.available == available)&&(identical(other.selectable, selectable) || other.selectable == selectable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,windowId,start,end,capacity,available,selectable);

@override
String toString() {
  return 'SlotWindow(windowId: $windowId, start: $start, end: $end, capacity: $capacity, available: $available, selectable: $selectable)';
}


}

/// @nodoc
abstract mixin class _$SlotWindowCopyWith<$Res> implements $SlotWindowCopyWith<$Res> {
  factory _$SlotWindowCopyWith(_SlotWindow value, $Res Function(_SlotWindow) _then) = __$SlotWindowCopyWithImpl;
@override @useResult
$Res call({
 String windowId, String start, String end, int capacity, int available, bool selectable
});




}
/// @nodoc
class __$SlotWindowCopyWithImpl<$Res>
    implements _$SlotWindowCopyWith<$Res> {
  __$SlotWindowCopyWithImpl(this._self, this._then);

  final _SlotWindow _self;
  final $Res Function(_SlotWindow) _then;

/// Create a copy of SlotWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? windowId = null,Object? start = null,Object? end = null,Object? capacity = null,Object? available = null,Object? selectable = null,}) {
  return _then(_SlotWindow(
windowId: null == windowId ? _self.windowId : windowId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,selectable: null == selectable ? _self.selectable : selectable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SlotDay {

 DateTime get date; List<SlotWindow> get windows;
/// Create a copy of SlotDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotDayCopyWith<SlotDay> get copyWith => _$SlotDayCopyWithImpl<SlotDay>(this as SlotDay, _$identity);

  /// Serializes this SlotDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotDay&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.windows, windows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(windows));

@override
String toString() {
  return 'SlotDay(date: $date, windows: $windows)';
}


}

/// @nodoc
abstract mixin class $SlotDayCopyWith<$Res>  {
  factory $SlotDayCopyWith(SlotDay value, $Res Function(SlotDay) _then) = _$SlotDayCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<SlotWindow> windows
});




}
/// @nodoc
class _$SlotDayCopyWithImpl<$Res>
    implements $SlotDayCopyWith<$Res> {
  _$SlotDayCopyWithImpl(this._self, this._then);

  final SlotDay _self;
  final $Res Function(SlotDay) _then;

/// Create a copy of SlotDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? windows = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,windows: null == windows ? _self.windows : windows // ignore: cast_nullable_to_non_nullable
as List<SlotWindow>,
  ));
}

}


/// Adds pattern-matching-related methods to [SlotDay].
extension SlotDayPatterns on SlotDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlotDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlotDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlotDay value)  $default,){
final _that = this;
switch (_that) {
case _SlotDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlotDay value)?  $default,){
final _that = this;
switch (_that) {
case _SlotDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<SlotWindow> windows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlotDay() when $default != null:
return $default(_that.date,_that.windows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<SlotWindow> windows)  $default,) {final _that = this;
switch (_that) {
case _SlotDay():
return $default(_that.date,_that.windows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<SlotWindow> windows)?  $default,) {final _that = this;
switch (_that) {
case _SlotDay() when $default != null:
return $default(_that.date,_that.windows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SlotDay implements SlotDay {
  const _SlotDay({required this.date, final  List<SlotWindow> windows = const <SlotWindow>[]}): _windows = windows;
  factory _SlotDay.fromJson(Map<String, dynamic> json) => _$SlotDayFromJson(json);

@override final  DateTime date;
 final  List<SlotWindow> _windows;
@override@JsonKey() List<SlotWindow> get windows {
  if (_windows is EqualUnmodifiableListView) return _windows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_windows);
}


/// Create a copy of SlotDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotDayCopyWith<_SlotDay> get copyWith => __$SlotDayCopyWithImpl<_SlotDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotDay&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._windows, _windows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_windows));

@override
String toString() {
  return 'SlotDay(date: $date, windows: $windows)';
}


}

/// @nodoc
abstract mixin class _$SlotDayCopyWith<$Res> implements $SlotDayCopyWith<$Res> {
  factory _$SlotDayCopyWith(_SlotDay value, $Res Function(_SlotDay) _then) = __$SlotDayCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<SlotWindow> windows
});




}
/// @nodoc
class __$SlotDayCopyWithImpl<$Res>
    implements _$SlotDayCopyWith<$Res> {
  __$SlotDayCopyWithImpl(this._self, this._then);

  final _SlotDay _self;
  final $Res Function(_SlotDay) _then;

/// Create a copy of SlotDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? windows = null,}) {
  return _then(_SlotDay(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,windows: null == windows ? _self._windows : windows // ignore: cast_nullable_to_non_nullable
as List<SlotWindow>,
  ));
}


}


/// @nodoc
mixin _$GiftPackaging {

 String get id; String get code; String get name; String? get description; String? get imageUrl; double get price; bool get isFree; bool get lowStock;
/// Create a copy of GiftPackaging
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftPackagingCopyWith<GiftPackaging> get copyWith => _$GiftPackagingCopyWithImpl<GiftPackaging>(this as GiftPackaging, _$identity);

  /// Serializes this GiftPackaging to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftPackaging&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.lowStock, lowStock) || other.lowStock == lowStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,description,imageUrl,price,isFree,lowStock);

@override
String toString() {
  return 'GiftPackaging(id: $id, code: $code, name: $name, description: $description, imageUrl: $imageUrl, price: $price, isFree: $isFree, lowStock: $lowStock)';
}


}

/// @nodoc
abstract mixin class $GiftPackagingCopyWith<$Res>  {
  factory $GiftPackagingCopyWith(GiftPackaging value, $Res Function(GiftPackaging) _then) = _$GiftPackagingCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String? description, String? imageUrl, double price, bool isFree, bool lowStock
});




}
/// @nodoc
class _$GiftPackagingCopyWithImpl<$Res>
    implements $GiftPackagingCopyWith<$Res> {
  _$GiftPackagingCopyWithImpl(this._self, this._then);

  final GiftPackaging _self;
  final $Res Function(GiftPackaging) _then;

/// Create a copy of GiftPackaging
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? description = freezed,Object? imageUrl = freezed,Object? price = null,Object? isFree = null,Object? lowStock = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,lowStock: null == lowStock ? _self.lowStock : lowStock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftPackaging].
extension GiftPackagingPatterns on GiftPackaging {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftPackaging value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftPackaging() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftPackaging value)  $default,){
final _that = this;
switch (_that) {
case _GiftPackaging():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftPackaging value)?  $default,){
final _that = this;
switch (_that) {
case _GiftPackaging() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String? description,  String? imageUrl,  double price,  bool isFree,  bool lowStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftPackaging() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.description,_that.imageUrl,_that.price,_that.isFree,_that.lowStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String? description,  String? imageUrl,  double price,  bool isFree,  bool lowStock)  $default,) {final _that = this;
switch (_that) {
case _GiftPackaging():
return $default(_that.id,_that.code,_that.name,_that.description,_that.imageUrl,_that.price,_that.isFree,_that.lowStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String? description,  String? imageUrl,  double price,  bool isFree,  bool lowStock)?  $default,) {final _that = this;
switch (_that) {
case _GiftPackaging() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.description,_that.imageUrl,_that.price,_that.isFree,_that.lowStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftPackaging implements GiftPackaging {
  const _GiftPackaging({required this.id, this.code = '', required this.name, this.description, this.imageUrl, this.price = 0, this.isFree = false, this.lowStock = false});
  factory _GiftPackaging.fromJson(Map<String, dynamic> json) => _$GiftPackagingFromJson(json);

@override final  String id;
@override@JsonKey() final  String code;
@override final  String name;
@override final  String? description;
@override final  String? imageUrl;
@override@JsonKey() final  double price;
@override@JsonKey() final  bool isFree;
@override@JsonKey() final  bool lowStock;

/// Create a copy of GiftPackaging
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftPackagingCopyWith<_GiftPackaging> get copyWith => __$GiftPackagingCopyWithImpl<_GiftPackaging>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftPackagingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftPackaging&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.lowStock, lowStock) || other.lowStock == lowStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,description,imageUrl,price,isFree,lowStock);

@override
String toString() {
  return 'GiftPackaging(id: $id, code: $code, name: $name, description: $description, imageUrl: $imageUrl, price: $price, isFree: $isFree, lowStock: $lowStock)';
}


}

/// @nodoc
abstract mixin class _$GiftPackagingCopyWith<$Res> implements $GiftPackagingCopyWith<$Res> {
  factory _$GiftPackagingCopyWith(_GiftPackaging value, $Res Function(_GiftPackaging) _then) = __$GiftPackagingCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String? description, String? imageUrl, double price, bool isFree, bool lowStock
});




}
/// @nodoc
class __$GiftPackagingCopyWithImpl<$Res>
    implements _$GiftPackagingCopyWith<$Res> {
  __$GiftPackagingCopyWithImpl(this._self, this._then);

  final _GiftPackaging _self;
  final $Res Function(_GiftPackaging) _then;

/// Create a copy of GiftPackaging
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? description = freezed,Object? imageUrl = freezed,Object? price = null,Object? isFree = null,Object? lowStock = null,}) {
  return _then(_GiftPackaging(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,lowStock: null == lowStock ? _self.lowStock : lowStock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$GiftCardType {

 String get id; String get code; String get name;@JsonKey(unknownEnumValue: GreetingCardKind.unknown) GreetingCardKind get kind; double get price; bool get requiresMessage;
/// Create a copy of GiftCardType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftCardTypeCopyWith<GiftCardType> get copyWith => _$GiftCardTypeCopyWithImpl<GiftCardType>(this as GiftCardType, _$identity);

  /// Serializes this GiftCardType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftCardType&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.price, price) || other.price == price)&&(identical(other.requiresMessage, requiresMessage) || other.requiresMessage == requiresMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,kind,price,requiresMessage);

@override
String toString() {
  return 'GiftCardType(id: $id, code: $code, name: $name, kind: $kind, price: $price, requiresMessage: $requiresMessage)';
}


}

/// @nodoc
abstract mixin class $GiftCardTypeCopyWith<$Res>  {
  factory $GiftCardTypeCopyWith(GiftCardType value, $Res Function(GiftCardType) _then) = _$GiftCardTypeCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name,@JsonKey(unknownEnumValue: GreetingCardKind.unknown) GreetingCardKind kind, double price, bool requiresMessage
});




}
/// @nodoc
class _$GiftCardTypeCopyWithImpl<$Res>
    implements $GiftCardTypeCopyWith<$Res> {
  _$GiftCardTypeCopyWithImpl(this._self, this._then);

  final GiftCardType _self;
  final $Res Function(GiftCardType) _then;

/// Create a copy of GiftCardType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? kind = null,Object? price = null,Object? requiresMessage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as GreetingCardKind,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,requiresMessage: null == requiresMessage ? _self.requiresMessage : requiresMessage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftCardType].
extension GiftCardTypePatterns on GiftCardType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftCardType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftCardType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftCardType value)  $default,){
final _that = this;
switch (_that) {
case _GiftCardType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftCardType value)?  $default,){
final _that = this;
switch (_that) {
case _GiftCardType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name, @JsonKey(unknownEnumValue: GreetingCardKind.unknown)  GreetingCardKind kind,  double price,  bool requiresMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftCardType() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.kind,_that.price,_that.requiresMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name, @JsonKey(unknownEnumValue: GreetingCardKind.unknown)  GreetingCardKind kind,  double price,  bool requiresMessage)  $default,) {final _that = this;
switch (_that) {
case _GiftCardType():
return $default(_that.id,_that.code,_that.name,_that.kind,_that.price,_that.requiresMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name, @JsonKey(unknownEnumValue: GreetingCardKind.unknown)  GreetingCardKind kind,  double price,  bool requiresMessage)?  $default,) {final _that = this;
switch (_that) {
case _GiftCardType() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.kind,_that.price,_that.requiresMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftCardType implements GiftCardType {
  const _GiftCardType({required this.id, this.code = '', required this.name, @JsonKey(unknownEnumValue: GreetingCardKind.unknown) this.kind = GreetingCardKind.none, this.price = 0, this.requiresMessage = false});
  factory _GiftCardType.fromJson(Map<String, dynamic> json) => _$GiftCardTypeFromJson(json);

@override final  String id;
@override@JsonKey() final  String code;
@override final  String name;
@override@JsonKey(unknownEnumValue: GreetingCardKind.unknown) final  GreetingCardKind kind;
@override@JsonKey() final  double price;
@override@JsonKey() final  bool requiresMessage;

/// Create a copy of GiftCardType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftCardTypeCopyWith<_GiftCardType> get copyWith => __$GiftCardTypeCopyWithImpl<_GiftCardType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftCardTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftCardType&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.price, price) || other.price == price)&&(identical(other.requiresMessage, requiresMessage) || other.requiresMessage == requiresMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,kind,price,requiresMessage);

@override
String toString() {
  return 'GiftCardType(id: $id, code: $code, name: $name, kind: $kind, price: $price, requiresMessage: $requiresMessage)';
}


}

/// @nodoc
abstract mixin class _$GiftCardTypeCopyWith<$Res> implements $GiftCardTypeCopyWith<$Res> {
  factory _$GiftCardTypeCopyWith(_GiftCardType value, $Res Function(_GiftCardType) _then) = __$GiftCardTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name,@JsonKey(unknownEnumValue: GreetingCardKind.unknown) GreetingCardKind kind, double price, bool requiresMessage
});




}
/// @nodoc
class __$GiftCardTypeCopyWithImpl<$Res>
    implements _$GiftCardTypeCopyWith<$Res> {
  __$GiftCardTypeCopyWithImpl(this._self, this._then);

  final _GiftCardType _self;
  final $Res Function(_GiftCardType) _then;

/// Create a copy of GiftCardType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? kind = null,Object? price = null,Object? requiresMessage = null,}) {
  return _then(_GiftCardType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as GreetingCardKind,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,requiresMessage: null == requiresMessage ? _self.requiresMessage : requiresMessage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$GiftCardDesign {

 String get id; String get code; String get name; String? get previewUrl;
/// Create a copy of GiftCardDesign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftCardDesignCopyWith<GiftCardDesign> get copyWith => _$GiftCardDesignCopyWithImpl<GiftCardDesign>(this as GiftCardDesign, _$identity);

  /// Serializes this GiftCardDesign to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftCardDesign&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,previewUrl);

@override
String toString() {
  return 'GiftCardDesign(id: $id, code: $code, name: $name, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class $GiftCardDesignCopyWith<$Res>  {
  factory $GiftCardDesignCopyWith(GiftCardDesign value, $Res Function(GiftCardDesign) _then) = _$GiftCardDesignCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String? previewUrl
});




}
/// @nodoc
class _$GiftCardDesignCopyWithImpl<$Res>
    implements $GiftCardDesignCopyWith<$Res> {
  _$GiftCardDesignCopyWithImpl(this._self, this._then);

  final GiftCardDesign _self;
  final $Res Function(GiftCardDesign) _then;

/// Create a copy of GiftCardDesign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? previewUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftCardDesign].
extension GiftCardDesignPatterns on GiftCardDesign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftCardDesign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftCardDesign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftCardDesign value)  $default,){
final _that = this;
switch (_that) {
case _GiftCardDesign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftCardDesign value)?  $default,){
final _that = this;
switch (_that) {
case _GiftCardDesign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String? previewUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftCardDesign() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.previewUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String? previewUrl)  $default,) {final _that = this;
switch (_that) {
case _GiftCardDesign():
return $default(_that.id,_that.code,_that.name,_that.previewUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String? previewUrl)?  $default,) {final _that = this;
switch (_that) {
case _GiftCardDesign() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.previewUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftCardDesign implements GiftCardDesign {
  const _GiftCardDesign({required this.id, this.code = '', required this.name, this.previewUrl});
  factory _GiftCardDesign.fromJson(Map<String, dynamic> json) => _$GiftCardDesignFromJson(json);

@override final  String id;
@override@JsonKey() final  String code;
@override final  String name;
@override final  String? previewUrl;

/// Create a copy of GiftCardDesign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftCardDesignCopyWith<_GiftCardDesign> get copyWith => __$GiftCardDesignCopyWithImpl<_GiftCardDesign>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftCardDesignToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftCardDesign&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,previewUrl);

@override
String toString() {
  return 'GiftCardDesign(id: $id, code: $code, name: $name, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class _$GiftCardDesignCopyWith<$Res> implements $GiftCardDesignCopyWith<$Res> {
  factory _$GiftCardDesignCopyWith(_GiftCardDesign value, $Res Function(_GiftCardDesign) _then) = __$GiftCardDesignCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String? previewUrl
});




}
/// @nodoc
class __$GiftCardDesignCopyWithImpl<$Res>
    implements _$GiftCardDesignCopyWith<$Res> {
  __$GiftCardDesignCopyWithImpl(this._self, this._then);

  final _GiftCardDesign _self;
  final $Res Function(_GiftCardDesign) _then;

/// Create a copy of GiftCardDesign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? previewUrl = freezed,}) {
  return _then(_GiftCardDesign(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GiftRules {

 bool get enabled; bool get hidePricesByDefault; bool get allowForCustomOrders; int get maxMessageLength; int get fromNameMaxLength; double? get freePackagingThreshold; String? get freePackagingOptionId;
/// Create a copy of GiftRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftRulesCopyWith<GiftRules> get copyWith => _$GiftRulesCopyWithImpl<GiftRules>(this as GiftRules, _$identity);

  /// Serializes this GiftRules to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftRules&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.hidePricesByDefault, hidePricesByDefault) || other.hidePricesByDefault == hidePricesByDefault)&&(identical(other.allowForCustomOrders, allowForCustomOrders) || other.allowForCustomOrders == allowForCustomOrders)&&(identical(other.maxMessageLength, maxMessageLength) || other.maxMessageLength == maxMessageLength)&&(identical(other.fromNameMaxLength, fromNameMaxLength) || other.fromNameMaxLength == fromNameMaxLength)&&(identical(other.freePackagingThreshold, freePackagingThreshold) || other.freePackagingThreshold == freePackagingThreshold)&&(identical(other.freePackagingOptionId, freePackagingOptionId) || other.freePackagingOptionId == freePackagingOptionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,hidePricesByDefault,allowForCustomOrders,maxMessageLength,fromNameMaxLength,freePackagingThreshold,freePackagingOptionId);

@override
String toString() {
  return 'GiftRules(enabled: $enabled, hidePricesByDefault: $hidePricesByDefault, allowForCustomOrders: $allowForCustomOrders, maxMessageLength: $maxMessageLength, fromNameMaxLength: $fromNameMaxLength, freePackagingThreshold: $freePackagingThreshold, freePackagingOptionId: $freePackagingOptionId)';
}


}

/// @nodoc
abstract mixin class $GiftRulesCopyWith<$Res>  {
  factory $GiftRulesCopyWith(GiftRules value, $Res Function(GiftRules) _then) = _$GiftRulesCopyWithImpl;
@useResult
$Res call({
 bool enabled, bool hidePricesByDefault, bool allowForCustomOrders, int maxMessageLength, int fromNameMaxLength, double? freePackagingThreshold, String? freePackagingOptionId
});




}
/// @nodoc
class _$GiftRulesCopyWithImpl<$Res>
    implements $GiftRulesCopyWith<$Res> {
  _$GiftRulesCopyWithImpl(this._self, this._then);

  final GiftRules _self;
  final $Res Function(GiftRules) _then;

/// Create a copy of GiftRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? hidePricesByDefault = null,Object? allowForCustomOrders = null,Object? maxMessageLength = null,Object? fromNameMaxLength = null,Object? freePackagingThreshold = freezed,Object? freePackagingOptionId = freezed,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,hidePricesByDefault: null == hidePricesByDefault ? _self.hidePricesByDefault : hidePricesByDefault // ignore: cast_nullable_to_non_nullable
as bool,allowForCustomOrders: null == allowForCustomOrders ? _self.allowForCustomOrders : allowForCustomOrders // ignore: cast_nullable_to_non_nullable
as bool,maxMessageLength: null == maxMessageLength ? _self.maxMessageLength : maxMessageLength // ignore: cast_nullable_to_non_nullable
as int,fromNameMaxLength: null == fromNameMaxLength ? _self.fromNameMaxLength : fromNameMaxLength // ignore: cast_nullable_to_non_nullable
as int,freePackagingThreshold: freezed == freePackagingThreshold ? _self.freePackagingThreshold : freePackagingThreshold // ignore: cast_nullable_to_non_nullable
as double?,freePackagingOptionId: freezed == freePackagingOptionId ? _self.freePackagingOptionId : freePackagingOptionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftRules].
extension GiftRulesPatterns on GiftRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftRules value)  $default,){
final _that = this;
switch (_that) {
case _GiftRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftRules value)?  $default,){
final _that = this;
switch (_that) {
case _GiftRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  bool hidePricesByDefault,  bool allowForCustomOrders,  int maxMessageLength,  int fromNameMaxLength,  double? freePackagingThreshold,  String? freePackagingOptionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftRules() when $default != null:
return $default(_that.enabled,_that.hidePricesByDefault,_that.allowForCustomOrders,_that.maxMessageLength,_that.fromNameMaxLength,_that.freePackagingThreshold,_that.freePackagingOptionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  bool hidePricesByDefault,  bool allowForCustomOrders,  int maxMessageLength,  int fromNameMaxLength,  double? freePackagingThreshold,  String? freePackagingOptionId)  $default,) {final _that = this;
switch (_that) {
case _GiftRules():
return $default(_that.enabled,_that.hidePricesByDefault,_that.allowForCustomOrders,_that.maxMessageLength,_that.fromNameMaxLength,_that.freePackagingThreshold,_that.freePackagingOptionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  bool hidePricesByDefault,  bool allowForCustomOrders,  int maxMessageLength,  int fromNameMaxLength,  double? freePackagingThreshold,  String? freePackagingOptionId)?  $default,) {final _that = this;
switch (_that) {
case _GiftRules() when $default != null:
return $default(_that.enabled,_that.hidePricesByDefault,_that.allowForCustomOrders,_that.maxMessageLength,_that.fromNameMaxLength,_that.freePackagingThreshold,_that.freePackagingOptionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftRules implements GiftRules {
  const _GiftRules({this.enabled = true, this.hidePricesByDefault = false, this.allowForCustomOrders = false, this.maxMessageLength = 200, this.fromNameMaxLength = 40, this.freePackagingThreshold, this.freePackagingOptionId});
  factory _GiftRules.fromJson(Map<String, dynamic> json) => _$GiftRulesFromJson(json);

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  bool hidePricesByDefault;
@override@JsonKey() final  bool allowForCustomOrders;
@override@JsonKey() final  int maxMessageLength;
@override@JsonKey() final  int fromNameMaxLength;
@override final  double? freePackagingThreshold;
@override final  String? freePackagingOptionId;

/// Create a copy of GiftRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftRulesCopyWith<_GiftRules> get copyWith => __$GiftRulesCopyWithImpl<_GiftRules>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftRulesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftRules&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.hidePricesByDefault, hidePricesByDefault) || other.hidePricesByDefault == hidePricesByDefault)&&(identical(other.allowForCustomOrders, allowForCustomOrders) || other.allowForCustomOrders == allowForCustomOrders)&&(identical(other.maxMessageLength, maxMessageLength) || other.maxMessageLength == maxMessageLength)&&(identical(other.fromNameMaxLength, fromNameMaxLength) || other.fromNameMaxLength == fromNameMaxLength)&&(identical(other.freePackagingThreshold, freePackagingThreshold) || other.freePackagingThreshold == freePackagingThreshold)&&(identical(other.freePackagingOptionId, freePackagingOptionId) || other.freePackagingOptionId == freePackagingOptionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,hidePricesByDefault,allowForCustomOrders,maxMessageLength,fromNameMaxLength,freePackagingThreshold,freePackagingOptionId);

@override
String toString() {
  return 'GiftRules(enabled: $enabled, hidePricesByDefault: $hidePricesByDefault, allowForCustomOrders: $allowForCustomOrders, maxMessageLength: $maxMessageLength, fromNameMaxLength: $fromNameMaxLength, freePackagingThreshold: $freePackagingThreshold, freePackagingOptionId: $freePackagingOptionId)';
}


}

/// @nodoc
abstract mixin class _$GiftRulesCopyWith<$Res> implements $GiftRulesCopyWith<$Res> {
  factory _$GiftRulesCopyWith(_GiftRules value, $Res Function(_GiftRules) _then) = __$GiftRulesCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, bool hidePricesByDefault, bool allowForCustomOrders, int maxMessageLength, int fromNameMaxLength, double? freePackagingThreshold, String? freePackagingOptionId
});




}
/// @nodoc
class __$GiftRulesCopyWithImpl<$Res>
    implements _$GiftRulesCopyWith<$Res> {
  __$GiftRulesCopyWithImpl(this._self, this._then);

  final _GiftRules _self;
  final $Res Function(_GiftRules) _then;

/// Create a copy of GiftRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? hidePricesByDefault = null,Object? allowForCustomOrders = null,Object? maxMessageLength = null,Object? fromNameMaxLength = null,Object? freePackagingThreshold = freezed,Object? freePackagingOptionId = freezed,}) {
  return _then(_GiftRules(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,hidePricesByDefault: null == hidePricesByDefault ? _self.hidePricesByDefault : hidePricesByDefault // ignore: cast_nullable_to_non_nullable
as bool,allowForCustomOrders: null == allowForCustomOrders ? _self.allowForCustomOrders : allowForCustomOrders // ignore: cast_nullable_to_non_nullable
as bool,maxMessageLength: null == maxMessageLength ? _self.maxMessageLength : maxMessageLength // ignore: cast_nullable_to_non_nullable
as int,fromNameMaxLength: null == fromNameMaxLength ? _self.fromNameMaxLength : fromNameMaxLength // ignore: cast_nullable_to_non_nullable
as int,freePackagingThreshold: freezed == freePackagingThreshold ? _self.freePackagingThreshold : freePackagingThreshold // ignore: cast_nullable_to_non_nullable
as double?,freePackagingOptionId: freezed == freePackagingOptionId ? _self.freePackagingOptionId : freePackagingOptionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GiftOptions {

 List<GiftPackaging> get packaging; List<GiftCardType> get cardTypes; List<GiftCardDesign> get cardDesigns;@JsonKey(unknownEnumValue: Occasion.unknown) List<Occasion> get occasions; GiftRules get rules;
/// Create a copy of GiftOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftOptionsCopyWith<GiftOptions> get copyWith => _$GiftOptionsCopyWithImpl<GiftOptions>(this as GiftOptions, _$identity);

  /// Serializes this GiftOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftOptions&&const DeepCollectionEquality().equals(other.packaging, packaging)&&const DeepCollectionEquality().equals(other.cardTypes, cardTypes)&&const DeepCollectionEquality().equals(other.cardDesigns, cardDesigns)&&const DeepCollectionEquality().equals(other.occasions, occasions)&&(identical(other.rules, rules) || other.rules == rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(packaging),const DeepCollectionEquality().hash(cardTypes),const DeepCollectionEquality().hash(cardDesigns),const DeepCollectionEquality().hash(occasions),rules);

@override
String toString() {
  return 'GiftOptions(packaging: $packaging, cardTypes: $cardTypes, cardDesigns: $cardDesigns, occasions: $occasions, rules: $rules)';
}


}

/// @nodoc
abstract mixin class $GiftOptionsCopyWith<$Res>  {
  factory $GiftOptionsCopyWith(GiftOptions value, $Res Function(GiftOptions) _then) = _$GiftOptionsCopyWithImpl;
@useResult
$Res call({
 List<GiftPackaging> packaging, List<GiftCardType> cardTypes, List<GiftCardDesign> cardDesigns,@JsonKey(unknownEnumValue: Occasion.unknown) List<Occasion> occasions, GiftRules rules
});


$GiftRulesCopyWith<$Res> get rules;

}
/// @nodoc
class _$GiftOptionsCopyWithImpl<$Res>
    implements $GiftOptionsCopyWith<$Res> {
  _$GiftOptionsCopyWithImpl(this._self, this._then);

  final GiftOptions _self;
  final $Res Function(GiftOptions) _then;

/// Create a copy of GiftOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packaging = null,Object? cardTypes = null,Object? cardDesigns = null,Object? occasions = null,Object? rules = null,}) {
  return _then(_self.copyWith(
packaging: null == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as List<GiftPackaging>,cardTypes: null == cardTypes ? _self.cardTypes : cardTypes // ignore: cast_nullable_to_non_nullable
as List<GiftCardType>,cardDesigns: null == cardDesigns ? _self.cardDesigns : cardDesigns // ignore: cast_nullable_to_non_nullable
as List<GiftCardDesign>,occasions: null == occasions ? _self.occasions : occasions // ignore: cast_nullable_to_non_nullable
as List<Occasion>,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as GiftRules,
  ));
}
/// Create a copy of GiftOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftRulesCopyWith<$Res> get rules {
  
  return $GiftRulesCopyWith<$Res>(_self.rules, (value) {
    return _then(_self.copyWith(rules: value));
  });
}
}


/// Adds pattern-matching-related methods to [GiftOptions].
extension GiftOptionsPatterns on GiftOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftOptions value)  $default,){
final _that = this;
switch (_that) {
case _GiftOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftOptions value)?  $default,){
final _that = this;
switch (_that) {
case _GiftOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GiftPackaging> packaging,  List<GiftCardType> cardTypes,  List<GiftCardDesign> cardDesigns, @JsonKey(unknownEnumValue: Occasion.unknown)  List<Occasion> occasions,  GiftRules rules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftOptions() when $default != null:
return $default(_that.packaging,_that.cardTypes,_that.cardDesigns,_that.occasions,_that.rules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GiftPackaging> packaging,  List<GiftCardType> cardTypes,  List<GiftCardDesign> cardDesigns, @JsonKey(unknownEnumValue: Occasion.unknown)  List<Occasion> occasions,  GiftRules rules)  $default,) {final _that = this;
switch (_that) {
case _GiftOptions():
return $default(_that.packaging,_that.cardTypes,_that.cardDesigns,_that.occasions,_that.rules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GiftPackaging> packaging,  List<GiftCardType> cardTypes,  List<GiftCardDesign> cardDesigns, @JsonKey(unknownEnumValue: Occasion.unknown)  List<Occasion> occasions,  GiftRules rules)?  $default,) {final _that = this;
switch (_that) {
case _GiftOptions() when $default != null:
return $default(_that.packaging,_that.cardTypes,_that.cardDesigns,_that.occasions,_that.rules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftOptions implements GiftOptions {
  const _GiftOptions({final  List<GiftPackaging> packaging = const <GiftPackaging>[], final  List<GiftCardType> cardTypes = const <GiftCardType>[], final  List<GiftCardDesign> cardDesigns = const <GiftCardDesign>[], @JsonKey(unknownEnumValue: Occasion.unknown) final  List<Occasion> occasions = const <Occasion>[], this.rules = const GiftRules()}): _packaging = packaging,_cardTypes = cardTypes,_cardDesigns = cardDesigns,_occasions = occasions;
  factory _GiftOptions.fromJson(Map<String, dynamic> json) => _$GiftOptionsFromJson(json);

 final  List<GiftPackaging> _packaging;
@override@JsonKey() List<GiftPackaging> get packaging {
  if (_packaging is EqualUnmodifiableListView) return _packaging;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packaging);
}

 final  List<GiftCardType> _cardTypes;
@override@JsonKey() List<GiftCardType> get cardTypes {
  if (_cardTypes is EqualUnmodifiableListView) return _cardTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cardTypes);
}

 final  List<GiftCardDesign> _cardDesigns;
@override@JsonKey() List<GiftCardDesign> get cardDesigns {
  if (_cardDesigns is EqualUnmodifiableListView) return _cardDesigns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cardDesigns);
}

 final  List<Occasion> _occasions;
@override@JsonKey(unknownEnumValue: Occasion.unknown) List<Occasion> get occasions {
  if (_occasions is EqualUnmodifiableListView) return _occasions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_occasions);
}

@override@JsonKey() final  GiftRules rules;

/// Create a copy of GiftOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftOptionsCopyWith<_GiftOptions> get copyWith => __$GiftOptionsCopyWithImpl<_GiftOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftOptions&&const DeepCollectionEquality().equals(other._packaging, _packaging)&&const DeepCollectionEquality().equals(other._cardTypes, _cardTypes)&&const DeepCollectionEquality().equals(other._cardDesigns, _cardDesigns)&&const DeepCollectionEquality().equals(other._occasions, _occasions)&&(identical(other.rules, rules) || other.rules == rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packaging),const DeepCollectionEquality().hash(_cardTypes),const DeepCollectionEquality().hash(_cardDesigns),const DeepCollectionEquality().hash(_occasions),rules);

@override
String toString() {
  return 'GiftOptions(packaging: $packaging, cardTypes: $cardTypes, cardDesigns: $cardDesigns, occasions: $occasions, rules: $rules)';
}


}

/// @nodoc
abstract mixin class _$GiftOptionsCopyWith<$Res> implements $GiftOptionsCopyWith<$Res> {
  factory _$GiftOptionsCopyWith(_GiftOptions value, $Res Function(_GiftOptions) _then) = __$GiftOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<GiftPackaging> packaging, List<GiftCardType> cardTypes, List<GiftCardDesign> cardDesigns,@JsonKey(unknownEnumValue: Occasion.unknown) List<Occasion> occasions, GiftRules rules
});


@override $GiftRulesCopyWith<$Res> get rules;

}
/// @nodoc
class __$GiftOptionsCopyWithImpl<$Res>
    implements _$GiftOptionsCopyWith<$Res> {
  __$GiftOptionsCopyWithImpl(this._self, this._then);

  final _GiftOptions _self;
  final $Res Function(_GiftOptions) _then;

/// Create a copy of GiftOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packaging = null,Object? cardTypes = null,Object? cardDesigns = null,Object? occasions = null,Object? rules = null,}) {
  return _then(_GiftOptions(
packaging: null == packaging ? _self._packaging : packaging // ignore: cast_nullable_to_non_nullable
as List<GiftPackaging>,cardTypes: null == cardTypes ? _self._cardTypes : cardTypes // ignore: cast_nullable_to_non_nullable
as List<GiftCardType>,cardDesigns: null == cardDesigns ? _self._cardDesigns : cardDesigns // ignore: cast_nullable_to_non_nullable
as List<GiftCardDesign>,occasions: null == occasions ? _self._occasions : occasions // ignore: cast_nullable_to_non_nullable
as List<Occasion>,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as GiftRules,
  ));
}

/// Create a copy of GiftOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftRulesCopyWith<$Res> get rules {
  
  return $GiftRulesCopyWith<$Res>(_self.rules, (value) {
    return _then(_self.copyWith(rules: value));
  });
}
}

/// @nodoc
mixin _$GiftSelection {

 bool get isGift; String? get recipientName; String? get recipientPhone; Occasion? get occasion; bool get surprise; String? get packagingOptionId; String? get cardTypeId; String? get cardDesignId; String? get message; String? get fromName; bool? get hidePrices;
/// Create a copy of GiftSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftSelectionCopyWith<GiftSelection> get copyWith => _$GiftSelectionCopyWithImpl<GiftSelection>(this as GiftSelection, _$identity);

  /// Serializes this GiftSelection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftSelection&&(identical(other.isGift, isGift) || other.isGift == isGift)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.surprise, surprise) || other.surprise == surprise)&&(identical(other.packagingOptionId, packagingOptionId) || other.packagingOptionId == packagingOptionId)&&(identical(other.cardTypeId, cardTypeId) || other.cardTypeId == cardTypeId)&&(identical(other.cardDesignId, cardDesignId) || other.cardDesignId == cardDesignId)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.hidePrices, hidePrices) || other.hidePrices == hidePrices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isGift,recipientName,recipientPhone,occasion,surprise,packagingOptionId,cardTypeId,cardDesignId,message,fromName,hidePrices);

@override
String toString() {
  return 'GiftSelection(isGift: $isGift, recipientName: $recipientName, recipientPhone: $recipientPhone, occasion: $occasion, surprise: $surprise, packagingOptionId: $packagingOptionId, cardTypeId: $cardTypeId, cardDesignId: $cardDesignId, message: $message, fromName: $fromName, hidePrices: $hidePrices)';
}


}

/// @nodoc
abstract mixin class $GiftSelectionCopyWith<$Res>  {
  factory $GiftSelectionCopyWith(GiftSelection value, $Res Function(GiftSelection) _then) = _$GiftSelectionCopyWithImpl;
@useResult
$Res call({
 bool isGift, String? recipientName, String? recipientPhone, Occasion? occasion, bool surprise, String? packagingOptionId, String? cardTypeId, String? cardDesignId, String? message, String? fromName, bool? hidePrices
});




}
/// @nodoc
class _$GiftSelectionCopyWithImpl<$Res>
    implements $GiftSelectionCopyWith<$Res> {
  _$GiftSelectionCopyWithImpl(this._self, this._then);

  final GiftSelection _self;
  final $Res Function(GiftSelection) _then;

/// Create a copy of GiftSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isGift = null,Object? recipientName = freezed,Object? recipientPhone = freezed,Object? occasion = freezed,Object? surprise = null,Object? packagingOptionId = freezed,Object? cardTypeId = freezed,Object? cardDesignId = freezed,Object? message = freezed,Object? fromName = freezed,Object? hidePrices = freezed,}) {
  return _then(_self.copyWith(
isGift: null == isGift ? _self.isGift : isGift // ignore: cast_nullable_to_non_nullable
as bool,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,recipientPhone: freezed == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as Occasion?,surprise: null == surprise ? _self.surprise : surprise // ignore: cast_nullable_to_non_nullable
as bool,packagingOptionId: freezed == packagingOptionId ? _self.packagingOptionId : packagingOptionId // ignore: cast_nullable_to_non_nullable
as String?,cardTypeId: freezed == cardTypeId ? _self.cardTypeId : cardTypeId // ignore: cast_nullable_to_non_nullable
as String?,cardDesignId: freezed == cardDesignId ? _self.cardDesignId : cardDesignId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,hidePrices: freezed == hidePrices ? _self.hidePrices : hidePrices // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftSelection].
extension GiftSelectionPatterns on GiftSelection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftSelection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftSelection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftSelection value)  $default,){
final _that = this;
switch (_that) {
case _GiftSelection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftSelection value)?  $default,){
final _that = this;
switch (_that) {
case _GiftSelection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isGift,  String? recipientName,  String? recipientPhone,  Occasion? occasion,  bool surprise,  String? packagingOptionId,  String? cardTypeId,  String? cardDesignId,  String? message,  String? fromName,  bool? hidePrices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftSelection() when $default != null:
return $default(_that.isGift,_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packagingOptionId,_that.cardTypeId,_that.cardDesignId,_that.message,_that.fromName,_that.hidePrices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isGift,  String? recipientName,  String? recipientPhone,  Occasion? occasion,  bool surprise,  String? packagingOptionId,  String? cardTypeId,  String? cardDesignId,  String? message,  String? fromName,  bool? hidePrices)  $default,) {final _that = this;
switch (_that) {
case _GiftSelection():
return $default(_that.isGift,_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packagingOptionId,_that.cardTypeId,_that.cardDesignId,_that.message,_that.fromName,_that.hidePrices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isGift,  String? recipientName,  String? recipientPhone,  Occasion? occasion,  bool surprise,  String? packagingOptionId,  String? cardTypeId,  String? cardDesignId,  String? message,  String? fromName,  bool? hidePrices)?  $default,) {final _that = this;
switch (_that) {
case _GiftSelection() when $default != null:
return $default(_that.isGift,_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packagingOptionId,_that.cardTypeId,_that.cardDesignId,_that.message,_that.fromName,_that.hidePrices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _GiftSelection implements GiftSelection {
  const _GiftSelection({required this.isGift, this.recipientName, this.recipientPhone, this.occasion, this.surprise = true, this.packagingOptionId, this.cardTypeId, this.cardDesignId, this.message, this.fromName, this.hidePrices});
  

@override final  bool isGift;
@override final  String? recipientName;
@override final  String? recipientPhone;
@override final  Occasion? occasion;
@override@JsonKey() final  bool surprise;
@override final  String? packagingOptionId;
@override final  String? cardTypeId;
@override final  String? cardDesignId;
@override final  String? message;
@override final  String? fromName;
@override final  bool? hidePrices;

/// Create a copy of GiftSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftSelectionCopyWith<_GiftSelection> get copyWith => __$GiftSelectionCopyWithImpl<_GiftSelection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftSelectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftSelection&&(identical(other.isGift, isGift) || other.isGift == isGift)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.surprise, surprise) || other.surprise == surprise)&&(identical(other.packagingOptionId, packagingOptionId) || other.packagingOptionId == packagingOptionId)&&(identical(other.cardTypeId, cardTypeId) || other.cardTypeId == cardTypeId)&&(identical(other.cardDesignId, cardDesignId) || other.cardDesignId == cardDesignId)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.hidePrices, hidePrices) || other.hidePrices == hidePrices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isGift,recipientName,recipientPhone,occasion,surprise,packagingOptionId,cardTypeId,cardDesignId,message,fromName,hidePrices);

@override
String toString() {
  return 'GiftSelection(isGift: $isGift, recipientName: $recipientName, recipientPhone: $recipientPhone, occasion: $occasion, surprise: $surprise, packagingOptionId: $packagingOptionId, cardTypeId: $cardTypeId, cardDesignId: $cardDesignId, message: $message, fromName: $fromName, hidePrices: $hidePrices)';
}


}

/// @nodoc
abstract mixin class _$GiftSelectionCopyWith<$Res> implements $GiftSelectionCopyWith<$Res> {
  factory _$GiftSelectionCopyWith(_GiftSelection value, $Res Function(_GiftSelection) _then) = __$GiftSelectionCopyWithImpl;
@override @useResult
$Res call({
 bool isGift, String? recipientName, String? recipientPhone, Occasion? occasion, bool surprise, String? packagingOptionId, String? cardTypeId, String? cardDesignId, String? message, String? fromName, bool? hidePrices
});




}
/// @nodoc
class __$GiftSelectionCopyWithImpl<$Res>
    implements _$GiftSelectionCopyWith<$Res> {
  __$GiftSelectionCopyWithImpl(this._self, this._then);

  final _GiftSelection _self;
  final $Res Function(_GiftSelection) _then;

/// Create a copy of GiftSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isGift = null,Object? recipientName = freezed,Object? recipientPhone = freezed,Object? occasion = freezed,Object? surprise = null,Object? packagingOptionId = freezed,Object? cardTypeId = freezed,Object? cardDesignId = freezed,Object? message = freezed,Object? fromName = freezed,Object? hidePrices = freezed,}) {
  return _then(_GiftSelection(
isGift: null == isGift ? _self.isGift : isGift // ignore: cast_nullable_to_non_nullable
as bool,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,recipientPhone: freezed == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as Occasion?,surprise: null == surprise ? _self.surprise : surprise // ignore: cast_nullable_to_non_nullable
as bool,packagingOptionId: freezed == packagingOptionId ? _self.packagingOptionId : packagingOptionId // ignore: cast_nullable_to_non_nullable
as String?,cardTypeId: freezed == cardTypeId ? _self.cardTypeId : cardTypeId // ignore: cast_nullable_to_non_nullable
as String?,cardDesignId: freezed == cardDesignId ? _self.cardDesignId : cardDesignId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,hidePrices: freezed == hidePrices ? _self.hidePrices : hidePrices // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$GiftIssue {

 String get code; String get message; String? get field;
/// Create a copy of GiftIssue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftIssueCopyWith<GiftIssue> get copyWith => _$GiftIssueCopyWithImpl<GiftIssue>(this as GiftIssue, _$identity);

  /// Serializes this GiftIssue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftIssue&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,field);

@override
String toString() {
  return 'GiftIssue(code: $code, message: $message, field: $field)';
}


}

/// @nodoc
abstract mixin class $GiftIssueCopyWith<$Res>  {
  factory $GiftIssueCopyWith(GiftIssue value, $Res Function(GiftIssue) _then) = _$GiftIssueCopyWithImpl;
@useResult
$Res call({
 String code, String message, String? field
});




}
/// @nodoc
class _$GiftIssueCopyWithImpl<$Res>
    implements $GiftIssueCopyWith<$Res> {
  _$GiftIssueCopyWithImpl(this._self, this._then);

  final GiftIssue _self;
  final $Res Function(GiftIssue) _then;

/// Create a copy of GiftIssue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? field = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftIssue].
extension GiftIssuePatterns on GiftIssue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftIssue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftIssue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftIssue value)  $default,){
final _that = this;
switch (_that) {
case _GiftIssue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftIssue value)?  $default,){
final _that = this;
switch (_that) {
case _GiftIssue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  String? field)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftIssue() when $default != null:
return $default(_that.code,_that.message,_that.field);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  String? field)  $default,) {final _that = this;
switch (_that) {
case _GiftIssue():
return $default(_that.code,_that.message,_that.field);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  String? field)?  $default,) {final _that = this;
switch (_that) {
case _GiftIssue() when $default != null:
return $default(_that.code,_that.message,_that.field);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftIssue implements GiftIssue {
  const _GiftIssue({required this.code, this.message = '', this.field});
  factory _GiftIssue.fromJson(Map<String, dynamic> json) => _$GiftIssueFromJson(json);

@override final  String code;
@override@JsonKey() final  String message;
@override final  String? field;

/// Create a copy of GiftIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftIssueCopyWith<_GiftIssue> get copyWith => __$GiftIssueCopyWithImpl<_GiftIssue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftIssueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftIssue&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,field);

@override
String toString() {
  return 'GiftIssue(code: $code, message: $message, field: $field)';
}


}

/// @nodoc
abstract mixin class _$GiftIssueCopyWith<$Res> implements $GiftIssueCopyWith<$Res> {
  factory _$GiftIssueCopyWith(_GiftIssue value, $Res Function(_GiftIssue) _then) = __$GiftIssueCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, String? field
});




}
/// @nodoc
class __$GiftIssueCopyWithImpl<$Res>
    implements _$GiftIssueCopyWith<$Res> {
  __$GiftIssueCopyWithImpl(this._self, this._then);

  final _GiftIssue _self;
  final $Res Function(_GiftIssue) _then;

/// Create a copy of GiftIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? field = freezed,}) {
  return _then(_GiftIssue(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GiftMessageCheck {

 bool get valid; int get length; int get maxLength; List<GiftIssue> get issues;
/// Create a copy of GiftMessageCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftMessageCheckCopyWith<GiftMessageCheck> get copyWith => _$GiftMessageCheckCopyWithImpl<GiftMessageCheck>(this as GiftMessageCheck, _$identity);

  /// Serializes this GiftMessageCheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftMessageCheck&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.length, length) || other.length == length)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&const DeepCollectionEquality().equals(other.issues, issues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,length,maxLength,const DeepCollectionEquality().hash(issues));

@override
String toString() {
  return 'GiftMessageCheck(valid: $valid, length: $length, maxLength: $maxLength, issues: $issues)';
}


}

/// @nodoc
abstract mixin class $GiftMessageCheckCopyWith<$Res>  {
  factory $GiftMessageCheckCopyWith(GiftMessageCheck value, $Res Function(GiftMessageCheck) _then) = _$GiftMessageCheckCopyWithImpl;
@useResult
$Res call({
 bool valid, int length, int maxLength, List<GiftIssue> issues
});




}
/// @nodoc
class _$GiftMessageCheckCopyWithImpl<$Res>
    implements $GiftMessageCheckCopyWith<$Res> {
  _$GiftMessageCheckCopyWithImpl(this._self, this._then);

  final GiftMessageCheck _self;
  final $Res Function(GiftMessageCheck) _then;

/// Create a copy of GiftMessageCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? length = null,Object? maxLength = null,Object? issues = null,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,maxLength: null == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as List<GiftIssue>,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftMessageCheck].
extension GiftMessageCheckPatterns on GiftMessageCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftMessageCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftMessageCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftMessageCheck value)  $default,){
final _that = this;
switch (_that) {
case _GiftMessageCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftMessageCheck value)?  $default,){
final _that = this;
switch (_that) {
case _GiftMessageCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid,  int length,  int maxLength,  List<GiftIssue> issues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftMessageCheck() when $default != null:
return $default(_that.valid,_that.length,_that.maxLength,_that.issues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid,  int length,  int maxLength,  List<GiftIssue> issues)  $default,) {final _that = this;
switch (_that) {
case _GiftMessageCheck():
return $default(_that.valid,_that.length,_that.maxLength,_that.issues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid,  int length,  int maxLength,  List<GiftIssue> issues)?  $default,) {final _that = this;
switch (_that) {
case _GiftMessageCheck() when $default != null:
return $default(_that.valid,_that.length,_that.maxLength,_that.issues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftMessageCheck implements GiftMessageCheck {
  const _GiftMessageCheck({this.valid = true, this.length = 0, this.maxLength = 0, final  List<GiftIssue> issues = const <GiftIssue>[]}): _issues = issues;
  factory _GiftMessageCheck.fromJson(Map<String, dynamic> json) => _$GiftMessageCheckFromJson(json);

@override@JsonKey() final  bool valid;
@override@JsonKey() final  int length;
@override@JsonKey() final  int maxLength;
 final  List<GiftIssue> _issues;
@override@JsonKey() List<GiftIssue> get issues {
  if (_issues is EqualUnmodifiableListView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_issues);
}


/// Create a copy of GiftMessageCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftMessageCheckCopyWith<_GiftMessageCheck> get copyWith => __$GiftMessageCheckCopyWithImpl<_GiftMessageCheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftMessageCheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftMessageCheck&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.length, length) || other.length == length)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&const DeepCollectionEquality().equals(other._issues, _issues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,length,maxLength,const DeepCollectionEquality().hash(_issues));

@override
String toString() {
  return 'GiftMessageCheck(valid: $valid, length: $length, maxLength: $maxLength, issues: $issues)';
}


}

/// @nodoc
abstract mixin class _$GiftMessageCheckCopyWith<$Res> implements $GiftMessageCheckCopyWith<$Res> {
  factory _$GiftMessageCheckCopyWith(_GiftMessageCheck value, $Res Function(_GiftMessageCheck) _then) = __$GiftMessageCheckCopyWithImpl;
@override @useResult
$Res call({
 bool valid, int length, int maxLength, List<GiftIssue> issues
});




}
/// @nodoc
class __$GiftMessageCheckCopyWithImpl<$Res>
    implements _$GiftMessageCheckCopyWith<$Res> {
  __$GiftMessageCheckCopyWithImpl(this._self, this._then);

  final _GiftMessageCheck _self;
  final $Res Function(_GiftMessageCheck) _then;

/// Create a copy of GiftMessageCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? length = null,Object? maxLength = null,Object? issues = null,}) {
  return _then(_GiftMessageCheck(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,maxLength: null == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as List<GiftIssue>,
  ));
}


}


/// @nodoc
mixin _$OrderPlaced {

 String get orderId; String get orderNumber;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; double get total;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get paymentMethod;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get paymentStatus; String? get paymentRedirectUrl; String? get giftReceiptCode;
/// Create a copy of OrderPlaced
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPlacedCopyWith<OrderPlaced> get copyWith => _$OrderPlacedCopyWithImpl<OrderPlaced>(this as OrderPlaced, _$identity);

  /// Serializes this OrderPlaced to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPlaced&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.total, total) || other.total == total)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentRedirectUrl, paymentRedirectUrl) || other.paymentRedirectUrl == paymentRedirectUrl)&&(identical(other.giftReceiptCode, giftReceiptCode) || other.giftReceiptCode == giftReceiptCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,orderNumber,status,total,paymentMethod,paymentStatus,paymentRedirectUrl,giftReceiptCode);

@override
String toString() {
  return 'OrderPlaced(orderId: $orderId, orderNumber: $orderNumber, status: $status, total: $total, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, paymentRedirectUrl: $paymentRedirectUrl, giftReceiptCode: $giftReceiptCode)';
}


}

/// @nodoc
abstract mixin class $OrderPlacedCopyWith<$Res>  {
  factory $OrderPlacedCopyWith(OrderPlaced value, $Res Function(OrderPlaced) _then) = _$OrderPlacedCopyWithImpl;
@useResult
$Res call({
 String orderId, String orderNumber,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, double total,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, String? paymentRedirectUrl, String? giftReceiptCode
});




}
/// @nodoc
class _$OrderPlacedCopyWithImpl<$Res>
    implements $OrderPlacedCopyWith<$Res> {
  _$OrderPlacedCopyWithImpl(this._self, this._then);

  final OrderPlaced _self;
  final $Res Function(OrderPlaced) _then;

/// Create a copy of OrderPlaced
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? orderNumber = null,Object? status = null,Object? total = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? paymentRedirectUrl = freezed,Object? giftReceiptCode = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,paymentRedirectUrl: freezed == paymentRedirectUrl ? _self.paymentRedirectUrl : paymentRedirectUrl // ignore: cast_nullable_to_non_nullable
as String?,giftReceiptCode: freezed == giftReceiptCode ? _self.giftReceiptCode : giftReceiptCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPlaced].
extension OrderPlacedPatterns on OrderPlaced {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPlaced value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPlaced() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPlaced value)  $default,){
final _that = this;
switch (_that) {
case _OrderPlaced():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPlaced value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPlaced() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  double total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? paymentRedirectUrl,  String? giftReceiptCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPlaced() when $default != null:
return $default(_that.orderId,_that.orderNumber,_that.status,_that.total,_that.paymentMethod,_that.paymentStatus,_that.paymentRedirectUrl,_that.giftReceiptCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  double total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? paymentRedirectUrl,  String? giftReceiptCode)  $default,) {final _that = this;
switch (_that) {
case _OrderPlaced():
return $default(_that.orderId,_that.orderNumber,_that.status,_that.total,_that.paymentMethod,_that.paymentStatus,_that.paymentRedirectUrl,_that.giftReceiptCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  double total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus paymentStatus,  String? paymentRedirectUrl,  String? giftReceiptCode)?  $default,) {final _that = this;
switch (_that) {
case _OrderPlaced() when $default != null:
return $default(_that.orderId,_that.orderNumber,_that.status,_that.total,_that.paymentMethod,_that.paymentStatus,_that.paymentRedirectUrl,_that.giftReceiptCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPlaced implements OrderPlaced {
  const _OrderPlaced({required this.orderId, required this.orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status = OrderStatus.newOrder, this.total = 0, @JsonKey(unknownEnumValue: PaymentMethod.unknown) this.paymentMethod = PaymentMethod.card, @JsonKey(unknownEnumValue: PaymentStatus.unknown) this.paymentStatus = PaymentStatus.pending, this.paymentRedirectUrl, this.giftReceiptCode});
  factory _OrderPlaced.fromJson(Map<String, dynamic> json) => _$OrderPlacedFromJson(json);

@override final  String orderId;
@override final  String orderNumber;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
@override@JsonKey() final  double total;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod paymentMethod;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus paymentStatus;
@override final  String? paymentRedirectUrl;
@override final  String? giftReceiptCode;

/// Create a copy of OrderPlaced
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPlacedCopyWith<_OrderPlaced> get copyWith => __$OrderPlacedCopyWithImpl<_OrderPlaced>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPlacedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPlaced&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.total, total) || other.total == total)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentRedirectUrl, paymentRedirectUrl) || other.paymentRedirectUrl == paymentRedirectUrl)&&(identical(other.giftReceiptCode, giftReceiptCode) || other.giftReceiptCode == giftReceiptCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,orderNumber,status,total,paymentMethod,paymentStatus,paymentRedirectUrl,giftReceiptCode);

@override
String toString() {
  return 'OrderPlaced(orderId: $orderId, orderNumber: $orderNumber, status: $status, total: $total, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, paymentRedirectUrl: $paymentRedirectUrl, giftReceiptCode: $giftReceiptCode)';
}


}

/// @nodoc
abstract mixin class _$OrderPlacedCopyWith<$Res> implements $OrderPlacedCopyWith<$Res> {
  factory _$OrderPlacedCopyWith(_OrderPlaced value, $Res Function(_OrderPlaced) _then) = __$OrderPlacedCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String orderNumber,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, double total,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus paymentStatus, String? paymentRedirectUrl, String? giftReceiptCode
});




}
/// @nodoc
class __$OrderPlacedCopyWithImpl<$Res>
    implements _$OrderPlacedCopyWith<$Res> {
  __$OrderPlacedCopyWithImpl(this._self, this._then);

  final _OrderPlaced _self;
  final $Res Function(_OrderPlaced) _then;

/// Create a copy of OrderPlaced
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? orderNumber = null,Object? status = null,Object? total = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? paymentRedirectUrl = freezed,Object? giftReceiptCode = freezed,}) {
  return _then(_OrderPlaced(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,paymentRedirectUrl: freezed == paymentRedirectUrl ? _self.paymentRedirectUrl : paymentRedirectUrl // ignore: cast_nullable_to_non_nullable
as String?,giftReceiptCode: freezed == giftReceiptCode ? _self.giftReceiptCode : giftReceiptCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaymentInfo {

 String get orderNumber;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get orderStatus;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get method;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get status; double get amount; String? get redirectUrl; String? get failureMessage;
/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentInfoCopyWith<PaymentInfo> get copyWith => _$PaymentInfoCopyWithImpl<PaymentInfo>(this as PaymentInfo, _$identity);

  /// Serializes this PaymentInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentInfo&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderNumber,orderStatus,method,status,amount,redirectUrl,failureMessage);

@override
String toString() {
  return 'PaymentInfo(orderNumber: $orderNumber, orderStatus: $orderStatus, method: $method, status: $status, amount: $amount, redirectUrl: $redirectUrl, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentInfoCopyWith<$Res>  {
  factory $PaymentInfoCopyWith(PaymentInfo value, $Res Function(PaymentInfo) _then) = _$PaymentInfoCopyWithImpl;
@useResult
$Res call({
 String orderNumber,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus orderStatus,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, double amount, String? redirectUrl, String? failureMessage
});




}
/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._self, this._then);

  final PaymentInfo _self;
  final $Res Function(PaymentInfo) _then;

/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNumber = null,Object? orderStatus = null,Object? method = null,Object? status = null,Object? amount = null,Object? redirectUrl = freezed,Object? failureMessage = freezed,}) {
  return _then(_self.copyWith(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentInfo].
extension PaymentInfoPatterns on PaymentInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentInfo value)  $default,){
final _that = this;
switch (_that) {
case _PaymentInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus orderStatus, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  double amount,  String? redirectUrl,  String? failureMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentInfo() when $default != null:
return $default(_that.orderNumber,_that.orderStatus,_that.method,_that.status,_that.amount,_that.redirectUrl,_that.failureMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus orderStatus, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  double amount,  String? redirectUrl,  String? failureMessage)  $default,) {final _that = this;
switch (_that) {
case _PaymentInfo():
return $default(_that.orderNumber,_that.orderStatus,_that.method,_that.status,_that.amount,_that.redirectUrl,_that.failureMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus orderStatus, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  double amount,  String? redirectUrl,  String? failureMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaymentInfo() when $default != null:
return $default(_that.orderNumber,_that.orderStatus,_that.method,_that.status,_that.amount,_that.redirectUrl,_that.failureMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentInfo implements PaymentInfo {
  const _PaymentInfo({required this.orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.orderStatus = OrderStatus.newOrder, @JsonKey(unknownEnumValue: PaymentMethod.unknown) this.method = PaymentMethod.card, @JsonKey(unknownEnumValue: PaymentStatus.unknown) this.status = PaymentStatus.pending, this.amount = 0, this.redirectUrl, this.failureMessage});
  factory _PaymentInfo.fromJson(Map<String, dynamic> json) => _$PaymentInfoFromJson(json);

@override final  String orderNumber;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus orderStatus;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod method;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus status;
@override@JsonKey() final  double amount;
@override final  String? redirectUrl;
@override final  String? failureMessage;

/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentInfoCopyWith<_PaymentInfo> get copyWith => __$PaymentInfoCopyWithImpl<_PaymentInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentInfo&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderNumber,orderStatus,method,status,amount,redirectUrl,failureMessage);

@override
String toString() {
  return 'PaymentInfo(orderNumber: $orderNumber, orderStatus: $orderStatus, method: $method, status: $status, amount: $amount, redirectUrl: $redirectUrl, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentInfoCopyWith<$Res> implements $PaymentInfoCopyWith<$Res> {
  factory _$PaymentInfoCopyWith(_PaymentInfo value, $Res Function(_PaymentInfo) _then) = __$PaymentInfoCopyWithImpl;
@override @useResult
$Res call({
 String orderNumber,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus orderStatus,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, double amount, String? redirectUrl, String? failureMessage
});




}
/// @nodoc
class __$PaymentInfoCopyWithImpl<$Res>
    implements _$PaymentInfoCopyWith<$Res> {
  __$PaymentInfoCopyWithImpl(this._self, this._then);

  final _PaymentInfo _self;
  final $Res Function(_PaymentInfo) _then;

/// Create a copy of PaymentInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNumber = null,Object? orderStatus = null,Object? method = null,Object? status = null,Object? amount = null,Object? redirectUrl = freezed,Object? failureMessage = freezed,}) {
  return _then(_PaymentInfo(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
