// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderListItem {

 String get id; String get number;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; List<String> get types; String get customerName; String get customerPhone; double get total;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? get paymentMethod;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus? get paymentStatus; String get zoneCode; DateTime? get slotDate; int get itemsCount; DateTime get createdAt; String? get thumbnailUrl;
/// Create a copy of OrderListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListItemCopyWith<OrderListItem> get copyWith => _$OrderListItemCopyWithImpl<OrderListItem>(this as OrderListItem, _$identity);

  /// Serializes this OrderListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.total, total) || other.total == total)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,status,const DeepCollectionEquality().hash(types),customerName,customerPhone,total,paymentMethod,paymentStatus,zoneCode,slotDate,itemsCount,createdAt,thumbnailUrl);

@override
String toString() {
  return 'OrderListItem(id: $id, number: $number, status: $status, types: $types, customerName: $customerName, customerPhone: $customerPhone, total: $total, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, zoneCode: $zoneCode, slotDate: $slotDate, itemsCount: $itemsCount, createdAt: $createdAt, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $OrderListItemCopyWith<$Res>  {
  factory $OrderListItemCopyWith(OrderListItem value, $Res Function(OrderListItem) _then) = _$OrderListItemCopyWithImpl;
@useResult
$Res call({
 String id, String number,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<String> types, String customerName, String customerPhone, double total,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus? paymentStatus, String zoneCode, DateTime? slotDate, int itemsCount, DateTime createdAt, String? thumbnailUrl
});




}
/// @nodoc
class _$OrderListItemCopyWithImpl<$Res>
    implements $OrderListItemCopyWith<$Res> {
  _$OrderListItemCopyWithImpl(this._self, this._then);

  final OrderListItem _self;
  final $Res Function(OrderListItem) _then;

/// Create a copy of OrderListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? status = null,Object? types = null,Object? customerName = null,Object? customerPhone = null,Object? total = null,Object? paymentMethod = freezed,Object? paymentStatus = freezed,Object? zoneCode = null,Object? slotDate = freezed,Object? itemsCount = null,Object? createdAt = null,Object? thumbnailUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus?,zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as DateTime?,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderListItem].
extension OrderListItemPatterns on OrderListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderListItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderListItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String number, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<String> types,  String customerName,  String customerPhone,  double total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod? paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus? paymentStatus,  String zoneCode,  DateTime? slotDate,  int itemsCount,  DateTime createdAt,  String? thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderListItem() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.types,_that.customerName,_that.customerPhone,_that.total,_that.paymentMethod,_that.paymentStatus,_that.zoneCode,_that.slotDate,_that.itemsCount,_that.createdAt,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String number, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<String> types,  String customerName,  String customerPhone,  double total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod? paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus? paymentStatus,  String zoneCode,  DateTime? slotDate,  int itemsCount,  DateTime createdAt,  String? thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _OrderListItem():
return $default(_that.id,_that.number,_that.status,_that.types,_that.customerName,_that.customerPhone,_that.total,_that.paymentMethod,_that.paymentStatus,_that.zoneCode,_that.slotDate,_that.itemsCount,_that.createdAt,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String number, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<String> types,  String customerName,  String customerPhone,  double total, @JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod? paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus? paymentStatus,  String zoneCode,  DateTime? slotDate,  int itemsCount,  DateTime createdAt,  String? thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _OrderListItem() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.types,_that.customerName,_that.customerPhone,_that.total,_that.paymentMethod,_that.paymentStatus,_that.zoneCode,_that.slotDate,_that.itemsCount,_that.createdAt,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderListItem extends OrderListItem {
  const _OrderListItem({required this.id, required this.number, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status = OrderStatus.unknown, final  List<String> types = const <String>[], this.customerName = '', this.customerPhone = '', this.total = 0, @JsonKey(unknownEnumValue: PaymentMethod.unknown) this.paymentMethod, @JsonKey(unknownEnumValue: PaymentStatus.unknown) this.paymentStatus, this.zoneCode = '', this.slotDate, this.itemsCount = 0, required this.createdAt, this.thumbnailUrl}): _types = types,super._();
  factory _OrderListItem.fromJson(Map<String, dynamic> json) => _$OrderListItemFromJson(json);

@override final  String id;
@override final  String number;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
 final  List<String> _types;
@override@JsonKey() List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override@JsonKey() final  String customerName;
@override@JsonKey() final  String customerPhone;
@override@JsonKey() final  double total;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod? paymentMethod;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus? paymentStatus;
@override@JsonKey() final  String zoneCode;
@override final  DateTime? slotDate;
@override@JsonKey() final  int itemsCount;
@override final  DateTime createdAt;
@override final  String? thumbnailUrl;

/// Create a copy of OrderListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderListItemCopyWith<_OrderListItem> get copyWith => __$OrderListItemCopyWithImpl<_OrderListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.total, total) || other.total == total)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,status,const DeepCollectionEquality().hash(_types),customerName,customerPhone,total,paymentMethod,paymentStatus,zoneCode,slotDate,itemsCount,createdAt,thumbnailUrl);

@override
String toString() {
  return 'OrderListItem(id: $id, number: $number, status: $status, types: $types, customerName: $customerName, customerPhone: $customerPhone, total: $total, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, zoneCode: $zoneCode, slotDate: $slotDate, itemsCount: $itemsCount, createdAt: $createdAt, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$OrderListItemCopyWith<$Res> implements $OrderListItemCopyWith<$Res> {
  factory _$OrderListItemCopyWith(_OrderListItem value, $Res Function(_OrderListItem) _then) = __$OrderListItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String number,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<String> types, String customerName, String customerPhone, double total,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod? paymentMethod,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus? paymentStatus, String zoneCode, DateTime? slotDate, int itemsCount, DateTime createdAt, String? thumbnailUrl
});




}
/// @nodoc
class __$OrderListItemCopyWithImpl<$Res>
    implements _$OrderListItemCopyWith<$Res> {
  __$OrderListItemCopyWithImpl(this._self, this._then);

  final _OrderListItem _self;
  final $Res Function(_OrderListItem) _then;

/// Create a copy of OrderListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? status = null,Object? types = null,Object? customerName = null,Object? customerPhone = null,Object? total = null,Object? paymentMethod = freezed,Object? paymentStatus = freezed,Object? zoneCode = null,Object? slotDate = freezed,Object? itemsCount = null,Object? createdAt = null,Object? thumbnailUrl = freezed,}) {
  return _then(_OrderListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus?,zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as DateTime?,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderDetail {

 String get id; String get number;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status; List<String> get types; DateTime get createdAt;@JsonKey(unknownEnumValue: OrderSource.unknown) OrderSource get source; ContactInfo get contact; OrderDelivery get delivery; List<OrderLine> get lines; List<OrderAdjustment> get adjustments; OrderTotals? get totals; OrderPayment? get payment; OrderGift? get gift; List<OrderEvent> get timeline; bool get canChangeSlot; bool get canReturn; bool get canPay;
/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<OrderDetail> get copyWith => _$OrderDetailCopyWithImpl<OrderDetail>(this as OrderDetail, _$identity);

  /// Serializes this OrderDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&const DeepCollectionEquality().equals(other.lines, lines)&&const DeepCollectionEquality().equals(other.adjustments, adjustments)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.gift, gift) || other.gift == gift)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&(identical(other.canChangeSlot, canChangeSlot) || other.canChangeSlot == canChangeSlot)&&(identical(other.canReturn, canReturn) || other.canReturn == canReturn)&&(identical(other.canPay, canPay) || other.canPay == canPay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,status,const DeepCollectionEquality().hash(types),createdAt,source,contact,delivery,const DeepCollectionEquality().hash(lines),const DeepCollectionEquality().hash(adjustments),totals,payment,gift,const DeepCollectionEquality().hash(timeline),canChangeSlot,canReturn,canPay);

@override
String toString() {
  return 'OrderDetail(id: $id, number: $number, status: $status, types: $types, createdAt: $createdAt, source: $source, contact: $contact, delivery: $delivery, lines: $lines, adjustments: $adjustments, totals: $totals, payment: $payment, gift: $gift, timeline: $timeline, canChangeSlot: $canChangeSlot, canReturn: $canReturn, canPay: $canPay)';
}


}

/// @nodoc
abstract mixin class $OrderDetailCopyWith<$Res>  {
  factory $OrderDetailCopyWith(OrderDetail value, $Res Function(OrderDetail) _then) = _$OrderDetailCopyWithImpl;
@useResult
$Res call({
 String id, String number,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<String> types, DateTime createdAt,@JsonKey(unknownEnumValue: OrderSource.unknown) OrderSource source, ContactInfo contact, OrderDelivery delivery, List<OrderLine> lines, List<OrderAdjustment> adjustments, OrderTotals? totals, OrderPayment? payment, OrderGift? gift, List<OrderEvent> timeline, bool canChangeSlot, bool canReturn, bool canPay
});


$ContactInfoCopyWith<$Res> get contact;$OrderDeliveryCopyWith<$Res> get delivery;$OrderTotalsCopyWith<$Res>? get totals;$OrderPaymentCopyWith<$Res>? get payment;$OrderGiftCopyWith<$Res>? get gift;

}
/// @nodoc
class _$OrderDetailCopyWithImpl<$Res>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._self, this._then);

  final OrderDetail _self;
  final $Res Function(OrderDetail) _then;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? status = null,Object? types = null,Object? createdAt = null,Object? source = null,Object? contact = null,Object? delivery = null,Object? lines = null,Object? adjustments = null,Object? totals = freezed,Object? payment = freezed,Object? gift = freezed,Object? timeline = null,Object? canChangeSlot = null,Object? canReturn = null,Object? canPay = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as OrderSource,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactInfo,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as OrderDelivery,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,adjustments: null == adjustments ? _self.adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as List<OrderAdjustment>,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as OrderTotals?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as OrderPayment?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as OrderGift?,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderEvent>,canChangeSlot: null == canChangeSlot ? _self.canChangeSlot : canChangeSlot // ignore: cast_nullable_to_non_nullable
as bool,canReturn: null == canReturn ? _self.canReturn : canReturn // ignore: cast_nullable_to_non_nullable
as bool,canPay: null == canPay ? _self.canPay : canPay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<$Res> get contact {
  
  return $ContactInfoCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDeliveryCopyWith<$Res> get delivery {
  
  return $OrderDeliveryCopyWith<$Res>(_self.delivery, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTotalsCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $OrderTotalsCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $OrderPaymentCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderGiftCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $OrderGiftCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetail].
extension OrderDetailPatterns on OrderDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetail value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetail value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String number, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<String> types,  DateTime createdAt, @JsonKey(unknownEnumValue: OrderSource.unknown)  OrderSource source,  ContactInfo contact,  OrderDelivery delivery,  List<OrderLine> lines,  List<OrderAdjustment> adjustments,  OrderTotals? totals,  OrderPayment? payment,  OrderGift? gift,  List<OrderEvent> timeline,  bool canChangeSlot,  bool canReturn,  bool canPay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.types,_that.createdAt,_that.source,_that.contact,_that.delivery,_that.lines,_that.adjustments,_that.totals,_that.payment,_that.gift,_that.timeline,_that.canChangeSlot,_that.canReturn,_that.canPay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String number, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<String> types,  DateTime createdAt, @JsonKey(unknownEnumValue: OrderSource.unknown)  OrderSource source,  ContactInfo contact,  OrderDelivery delivery,  List<OrderLine> lines,  List<OrderAdjustment> adjustments,  OrderTotals? totals,  OrderPayment? payment,  OrderGift? gift,  List<OrderEvent> timeline,  bool canChangeSlot,  bool canReturn,  bool canPay)  $default,) {final _that = this;
switch (_that) {
case _OrderDetail():
return $default(_that.id,_that.number,_that.status,_that.types,_that.createdAt,_that.source,_that.contact,_that.delivery,_that.lines,_that.adjustments,_that.totals,_that.payment,_that.gift,_that.timeline,_that.canChangeSlot,_that.canReturn,_that.canPay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String number, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status,  List<String> types,  DateTime createdAt, @JsonKey(unknownEnumValue: OrderSource.unknown)  OrderSource source,  ContactInfo contact,  OrderDelivery delivery,  List<OrderLine> lines,  List<OrderAdjustment> adjustments,  OrderTotals? totals,  OrderPayment? payment,  OrderGift? gift,  List<OrderEvent> timeline,  bool canChangeSlot,  bool canReturn,  bool canPay)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.types,_that.createdAt,_that.source,_that.contact,_that.delivery,_that.lines,_that.adjustments,_that.totals,_that.payment,_that.gift,_that.timeline,_that.canChangeSlot,_that.canReturn,_that.canPay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetail extends OrderDetail {
  const _OrderDetail({required this.id, required this.number, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status = OrderStatus.unknown, final  List<String> types = const <String>[], required this.createdAt, @JsonKey(unknownEnumValue: OrderSource.unknown) this.source = OrderSource.unknown, required this.contact, required this.delivery, final  List<OrderLine> lines = const <OrderLine>[], final  List<OrderAdjustment> adjustments = const <OrderAdjustment>[], this.totals, this.payment, this.gift, final  List<OrderEvent> timeline = const <OrderEvent>[], this.canChangeSlot = false, this.canReturn = false, this.canPay = false}): _types = types,_lines = lines,_adjustments = adjustments,_timeline = timeline,super._();
  factory _OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);

@override final  String id;
@override final  String number;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
 final  List<String> _types;
@override@JsonKey() List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override final  DateTime createdAt;
@override@JsonKey(unknownEnumValue: OrderSource.unknown) final  OrderSource source;
@override final  ContactInfo contact;
@override final  OrderDelivery delivery;
 final  List<OrderLine> _lines;
@override@JsonKey() List<OrderLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  List<OrderAdjustment> _adjustments;
@override@JsonKey() List<OrderAdjustment> get adjustments {
  if (_adjustments is EqualUnmodifiableListView) return _adjustments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adjustments);
}

@override final  OrderTotals? totals;
@override final  OrderPayment? payment;
@override final  OrderGift? gift;
 final  List<OrderEvent> _timeline;
@override@JsonKey() List<OrderEvent> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

@override@JsonKey() final  bool canChangeSlot;
@override@JsonKey() final  bool canReturn;
@override@JsonKey() final  bool canPay;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailCopyWith<_OrderDetail> get copyWith => __$OrderDetailCopyWithImpl<_OrderDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&const DeepCollectionEquality().equals(other._lines, _lines)&&const DeepCollectionEquality().equals(other._adjustments, _adjustments)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.gift, gift) || other.gift == gift)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&(identical(other.canChangeSlot, canChangeSlot) || other.canChangeSlot == canChangeSlot)&&(identical(other.canReturn, canReturn) || other.canReturn == canReturn)&&(identical(other.canPay, canPay) || other.canPay == canPay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,status,const DeepCollectionEquality().hash(_types),createdAt,source,contact,delivery,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_adjustments),totals,payment,gift,const DeepCollectionEquality().hash(_timeline),canChangeSlot,canReturn,canPay);

@override
String toString() {
  return 'OrderDetail(id: $id, number: $number, status: $status, types: $types, createdAt: $createdAt, source: $source, contact: $contact, delivery: $delivery, lines: $lines, adjustments: $adjustments, totals: $totals, payment: $payment, gift: $gift, timeline: $timeline, canChangeSlot: $canChangeSlot, canReturn: $canReturn, canPay: $canPay)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailCopyWith<$Res> implements $OrderDetailCopyWith<$Res> {
  factory _$OrderDetailCopyWith(_OrderDetail value, $Res Function(_OrderDetail) _then) = __$OrderDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String number,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status, List<String> types, DateTime createdAt,@JsonKey(unknownEnumValue: OrderSource.unknown) OrderSource source, ContactInfo contact, OrderDelivery delivery, List<OrderLine> lines, List<OrderAdjustment> adjustments, OrderTotals? totals, OrderPayment? payment, OrderGift? gift, List<OrderEvent> timeline, bool canChangeSlot, bool canReturn, bool canPay
});


@override $ContactInfoCopyWith<$Res> get contact;@override $OrderDeliveryCopyWith<$Res> get delivery;@override $OrderTotalsCopyWith<$Res>? get totals;@override $OrderPaymentCopyWith<$Res>? get payment;@override $OrderGiftCopyWith<$Res>? get gift;

}
/// @nodoc
class __$OrderDetailCopyWithImpl<$Res>
    implements _$OrderDetailCopyWith<$Res> {
  __$OrderDetailCopyWithImpl(this._self, this._then);

  final _OrderDetail _self;
  final $Res Function(_OrderDetail) _then;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? status = null,Object? types = null,Object? createdAt = null,Object? source = null,Object? contact = null,Object? delivery = null,Object? lines = null,Object? adjustments = null,Object? totals = freezed,Object? payment = freezed,Object? gift = freezed,Object? timeline = null,Object? canChangeSlot = null,Object? canReturn = null,Object? canPay = null,}) {
  return _then(_OrderDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as OrderSource,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactInfo,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as OrderDelivery,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,adjustments: null == adjustments ? _self._adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as List<OrderAdjustment>,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as OrderTotals?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as OrderPayment?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as OrderGift?,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderEvent>,canChangeSlot: null == canChangeSlot ? _self.canChangeSlot : canChangeSlot // ignore: cast_nullable_to_non_nullable
as bool,canReturn: null == canReturn ? _self.canReturn : canReturn // ignore: cast_nullable_to_non_nullable
as bool,canPay: null == canPay ? _self.canPay : canPay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<$Res> get contact {
  
  return $ContactInfoCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDeliveryCopyWith<$Res> get delivery {
  
  return $OrderDeliveryCopyWith<$Res>(_self.delivery, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTotalsCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $OrderTotalsCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $OrderPaymentCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderGiftCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $OrderGiftCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}
}


/// @nodoc
mixin _$OrderDelivery {

 String get zoneCode; String get zoneName;@JsonKey(unknownEnumValue: DeliveryKind.unknown) DeliveryKind get kind; DeliveryAddress? get address; DateTime? get slotDate; String? get slotStart; String? get slotEnd; String? get courierFirstName; int? get courierEtaMinutes; int? get courierStopsAway;
/// Create a copy of OrderDelivery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDeliveryCopyWith<OrderDelivery> get copyWith => _$OrderDeliveryCopyWithImpl<OrderDelivery>(this as OrderDelivery, _$identity);

  /// Serializes this OrderDelivery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDelivery&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.address, address) || other.address == address)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.slotStart, slotStart) || other.slotStart == slotStart)&&(identical(other.slotEnd, slotEnd) || other.slotEnd == slotEnd)&&(identical(other.courierFirstName, courierFirstName) || other.courierFirstName == courierFirstName)&&(identical(other.courierEtaMinutes, courierEtaMinutes) || other.courierEtaMinutes == courierEtaMinutes)&&(identical(other.courierStopsAway, courierStopsAway) || other.courierStopsAway == courierStopsAway));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneCode,zoneName,kind,address,slotDate,slotStart,slotEnd,courierFirstName,courierEtaMinutes,courierStopsAway);

@override
String toString() {
  return 'OrderDelivery(zoneCode: $zoneCode, zoneName: $zoneName, kind: $kind, address: $address, slotDate: $slotDate, slotStart: $slotStart, slotEnd: $slotEnd, courierFirstName: $courierFirstName, courierEtaMinutes: $courierEtaMinutes, courierStopsAway: $courierStopsAway)';
}


}

/// @nodoc
abstract mixin class $OrderDeliveryCopyWith<$Res>  {
  factory $OrderDeliveryCopyWith(OrderDelivery value, $Res Function(OrderDelivery) _then) = _$OrderDeliveryCopyWithImpl;
@useResult
$Res call({
 String zoneCode, String zoneName,@JsonKey(unknownEnumValue: DeliveryKind.unknown) DeliveryKind kind, DeliveryAddress? address, DateTime? slotDate, String? slotStart, String? slotEnd, String? courierFirstName, int? courierEtaMinutes, int? courierStopsAway
});


$DeliveryAddressCopyWith<$Res>? get address;

}
/// @nodoc
class _$OrderDeliveryCopyWithImpl<$Res>
    implements $OrderDeliveryCopyWith<$Res> {
  _$OrderDeliveryCopyWithImpl(this._self, this._then);

  final OrderDelivery _self;
  final $Res Function(OrderDelivery) _then;

/// Create a copy of OrderDelivery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? zoneCode = null,Object? zoneName = null,Object? kind = null,Object? address = freezed,Object? slotDate = freezed,Object? slotStart = freezed,Object? slotEnd = freezed,Object? courierFirstName = freezed,Object? courierEtaMinutes = freezed,Object? courierStopsAway = freezed,}) {
  return _then(_self.copyWith(
zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,zoneName: null == zoneName ? _self.zoneName : zoneName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DeliveryKind,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as DateTime?,slotStart: freezed == slotStart ? _self.slotStart : slotStart // ignore: cast_nullable_to_non_nullable
as String?,slotEnd: freezed == slotEnd ? _self.slotEnd : slotEnd // ignore: cast_nullable_to_non_nullable
as String?,courierFirstName: freezed == courierFirstName ? _self.courierFirstName : courierFirstName // ignore: cast_nullable_to_non_nullable
as String?,courierEtaMinutes: freezed == courierEtaMinutes ? _self.courierEtaMinutes : courierEtaMinutes // ignore: cast_nullable_to_non_nullable
as int?,courierStopsAway: freezed == courierStopsAway ? _self.courierStopsAway : courierStopsAway // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of OrderDelivery
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
}
}


/// Adds pattern-matching-related methods to [OrderDelivery].
extension OrderDeliveryPatterns on OrderDelivery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDelivery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDelivery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDelivery value)  $default,){
final _that = this;
switch (_that) {
case _OrderDelivery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDelivery value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDelivery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String zoneCode,  String zoneName, @JsonKey(unknownEnumValue: DeliveryKind.unknown)  DeliveryKind kind,  DeliveryAddress? address,  DateTime? slotDate,  String? slotStart,  String? slotEnd,  String? courierFirstName,  int? courierEtaMinutes,  int? courierStopsAway)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDelivery() when $default != null:
return $default(_that.zoneCode,_that.zoneName,_that.kind,_that.address,_that.slotDate,_that.slotStart,_that.slotEnd,_that.courierFirstName,_that.courierEtaMinutes,_that.courierStopsAway);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String zoneCode,  String zoneName, @JsonKey(unknownEnumValue: DeliveryKind.unknown)  DeliveryKind kind,  DeliveryAddress? address,  DateTime? slotDate,  String? slotStart,  String? slotEnd,  String? courierFirstName,  int? courierEtaMinutes,  int? courierStopsAway)  $default,) {final _that = this;
switch (_that) {
case _OrderDelivery():
return $default(_that.zoneCode,_that.zoneName,_that.kind,_that.address,_that.slotDate,_that.slotStart,_that.slotEnd,_that.courierFirstName,_that.courierEtaMinutes,_that.courierStopsAway);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String zoneCode,  String zoneName, @JsonKey(unknownEnumValue: DeliveryKind.unknown)  DeliveryKind kind,  DeliveryAddress? address,  DateTime? slotDate,  String? slotStart,  String? slotEnd,  String? courierFirstName,  int? courierEtaMinutes,  int? courierStopsAway)?  $default,) {final _that = this;
switch (_that) {
case _OrderDelivery() when $default != null:
return $default(_that.zoneCode,_that.zoneName,_that.kind,_that.address,_that.slotDate,_that.slotStart,_that.slotEnd,_that.courierFirstName,_that.courierEtaMinutes,_that.courierStopsAway);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDelivery extends OrderDelivery {
  const _OrderDelivery({this.zoneCode = '', this.zoneName = '', @JsonKey(unknownEnumValue: DeliveryKind.unknown) this.kind = DeliveryKind.unknown, this.address, this.slotDate, this.slotStart, this.slotEnd, this.courierFirstName, this.courierEtaMinutes, this.courierStopsAway}): super._();
  factory _OrderDelivery.fromJson(Map<String, dynamic> json) => _$OrderDeliveryFromJson(json);

@override@JsonKey() final  String zoneCode;
@override@JsonKey() final  String zoneName;
@override@JsonKey(unknownEnumValue: DeliveryKind.unknown) final  DeliveryKind kind;
@override final  DeliveryAddress? address;
@override final  DateTime? slotDate;
@override final  String? slotStart;
@override final  String? slotEnd;
@override final  String? courierFirstName;
@override final  int? courierEtaMinutes;
@override final  int? courierStopsAway;

/// Create a copy of OrderDelivery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDeliveryCopyWith<_OrderDelivery> get copyWith => __$OrderDeliveryCopyWithImpl<_OrderDelivery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDeliveryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDelivery&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.address, address) || other.address == address)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.slotStart, slotStart) || other.slotStart == slotStart)&&(identical(other.slotEnd, slotEnd) || other.slotEnd == slotEnd)&&(identical(other.courierFirstName, courierFirstName) || other.courierFirstName == courierFirstName)&&(identical(other.courierEtaMinutes, courierEtaMinutes) || other.courierEtaMinutes == courierEtaMinutes)&&(identical(other.courierStopsAway, courierStopsAway) || other.courierStopsAway == courierStopsAway));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneCode,zoneName,kind,address,slotDate,slotStart,slotEnd,courierFirstName,courierEtaMinutes,courierStopsAway);

@override
String toString() {
  return 'OrderDelivery(zoneCode: $zoneCode, zoneName: $zoneName, kind: $kind, address: $address, slotDate: $slotDate, slotStart: $slotStart, slotEnd: $slotEnd, courierFirstName: $courierFirstName, courierEtaMinutes: $courierEtaMinutes, courierStopsAway: $courierStopsAway)';
}


}

/// @nodoc
abstract mixin class _$OrderDeliveryCopyWith<$Res> implements $OrderDeliveryCopyWith<$Res> {
  factory _$OrderDeliveryCopyWith(_OrderDelivery value, $Res Function(_OrderDelivery) _then) = __$OrderDeliveryCopyWithImpl;
@override @useResult
$Res call({
 String zoneCode, String zoneName,@JsonKey(unknownEnumValue: DeliveryKind.unknown) DeliveryKind kind, DeliveryAddress? address, DateTime? slotDate, String? slotStart, String? slotEnd, String? courierFirstName, int? courierEtaMinutes, int? courierStopsAway
});


@override $DeliveryAddressCopyWith<$Res>? get address;

}
/// @nodoc
class __$OrderDeliveryCopyWithImpl<$Res>
    implements _$OrderDeliveryCopyWith<$Res> {
  __$OrderDeliveryCopyWithImpl(this._self, this._then);

  final _OrderDelivery _self;
  final $Res Function(_OrderDelivery) _then;

/// Create a copy of OrderDelivery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? zoneCode = null,Object? zoneName = null,Object? kind = null,Object? address = freezed,Object? slotDate = freezed,Object? slotStart = freezed,Object? slotEnd = freezed,Object? courierFirstName = freezed,Object? courierEtaMinutes = freezed,Object? courierStopsAway = freezed,}) {
  return _then(_OrderDelivery(
zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,zoneName: null == zoneName ? _self.zoneName : zoneName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DeliveryKind,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as DateTime?,slotStart: freezed == slotStart ? _self.slotStart : slotStart // ignore: cast_nullable_to_non_nullable
as String?,slotEnd: freezed == slotEnd ? _self.slotEnd : slotEnd // ignore: cast_nullable_to_non_nullable
as String?,courierFirstName: freezed == courierFirstName ? _self.courierFirstName : courierFirstName // ignore: cast_nullable_to_non_nullable
as String?,courierEtaMinutes: freezed == courierEtaMinutes ? _self.courierEtaMinutes : courierEtaMinutes // ignore: cast_nullable_to_non_nullable
as int?,courierStopsAway: freezed == courierStopsAway ? _self.courierStopsAway : courierStopsAway // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of OrderDelivery
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
}
}


/// @nodoc
mixin _$OrderLine {

 String get id;@JsonKey(unknownEnumValue: OrderLineKind.unknown) OrderLineKind get kind; String? get productId; String? get designId; String get name; String? get color;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; String? get sku; String? get imageUrl; double? get unitPrice; int get quantity; double? get lineTotal; bool get nonReturnable; OrderLineDesign? get design;
/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineCopyWith<OrderLine> get copyWith => _$OrderLineCopyWithImpl<OrderLine>(this as OrderLine, _$identity);

  /// Serializes this OrderLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLine&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.designId, designId) || other.designId == designId)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.nonReturnable, nonReturnable) || other.nonReturnable == nonReturnable)&&(identical(other.design, design) || other.design == design));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,productId,designId,name,color,size,sku,imageUrl,unitPrice,quantity,lineTotal,nonReturnable,design);

@override
String toString() {
  return 'OrderLine(id: $id, kind: $kind, productId: $productId, designId: $designId, name: $name, color: $color, size: $size, sku: $sku, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, nonReturnable: $nonReturnable, design: $design)';
}


}

/// @nodoc
abstract mixin class $OrderLineCopyWith<$Res>  {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) _then) = _$OrderLineCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: OrderLineKind.unknown) OrderLineKind kind, String? productId, String? designId, String name, String? color,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? sku, String? imageUrl, double? unitPrice, int quantity, double? lineTotal, bool nonReturnable, OrderLineDesign? design
});


$OrderLineDesignCopyWith<$Res>? get design;

}
/// @nodoc
class _$OrderLineCopyWithImpl<$Res>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._self, this._then);

  final OrderLine _self;
  final $Res Function(OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? productId = freezed,Object? designId = freezed,Object? name = null,Object? color = freezed,Object? size = freezed,Object? sku = freezed,Object? imageUrl = freezed,Object? unitPrice = freezed,Object? quantity = null,Object? lineTotal = freezed,Object? nonReturnable = null,Object? design = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OrderLineKind,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,designId: freezed == designId ? _self.designId : designId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: freezed == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double?,nonReturnable: null == nonReturnable ? _self.nonReturnable : nonReturnable // ignore: cast_nullable_to_non_nullable
as bool,design: freezed == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as OrderLineDesign?,
  ));
}
/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLineDesignCopyWith<$Res>? get design {
    if (_self.design == null) {
    return null;
  }

  return $OrderLineDesignCopyWith<$Res>(_self.design!, (value) {
    return _then(_self.copyWith(design: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderLine].
extension OrderLinePatterns on OrderLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLine value)  $default,){
final _that = this;
switch (_that) {
case _OrderLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: OrderLineKind.unknown)  OrderLineKind kind,  String? productId,  String? designId,  String name,  String? color, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? sku,  String? imageUrl,  double? unitPrice,  int quantity,  double? lineTotal,  bool nonReturnable,  OrderLineDesign? design)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.id,_that.kind,_that.productId,_that.designId,_that.name,_that.color,_that.size,_that.sku,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.nonReturnable,_that.design);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: OrderLineKind.unknown)  OrderLineKind kind,  String? productId,  String? designId,  String name,  String? color, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? sku,  String? imageUrl,  double? unitPrice,  int quantity,  double? lineTotal,  bool nonReturnable,  OrderLineDesign? design)  $default,) {final _that = this;
switch (_that) {
case _OrderLine():
return $default(_that.id,_that.kind,_that.productId,_that.designId,_that.name,_that.color,_that.size,_that.sku,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.nonReturnable,_that.design);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(unknownEnumValue: OrderLineKind.unknown)  OrderLineKind kind,  String? productId,  String? designId,  String name,  String? color, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? sku,  String? imageUrl,  double? unitPrice,  int quantity,  double? lineTotal,  bool nonReturnable,  OrderLineDesign? design)?  $default,) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.id,_that.kind,_that.productId,_that.designId,_that.name,_that.color,_that.size,_that.sku,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.nonReturnable,_that.design);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLine extends OrderLine {
  const _OrderLine({required this.id, @JsonKey(unknownEnumValue: OrderLineKind.unknown) this.kind = OrderLineKind.unknown, this.productId, this.designId, required this.name, this.color, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.sku, this.imageUrl, this.unitPrice, this.quantity = 1, this.lineTotal, this.nonReturnable = false, this.design}): super._();
  factory _OrderLine.fromJson(Map<String, dynamic> json) => _$OrderLineFromJson(json);

@override final  String id;
@override@JsonKey(unknownEnumValue: OrderLineKind.unknown) final  OrderLineKind kind;
@override final  String? productId;
@override final  String? designId;
@override final  String name;
@override final  String? color;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override final  String? sku;
@override final  String? imageUrl;
@override final  double? unitPrice;
@override@JsonKey() final  int quantity;
@override final  double? lineTotal;
@override@JsonKey() final  bool nonReturnable;
@override final  OrderLineDesign? design;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineCopyWith<_OrderLine> get copyWith => __$OrderLineCopyWithImpl<_OrderLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLine&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.designId, designId) || other.designId == designId)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.nonReturnable, nonReturnable) || other.nonReturnable == nonReturnable)&&(identical(other.design, design) || other.design == design));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,productId,designId,name,color,size,sku,imageUrl,unitPrice,quantity,lineTotal,nonReturnable,design);

@override
String toString() {
  return 'OrderLine(id: $id, kind: $kind, productId: $productId, designId: $designId, name: $name, color: $color, size: $size, sku: $sku, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, nonReturnable: $nonReturnable, design: $design)';
}


}

/// @nodoc
abstract mixin class _$OrderLineCopyWith<$Res> implements $OrderLineCopyWith<$Res> {
  factory _$OrderLineCopyWith(_OrderLine value, $Res Function(_OrderLine) _then) = __$OrderLineCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: OrderLineKind.unknown) OrderLineKind kind, String? productId, String? designId, String name, String? color,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? sku, String? imageUrl, double? unitPrice, int quantity, double? lineTotal, bool nonReturnable, OrderLineDesign? design
});


@override $OrderLineDesignCopyWith<$Res>? get design;

}
/// @nodoc
class __$OrderLineCopyWithImpl<$Res>
    implements _$OrderLineCopyWith<$Res> {
  __$OrderLineCopyWithImpl(this._self, this._then);

  final _OrderLine _self;
  final $Res Function(_OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? productId = freezed,Object? designId = freezed,Object? name = null,Object? color = freezed,Object? size = freezed,Object? sku = freezed,Object? imageUrl = freezed,Object? unitPrice = freezed,Object? quantity = null,Object? lineTotal = freezed,Object? nonReturnable = null,Object? design = freezed,}) {
  return _then(_OrderLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OrderLineKind,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,designId: freezed == designId ? _self.designId : designId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: freezed == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double?,nonReturnable: null == nonReturnable ? _self.nonReturnable : nonReturnable // ignore: cast_nullable_to_non_nullable
as bool,design: freezed == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as OrderLineDesign?,
  ));
}

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLineDesignCopyWith<$Res>? get design {
    if (_self.design == null) {
    return null;
  }

  return $OrderLineDesignCopyWith<$Res>(_self.design!, (value) {
    return _then(_self.copyWith(design: value));
  });
}
}


/// @nodoc
mixin _$OrderLineDesign {

 String get designId; String get name;@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus get status; OrderLineDesignSpec? get spec; List<String> get mockupUrls; String? get shareToken; String? get shareUrl;
/// Create a copy of OrderLineDesign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineDesignCopyWith<OrderLineDesign> get copyWith => _$OrderLineDesignCopyWithImpl<OrderLineDesign>(this as OrderLineDesign, _$identity);

  /// Serializes this OrderLineDesign to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineDesign&&(identical(other.designId, designId) || other.designId == designId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.spec, spec) || other.spec == spec)&&const DeepCollectionEquality().equals(other.mockupUrls, mockupUrls)&&(identical(other.shareToken, shareToken) || other.shareToken == shareToken)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,designId,name,status,spec,const DeepCollectionEquality().hash(mockupUrls),shareToken,shareUrl);

@override
String toString() {
  return 'OrderLineDesign(designId: $designId, name: $name, status: $status, spec: $spec, mockupUrls: $mockupUrls, shareToken: $shareToken, shareUrl: $shareUrl)';
}


}

/// @nodoc
abstract mixin class $OrderLineDesignCopyWith<$Res>  {
  factory $OrderLineDesignCopyWith(OrderLineDesign value, $Res Function(OrderLineDesign) _then) = _$OrderLineDesignCopyWithImpl;
@useResult
$Res call({
 String designId, String name,@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus status, OrderLineDesignSpec? spec, List<String> mockupUrls, String? shareToken, String? shareUrl
});


$OrderLineDesignSpecCopyWith<$Res>? get spec;

}
/// @nodoc
class _$OrderLineDesignCopyWithImpl<$Res>
    implements $OrderLineDesignCopyWith<$Res> {
  _$OrderLineDesignCopyWithImpl(this._self, this._then);

  final OrderLineDesign _self;
  final $Res Function(OrderLineDesign) _then;

/// Create a copy of OrderLineDesign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? designId = null,Object? name = null,Object? status = null,Object? spec = freezed,Object? mockupUrls = null,Object? shareToken = freezed,Object? shareUrl = freezed,}) {
  return _then(_self.copyWith(
designId: null == designId ? _self.designId : designId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DesignStatus,spec: freezed == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as OrderLineDesignSpec?,mockupUrls: null == mockupUrls ? _self.mockupUrls : mockupUrls // ignore: cast_nullable_to_non_nullable
as List<String>,shareToken: freezed == shareToken ? _self.shareToken : shareToken // ignore: cast_nullable_to_non_nullable
as String?,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OrderLineDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLineDesignSpecCopyWith<$Res>? get spec {
    if (_self.spec == null) {
    return null;
  }

  return $OrderLineDesignSpecCopyWith<$Res>(_self.spec!, (value) {
    return _then(_self.copyWith(spec: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderLineDesign].
extension OrderLineDesignPatterns on OrderLineDesign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineDesign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineDesign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineDesign value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineDesign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineDesign value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineDesign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String designId,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  OrderLineDesignSpec? spec,  List<String> mockupUrls,  String? shareToken,  String? shareUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineDesign() when $default != null:
return $default(_that.designId,_that.name,_that.status,_that.spec,_that.mockupUrls,_that.shareToken,_that.shareUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String designId,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  OrderLineDesignSpec? spec,  List<String> mockupUrls,  String? shareToken,  String? shareUrl)  $default,) {final _that = this;
switch (_that) {
case _OrderLineDesign():
return $default(_that.designId,_that.name,_that.status,_that.spec,_that.mockupUrls,_that.shareToken,_that.shareUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String designId,  String name, @JsonKey(unknownEnumValue: DesignStatus.unknown)  DesignStatus status,  OrderLineDesignSpec? spec,  List<String> mockupUrls,  String? shareToken,  String? shareUrl)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineDesign() when $default != null:
return $default(_that.designId,_that.name,_that.status,_that.spec,_that.mockupUrls,_that.shareToken,_that.shareUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLineDesign implements OrderLineDesign {
  const _OrderLineDesign({required this.designId, this.name = '', @JsonKey(unknownEnumValue: DesignStatus.unknown) this.status = DesignStatus.unknown, this.spec, final  List<String> mockupUrls = const <String>[], this.shareToken, this.shareUrl}): _mockupUrls = mockupUrls;
  factory _OrderLineDesign.fromJson(Map<String, dynamic> json) => _$OrderLineDesignFromJson(json);

@override final  String designId;
@override@JsonKey() final  String name;
@override@JsonKey(unknownEnumValue: DesignStatus.unknown) final  DesignStatus status;
@override final  OrderLineDesignSpec? spec;
 final  List<String> _mockupUrls;
@override@JsonKey() List<String> get mockupUrls {
  if (_mockupUrls is EqualUnmodifiableListView) return _mockupUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mockupUrls);
}

@override final  String? shareToken;
@override final  String? shareUrl;

/// Create a copy of OrderLineDesign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineDesignCopyWith<_OrderLineDesign> get copyWith => __$OrderLineDesignCopyWithImpl<_OrderLineDesign>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineDesignToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineDesign&&(identical(other.designId, designId) || other.designId == designId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.spec, spec) || other.spec == spec)&&const DeepCollectionEquality().equals(other._mockupUrls, _mockupUrls)&&(identical(other.shareToken, shareToken) || other.shareToken == shareToken)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,designId,name,status,spec,const DeepCollectionEquality().hash(_mockupUrls),shareToken,shareUrl);

@override
String toString() {
  return 'OrderLineDesign(designId: $designId, name: $name, status: $status, spec: $spec, mockupUrls: $mockupUrls, shareToken: $shareToken, shareUrl: $shareUrl)';
}


}

/// @nodoc
abstract mixin class _$OrderLineDesignCopyWith<$Res> implements $OrderLineDesignCopyWith<$Res> {
  factory _$OrderLineDesignCopyWith(_OrderLineDesign value, $Res Function(_OrderLineDesign) _then) = __$OrderLineDesignCopyWithImpl;
@override @useResult
$Res call({
 String designId, String name,@JsonKey(unknownEnumValue: DesignStatus.unknown) DesignStatus status, OrderLineDesignSpec? spec, List<String> mockupUrls, String? shareToken, String? shareUrl
});


@override $OrderLineDesignSpecCopyWith<$Res>? get spec;

}
/// @nodoc
class __$OrderLineDesignCopyWithImpl<$Res>
    implements _$OrderLineDesignCopyWith<$Res> {
  __$OrderLineDesignCopyWithImpl(this._self, this._then);

  final _OrderLineDesign _self;
  final $Res Function(_OrderLineDesign) _then;

/// Create a copy of OrderLineDesign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? designId = null,Object? name = null,Object? status = null,Object? spec = freezed,Object? mockupUrls = null,Object? shareToken = freezed,Object? shareUrl = freezed,}) {
  return _then(_OrderLineDesign(
designId: null == designId ? _self.designId : designId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DesignStatus,spec: freezed == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as OrderLineDesignSpec?,mockupUrls: null == mockupUrls ? _self._mockupUrls : mockupUrls // ignore: cast_nullable_to_non_nullable
as List<String>,shareToken: freezed == shareToken ? _self.shareToken : shareToken // ignore: cast_nullable_to_non_nullable
as String?,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrderLineDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLineDesignSpecCopyWith<$Res>? get spec {
    if (_self.spec == null) {
    return null;
  }

  return $OrderLineDesignSpecCopyWith<$Res>(_self.spec!, (value) {
    return _then(_self.copyWith(spec: value));
  });
}
}


/// @nodoc
mixin _$OrderLineDesignSpec {

 String get baseCode;@JsonKey(unknownEnumValue: Fit.unknown) Fit get fit; String get fabricCode; String? get colorName; String? get colorHex;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; int get quantity; bool get rush;
/// Create a copy of OrderLineDesignSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineDesignSpecCopyWith<OrderLineDesignSpec> get copyWith => _$OrderLineDesignSpecCopyWithImpl<OrderLineDesignSpec>(this as OrderLineDesignSpec, _$identity);

  /// Serializes this OrderLineDesignSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineDesignSpec&&(identical(other.baseCode, baseCode) || other.baseCode == baseCode)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.fabricCode, fabricCode) || other.fabricCode == fabricCode)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.size, size) || other.size == size)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rush, rush) || other.rush == rush));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseCode,fit,fabricCode,colorName,colorHex,size,quantity,rush);

@override
String toString() {
  return 'OrderLineDesignSpec(baseCode: $baseCode, fit: $fit, fabricCode: $fabricCode, colorName: $colorName, colorHex: $colorHex, size: $size, quantity: $quantity, rush: $rush)';
}


}

/// @nodoc
abstract mixin class $OrderLineDesignSpecCopyWith<$Res>  {
  factory $OrderLineDesignSpecCopyWith(OrderLineDesignSpec value, $Res Function(OrderLineDesignSpec) _then) = _$OrderLineDesignSpecCopyWithImpl;
@useResult
$Res call({
 String baseCode,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, String fabricCode, String? colorName, String? colorHex,@JsonKey(unknownEnumValue: Size.unknown) Size? size, int quantity, bool rush
});




}
/// @nodoc
class _$OrderLineDesignSpecCopyWithImpl<$Res>
    implements $OrderLineDesignSpecCopyWith<$Res> {
  _$OrderLineDesignSpecCopyWithImpl(this._self, this._then);

  final OrderLineDesignSpec _self;
  final $Res Function(OrderLineDesignSpec) _then;

/// Create a copy of OrderLineDesignSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseCode = null,Object? fit = null,Object? fabricCode = null,Object? colorName = freezed,Object? colorHex = freezed,Object? size = freezed,Object? quantity = null,Object? rush = null,}) {
  return _then(_self.copyWith(
baseCode: null == baseCode ? _self.baseCode : baseCode // ignore: cast_nullable_to_non_nullable
as String,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,fabricCode: null == fabricCode ? _self.fabricCode : fabricCode // ignore: cast_nullable_to_non_nullable
as String,colorName: freezed == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rush: null == rush ? _self.rush : rush // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLineDesignSpec].
extension OrderLineDesignSpecPatterns on OrderLineDesignSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineDesignSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineDesignSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineDesignSpec value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineDesignSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineDesignSpec value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineDesignSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseCode, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  String fabricCode,  String? colorName,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  int quantity,  bool rush)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineDesignSpec() when $default != null:
return $default(_that.baseCode,_that.fit,_that.fabricCode,_that.colorName,_that.colorHex,_that.size,_that.quantity,_that.rush);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseCode, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  String fabricCode,  String? colorName,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  int quantity,  bool rush)  $default,) {final _that = this;
switch (_that) {
case _OrderLineDesignSpec():
return $default(_that.baseCode,_that.fit,_that.fabricCode,_that.colorName,_that.colorHex,_that.size,_that.quantity,_that.rush);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseCode, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  String fabricCode,  String? colorName,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  int quantity,  bool rush)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineDesignSpec() when $default != null:
return $default(_that.baseCode,_that.fit,_that.fabricCode,_that.colorName,_that.colorHex,_that.size,_that.quantity,_that.rush);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLineDesignSpec implements OrderLineDesignSpec {
  const _OrderLineDesignSpec({this.baseCode = '', @JsonKey(unknownEnumValue: Fit.unknown) this.fit = Fit.unknown, this.fabricCode = '', this.colorName, this.colorHex, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.quantity = 1, this.rush = false});
  factory _OrderLineDesignSpec.fromJson(Map<String, dynamic> json) => _$OrderLineDesignSpecFromJson(json);

@override@JsonKey() final  String baseCode;
@override@JsonKey(unknownEnumValue: Fit.unknown) final  Fit fit;
@override@JsonKey() final  String fabricCode;
@override final  String? colorName;
@override final  String? colorHex;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  bool rush;

/// Create a copy of OrderLineDesignSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineDesignSpecCopyWith<_OrderLineDesignSpec> get copyWith => __$OrderLineDesignSpecCopyWithImpl<_OrderLineDesignSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineDesignSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineDesignSpec&&(identical(other.baseCode, baseCode) || other.baseCode == baseCode)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.fabricCode, fabricCode) || other.fabricCode == fabricCode)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.size, size) || other.size == size)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rush, rush) || other.rush == rush));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseCode,fit,fabricCode,colorName,colorHex,size,quantity,rush);

@override
String toString() {
  return 'OrderLineDesignSpec(baseCode: $baseCode, fit: $fit, fabricCode: $fabricCode, colorName: $colorName, colorHex: $colorHex, size: $size, quantity: $quantity, rush: $rush)';
}


}

/// @nodoc
abstract mixin class _$OrderLineDesignSpecCopyWith<$Res> implements $OrderLineDesignSpecCopyWith<$Res> {
  factory _$OrderLineDesignSpecCopyWith(_OrderLineDesignSpec value, $Res Function(_OrderLineDesignSpec) _then) = __$OrderLineDesignSpecCopyWithImpl;
@override @useResult
$Res call({
 String baseCode,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, String fabricCode, String? colorName, String? colorHex,@JsonKey(unknownEnumValue: Size.unknown) Size? size, int quantity, bool rush
});




}
/// @nodoc
class __$OrderLineDesignSpecCopyWithImpl<$Res>
    implements _$OrderLineDesignSpecCopyWith<$Res> {
  __$OrderLineDesignSpecCopyWithImpl(this._self, this._then);

  final _OrderLineDesignSpec _self;
  final $Res Function(_OrderLineDesignSpec) _then;

/// Create a copy of OrderLineDesignSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseCode = null,Object? fit = null,Object? fabricCode = null,Object? colorName = freezed,Object? colorHex = freezed,Object? size = freezed,Object? quantity = null,Object? rush = null,}) {
  return _then(_OrderLineDesignSpec(
baseCode: null == baseCode ? _self.baseCode : baseCode // ignore: cast_nullable_to_non_nullable
as String,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,fabricCode: null == fabricCode ? _self.fabricCode : fabricCode // ignore: cast_nullable_to_non_nullable
as String,colorName: freezed == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rush: null == rush ? _self.rush : rush // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OrderAdjustment {

@JsonKey(unknownEnumValue: AdjustmentType.unknown) AdjustmentType get type; double get amount; String? get label; String? get orderLineId;
/// Create a copy of OrderAdjustment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAdjustmentCopyWith<OrderAdjustment> get copyWith => _$OrderAdjustmentCopyWithImpl<OrderAdjustment>(this as OrderAdjustment, _$identity);

  /// Serializes this OrderAdjustment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAdjustment&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.label, label) || other.label == label)&&(identical(other.orderLineId, orderLineId) || other.orderLineId == orderLineId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,amount,label,orderLineId);

@override
String toString() {
  return 'OrderAdjustment(type: $type, amount: $amount, label: $label, orderLineId: $orderLineId)';
}


}

/// @nodoc
abstract mixin class $OrderAdjustmentCopyWith<$Res>  {
  factory $OrderAdjustmentCopyWith(OrderAdjustment value, $Res Function(OrderAdjustment) _then) = _$OrderAdjustmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: AdjustmentType.unknown) AdjustmentType type, double amount, String? label, String? orderLineId
});




}
/// @nodoc
class _$OrderAdjustmentCopyWithImpl<$Res>
    implements $OrderAdjustmentCopyWith<$Res> {
  _$OrderAdjustmentCopyWithImpl(this._self, this._then);

  final OrderAdjustment _self;
  final $Res Function(OrderAdjustment) _then;

/// Create a copy of OrderAdjustment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? amount = null,Object? label = freezed,Object? orderLineId = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AdjustmentType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,orderLineId: freezed == orderLineId ? _self.orderLineId : orderLineId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderAdjustment].
extension OrderAdjustmentPatterns on OrderAdjustment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAdjustment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAdjustment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAdjustment value)  $default,){
final _that = this;
switch (_that) {
case _OrderAdjustment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAdjustment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAdjustment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: AdjustmentType.unknown)  AdjustmentType type,  double amount,  String? label,  String? orderLineId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAdjustment() when $default != null:
return $default(_that.type,_that.amount,_that.label,_that.orderLineId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: AdjustmentType.unknown)  AdjustmentType type,  double amount,  String? label,  String? orderLineId)  $default,) {final _that = this;
switch (_that) {
case _OrderAdjustment():
return $default(_that.type,_that.amount,_that.label,_that.orderLineId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: AdjustmentType.unknown)  AdjustmentType type,  double amount,  String? label,  String? orderLineId)?  $default,) {final _that = this;
switch (_that) {
case _OrderAdjustment() when $default != null:
return $default(_that.type,_that.amount,_that.label,_that.orderLineId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderAdjustment implements OrderAdjustment {
  const _OrderAdjustment({@JsonKey(unknownEnumValue: AdjustmentType.unknown) this.type = AdjustmentType.unknown, required this.amount, this.label, this.orderLineId});
  factory _OrderAdjustment.fromJson(Map<String, dynamic> json) => _$OrderAdjustmentFromJson(json);

@override@JsonKey(unknownEnumValue: AdjustmentType.unknown) final  AdjustmentType type;
@override final  double amount;
@override final  String? label;
@override final  String? orderLineId;

/// Create a copy of OrderAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAdjustmentCopyWith<_OrderAdjustment> get copyWith => __$OrderAdjustmentCopyWithImpl<_OrderAdjustment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderAdjustmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAdjustment&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.label, label) || other.label == label)&&(identical(other.orderLineId, orderLineId) || other.orderLineId == orderLineId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,amount,label,orderLineId);

@override
String toString() {
  return 'OrderAdjustment(type: $type, amount: $amount, label: $label, orderLineId: $orderLineId)';
}


}

/// @nodoc
abstract mixin class _$OrderAdjustmentCopyWith<$Res> implements $OrderAdjustmentCopyWith<$Res> {
  factory _$OrderAdjustmentCopyWith(_OrderAdjustment value, $Res Function(_OrderAdjustment) _then) = __$OrderAdjustmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: AdjustmentType.unknown) AdjustmentType type, double amount, String? label, String? orderLineId
});




}
/// @nodoc
class __$OrderAdjustmentCopyWithImpl<$Res>
    implements _$OrderAdjustmentCopyWith<$Res> {
  __$OrderAdjustmentCopyWithImpl(this._self, this._then);

  final _OrderAdjustment _self;
  final $Res Function(_OrderAdjustment) _then;

/// Create a copy of OrderAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? amount = null,Object? label = freezed,Object? orderLineId = freezed,}) {
  return _then(_OrderAdjustment(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AdjustmentType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,orderLineId: freezed == orderLineId ? _self.orderLineId : orderLineId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderTotals {

 double get subtotal; double get discount; double get delivery; double get giftPackaging; double get greetingCard; double get total; double get vatIncluded;
/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTotalsCopyWith<OrderTotals> get copyWith => _$OrderTotalsCopyWithImpl<OrderTotals>(this as OrderTotals, _$identity);

  /// Serializes this OrderTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.giftPackaging, giftPackaging) || other.giftPackaging == giftPackaging)&&(identical(other.greetingCard, greetingCard) || other.greetingCard == greetingCard)&&(identical(other.total, total) || other.total == total)&&(identical(other.vatIncluded, vatIncluded) || other.vatIncluded == vatIncluded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,delivery,giftPackaging,greetingCard,total,vatIncluded);

@override
String toString() {
  return 'OrderTotals(subtotal: $subtotal, discount: $discount, delivery: $delivery, giftPackaging: $giftPackaging, greetingCard: $greetingCard, total: $total, vatIncluded: $vatIncluded)';
}


}

/// @nodoc
abstract mixin class $OrderTotalsCopyWith<$Res>  {
  factory $OrderTotalsCopyWith(OrderTotals value, $Res Function(OrderTotals) _then) = _$OrderTotalsCopyWithImpl;
@useResult
$Res call({
 double subtotal, double discount, double delivery, double giftPackaging, double greetingCard, double total, double vatIncluded
});




}
/// @nodoc
class _$OrderTotalsCopyWithImpl<$Res>
    implements $OrderTotalsCopyWith<$Res> {
  _$OrderTotalsCopyWithImpl(this._self, this._then);

  final OrderTotals _self;
  final $Res Function(OrderTotals) _then;

/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? discount = null,Object? delivery = null,Object? giftPackaging = null,Object? greetingCard = null,Object? total = null,Object? vatIncluded = null,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as double,giftPackaging: null == giftPackaging ? _self.giftPackaging : giftPackaging // ignore: cast_nullable_to_non_nullable
as double,greetingCard: null == greetingCard ? _self.greetingCard : greetingCard // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,vatIncluded: null == vatIncluded ? _self.vatIncluded : vatIncluded // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTotals].
extension OrderTotalsPatterns on OrderTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTotals value)  $default,){
final _that = this;
switch (_that) {
case _OrderTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTotals value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double delivery,  double giftPackaging,  double greetingCard,  double total,  double vatIncluded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.delivery,_that.giftPackaging,_that.greetingCard,_that.total,_that.vatIncluded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double delivery,  double giftPackaging,  double greetingCard,  double total,  double vatIncluded)  $default,) {final _that = this;
switch (_that) {
case _OrderTotals():
return $default(_that.subtotal,_that.discount,_that.delivery,_that.giftPackaging,_that.greetingCard,_that.total,_that.vatIncluded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double subtotal,  double discount,  double delivery,  double giftPackaging,  double greetingCard,  double total,  double vatIncluded)?  $default,) {final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.delivery,_that.giftPackaging,_that.greetingCard,_that.total,_that.vatIncluded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTotals implements OrderTotals {
  const _OrderTotals({required this.subtotal, this.discount = 0, this.delivery = 0, this.giftPackaging = 0, this.greetingCard = 0, required this.total, this.vatIncluded = 0});
  factory _OrderTotals.fromJson(Map<String, dynamic> json) => _$OrderTotalsFromJson(json);

@override final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double delivery;
@override@JsonKey() final  double giftPackaging;
@override@JsonKey() final  double greetingCard;
@override final  double total;
@override@JsonKey() final  double vatIncluded;

/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTotalsCopyWith<_OrderTotals> get copyWith => __$OrderTotalsCopyWithImpl<_OrderTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.giftPackaging, giftPackaging) || other.giftPackaging == giftPackaging)&&(identical(other.greetingCard, greetingCard) || other.greetingCard == greetingCard)&&(identical(other.total, total) || other.total == total)&&(identical(other.vatIncluded, vatIncluded) || other.vatIncluded == vatIncluded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,delivery,giftPackaging,greetingCard,total,vatIncluded);

@override
String toString() {
  return 'OrderTotals(subtotal: $subtotal, discount: $discount, delivery: $delivery, giftPackaging: $giftPackaging, greetingCard: $greetingCard, total: $total, vatIncluded: $vatIncluded)';
}


}

/// @nodoc
abstract mixin class _$OrderTotalsCopyWith<$Res> implements $OrderTotalsCopyWith<$Res> {
  factory _$OrderTotalsCopyWith(_OrderTotals value, $Res Function(_OrderTotals) _then) = __$OrderTotalsCopyWithImpl;
@override @useResult
$Res call({
 double subtotal, double discount, double delivery, double giftPackaging, double greetingCard, double total, double vatIncluded
});




}
/// @nodoc
class __$OrderTotalsCopyWithImpl<$Res>
    implements _$OrderTotalsCopyWith<$Res> {
  __$OrderTotalsCopyWithImpl(this._self, this._then);

  final _OrderTotals _self;
  final $Res Function(_OrderTotals) _then;

/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? discount = null,Object? delivery = null,Object? giftPackaging = null,Object? greetingCard = null,Object? total = null,Object? vatIncluded = null,}) {
  return _then(_OrderTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as double,giftPackaging: null == giftPackaging ? _self.giftPackaging : giftPackaging // ignore: cast_nullable_to_non_nullable
as double,greetingCard: null == greetingCard ? _self.greetingCard : greetingCard // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,vatIncluded: null == vatIncluded ? _self.vatIncluded : vatIncluded // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$OrderPayment {

@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get method;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get status; String? get cardMask; String? get transactionId;
/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<OrderPayment> get copyWith => _$OrderPaymentCopyWithImpl<OrderPayment>(this as OrderPayment, _$identity);

  /// Serializes this OrderPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.cardMask, cardMask) || other.cardMask == cardMask)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,status,cardMask,transactionId);

@override
String toString() {
  return 'OrderPayment(method: $method, status: $status, cardMask: $cardMask, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $OrderPaymentCopyWith<$Res>  {
  factory $OrderPaymentCopyWith(OrderPayment value, $Res Function(OrderPayment) _then) = _$OrderPaymentCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, String? cardMask, String? transactionId
});




}
/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._self, this._then);

  final OrderPayment _self;
  final $Res Function(OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? status = null,Object? cardMask = freezed,Object? transactionId = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,cardMask: freezed == cardMask ? _self.cardMask : cardMask // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPayment].
extension OrderPaymentPatterns on OrderPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPayment value)  $default,){
final _that = this;
switch (_that) {
case _OrderPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPayment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  String? cardMask,  String? transactionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.method,_that.status,_that.cardMask,_that.transactionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  String? cardMask,  String? transactionId)  $default,) {final _that = this;
switch (_that) {
case _OrderPayment():
return $default(_that.method,_that.status,_that.cardMask,_that.transactionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: PaymentMethod.unknown)  PaymentMethod method, @JsonKey(unknownEnumValue: PaymentStatus.unknown)  PaymentStatus status,  String? cardMask,  String? transactionId)?  $default,) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.method,_that.status,_that.cardMask,_that.transactionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPayment implements OrderPayment {
  const _OrderPayment({@JsonKey(unknownEnumValue: PaymentMethod.unknown) this.method = PaymentMethod.unknown, @JsonKey(unknownEnumValue: PaymentStatus.unknown) this.status = PaymentStatus.unknown, this.cardMask, this.transactionId});
  factory _OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);

@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod method;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus status;
@override final  String? cardMask;
@override final  String? transactionId;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPaymentCopyWith<_OrderPayment> get copyWith => __$OrderPaymentCopyWithImpl<_OrderPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.cardMask, cardMask) || other.cardMask == cardMask)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,status,cardMask,transactionId);

@override
String toString() {
  return 'OrderPayment(method: $method, status: $status, cardMask: $cardMask, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class _$OrderPaymentCopyWith<$Res> implements $OrderPaymentCopyWith<$Res> {
  factory _$OrderPaymentCopyWith(_OrderPayment value, $Res Function(_OrderPayment) _then) = __$OrderPaymentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, String? cardMask, String? transactionId
});




}
/// @nodoc
class __$OrderPaymentCopyWithImpl<$Res>
    implements _$OrderPaymentCopyWith<$Res> {
  __$OrderPaymentCopyWithImpl(this._self, this._then);

  final _OrderPayment _self;
  final $Res Function(_OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? status = null,Object? cardMask = freezed,Object? transactionId = freezed,}) {
  return _then(_OrderPayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,cardMask: freezed == cardMask ? _self.cardMask : cardMask // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderGift {

 String get recipientName; String get recipientPhone;@JsonKey(unknownEnumValue: Occasion.unknown) Occasion get occasion; bool get surprise; String get packaging; String get cardType; String? get cardDesign; String? get message; String? get fromName; bool get hidePrices; String? get receiptCode;
/// Create a copy of OrderGift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderGiftCopyWith<OrderGift> get copyWith => _$OrderGiftCopyWithImpl<OrderGift>(this as OrderGift, _$identity);

  /// Serializes this OrderGift to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderGift&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.surprise, surprise) || other.surprise == surprise)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.cardDesign, cardDesign) || other.cardDesign == cardDesign)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.hidePrices, hidePrices) || other.hidePrices == hidePrices)&&(identical(other.receiptCode, receiptCode) || other.receiptCode == receiptCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientName,recipientPhone,occasion,surprise,packaging,cardType,cardDesign,message,fromName,hidePrices,receiptCode);

@override
String toString() {
  return 'OrderGift(recipientName: $recipientName, recipientPhone: $recipientPhone, occasion: $occasion, surprise: $surprise, packaging: $packaging, cardType: $cardType, cardDesign: $cardDesign, message: $message, fromName: $fromName, hidePrices: $hidePrices, receiptCode: $receiptCode)';
}


}

/// @nodoc
abstract mixin class $OrderGiftCopyWith<$Res>  {
  factory $OrderGiftCopyWith(OrderGift value, $Res Function(OrderGift) _then) = _$OrderGiftCopyWithImpl;
@useResult
$Res call({
 String recipientName, String recipientPhone,@JsonKey(unknownEnumValue: Occasion.unknown) Occasion occasion, bool surprise, String packaging, String cardType, String? cardDesign, String? message, String? fromName, bool hidePrices, String? receiptCode
});




}
/// @nodoc
class _$OrderGiftCopyWithImpl<$Res>
    implements $OrderGiftCopyWith<$Res> {
  _$OrderGiftCopyWithImpl(this._self, this._then);

  final OrderGift _self;
  final $Res Function(OrderGift) _then;

/// Create a copy of OrderGift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientName = null,Object? recipientPhone = null,Object? occasion = null,Object? surprise = null,Object? packaging = null,Object? cardType = null,Object? cardDesign = freezed,Object? message = freezed,Object? fromName = freezed,Object? hidePrices = null,Object? receiptCode = freezed,}) {
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
as bool,receiptCode: freezed == receiptCode ? _self.receiptCode : receiptCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderGift].
extension OrderGiftPatterns on OrderGift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderGift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderGift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderGift value)  $default,){
final _that = this;
switch (_that) {
case _OrderGift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderGift value)?  $default,){
final _that = this;
switch (_that) {
case _OrderGift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipientName,  String recipientPhone, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  bool surprise,  String packaging,  String cardType,  String? cardDesign,  String? message,  String? fromName,  bool hidePrices,  String? receiptCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderGift() when $default != null:
return $default(_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packaging,_that.cardType,_that.cardDesign,_that.message,_that.fromName,_that.hidePrices,_that.receiptCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipientName,  String recipientPhone, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  bool surprise,  String packaging,  String cardType,  String? cardDesign,  String? message,  String? fromName,  bool hidePrices,  String? receiptCode)  $default,) {final _that = this;
switch (_that) {
case _OrderGift():
return $default(_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packaging,_that.cardType,_that.cardDesign,_that.message,_that.fromName,_that.hidePrices,_that.receiptCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipientName,  String recipientPhone, @JsonKey(unknownEnumValue: Occasion.unknown)  Occasion occasion,  bool surprise,  String packaging,  String cardType,  String? cardDesign,  String? message,  String? fromName,  bool hidePrices,  String? receiptCode)?  $default,) {final _that = this;
switch (_that) {
case _OrderGift() when $default != null:
return $default(_that.recipientName,_that.recipientPhone,_that.occasion,_that.surprise,_that.packaging,_that.cardType,_that.cardDesign,_that.message,_that.fromName,_that.hidePrices,_that.receiptCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderGift implements OrderGift {
  const _OrderGift({this.recipientName = '', this.recipientPhone = '', @JsonKey(unknownEnumValue: Occasion.unknown) this.occasion = Occasion.unknown, this.surprise = false, this.packaging = '', this.cardType = '', this.cardDesign, this.message, this.fromName, this.hidePrices = false, this.receiptCode});
  factory _OrderGift.fromJson(Map<String, dynamic> json) => _$OrderGiftFromJson(json);

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
@override final  String? receiptCode;

/// Create a copy of OrderGift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderGiftCopyWith<_OrderGift> get copyWith => __$OrderGiftCopyWithImpl<_OrderGift>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderGiftToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderGift&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.surprise, surprise) || other.surprise == surprise)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.cardDesign, cardDesign) || other.cardDesign == cardDesign)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.hidePrices, hidePrices) || other.hidePrices == hidePrices)&&(identical(other.receiptCode, receiptCode) || other.receiptCode == receiptCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientName,recipientPhone,occasion,surprise,packaging,cardType,cardDesign,message,fromName,hidePrices,receiptCode);

@override
String toString() {
  return 'OrderGift(recipientName: $recipientName, recipientPhone: $recipientPhone, occasion: $occasion, surprise: $surprise, packaging: $packaging, cardType: $cardType, cardDesign: $cardDesign, message: $message, fromName: $fromName, hidePrices: $hidePrices, receiptCode: $receiptCode)';
}


}

/// @nodoc
abstract mixin class _$OrderGiftCopyWith<$Res> implements $OrderGiftCopyWith<$Res> {
  factory _$OrderGiftCopyWith(_OrderGift value, $Res Function(_OrderGift) _then) = __$OrderGiftCopyWithImpl;
@override @useResult
$Res call({
 String recipientName, String recipientPhone,@JsonKey(unknownEnumValue: Occasion.unknown) Occasion occasion, bool surprise, String packaging, String cardType, String? cardDesign, String? message, String? fromName, bool hidePrices, String? receiptCode
});




}
/// @nodoc
class __$OrderGiftCopyWithImpl<$Res>
    implements _$OrderGiftCopyWith<$Res> {
  __$OrderGiftCopyWithImpl(this._self, this._then);

  final _OrderGift _self;
  final $Res Function(_OrderGift) _then;

/// Create a copy of OrderGift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientName = null,Object? recipientPhone = null,Object? occasion = null,Object? surprise = null,Object? packaging = null,Object? cardType = null,Object? cardDesign = freezed,Object? message = freezed,Object? fromName = freezed,Object? hidePrices = null,Object? receiptCode = freezed,}) {
  return _then(_OrderGift(
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
as bool,receiptCode: freezed == receiptCode ? _self.receiptCode : receiptCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderEvent {

@JsonKey(unknownEnumValue: OrderEventType.unknown) OrderEventType get type;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get status;@JsonKey(unknownEnumValue: ActorKind.unknown) ActorKind get actor; DateTime get occurredAt; String? get note; Map<String, String?>? get data;
/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEventCopyWith<OrderEvent> get copyWith => _$OrderEventCopyWithImpl<OrderEvent>(this as OrderEvent, _$identity);

  /// Serializes this OrderEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,status,actor,occurredAt,note,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'OrderEvent(type: $type, status: $status, actor: $actor, occurredAt: $occurredAt, note: $note, data: $data)';
}


}

/// @nodoc
abstract mixin class $OrderEventCopyWith<$Res>  {
  factory $OrderEventCopyWith(OrderEvent value, $Res Function(OrderEvent) _then) = _$OrderEventCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: OrderEventType.unknown) OrderEventType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status,@JsonKey(unknownEnumValue: ActorKind.unknown) ActorKind actor, DateTime occurredAt, String? note, Map<String, String?>? data
});




}
/// @nodoc
class _$OrderEventCopyWithImpl<$Res>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._self, this._then);

  final OrderEvent _self;
  final $Res Function(OrderEvent) _then;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? status = null,Object? actor = null,Object? occurredAt = null,Object? note = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderEventType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as ActorKind,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, String?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderEvent].
extension OrderEventPatterns on OrderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEvent value)  $default,){
final _that = this;
switch (_that) {
case _OrderEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEvent value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OrderEventType.unknown)  OrderEventType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status, @JsonKey(unknownEnumValue: ActorKind.unknown)  ActorKind actor,  DateTime occurredAt,  String? note,  Map<String, String?>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEvent() when $default != null:
return $default(_that.type,_that.status,_that.actor,_that.occurredAt,_that.note,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OrderEventType.unknown)  OrderEventType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status, @JsonKey(unknownEnumValue: ActorKind.unknown)  ActorKind actor,  DateTime occurredAt,  String? note,  Map<String, String?>? data)  $default,) {final _that = this;
switch (_that) {
case _OrderEvent():
return $default(_that.type,_that.status,_that.actor,_that.occurredAt,_that.note,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: OrderEventType.unknown)  OrderEventType type, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus status, @JsonKey(unknownEnumValue: ActorKind.unknown)  ActorKind actor,  DateTime occurredAt,  String? note,  Map<String, String?>? data)?  $default,) {final _that = this;
switch (_that) {
case _OrderEvent() when $default != null:
return $default(_that.type,_that.status,_that.actor,_that.occurredAt,_that.note,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderEvent implements OrderEvent {
  const _OrderEvent({@JsonKey(unknownEnumValue: OrderEventType.unknown) this.type = OrderEventType.unknown, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status = OrderStatus.unknown, @JsonKey(unknownEnumValue: ActorKind.unknown) this.actor = ActorKind.unknown, required this.occurredAt, this.note, final  Map<String, String?>? data}): _data = data;
  factory _OrderEvent.fromJson(Map<String, dynamic> json) => _$OrderEventFromJson(json);

@override@JsonKey(unknownEnumValue: OrderEventType.unknown) final  OrderEventType type;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus status;
@override@JsonKey(unknownEnumValue: ActorKind.unknown) final  ActorKind actor;
@override final  DateTime occurredAt;
@override final  String? note;
 final  Map<String, String?>? _data;
@override Map<String, String?>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEventCopyWith<_OrderEvent> get copyWith => __$OrderEventCopyWithImpl<_OrderEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,status,actor,occurredAt,note,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'OrderEvent(type: $type, status: $status, actor: $actor, occurredAt: $occurredAt, note: $note, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OrderEventCopyWith<$Res> implements $OrderEventCopyWith<$Res> {
  factory _$OrderEventCopyWith(_OrderEvent value, $Res Function(_OrderEvent) _then) = __$OrderEventCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: OrderEventType.unknown) OrderEventType type,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus status,@JsonKey(unknownEnumValue: ActorKind.unknown) ActorKind actor, DateTime occurredAt, String? note, Map<String, String?>? data
});




}
/// @nodoc
class __$OrderEventCopyWithImpl<$Res>
    implements _$OrderEventCopyWith<$Res> {
  __$OrderEventCopyWithImpl(this._self, this._then);

  final _OrderEvent _self;
  final $Res Function(_OrderEvent) _then;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? status = null,Object? actor = null,Object? occurredAt = null,Object? note = freezed,Object? data = freezed,}) {
  return _then(_OrderEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderEventType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as ActorKind,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, String?>?,
  ));
}


}


/// @nodoc
mixin _$TrackingResult {

 OrderDetail get order; bool get isRecipientView; String? get whatsAppUrl;
/// Create a copy of TrackingResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingResultCopyWith<TrackingResult> get copyWith => _$TrackingResultCopyWithImpl<TrackingResult>(this as TrackingResult, _$identity);

  /// Serializes this TrackingResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingResult&&(identical(other.order, order) || other.order == order)&&(identical(other.isRecipientView, isRecipientView) || other.isRecipientView == isRecipientView)&&(identical(other.whatsAppUrl, whatsAppUrl) || other.whatsAppUrl == whatsAppUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,isRecipientView,whatsAppUrl);

@override
String toString() {
  return 'TrackingResult(order: $order, isRecipientView: $isRecipientView, whatsAppUrl: $whatsAppUrl)';
}


}

/// @nodoc
abstract mixin class $TrackingResultCopyWith<$Res>  {
  factory $TrackingResultCopyWith(TrackingResult value, $Res Function(TrackingResult) _then) = _$TrackingResultCopyWithImpl;
@useResult
$Res call({
 OrderDetail order, bool isRecipientView, String? whatsAppUrl
});


$OrderDetailCopyWith<$Res> get order;

}
/// @nodoc
class _$TrackingResultCopyWithImpl<$Res>
    implements $TrackingResultCopyWith<$Res> {
  _$TrackingResultCopyWithImpl(this._self, this._then);

  final TrackingResult _self;
  final $Res Function(TrackingResult) _then;

/// Create a copy of TrackingResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? isRecipientView = null,Object? whatsAppUrl = freezed,}) {
  return _then(_self.copyWith(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetail,isRecipientView: null == isRecipientView ? _self.isRecipientView : isRecipientView // ignore: cast_nullable_to_non_nullable
as bool,whatsAppUrl: freezed == whatsAppUrl ? _self.whatsAppUrl : whatsAppUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TrackingResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<$Res> get order {
  
  return $OrderDetailCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrackingResult].
extension TrackingResultPatterns on TrackingResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingResult value)  $default,){
final _that = this;
switch (_that) {
case _TrackingResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingResult value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderDetail order,  bool isRecipientView,  String? whatsAppUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingResult() when $default != null:
return $default(_that.order,_that.isRecipientView,_that.whatsAppUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderDetail order,  bool isRecipientView,  String? whatsAppUrl)  $default,) {final _that = this;
switch (_that) {
case _TrackingResult():
return $default(_that.order,_that.isRecipientView,_that.whatsAppUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderDetail order,  bool isRecipientView,  String? whatsAppUrl)?  $default,) {final _that = this;
switch (_that) {
case _TrackingResult() when $default != null:
return $default(_that.order,_that.isRecipientView,_that.whatsAppUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingResult implements TrackingResult {
  const _TrackingResult({required this.order, this.isRecipientView = false, this.whatsAppUrl});
  factory _TrackingResult.fromJson(Map<String, dynamic> json) => _$TrackingResultFromJson(json);

@override final  OrderDetail order;
@override@JsonKey() final  bool isRecipientView;
@override final  String? whatsAppUrl;

/// Create a copy of TrackingResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingResultCopyWith<_TrackingResult> get copyWith => __$TrackingResultCopyWithImpl<_TrackingResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingResult&&(identical(other.order, order) || other.order == order)&&(identical(other.isRecipientView, isRecipientView) || other.isRecipientView == isRecipientView)&&(identical(other.whatsAppUrl, whatsAppUrl) || other.whatsAppUrl == whatsAppUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,isRecipientView,whatsAppUrl);

@override
String toString() {
  return 'TrackingResult(order: $order, isRecipientView: $isRecipientView, whatsAppUrl: $whatsAppUrl)';
}


}

/// @nodoc
abstract mixin class _$TrackingResultCopyWith<$Res> implements $TrackingResultCopyWith<$Res> {
  factory _$TrackingResultCopyWith(_TrackingResult value, $Res Function(_TrackingResult) _then) = __$TrackingResultCopyWithImpl;
@override @useResult
$Res call({
 OrderDetail order, bool isRecipientView, String? whatsAppUrl
});


@override $OrderDetailCopyWith<$Res> get order;

}
/// @nodoc
class __$TrackingResultCopyWithImpl<$Res>
    implements _$TrackingResultCopyWith<$Res> {
  __$TrackingResultCopyWithImpl(this._self, this._then);

  final _TrackingResult _self;
  final $Res Function(_TrackingResult) _then;

/// Create a copy of TrackingResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? isRecipientView = null,Object? whatsAppUrl = freezed,}) {
  return _then(_TrackingResult(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetail,isRecipientView: null == isRecipientView ? _self.isRecipientView : isRecipientView // ignore: cast_nullable_to_non_nullable
as bool,whatsAppUrl: freezed == whatsAppUrl ? _self.whatsAppUrl : whatsAppUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TrackingResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<$Res> get order {
  
  return $OrderDetailCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// @nodoc
mixin _$ReturnItem {

 String get orderLineId; int get quantity;@JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true) Size? get exchangeSize;
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
 String orderLineId, int quantity,@JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true) Size? exchangeSize
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderLineId,  int quantity, @JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true)  Size? exchangeSize)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderLineId,  int quantity, @JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true)  Size? exchangeSize)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderLineId,  int quantity, @JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true)  Size? exchangeSize)?  $default,) {final _that = this;
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
  const _ReturnItem({required this.orderLineId, required this.quantity, @JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true) this.exchangeSize});
  factory _ReturnItem.fromJson(Map<String, dynamic> json) => _$ReturnItemFromJson(json);

@override final  String orderLineId;
@override final  int quantity;
@override@JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true) final  Size? exchangeSize;

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
 String orderLineId, int quantity,@JsonKey(unknownEnumValue: Size.unknown, includeIfNull: true) Size? exchangeSize
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
mixin _$ReturnRecord {

 String get id; String get orderNumber; ReturnKind get kind;@JsonKey(unknownEnumValue: ReturnStatus.unknown) ReturnStatus get status;@JsonKey(unknownEnumValue: ReturnChannel.unknown) ReturnChannel get channel; List<ReturnItem> get items; String? get reason; String? get resolutionNote; DateTime get createdAt;
/// Create a copy of ReturnRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnRecordCopyWith<ReturnRecord> get copyWith => _$ReturnRecordCopyWithImpl<ReturnRecord>(this as ReturnRecord, _$identity);

  /// Serializes this ReturnRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.resolutionNote, resolutionNote) || other.resolutionNote == resolutionNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,kind,status,channel,const DeepCollectionEquality().hash(items),reason,resolutionNote,createdAt);

@override
String toString() {
  return 'ReturnRecord(id: $id, orderNumber: $orderNumber, kind: $kind, status: $status, channel: $channel, items: $items, reason: $reason, resolutionNote: $resolutionNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReturnRecordCopyWith<$Res>  {
  factory $ReturnRecordCopyWith(ReturnRecord value, $Res Function(ReturnRecord) _then) = _$ReturnRecordCopyWithImpl;
@useResult
$Res call({
 String id, String orderNumber, ReturnKind kind,@JsonKey(unknownEnumValue: ReturnStatus.unknown) ReturnStatus status,@JsonKey(unknownEnumValue: ReturnChannel.unknown) ReturnChannel channel, List<ReturnItem> items, String? reason, String? resolutionNote, DateTime createdAt
});




}
/// @nodoc
class _$ReturnRecordCopyWithImpl<$Res>
    implements $ReturnRecordCopyWith<$Res> {
  _$ReturnRecordCopyWithImpl(this._self, this._then);

  final ReturnRecord _self;
  final $Res Function(ReturnRecord) _then;

/// Create a copy of ReturnRecord
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


/// Adds pattern-matching-related methods to [ReturnRecord].
extension ReturnRecordPatterns on ReturnRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnRecord value)  $default,){
final _that = this;
switch (_that) {
case _ReturnRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnRecord() when $default != null:
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
case _ReturnRecord() when $default != null:
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
case _ReturnRecord():
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
case _ReturnRecord() when $default != null:
return $default(_that.id,_that.orderNumber,_that.kind,_that.status,_that.channel,_that.items,_that.reason,_that.resolutionNote,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnRecord implements ReturnRecord {
  const _ReturnRecord({required this.id, required this.orderNumber, this.kind = ReturnKind.returnItem, @JsonKey(unknownEnumValue: ReturnStatus.unknown) this.status = ReturnStatus.unknown, @JsonKey(unknownEnumValue: ReturnChannel.unknown) this.channel = ReturnChannel.unknown, final  List<ReturnItem> items = const <ReturnItem>[], this.reason, this.resolutionNote, required this.createdAt}): _items = items;
  factory _ReturnRecord.fromJson(Map<String, dynamic> json) => _$ReturnRecordFromJson(json);

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

/// Create a copy of ReturnRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnRecordCopyWith<_ReturnRecord> get copyWith => __$ReturnRecordCopyWithImpl<_ReturnRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.resolutionNote, resolutionNote) || other.resolutionNote == resolutionNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,kind,status,channel,const DeepCollectionEquality().hash(_items),reason,resolutionNote,createdAt);

@override
String toString() {
  return 'ReturnRecord(id: $id, orderNumber: $orderNumber, kind: $kind, status: $status, channel: $channel, items: $items, reason: $reason, resolutionNote: $resolutionNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReturnRecordCopyWith<$Res> implements $ReturnRecordCopyWith<$Res> {
  factory _$ReturnRecordCopyWith(_ReturnRecord value, $Res Function(_ReturnRecord) _then) = __$ReturnRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderNumber, ReturnKind kind,@JsonKey(unknownEnumValue: ReturnStatus.unknown) ReturnStatus status,@JsonKey(unknownEnumValue: ReturnChannel.unknown) ReturnChannel channel, List<ReturnItem> items, String? reason, String? resolutionNote, DateTime createdAt
});




}
/// @nodoc
class __$ReturnRecordCopyWithImpl<$Res>
    implements _$ReturnRecordCopyWith<$Res> {
  __$ReturnRecordCopyWithImpl(this._self, this._then);

  final _ReturnRecord _self;
  final $Res Function(_ReturnRecord) _then;

/// Create a copy of ReturnRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? kind = null,Object? status = null,Object? channel = null,Object? items = null,Object? reason = freezed,Object? resolutionNote = freezed,Object? createdAt = null,}) {
  return _then(_ReturnRecord(
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
mixin _$PaymentStatusInfo {

 String get orderNumber;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus get orderStatus;@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod get method;@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus get status; double get amount; String? get redirectUrl; String? get failureMessage;
/// Create a copy of PaymentStatusInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStatusInfoCopyWith<PaymentStatusInfo> get copyWith => _$PaymentStatusInfoCopyWithImpl<PaymentStatusInfo>(this as PaymentStatusInfo, _$identity);

  /// Serializes this PaymentStatusInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentStatusInfo&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderNumber,orderStatus,method,status,amount,redirectUrl,failureMessage);

@override
String toString() {
  return 'PaymentStatusInfo(orderNumber: $orderNumber, orderStatus: $orderStatus, method: $method, status: $status, amount: $amount, redirectUrl: $redirectUrl, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentStatusInfoCopyWith<$Res>  {
  factory $PaymentStatusInfoCopyWith(PaymentStatusInfo value, $Res Function(PaymentStatusInfo) _then) = _$PaymentStatusInfoCopyWithImpl;
@useResult
$Res call({
 String orderNumber,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus orderStatus,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, double amount, String? redirectUrl, String? failureMessage
});




}
/// @nodoc
class _$PaymentStatusInfoCopyWithImpl<$Res>
    implements $PaymentStatusInfoCopyWith<$Res> {
  _$PaymentStatusInfoCopyWithImpl(this._self, this._then);

  final PaymentStatusInfo _self;
  final $Res Function(PaymentStatusInfo) _then;

/// Create a copy of PaymentStatusInfo
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


/// Adds pattern-matching-related methods to [PaymentStatusInfo].
extension PaymentStatusInfoPatterns on PaymentStatusInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentStatusInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentStatusInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentStatusInfo value)  $default,){
final _that = this;
switch (_that) {
case _PaymentStatusInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentStatusInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentStatusInfo() when $default != null:
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
case _PaymentStatusInfo() when $default != null:
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
case _PaymentStatusInfo():
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
case _PaymentStatusInfo() when $default != null:
return $default(_that.orderNumber,_that.orderStatus,_that.method,_that.status,_that.amount,_that.redirectUrl,_that.failureMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentStatusInfo implements PaymentStatusInfo {
  const _PaymentStatusInfo({required this.orderNumber, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.orderStatus = OrderStatus.unknown, @JsonKey(unknownEnumValue: PaymentMethod.unknown) this.method = PaymentMethod.unknown, @JsonKey(unknownEnumValue: PaymentStatus.unknown) this.status = PaymentStatus.unknown, this.amount = 0, this.redirectUrl, this.failureMessage});
  factory _PaymentStatusInfo.fromJson(Map<String, dynamic> json) => _$PaymentStatusInfoFromJson(json);

@override final  String orderNumber;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus orderStatus;
@override@JsonKey(unknownEnumValue: PaymentMethod.unknown) final  PaymentMethod method;
@override@JsonKey(unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus status;
@override@JsonKey() final  double amount;
@override final  String? redirectUrl;
@override final  String? failureMessage;

/// Create a copy of PaymentStatusInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStatusInfoCopyWith<_PaymentStatusInfo> get copyWith => __$PaymentStatusInfoCopyWithImpl<_PaymentStatusInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentStatusInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentStatusInfo&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.method, method) || other.method == method)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderNumber,orderStatus,method,status,amount,redirectUrl,failureMessage);

@override
String toString() {
  return 'PaymentStatusInfo(orderNumber: $orderNumber, orderStatus: $orderStatus, method: $method, status: $status, amount: $amount, redirectUrl: $redirectUrl, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentStatusInfoCopyWith<$Res> implements $PaymentStatusInfoCopyWith<$Res> {
  factory _$PaymentStatusInfoCopyWith(_PaymentStatusInfo value, $Res Function(_PaymentStatusInfo) _then) = __$PaymentStatusInfoCopyWithImpl;
@override @useResult
$Res call({
 String orderNumber,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus orderStatus,@JsonKey(unknownEnumValue: PaymentMethod.unknown) PaymentMethod method,@JsonKey(unknownEnumValue: PaymentStatus.unknown) PaymentStatus status, double amount, String? redirectUrl, String? failureMessage
});




}
/// @nodoc
class __$PaymentStatusInfoCopyWithImpl<$Res>
    implements _$PaymentStatusInfoCopyWith<$Res> {
  __$PaymentStatusInfoCopyWithImpl(this._self, this._then);

  final _PaymentStatusInfo _self;
  final $Res Function(_PaymentStatusInfo) _then;

/// Create a copy of PaymentStatusInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNumber = null,Object? orderStatus = null,Object? method = null,Object? status = null,Object? amount = null,Object? redirectUrl = freezed,Object? failureMessage = freezed,}) {
  return _then(_PaymentStatusInfo(
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

class _SlotDay extends SlotDay {
  const _SlotDay({required this.date, final  List<SlotWindow> windows = const <SlotWindow>[]}): _windows = windows,super._();
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

class _GiftReceipt extends GiftReceipt {
  const _GiftReceipt({required this.receiptCode, this.recipientName = '', @JsonKey(unknownEnumValue: Occasion.unknown) this.occasion = Occasion.unknown, this.fromName, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status = OrderStatus.unknown, final  List<GiftReceiptLine> lines = const <GiftReceiptLine>[], this.exchangeAllowed = false, this.exchangeDeadline}): _lines = lines,super._();
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

class _GiftReceiptLine extends GiftReceiptLine {
  const _GiftReceiptLine({required this.lineId, required this.name, this.color, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.quantity = 1, this.exchangeable = false, @JsonKey(unknownEnumValue: Size.unknown) final  List<Size> availableSizes = const <Size>[]}): _availableSizes = availableSizes,super._();
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

// dart format on
