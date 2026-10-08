// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReturnRequestState {

 OrderAccess get access; ReturnRequestStatus get status; OrderDetail? get order; ReturnForm? get form;/// Validation messages appear only after the first submit attempt.
 bool get showErrors; bool get submitting; Object? get error; Object? get submitError;/// The created return — the page switches to its success view.
 ReturnInfo? get result;
/// Create a copy of ReturnRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnRequestStateCopyWith<ReturnRequestState> get copyWith => _$ReturnRequestStateCopyWithImpl<ReturnRequestState>(this as ReturnRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnRequestState&&(identical(other.access, access) || other.access == access)&&(identical(other.status, status) || other.status == status)&&(identical(other.order, order) || other.order == order)&&(identical(other.form, form) || other.form == form)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.submitError, submitError)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,access,status,order,form,showErrors,submitting,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(submitError),result);

@override
String toString() {
  return 'ReturnRequestState(access: $access, status: $status, order: $order, form: $form, showErrors: $showErrors, submitting: $submitting, error: $error, submitError: $submitError, result: $result)';
}


}

/// @nodoc
abstract mixin class $ReturnRequestStateCopyWith<$Res>  {
  factory $ReturnRequestStateCopyWith(ReturnRequestState value, $Res Function(ReturnRequestState) _then) = _$ReturnRequestStateCopyWithImpl;
@useResult
$Res call({
 OrderAccess access, ReturnRequestStatus status, OrderDetail? order, ReturnForm? form, bool showErrors, bool submitting, Object? error, Object? submitError, ReturnInfo? result
});


$OrderDetailCopyWith<$Res>? get order;$ReturnInfoCopyWith<$Res>? get result;

}
/// @nodoc
class _$ReturnRequestStateCopyWithImpl<$Res>
    implements $ReturnRequestStateCopyWith<$Res> {
  _$ReturnRequestStateCopyWithImpl(this._self, this._then);

  final ReturnRequestState _self;
  final $Res Function(ReturnRequestState) _then;

/// Create a copy of ReturnRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access = null,Object? status = null,Object? order = freezed,Object? form = freezed,Object? showErrors = null,Object? submitting = null,Object? error = freezed,Object? submitError = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as OrderAccess,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnRequestStatus,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetail?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReturnForm?,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,submitError: freezed == submitError ? _self.submitError : submitError ,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ReturnInfo?,
  ));
}
/// Create a copy of ReturnRequestState
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
}/// Create a copy of ReturnRequestState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnInfoCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ReturnInfoCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReturnRequestState].
extension ReturnRequestStatePatterns on ReturnRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnRequestState value)  $default,){
final _that = this;
switch (_that) {
case _ReturnRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderAccess access,  ReturnRequestStatus status,  OrderDetail? order,  ReturnForm? form,  bool showErrors,  bool submitting,  Object? error,  Object? submitError,  ReturnInfo? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnRequestState() when $default != null:
return $default(_that.access,_that.status,_that.order,_that.form,_that.showErrors,_that.submitting,_that.error,_that.submitError,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderAccess access,  ReturnRequestStatus status,  OrderDetail? order,  ReturnForm? form,  bool showErrors,  bool submitting,  Object? error,  Object? submitError,  ReturnInfo? result)  $default,) {final _that = this;
switch (_that) {
case _ReturnRequestState():
return $default(_that.access,_that.status,_that.order,_that.form,_that.showErrors,_that.submitting,_that.error,_that.submitError,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderAccess access,  ReturnRequestStatus status,  OrderDetail? order,  ReturnForm? form,  bool showErrors,  bool submitting,  Object? error,  Object? submitError,  ReturnInfo? result)?  $default,) {final _that = this;
switch (_that) {
case _ReturnRequestState() when $default != null:
return $default(_that.access,_that.status,_that.order,_that.form,_that.showErrors,_that.submitting,_that.error,_that.submitError,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _ReturnRequestState extends ReturnRequestState {
  const _ReturnRequestState({required this.access, this.status = ReturnRequestStatus.loading, this.order, this.form, this.showErrors = false, this.submitting = false, this.error, this.submitError, this.result}): super._();
  

@override final  OrderAccess access;
@override@JsonKey() final  ReturnRequestStatus status;
@override final  OrderDetail? order;
@override final  ReturnForm? form;
/// Validation messages appear only after the first submit attempt.
@override@JsonKey() final  bool showErrors;
@override@JsonKey() final  bool submitting;
@override final  Object? error;
@override final  Object? submitError;
/// The created return — the page switches to its success view.
@override final  ReturnInfo? result;

/// Create a copy of ReturnRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnRequestStateCopyWith<_ReturnRequestState> get copyWith => __$ReturnRequestStateCopyWithImpl<_ReturnRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnRequestState&&(identical(other.access, access) || other.access == access)&&(identical(other.status, status) || other.status == status)&&(identical(other.order, order) || other.order == order)&&(identical(other.form, form) || other.form == form)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.submitError, submitError)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,access,status,order,form,showErrors,submitting,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(submitError),result);

@override
String toString() {
  return 'ReturnRequestState(access: $access, status: $status, order: $order, form: $form, showErrors: $showErrors, submitting: $submitting, error: $error, submitError: $submitError, result: $result)';
}


}

/// @nodoc
abstract mixin class _$ReturnRequestStateCopyWith<$Res> implements $ReturnRequestStateCopyWith<$Res> {
  factory _$ReturnRequestStateCopyWith(_ReturnRequestState value, $Res Function(_ReturnRequestState) _then) = __$ReturnRequestStateCopyWithImpl;
@override @useResult
$Res call({
 OrderAccess access, ReturnRequestStatus status, OrderDetail? order, ReturnForm? form, bool showErrors, bool submitting, Object? error, Object? submitError, ReturnInfo? result
});


@override $OrderDetailCopyWith<$Res>? get order;@override $ReturnInfoCopyWith<$Res>? get result;

}
/// @nodoc
class __$ReturnRequestStateCopyWithImpl<$Res>
    implements _$ReturnRequestStateCopyWith<$Res> {
  __$ReturnRequestStateCopyWithImpl(this._self, this._then);

  final _ReturnRequestState _self;
  final $Res Function(_ReturnRequestState) _then;

/// Create a copy of ReturnRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access = null,Object? status = null,Object? order = freezed,Object? form = freezed,Object? showErrors = null,Object? submitting = null,Object? error = freezed,Object? submitError = freezed,Object? result = freezed,}) {
  return _then(_ReturnRequestState(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as OrderAccess,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnRequestStatus,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetail?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReturnForm?,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,submitError: freezed == submitError ? _self.submitError : submitError ,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ReturnInfo?,
  ));
}

/// Create a copy of ReturnRequestState
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
}/// Create a copy of ReturnRequestState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnInfoCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ReturnInfoCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
