// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderDetailState {

 OrderAccess get access; OrderDetailStatus get status; OrderDetail? get order; bool get stale; bool get refreshing; bool get isRecipientView; String? get whatsAppUrl;/// Load failure (full-screen error).
 Object? get error; PayFlow get payment;/// The gateway's localized reason when a retried payment failed.
 String? get paymentFailure;/// Last action failure (toast). A new instance each time, so listeners fire once per failure.
 Object? get actionError; OrderNotice? get notice; int get noticeSeq;
/// Create a copy of OrderDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailStateCopyWith<OrderDetailState> get copyWith => _$OrderDetailStateCopyWithImpl<OrderDetailState>(this as OrderDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailState&&(identical(other.access, access) || other.access == access)&&(identical(other.status, status) || other.status == status)&&(identical(other.order, order) || other.order == order)&&(identical(other.stale, stale) || other.stale == stale)&&(identical(other.refreshing, refreshing) || other.refreshing == refreshing)&&(identical(other.isRecipientView, isRecipientView) || other.isRecipientView == isRecipientView)&&(identical(other.whatsAppUrl, whatsAppUrl) || other.whatsAppUrl == whatsAppUrl)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.paymentFailure, paymentFailure) || other.paymentFailure == paymentFailure)&&const DeepCollectionEquality().equals(other.actionError, actionError)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeSeq, noticeSeq) || other.noticeSeq == noticeSeq));
}


@override
int get hashCode => Object.hash(runtimeType,access,status,order,stale,refreshing,isRecipientView,whatsAppUrl,const DeepCollectionEquality().hash(error),payment,paymentFailure,const DeepCollectionEquality().hash(actionError),notice,noticeSeq);

@override
String toString() {
  return 'OrderDetailState(access: $access, status: $status, order: $order, stale: $stale, refreshing: $refreshing, isRecipientView: $isRecipientView, whatsAppUrl: $whatsAppUrl, error: $error, payment: $payment, paymentFailure: $paymentFailure, actionError: $actionError, notice: $notice, noticeSeq: $noticeSeq)';
}


}

/// @nodoc
abstract mixin class $OrderDetailStateCopyWith<$Res>  {
  factory $OrderDetailStateCopyWith(OrderDetailState value, $Res Function(OrderDetailState) _then) = _$OrderDetailStateCopyWithImpl;
@useResult
$Res call({
 OrderAccess access, OrderDetailStatus status, OrderDetail? order, bool stale, bool refreshing, bool isRecipientView, String? whatsAppUrl, Object? error, PayFlow payment, String? paymentFailure, Object? actionError, OrderNotice? notice, int noticeSeq
});


$OrderDetailCopyWith<$Res>? get order;

}
/// @nodoc
class _$OrderDetailStateCopyWithImpl<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  _$OrderDetailStateCopyWithImpl(this._self, this._then);

  final OrderDetailState _self;
  final $Res Function(OrderDetailState) _then;

/// Create a copy of OrderDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access = null,Object? status = null,Object? order = freezed,Object? stale = null,Object? refreshing = null,Object? isRecipientView = null,Object? whatsAppUrl = freezed,Object? error = freezed,Object? payment = null,Object? paymentFailure = freezed,Object? actionError = freezed,Object? notice = freezed,Object? noticeSeq = null,}) {
  return _then(_self.copyWith(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as OrderAccess,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderDetailStatus,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetail?,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as bool,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,isRecipientView: null == isRecipientView ? _self.isRecipientView : isRecipientView // ignore: cast_nullable_to_non_nullable
as bool,whatsAppUrl: freezed == whatsAppUrl ? _self.whatsAppUrl : whatsAppUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error ,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PayFlow,paymentFailure: freezed == paymentFailure ? _self.paymentFailure : paymentFailure // ignore: cast_nullable_to_non_nullable
as String?,actionError: freezed == actionError ? _self.actionError : actionError ,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as OrderNotice?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<$Res>? get order {
    if (_self.order == null) {
    return null;
  }

  return $OrderDetailCopyWith<$Res>(_self.order!, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetailState].
extension OrderDetailStatePatterns on OrderDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailState value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderAccess access,  OrderDetailStatus status,  OrderDetail? order,  bool stale,  bool refreshing,  bool isRecipientView,  String? whatsAppUrl,  Object? error,  PayFlow payment,  String? paymentFailure,  Object? actionError,  OrderNotice? notice,  int noticeSeq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailState() when $default != null:
return $default(_that.access,_that.status,_that.order,_that.stale,_that.refreshing,_that.isRecipientView,_that.whatsAppUrl,_that.error,_that.payment,_that.paymentFailure,_that.actionError,_that.notice,_that.noticeSeq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderAccess access,  OrderDetailStatus status,  OrderDetail? order,  bool stale,  bool refreshing,  bool isRecipientView,  String? whatsAppUrl,  Object? error,  PayFlow payment,  String? paymentFailure,  Object? actionError,  OrderNotice? notice,  int noticeSeq)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailState():
return $default(_that.access,_that.status,_that.order,_that.stale,_that.refreshing,_that.isRecipientView,_that.whatsAppUrl,_that.error,_that.payment,_that.paymentFailure,_that.actionError,_that.notice,_that.noticeSeq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderAccess access,  OrderDetailStatus status,  OrderDetail? order,  bool stale,  bool refreshing,  bool isRecipientView,  String? whatsAppUrl,  Object? error,  PayFlow payment,  String? paymentFailure,  Object? actionError,  OrderNotice? notice,  int noticeSeq)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailState() when $default != null:
return $default(_that.access,_that.status,_that.order,_that.stale,_that.refreshing,_that.isRecipientView,_that.whatsAppUrl,_that.error,_that.payment,_that.paymentFailure,_that.actionError,_that.notice,_that.noticeSeq);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDetailState extends OrderDetailState {
  const _OrderDetailState({required this.access, this.status = OrderDetailStatus.loading, this.order, this.stale = false, this.refreshing = false, this.isRecipientView = false, this.whatsAppUrl, this.error, this.payment = PayFlow.idle, this.paymentFailure, this.actionError, this.notice, this.noticeSeq = 0}): super._();
  

@override final  OrderAccess access;
@override@JsonKey() final  OrderDetailStatus status;
@override final  OrderDetail? order;
@override@JsonKey() final  bool stale;
@override@JsonKey() final  bool refreshing;
@override@JsonKey() final  bool isRecipientView;
@override final  String? whatsAppUrl;
/// Load failure (full-screen error).
@override final  Object? error;
@override@JsonKey() final  PayFlow payment;
/// The gateway's localized reason when a retried payment failed.
@override final  String? paymentFailure;
/// Last action failure (toast). A new instance each time, so listeners fire once per failure.
@override final  Object? actionError;
@override final  OrderNotice? notice;
@override@JsonKey() final  int noticeSeq;

/// Create a copy of OrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailStateCopyWith<_OrderDetailState> get copyWith => __$OrderDetailStateCopyWithImpl<_OrderDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailState&&(identical(other.access, access) || other.access == access)&&(identical(other.status, status) || other.status == status)&&(identical(other.order, order) || other.order == order)&&(identical(other.stale, stale) || other.stale == stale)&&(identical(other.refreshing, refreshing) || other.refreshing == refreshing)&&(identical(other.isRecipientView, isRecipientView) || other.isRecipientView == isRecipientView)&&(identical(other.whatsAppUrl, whatsAppUrl) || other.whatsAppUrl == whatsAppUrl)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.paymentFailure, paymentFailure) || other.paymentFailure == paymentFailure)&&const DeepCollectionEquality().equals(other.actionError, actionError)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeSeq, noticeSeq) || other.noticeSeq == noticeSeq));
}


@override
int get hashCode => Object.hash(runtimeType,access,status,order,stale,refreshing,isRecipientView,whatsAppUrl,const DeepCollectionEquality().hash(error),payment,paymentFailure,const DeepCollectionEquality().hash(actionError),notice,noticeSeq);

@override
String toString() {
  return 'OrderDetailState(access: $access, status: $status, order: $order, stale: $stale, refreshing: $refreshing, isRecipientView: $isRecipientView, whatsAppUrl: $whatsAppUrl, error: $error, payment: $payment, paymentFailure: $paymentFailure, actionError: $actionError, notice: $notice, noticeSeq: $noticeSeq)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailStateCopyWith<$Res> implements $OrderDetailStateCopyWith<$Res> {
  factory _$OrderDetailStateCopyWith(_OrderDetailState value, $Res Function(_OrderDetailState) _then) = __$OrderDetailStateCopyWithImpl;
@override @useResult
$Res call({
 OrderAccess access, OrderDetailStatus status, OrderDetail? order, bool stale, bool refreshing, bool isRecipientView, String? whatsAppUrl, Object? error, PayFlow payment, String? paymentFailure, Object? actionError, OrderNotice? notice, int noticeSeq
});


@override $OrderDetailCopyWith<$Res>? get order;

}
/// @nodoc
class __$OrderDetailStateCopyWithImpl<$Res>
    implements _$OrderDetailStateCopyWith<$Res> {
  __$OrderDetailStateCopyWithImpl(this._self, this._then);

  final _OrderDetailState _self;
  final $Res Function(_OrderDetailState) _then;

/// Create a copy of OrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access = null,Object? status = null,Object? order = freezed,Object? stale = null,Object? refreshing = null,Object? isRecipientView = null,Object? whatsAppUrl = freezed,Object? error = freezed,Object? payment = null,Object? paymentFailure = freezed,Object? actionError = freezed,Object? notice = freezed,Object? noticeSeq = null,}) {
  return _then(_OrderDetailState(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as OrderAccess,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderDetailStatus,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetail?,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as bool,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,isRecipientView: null == isRecipientView ? _self.isRecipientView : isRecipientView // ignore: cast_nullable_to_non_nullable
as bool,whatsAppUrl: freezed == whatsAppUrl ? _self.whatsAppUrl : whatsAppUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error ,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PayFlow,paymentFailure: freezed == paymentFailure ? _self.paymentFailure : paymentFailure // ignore: cast_nullable_to_non_nullable
as String?,actionError: freezed == actionError ? _self.actionError : actionError ,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as OrderNotice?,noticeSeq: null == noticeSeq ? _self.noticeSeq : noticeSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OrderDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<$Res>? get order {
    if (_self.order == null) {
    return null;
  }

  return $OrderDetailCopyWith<$Res>(_self.order!, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

// dart format on
