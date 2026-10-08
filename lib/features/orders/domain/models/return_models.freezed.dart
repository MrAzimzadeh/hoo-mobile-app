// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnItem {

 String get orderLineId; int get quantity;@JsonKey(unknownEnumValue: Size.unknown) Size? get exchangeSize;
/// Create a copy of ReturnItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnItemCopyWith<ReturnItem> get copyWith => _$ReturnItemCopyWithImpl<ReturnItem>(this as ReturnItem, _$identity);

  /// Serializes this ReturnItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnItem&&(identical(other.orderLineId, orderLineId) || other.orderLineId == orderLineId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.exchangeSize, exchangeSize) || other.exchangeSize == exchangeSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderLineId,quantity,exchangeSize);

@override
String toString() {
  return 'ReturnItem(orderLineId: $orderLineId, quantity: $quantity, exchangeSize: $exchangeSize)';
}


}

/// @nodoc
abstract mixin class $ReturnItemCopyWith<$Res>  {
  factory $ReturnItemCopyWith(ReturnItem value, $Res Function(ReturnItem) _then) = _$ReturnItemCopyWithImpl;
@useResult
$Res call({
 String orderLineId, int quantity,@JsonKey(unknownEnumValue: Size.unknown) Size? exchangeSize
});




}
/// @nodoc
class _$ReturnItemCopyWithImpl<$Res>
    implements $ReturnItemCopyWith<$Res> {
  _$ReturnItemCopyWithImpl(this._self, this._then);

  final ReturnItem _self;
  final $Res Function(ReturnItem) _then;

/// Create a copy of ReturnItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderLineId = null,Object? quantity = null,Object? exchangeSize = freezed,}) {
  return _then(_self.copyWith(
orderLineId: null == orderLineId ? _self.orderLineId : orderLineId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,exchangeSize: freezed == exchangeSize ? _self.exchangeSize : exchangeSize // ignore: cast_nullable_to_non_nullable
as Size?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnItem].
extension ReturnItemPatterns on ReturnItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnItem value)  $default,){
final _that = this;
switch (_that) {
case _ReturnItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderLineId,  int quantity, @JsonKey(unknownEnumValue: Size.unknown)  Size? exchangeSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnItem() when $default != null:
return $default(_that.orderLineId,_that.quantity,_that.exchangeSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderLineId,  int quantity, @JsonKey(unknownEnumValue: Size.unknown)  Size? exchangeSize)  $default,) {final _that = this;
switch (_that) {
case _ReturnItem():
return $default(_that.orderLineId,_that.quantity,_that.exchangeSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderLineId,  int quantity, @JsonKey(unknownEnumValue: Size.unknown)  Size? exchangeSize)?  $default,) {final _that = this;
switch (_that) {
case _ReturnItem() when $default != null:
return $default(_that.orderLineId,_that.quantity,_that.exchangeSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnItem implements ReturnItem {
  const _ReturnItem({required this.orderLineId, required this.quantity, @JsonKey(unknownEnumValue: Size.unknown) this.exchangeSize});
  factory _ReturnItem.fromJson(Map<String, dynamic> json) => _$ReturnItemFromJson(json);

@override final  String orderLineId;
@override final  int quantity;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? exchangeSize;

/// Create a copy of ReturnItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnItemCopyWith<_ReturnItem> get copyWith => __$ReturnItemCopyWithImpl<_ReturnItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnItem&&(identical(other.orderLineId, orderLineId) || other.orderLineId == orderLineId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.exchangeSize, exchangeSize) || other.exchangeSize == exchangeSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderLineId,quantity,exchangeSize);

@override
String toString() {
  return 'ReturnItem(orderLineId: $orderLineId, quantity: $quantity, exchangeSize: $exchangeSize)';
}


}

/// @nodoc
abstract mixin class _$ReturnItemCopyWith<$Res> implements $ReturnItemCopyWith<$Res> {
  factory _$ReturnItemCopyWith(_ReturnItem value, $Res Function(_ReturnItem) _then) = __$ReturnItemCopyWithImpl;
@override @useResult
$Res call({
 String orderLineId, int quantity,@JsonKey(unknownEnumValue: Size.unknown) Size? exchangeSize
});




}
/// @nodoc
class __$ReturnItemCopyWithImpl<$Res>
    implements _$ReturnItemCopyWith<$Res> {
  __$ReturnItemCopyWithImpl(this._self, this._then);

  final _ReturnItem _self;
  final $Res Function(_ReturnItem) _then;

/// Create a copy of ReturnItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderLineId = null,Object? quantity = null,Object? exchangeSize = freezed,}) {
  return _then(_ReturnItem(
orderLineId: null == orderLineId ? _self.orderLineId : orderLineId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,exchangeSize: freezed == exchangeSize ? _self.exchangeSize : exchangeSize // ignore: cast_nullable_to_non_nullable
as Size?,
  ));
}


}


/// @nodoc
mixin _$ReturnInfo {

 String get id; String get orderNumber; ReturnKind get kind;@JsonKey(unknownEnumValue: ReturnStatus.unknown) ReturnStatus get status;@JsonKey(unknownEnumValue: ReturnChannel.unknown) ReturnChannel get channel; List<ReturnItem> get items; String? get reason; String? get resolutionNote; DateTime get createdAt;
/// Create a copy of ReturnInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnInfoCopyWith<ReturnInfo> get copyWith => _$ReturnInfoCopyWithImpl<ReturnInfo>(this as ReturnInfo, _$identity);

  /// Serializes this ReturnInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.resolutionNote, resolutionNote) || other.resolutionNote == resolutionNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,kind,status,channel,const DeepCollectionEquality().hash(items),reason,resolutionNote,createdAt);

@override
String toString() {
  return 'ReturnInfo(id: $id, orderNumber: $orderNumber, kind: $kind, status: $status, channel: $channel, items: $items, reason: $reason, resolutionNote: $resolutionNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReturnInfoCopyWith<$Res>  {
  factory $ReturnInfoCopyWith(ReturnInfo value, $Res Function(ReturnInfo) _then) = _$ReturnInfoCopyWithImpl;
@useResult
$Res call({
 String id, String orderNumber, ReturnKind kind,@JsonKey(unknownEnumValue: ReturnStatus.unknown) ReturnStatus status,@JsonKey(unknownEnumValue: ReturnChannel.unknown) ReturnChannel channel, List<ReturnItem> items, String? reason, String? resolutionNote, DateTime createdAt
});




}
/// @nodoc
class _$ReturnInfoCopyWithImpl<$Res>
    implements $ReturnInfoCopyWith<$Res> {
  _$ReturnInfoCopyWithImpl(this._self, this._then);

  final ReturnInfo _self;
  final $Res Function(ReturnInfo) _then;

/// Create a copy of ReturnInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? kind = null,Object? status = null,Object? channel = null,Object? items = null,Object? reason = freezed,Object? resolutionNote = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReturnKind,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnStatus,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ReturnChannel,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReturnItem>,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,resolutionNote: freezed == resolutionNote ? _self.resolutionNote : resolutionNote // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnInfo].
extension ReturnInfoPatterns on ReturnInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnInfo value)  $default,){
final _that = this;
switch (_that) {
case _ReturnInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderNumber,  ReturnKind kind, @JsonKey(unknownEnumValue: ReturnStatus.unknown)  ReturnStatus status, @JsonKey(unknownEnumValue: ReturnChannel.unknown)  ReturnChannel channel,  List<ReturnItem> items,  String? reason,  String? resolutionNote,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnInfo() when $default != null:
return $default(_that.id,_that.orderNumber,_that.kind,_that.status,_that.channel,_that.items,_that.reason,_that.resolutionNote,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderNumber,  ReturnKind kind, @JsonKey(unknownEnumValue: ReturnStatus.unknown)  ReturnStatus status, @JsonKey(unknownEnumValue: ReturnChannel.unknown)  ReturnChannel channel,  List<ReturnItem> items,  String? reason,  String? resolutionNote,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ReturnInfo():
return $default(_that.id,_that.orderNumber,_that.kind,_that.status,_that.channel,_that.items,_that.reason,_that.resolutionNote,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderNumber,  ReturnKind kind, @JsonKey(unknownEnumValue: ReturnStatus.unknown)  ReturnStatus status, @JsonKey(unknownEnumValue: ReturnChannel.unknown)  ReturnChannel channel,  List<ReturnItem> items,  String? reason,  String? resolutionNote,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ReturnInfo() when $default != null:
return $default(_that.id,_that.orderNumber,_that.kind,_that.status,_that.channel,_that.items,_that.reason,_that.resolutionNote,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnInfo extends ReturnInfo {
  const _ReturnInfo({required this.id, required this.orderNumber, this.kind = ReturnKind.returnItem, @JsonKey(unknownEnumValue: ReturnStatus.unknown) this.status = ReturnStatus.unknown, @JsonKey(unknownEnumValue: ReturnChannel.unknown) this.channel = ReturnChannel.unknown, final  List<ReturnItem> items = const <ReturnItem>[], this.reason, this.resolutionNote, required this.createdAt}): _items = items,super._();
  factory _ReturnInfo.fromJson(Map<String, dynamic> json) => _$ReturnInfoFromJson(json);

@override final  String id;
@override final  String orderNumber;
@override@JsonKey() final  ReturnKind kind;
@override@JsonKey(unknownEnumValue: ReturnStatus.unknown) final  ReturnStatus status;
@override@JsonKey(unknownEnumValue: ReturnChannel.unknown) final  ReturnChannel channel;
 final  List<ReturnItem> _items;
@override@JsonKey() List<ReturnItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? reason;
@override final  String? resolutionNote;
@override final  DateTime createdAt;

/// Create a copy of ReturnInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnInfoCopyWith<_ReturnInfo> get copyWith => __$ReturnInfoCopyWithImpl<_ReturnInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.resolutionNote, resolutionNote) || other.resolutionNote == resolutionNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,kind,status,channel,const DeepCollectionEquality().hash(_items),reason,resolutionNote,createdAt);

@override
String toString() {
  return 'ReturnInfo(id: $id, orderNumber: $orderNumber, kind: $kind, status: $status, channel: $channel, items: $items, reason: $reason, resolutionNote: $resolutionNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReturnInfoCopyWith<$Res> implements $ReturnInfoCopyWith<$Res> {
  factory _$ReturnInfoCopyWith(_ReturnInfo value, $Res Function(_ReturnInfo) _then) = __$ReturnInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderNumber, ReturnKind kind,@JsonKey(unknownEnumValue: ReturnStatus.unknown) ReturnStatus status,@JsonKey(unknownEnumValue: ReturnChannel.unknown) ReturnChannel channel, List<ReturnItem> items, String? reason, String? resolutionNote, DateTime createdAt
});




}
/// @nodoc
class __$ReturnInfoCopyWithImpl<$Res>
    implements _$ReturnInfoCopyWith<$Res> {
  __$ReturnInfoCopyWithImpl(this._self, this._then);

  final _ReturnInfo _self;
  final $Res Function(_ReturnInfo) _then;

/// Create a copy of ReturnInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? kind = null,Object? status = null,Object? channel = null,Object? items = null,Object? reason = freezed,Object? resolutionNote = freezed,Object? createdAt = null,}) {
  return _then(_ReturnInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReturnKind,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnStatus,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ReturnChannel,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReturnItem>,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,resolutionNote: freezed == resolutionNote ? _self.resolutionNote : resolutionNote // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$GiftReceiptLine {

 String get lineId; String get name; String? get color;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; int get quantity; bool get exchangeable;@JsonKey(unknownEnumValue: Size.unknown) List<Size> get availableSizes;
/// Create a copy of GiftReceiptLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftReceiptLineCopyWith<GiftReceiptLine> get copyWith => _$GiftReceiptLineCopyWithImpl<GiftReceiptLine>(this as GiftReceiptLine, _$identity);

  /// Serializes this GiftReceiptLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftReceiptLine&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.exchangeable, exchangeable) || other.exchangeable == exchangeable)&&const DeepCollectionEquality().equals(other.availableSizes, availableSizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineId,name,color,size,quantity,exchangeable,const DeepCollectionEquality().hash(availableSizes));

@override
String toString() {
  return 'GiftReceiptLine(lineId: $lineId, name: $name, color: $color, size: $size, quantity: $quantity, exchangeable: $exchangeable, availableSizes: $availableSizes)';
}


}

/// @nodoc
abstract mixin class $GiftReceiptLineCopyWith<$Res>  {
  factory $GiftReceiptLineCopyWith(GiftReceiptLine value, $Res Function(GiftReceiptLine) _then) = _$GiftReceiptLineCopyWithImpl;
@useResult
$Res call({
 String lineId, String name, String? color,@JsonKey(unknownEnumValue: Size.unknown) Size? size, int quantity, bool exchangeable,@JsonKey(unknownEnumValue: Size.unknown) List<Size> availableSizes
});




}
/// @nodoc
class _$GiftReceiptLineCopyWithImpl<$Res>
    implements $GiftReceiptLineCopyWith<$Res> {
  _$GiftReceiptLineCopyWithImpl(this._self, this._then);

  final GiftReceiptLine _self;
  final $Res Function(GiftReceiptLine) _then;

/// Create a copy of GiftReceiptLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineId = null,Object? name = null,Object? color = freezed,Object? size = freezed,Object? quantity = null,Object? exchangeable = null,Object? availableSizes = null,}) {
  return _then(_self.copyWith(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,exchangeable: null == exchangeable ? _self.exchangeable : exchangeable // ignore: cast_nullable_to_non_nullable
as bool,availableSizes: null == availableSizes ? _self.availableSizes : availableSizes // ignore: cast_nullable_to_non_nullable
as List<Size>,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftReceiptLine].
extension GiftReceiptLinePatterns on GiftReceiptLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftReceiptLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftReceiptLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftReceiptLine value)  $default,){
final _that = this;
switch (_that) {
case _GiftReceiptLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftReceiptLine value)?  $default,){
final _that = this;
switch (_that) {
case _GiftReceiptLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lineId,  String name,  String? color, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  int quantity,  bool exchangeable, @JsonKey(unknownEnumValue: Size.unknown)  List<Size> availableSizes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftReceiptLine() when $default != null:
return $default(_that.lineId,_that.name,_that.color,_that.size,_that.quantity,_that.exchangeable,_that.availableSizes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lineId,  String name,  String? color, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  int quantity,  bool exchangeable, @JsonKey(unknownEnumValue: Size.unknown)  List<Size> availableSizes)  $default,) {final _that = this;
switch (_that) {
case _GiftReceiptLine():
return $default(_that.lineId,_that.name,_that.color,_that.size,_that.quantity,_that.exchangeable,_that.availableSizes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lineId,  String name,  String? color, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  int quantity,  bool exchangeable, @JsonKey(unknownEnumValue: Size.unknown)  List<Size> availableSizes)?  $default,) {final _that = this;
switch (_that) {
case _GiftReceiptLine() when $default != null:
return $default(_that.lineId,_that.name,_that.color,_that.size,_that.quantity,_that.exchangeable,_that.availableSizes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftReceiptLine implements GiftReceiptLine {
  const _GiftReceiptLine({required this.lineId, required this.name, this.color, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.quantity = 1, this.exchangeable = false, @JsonKey(unknownEnumValue: Size.unknown) final  List<Size> availableSizes = const <Size>[]}): _availableSizes = availableSizes;
  factory _GiftReceiptLine.fromJson(Map<String, dynamic> json) => _$GiftReceiptLineFromJson(json);

@override final  String lineId;
@override final  String name;
@override final  String? color;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  bool exchangeable;
 final  List<Size> _availableSizes;
@override@JsonKey(unknownEnumValue: Size.unknown) List<Size> get availableSizes {
  if (_availableSizes is EqualUnmodifiableListView) return _availableSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableSizes);
}


/// Create a copy of GiftReceiptLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftReceiptLineCopyWith<_GiftReceiptLine> get copyWith => __$GiftReceiptLineCopyWithImpl<_GiftReceiptLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftReceiptLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftReceiptLine&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.exchangeable, exchangeable) || other.exchangeable == exchangeable)&&const DeepCollectionEquality().equals(other._availableSizes, _availableSizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineId,name,color,size,quantity,exchangeable,const DeepCollectionEquality().hash(_availableSizes));

@override
String toString() {
  return 'GiftReceiptLine(lineId: $lineId, name: $name, color: $color, size: $size, quantity: $quantity, exchangeable: $exchangeable, availableSizes: $availableSizes)';
}


}

/// @nodoc
abstract mixin class _$GiftReceiptLineCopyWith<$Res> implements $GiftReceiptLineCopyWith<$Res> {
  factory _$GiftReceiptLineCopyWith(_GiftReceiptLine value, $Res Function(_GiftReceiptLine) _then) = __$GiftReceiptLineCopyWithImpl;
@override @useResult
$Res call({
 String lineId, String name, String? color,@JsonKey(unknownEnumValue: Size.unknown) Size? size, int quantity, bool exchangeable,@JsonKey(unknownEnumValue: Size.unknown) List<Size> availableSizes
});




}
/// @nodoc
class __$GiftReceiptLineCopyWithImpl<$Res>
    implements _$GiftReceiptLineCopyWith<$Res> {
  __$GiftReceiptLineCopyWithImpl(this._self, this._then);

  final _GiftReceiptLine _self;
  final $Res Function(_GiftReceiptLine) _then;

/// Create a copy of GiftReceiptLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? name = null,Object? color = freezed,Object? size = freezed,Object? quantity = null,Object? exchangeable = null,Object? availableSizes = null,}) {
  return _then(_GiftReceiptLine(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,exchangeable: null == exchangeable ? _self.exchangeable : exchangeable // ignore: cast_nullable_to_non_nullable
as bool,availableSizes: null == availableSizes ? _self._availableSizes : availableSizes // ignore: cast_nullable_to_non_nullable
as List<Size>,
  ));
}


}


/// @nodoc
mixin _$GiftReceipt {

 String get receiptCode; String get recipientName;@JsonKey(unknownEnumValue: Occasion.unknown) Occasion get occasion; String? get fromName;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; List<GiftReceiptLine> get lines; bool get exchangeAllowed; DateTime? get exchangeDeadline;
/// Create a copy of GiftReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftReceiptCopyWith<GiftReceipt> get copyWith => _$GiftReceiptCopyWithImpl<GiftReceipt>(this as GiftReceipt, _$identity);

  /// Serializes this GiftReceipt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftReceipt&&(identical(other.receiptCode, receiptCode) || other.receiptCode == receiptCode)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.exchangeAllowed, exchangeAllowed) || other.exchangeAllowed == exchangeAllowed)&&(identical(other.exchangeDeadline, exchangeDeadline) || other.exchangeDeadline == exchangeDeadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptCode,recipientName,occasion,fromName,status,const DeepCollectionEquality().hash(lines),exchangeAllowed,exchangeDeadline);

@override
String toString() {
  return 'GiftReceipt(receiptCode: $receiptCode, recipientName: $recipientName, occasion: $occasion, fromName: $fromName, status: $status, lines: $lines, exchangeAllowed: $exchangeAllowed, exchangeDeadline: $exchangeDeadline)';
}


}

/// @nodoc
abstract mixin class $GiftReceiptCopyWith<$Res>  {
  factory $GiftReceiptCopyWith(GiftReceipt value, $Res Function(GiftReceipt) _then) = _$GiftReceiptCopyWithImpl;
@useResult
$Res call({
 String receiptCode, String recipientName,@JsonKey(unknownEnumValue: Occasion.unknown) Occasion occasion, String? fromName,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<GiftReceiptLine> lines, bool exchangeAllowed, DateTime? exchangeDeadline
});




}
/// @nodoc
class _$GiftReceiptCopyWithImpl<$Res>
    implements $GiftReceiptCopyWith<$Res> {
  _$GiftReceiptCopyWithImpl(this._self, this._then);

  final GiftReceipt _self;
  final $Res Function(GiftReceipt) _then;

/// Create a copy of GiftReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiptCode = null,Object? recipientName = null,Object? occasion = null,Object? fromName = freezed,Object? status = null,Object? lines = null,Object? exchangeAllowed = null,Object? exchangeDeadline = freezed,}) {
  return _then(_self.copyWith(
receiptCode: null == receiptCode ? _self.receiptCode : receiptCode // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as Occasion,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<GiftReceiptLine>,exchangeAllowed: null == exchangeAllowed ? _self.exchangeAllowed : exchangeAllowed // ignore: cast_nullable_to_non_nullable
as bool,exchangeDeadline: freezed == exchangeDeadline ? _self.exchangeDeadline : exchangeDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftReceipt].
extension GiftReceiptPatterns on GiftReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftReceipt value)  $default,){
final _that = this;
switch (_that) {
case _GiftReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _GiftReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String receiptCode,  String recipientName, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  String? fromName, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<GiftReceiptLine> lines,  bool exchangeAllowed,  DateTime? exchangeDeadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftReceipt() when $default != null:
return $default(_that.receiptCode,_that.recipientName,_that.occasion,_that.fromName,_that.status,_that.lines,_that.exchangeAllowed,_that.exchangeDeadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String receiptCode,  String recipientName, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  String? fromName, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<GiftReceiptLine> lines,  bool exchangeAllowed,  DateTime? exchangeDeadline)  $default,) {final _that = this;
switch (_that) {
case _GiftReceipt():
return $default(_that.receiptCode,_that.recipientName,_that.occasion,_that.fromName,_that.status,_that.lines,_that.exchangeAllowed,_that.exchangeDeadline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String receiptCode,  String recipientName, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  String? fromName, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<GiftReceiptLine> lines,  bool exchangeAllowed,  DateTime? exchangeDeadline)?  $default,) {final _that = this;
switch (_that) {
case _GiftReceipt() when $default != null:
return $default(_that.receiptCode,_that.recipientName,_that.occasion,_that.fromName,_that.status,_that.lines,_that.exchangeAllowed,_that.exchangeDeadline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftReceipt implements GiftReceipt {
  const _GiftReceipt({required this.receiptCode, this.recipientName = '', @JsonKey(unknownEnumValue: Occasion.unknown) this.occasion = Occasion.unknown, this.fromName, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status = OrderStatus.unknown, final  List<GiftReceiptLine> lines = const <GiftReceiptLine>[], this.exchangeAllowed = false, this.exchangeDeadline}): _lines = lines;
  factory _GiftReceipt.fromJson(Map<String, dynamic> json) => _$GiftReceiptFromJson(json);

@override final  String receiptCode;
@override@JsonKey() final  String recipientName;
@override@JsonKey(unknownEnumValue: Occasion.unknown) final  Occasion occasion;
@override final  String? fromName;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
 final  List<GiftReceiptLine> _lines;
@override@JsonKey() List<GiftReceiptLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey() final  bool exchangeAllowed;
@override final  DateTime? exchangeDeadline;

/// Create a copy of GiftReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftReceiptCopyWith<_GiftReceipt> get copyWith => __$GiftReceiptCopyWithImpl<_GiftReceipt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftReceiptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftReceipt&&(identical(other.receiptCode, receiptCode) || other.receiptCode == receiptCode)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.exchangeAllowed, exchangeAllowed) || other.exchangeAllowed == exchangeAllowed)&&(identical(other.exchangeDeadline, exchangeDeadline) || other.exchangeDeadline == exchangeDeadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptCode,recipientName,occasion,fromName,status,const DeepCollectionEquality().hash(_lines),exchangeAllowed,exchangeDeadline);

@override
String toString() {
  return 'GiftReceipt(receiptCode: $receiptCode, recipientName: $recipientName, occasion: $occasion, fromName: $fromName, status: $status, lines: $lines, exchangeAllowed: $exchangeAllowed, exchangeDeadline: $exchangeDeadline)';
}


}

/// @nodoc
abstract mixin class _$GiftReceiptCopyWith<$Res> implements $GiftReceiptCopyWith<$Res> {
  factory _$GiftReceiptCopyWith(_GiftReceipt value, $Res Function(_GiftReceipt) _then) = __$GiftReceiptCopyWithImpl;
@override @useResult
$Res call({
 String receiptCode, String recipientName,@JsonKey(unknownEnumValue: Occasion.unknown) Occasion occasion, String? fromName,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<GiftReceiptLine> lines, bool exchangeAllowed, DateTime? exchangeDeadline
});




}
/// @nodoc
class __$GiftReceiptCopyWithImpl<$Res>
    implements _$GiftReceiptCopyWith<$Res> {
  __$GiftReceiptCopyWithImpl(this._self, this._then);

  final _GiftReceipt _self;
  final $Res Function(_GiftReceipt) _then;

/// Create a copy of GiftReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiptCode = null,Object? recipientName = null,Object? occasion = null,Object? fromName = freezed,Object? status = null,Object? lines = null,Object? exchangeAllowed = null,Object? exchangeDeadline = freezed,}) {
  return _then(_GiftReceipt(
receiptCode: null == receiptCode ? _self.receiptCode : receiptCode // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as Occasion,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<GiftReceiptLine>,exchangeAllowed: null == exchangeAllowed ? _self.exchangeAllowed : exchangeAllowed // ignore: cast_nullable_to_non_nullable
as bool,exchangeDeadline: freezed == exchangeDeadline ? _self.exchangeDeadline : exchangeDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
