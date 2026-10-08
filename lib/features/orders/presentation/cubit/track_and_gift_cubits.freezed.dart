// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_and_gift_cubits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackOrderState {

 bool get submitting; bool get numberMissing; bool get phoneInvalid; Object? get error;/// Found → the page opens the order detail with these guest credentials.
 OrderAccess? get found;
/// Create a copy of TrackOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackOrderStateCopyWith<TrackOrderState> get copyWith => _$TrackOrderStateCopyWithImpl<TrackOrderState>(this as TrackOrderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackOrderState&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.numberMissing, numberMissing) || other.numberMissing == numberMissing)&&(identical(other.phoneInvalid, phoneInvalid) || other.phoneInvalid == phoneInvalid)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.found, found) || other.found == found));
}


@override
int get hashCode => Object.hash(runtimeType,submitting,numberMissing,phoneInvalid,const DeepCollectionEquality().hash(error),found);

@override
String toString() {
  return 'TrackOrderState(submitting: $submitting, numberMissing: $numberMissing, phoneInvalid: $phoneInvalid, error: $error, found: $found)';
}


}

/// @nodoc
abstract mixin class $TrackOrderStateCopyWith<$Res>  {
  factory $TrackOrderStateCopyWith(TrackOrderState value, $Res Function(TrackOrderState) _then) = _$TrackOrderStateCopyWithImpl;
@useResult
$Res call({
 bool submitting, bool numberMissing, bool phoneInvalid, Object? error, OrderAccess? found
});




}
/// @nodoc
class _$TrackOrderStateCopyWithImpl<$Res>
    implements $TrackOrderStateCopyWith<$Res> {
  _$TrackOrderStateCopyWithImpl(this._self, this._then);

  final TrackOrderState _self;
  final $Res Function(TrackOrderState) _then;

/// Create a copy of TrackOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submitting = null,Object? numberMissing = null,Object? phoneInvalid = null,Object? error = freezed,Object? found = freezed,}) {
  return _then(_self.copyWith(
submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,numberMissing: null == numberMissing ? _self.numberMissing : numberMissing // ignore: cast_nullable_to_non_nullable
as bool,phoneInvalid: null == phoneInvalid ? _self.phoneInvalid : phoneInvalid // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,found: freezed == found ? _self.found : found // ignore: cast_nullable_to_non_nullable
as OrderAccess?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackOrderState].
extension TrackOrderStatePatterns on TrackOrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackOrderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackOrderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackOrderState value)  $default,){
final _that = this;
switch (_that) {
case _TrackOrderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackOrderState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackOrderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool submitting,  bool numberMissing,  bool phoneInvalid,  Object? error,  OrderAccess? found)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackOrderState() when $default != null:
return $default(_that.submitting,_that.numberMissing,_that.phoneInvalid,_that.error,_that.found);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool submitting,  bool numberMissing,  bool phoneInvalid,  Object? error,  OrderAccess? found)  $default,) {final _that = this;
switch (_that) {
case _TrackOrderState():
return $default(_that.submitting,_that.numberMissing,_that.phoneInvalid,_that.error,_that.found);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool submitting,  bool numberMissing,  bool phoneInvalid,  Object? error,  OrderAccess? found)?  $default,) {final _that = this;
switch (_that) {
case _TrackOrderState() when $default != null:
return $default(_that.submitting,_that.numberMissing,_that.phoneInvalid,_that.error,_that.found);case _:
  return null;

}
}

}

/// @nodoc


class _TrackOrderState implements TrackOrderState {
  const _TrackOrderState({this.submitting = false, this.numberMissing = false, this.phoneInvalid = false, this.error, this.found});
  

@override@JsonKey() final  bool submitting;
@override@JsonKey() final  bool numberMissing;
@override@JsonKey() final  bool phoneInvalid;
@override final  Object? error;
/// Found → the page opens the order detail with these guest credentials.
@override final  OrderAccess? found;

/// Create a copy of TrackOrderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackOrderStateCopyWith<_TrackOrderState> get copyWith => __$TrackOrderStateCopyWithImpl<_TrackOrderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackOrderState&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.numberMissing, numberMissing) || other.numberMissing == numberMissing)&&(identical(other.phoneInvalid, phoneInvalid) || other.phoneInvalid == phoneInvalid)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.found, found) || other.found == found));
}


@override
int get hashCode => Object.hash(runtimeType,submitting,numberMissing,phoneInvalid,const DeepCollectionEquality().hash(error),found);

@override
String toString() {
  return 'TrackOrderState(submitting: $submitting, numberMissing: $numberMissing, phoneInvalid: $phoneInvalid, error: $error, found: $found)';
}


}

/// @nodoc
abstract mixin class _$TrackOrderStateCopyWith<$Res> implements $TrackOrderStateCopyWith<$Res> {
  factory _$TrackOrderStateCopyWith(_TrackOrderState value, $Res Function(_TrackOrderState) _then) = __$TrackOrderStateCopyWithImpl;
@override @useResult
$Res call({
 bool submitting, bool numberMissing, bool phoneInvalid, Object? error, OrderAccess? found
});




}
/// @nodoc
class __$TrackOrderStateCopyWithImpl<$Res>
    implements _$TrackOrderStateCopyWith<$Res> {
  __$TrackOrderStateCopyWithImpl(this._self, this._then);

  final _TrackOrderState _self;
  final $Res Function(_TrackOrderState) _then;

/// Create a copy of TrackOrderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submitting = null,Object? numberMissing = null,Object? phoneInvalid = null,Object? error = freezed,Object? found = freezed,}) {
  return _then(_TrackOrderState(
submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,numberMissing: null == numberMissing ? _self.numberMissing : numberMissing // ignore: cast_nullable_to_non_nullable
as bool,phoneInvalid: null == phoneInvalid ? _self.phoneInvalid : phoneInvalid // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,found: freezed == found ? _self.found : found // ignore: cast_nullable_to_non_nullable
as OrderAccess?,
  ));
}


}

/// @nodoc
mixin _$GiftReceiptState {

 GiftReceiptStep get step; String get code;/// Recipient's phone, wire format, once the receipt opened.
 String? get phone; GiftReceipt? get receipt;/// lineId → new size.
 Map<String, Size> get sizes; bool get codeMissing; bool get phoneInvalid; Object? get error; bool get submitting; Object? get submitError;/// The exchange request created by the server.
 ReturnInfo? get exchange;
/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftReceiptStateCopyWith<GiftReceiptState> get copyWith => _$GiftReceiptStateCopyWithImpl<GiftReceiptState>(this as GiftReceiptState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftReceiptState&&(identical(other.step, step) || other.step == step)&&(identical(other.code, code) || other.code == code)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.receipt, receipt) || other.receipt == receipt)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&(identical(other.codeMissing, codeMissing) || other.codeMissing == codeMissing)&&(identical(other.phoneInvalid, phoneInvalid) || other.phoneInvalid == phoneInvalid)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.submitError, submitError)&&(identical(other.exchange, exchange) || other.exchange == exchange));
}


@override
int get hashCode => Object.hash(runtimeType,step,code,phone,receipt,const DeepCollectionEquality().hash(sizes),codeMissing,phoneInvalid,const DeepCollectionEquality().hash(error),submitting,const DeepCollectionEquality().hash(submitError),exchange);

@override
String toString() {
  return 'GiftReceiptState(step: $step, code: $code, phone: $phone, receipt: $receipt, sizes: $sizes, codeMissing: $codeMissing, phoneInvalid: $phoneInvalid, error: $error, submitting: $submitting, submitError: $submitError, exchange: $exchange)';
}


}

/// @nodoc
abstract mixin class $GiftReceiptStateCopyWith<$Res>  {
  factory $GiftReceiptStateCopyWith(GiftReceiptState value, $Res Function(GiftReceiptState) _then) = _$GiftReceiptStateCopyWithImpl;
@useResult
$Res call({
 GiftReceiptStep step, String code, String? phone, GiftReceipt? receipt, Map<String, Size> sizes, bool codeMissing, bool phoneInvalid, Object? error, bool submitting, Object? submitError, ReturnInfo? exchange
});


$GiftReceiptCopyWith<$Res>? get receipt;$ReturnInfoCopyWith<$Res>? get exchange;

}
/// @nodoc
class _$GiftReceiptStateCopyWithImpl<$Res>
    implements $GiftReceiptStateCopyWith<$Res> {
  _$GiftReceiptStateCopyWithImpl(this._self, this._then);

  final GiftReceiptState _self;
  final $Res Function(GiftReceiptState) _then;

/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? code = null,Object? phone = freezed,Object? receipt = freezed,Object? sizes = null,Object? codeMissing = null,Object? phoneInvalid = null,Object? error = freezed,Object? submitting = null,Object? submitError = freezed,Object? exchange = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as GiftReceiptStep,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,receipt: freezed == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as GiftReceipt?,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as Map<String, Size>,codeMissing: null == codeMissing ? _self.codeMissing : codeMissing // ignore: cast_nullable_to_non_nullable
as bool,phoneInvalid: null == phoneInvalid ? _self.phoneInvalid : phoneInvalid // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError ,exchange: freezed == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as ReturnInfo?,
  ));
}
/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftReceiptCopyWith<$Res>? get receipt {
    if (_self.receipt == null) {
    return null;
  }

  return $GiftReceiptCopyWith<$Res>(_self.receipt!, (value) {
    return _then(_self.copyWith(receipt: value));
  });
}/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnInfoCopyWith<$Res>? get exchange {
    if (_self.exchange == null) {
    return null;
  }

  return $ReturnInfoCopyWith<$Res>(_self.exchange!, (value) {
    return _then(_self.copyWith(exchange: value));
  });
}
}


/// Adds pattern-matching-related methods to [GiftReceiptState].
extension GiftReceiptStatePatterns on GiftReceiptState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftReceiptState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftReceiptState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftReceiptState value)  $default,){
final _that = this;
switch (_that) {
case _GiftReceiptState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftReceiptState value)?  $default,){
final _that = this;
switch (_that) {
case _GiftReceiptState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GiftReceiptStep step,  String code,  String? phone,  GiftReceipt? receipt,  Map<String, Size> sizes,  bool codeMissing,  bool phoneInvalid,  Object? error,  bool submitting,  Object? submitError,  ReturnInfo? exchange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftReceiptState() when $default != null:
return $default(_that.step,_that.code,_that.phone,_that.receipt,_that.sizes,_that.codeMissing,_that.phoneInvalid,_that.error,_that.submitting,_that.submitError,_that.exchange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GiftReceiptStep step,  String code,  String? phone,  GiftReceipt? receipt,  Map<String, Size> sizes,  bool codeMissing,  bool phoneInvalid,  Object? error,  bool submitting,  Object? submitError,  ReturnInfo? exchange)  $default,) {final _that = this;
switch (_that) {
case _GiftReceiptState():
return $default(_that.step,_that.code,_that.phone,_that.receipt,_that.sizes,_that.codeMissing,_that.phoneInvalid,_that.error,_that.submitting,_that.submitError,_that.exchange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GiftReceiptStep step,  String code,  String? phone,  GiftReceipt? receipt,  Map<String, Size> sizes,  bool codeMissing,  bool phoneInvalid,  Object? error,  bool submitting,  Object? submitError,  ReturnInfo? exchange)?  $default,) {final _that = this;
switch (_that) {
case _GiftReceiptState() when $default != null:
return $default(_that.step,_that.code,_that.phone,_that.receipt,_that.sizes,_that.codeMissing,_that.phoneInvalid,_that.error,_that.submitting,_that.submitError,_that.exchange);case _:
  return null;

}
}

}

/// @nodoc


class _GiftReceiptState extends GiftReceiptState {
  const _GiftReceiptState({this.step = GiftReceiptStep.form, this.code = '', this.phone, this.receipt, final  Map<String, Size> sizes = const <String, Size>{}, this.codeMissing = false, this.phoneInvalid = false, this.error, this.submitting = false, this.submitError, this.exchange}): _sizes = sizes,super._();
  

@override@JsonKey() final  GiftReceiptStep step;
@override@JsonKey() final  String code;
/// Recipient's phone, wire format, once the receipt opened.
@override final  String? phone;
@override final  GiftReceipt? receipt;
/// lineId → new size.
 final  Map<String, Size> _sizes;
/// lineId → new size.
@override@JsonKey() Map<String, Size> get sizes {
  if (_sizes is EqualUnmodifiableMapView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sizes);
}

@override@JsonKey() final  bool codeMissing;
@override@JsonKey() final  bool phoneInvalid;
@override final  Object? error;
@override@JsonKey() final  bool submitting;
@override final  Object? submitError;
/// The exchange request created by the server.
@override final  ReturnInfo? exchange;

/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftReceiptStateCopyWith<_GiftReceiptState> get copyWith => __$GiftReceiptStateCopyWithImpl<_GiftReceiptState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftReceiptState&&(identical(other.step, step) || other.step == step)&&(identical(other.code, code) || other.code == code)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.receipt, receipt) || other.receipt == receipt)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&(identical(other.codeMissing, codeMissing) || other.codeMissing == codeMissing)&&(identical(other.phoneInvalid, phoneInvalid) || other.phoneInvalid == phoneInvalid)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.submitError, submitError)&&(identical(other.exchange, exchange) || other.exchange == exchange));
}


@override
int get hashCode => Object.hash(runtimeType,step,code,phone,receipt,const DeepCollectionEquality().hash(_sizes),codeMissing,phoneInvalid,const DeepCollectionEquality().hash(error),submitting,const DeepCollectionEquality().hash(submitError),exchange);

@override
String toString() {
  return 'GiftReceiptState(step: $step, code: $code, phone: $phone, receipt: $receipt, sizes: $sizes, codeMissing: $codeMissing, phoneInvalid: $phoneInvalid, error: $error, submitting: $submitting, submitError: $submitError, exchange: $exchange)';
}


}

/// @nodoc
abstract mixin class _$GiftReceiptStateCopyWith<$Res> implements $GiftReceiptStateCopyWith<$Res> {
  factory _$GiftReceiptStateCopyWith(_GiftReceiptState value, $Res Function(_GiftReceiptState) _then) = __$GiftReceiptStateCopyWithImpl;
@override @useResult
$Res call({
 GiftReceiptStep step, String code, String? phone, GiftReceipt? receipt, Map<String, Size> sizes, bool codeMissing, bool phoneInvalid, Object? error, bool submitting, Object? submitError, ReturnInfo? exchange
});


@override $GiftReceiptCopyWith<$Res>? get receipt;@override $ReturnInfoCopyWith<$Res>? get exchange;

}
/// @nodoc
class __$GiftReceiptStateCopyWithImpl<$Res>
    implements _$GiftReceiptStateCopyWith<$Res> {
  __$GiftReceiptStateCopyWithImpl(this._self, this._then);

  final _GiftReceiptState _self;
  final $Res Function(_GiftReceiptState) _then;

/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? code = null,Object? phone = freezed,Object? receipt = freezed,Object? sizes = null,Object? codeMissing = null,Object? phoneInvalid = null,Object? error = freezed,Object? submitting = null,Object? submitError = freezed,Object? exchange = freezed,}) {
  return _then(_GiftReceiptState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as GiftReceiptStep,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,receipt: freezed == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as GiftReceipt?,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as Map<String, Size>,codeMissing: null == codeMissing ? _self.codeMissing : codeMissing // ignore: cast_nullable_to_non_nullable
as bool,phoneInvalid: null == phoneInvalid ? _self.phoneInvalid : phoneInvalid // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError ,exchange: freezed == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as ReturnInfo?,
  ));
}

/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftReceiptCopyWith<$Res>? get receipt {
    if (_self.receipt == null) {
    return null;
  }

  return $GiftReceiptCopyWith<$Res>(_self.receipt!, (value) {
    return _then(_self.copyWith(receipt: value));
  });
}/// Create a copy of GiftReceiptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnInfoCopyWith<$Res>? get exchange {
    if (_self.exchange == null) {
    return null;
  }

  return $ReturnInfoCopyWith<$Res>(_self.exchange!, (value) {
    return _then(_self.copyWith(exchange: value));
  });
}
}

// dart format on
