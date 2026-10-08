// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SlotPickerState {

 SlotPickerStatus get status; List<SlotDay> get days; DateTime? get selectedDate; String? get selectedWindowId; bool get submitting; Object? get error; Object? get submitError;/// Set once the server accepted the change.
 OrderDetail? get updated;
/// Create a copy of SlotPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotPickerStateCopyWith<SlotPickerState> get copyWith => _$SlotPickerStateCopyWithImpl<SlotPickerState>(this as SlotPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotPickerState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedWindowId, selectedWindowId) || other.selectedWindowId == selectedWindowId)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.submitError, submitError)&&(identical(other.updated, updated) || other.updated == updated));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(days),selectedDate,selectedWindowId,submitting,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(submitError),updated);

@override
String toString() {
  return 'SlotPickerState(status: $status, days: $days, selectedDate: $selectedDate, selectedWindowId: $selectedWindowId, submitting: $submitting, error: $error, submitError: $submitError, updated: $updated)';
}


}

/// @nodoc
abstract mixin class $SlotPickerStateCopyWith<$Res>  {
  factory $SlotPickerStateCopyWith(SlotPickerState value, $Res Function(SlotPickerState) _then) = _$SlotPickerStateCopyWithImpl;
@useResult
$Res call({
 SlotPickerStatus status, List<SlotDay> days, DateTime? selectedDate, String? selectedWindowId, bool submitting, Object? error, Object? submitError, OrderDetail? updated
});


$OrderDetailCopyWith<$Res>? get updated;

}
/// @nodoc
class _$SlotPickerStateCopyWithImpl<$Res>
    implements $SlotPickerStateCopyWith<$Res> {
  _$SlotPickerStateCopyWithImpl(this._self, this._then);

  final SlotPickerState _self;
  final $Res Function(SlotPickerState) _then;

/// Create a copy of SlotPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? days = null,Object? selectedDate = freezed,Object? selectedWindowId = freezed,Object? submitting = null,Object? error = freezed,Object? submitError = freezed,Object? updated = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SlotPickerStatus,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<SlotDay>,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedWindowId: freezed == selectedWindowId ? _self.selectedWindowId : selectedWindowId // ignore: cast_nullable_to_non_nullable
as String?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,submitError: freezed == submitError ? _self.submitError : submitError ,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as OrderDetail?,
  ));
}
/// Create a copy of SlotPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<$Res>? get updated {
    if (_self.updated == null) {
    return null;
  }

  return $OrderDetailCopyWith<$Res>(_self.updated!, (value) {
    return _then(_self.copyWith(updated: value));
  });
}
}


/// Adds pattern-matching-related methods to [SlotPickerState].
extension SlotPickerStatePatterns on SlotPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlotPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlotPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlotPickerState value)  $default,){
final _that = this;
switch (_that) {
case _SlotPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlotPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _SlotPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SlotPickerStatus status,  List<SlotDay> days,  DateTime? selectedDate,  String? selectedWindowId,  bool submitting,  Object? error,  Object? submitError,  OrderDetail? updated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlotPickerState() when $default != null:
return $default(_that.status,_that.days,_that.selectedDate,_that.selectedWindowId,_that.submitting,_that.error,_that.submitError,_that.updated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SlotPickerStatus status,  List<SlotDay> days,  DateTime? selectedDate,  String? selectedWindowId,  bool submitting,  Object? error,  Object? submitError,  OrderDetail? updated)  $default,) {final _that = this;
switch (_that) {
case _SlotPickerState():
return $default(_that.status,_that.days,_that.selectedDate,_that.selectedWindowId,_that.submitting,_that.error,_that.submitError,_that.updated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SlotPickerStatus status,  List<SlotDay> days,  DateTime? selectedDate,  String? selectedWindowId,  bool submitting,  Object? error,  Object? submitError,  OrderDetail? updated)?  $default,) {final _that = this;
switch (_that) {
case _SlotPickerState() when $default != null:
return $default(_that.status,_that.days,_that.selectedDate,_that.selectedWindowId,_that.submitting,_that.error,_that.submitError,_that.updated);case _:
  return null;

}
}

}

/// @nodoc


class _SlotPickerState extends SlotPickerState {
  const _SlotPickerState({this.status = SlotPickerStatus.loading, final  List<SlotDay> days = const <SlotDay>[], this.selectedDate, this.selectedWindowId, this.submitting = false, this.error, this.submitError, this.updated}): _days = days,super._();
  

@override@JsonKey() final  SlotPickerStatus status;
 final  List<SlotDay> _days;
@override@JsonKey() List<SlotDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override final  DateTime? selectedDate;
@override final  String? selectedWindowId;
@override@JsonKey() final  bool submitting;
@override final  Object? error;
@override final  Object? submitError;
/// Set once the server accepted the change.
@override final  OrderDetail? updated;

/// Create a copy of SlotPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotPickerStateCopyWith<_SlotPickerState> get copyWith => __$SlotPickerStateCopyWithImpl<_SlotPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotPickerState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedWindowId, selectedWindowId) || other.selectedWindowId == selectedWindowId)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.submitError, submitError)&&(identical(other.updated, updated) || other.updated == updated));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_days),selectedDate,selectedWindowId,submitting,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(submitError),updated);

@override
String toString() {
  return 'SlotPickerState(status: $status, days: $days, selectedDate: $selectedDate, selectedWindowId: $selectedWindowId, submitting: $submitting, error: $error, submitError: $submitError, updated: $updated)';
}


}

/// @nodoc
abstract mixin class _$SlotPickerStateCopyWith<$Res> implements $SlotPickerStateCopyWith<$Res> {
  factory _$SlotPickerStateCopyWith(_SlotPickerState value, $Res Function(_SlotPickerState) _then) = __$SlotPickerStateCopyWithImpl;
@override @useResult
$Res call({
 SlotPickerStatus status, List<SlotDay> days, DateTime? selectedDate, String? selectedWindowId, bool submitting, Object? error, Object? submitError, OrderDetail? updated
});


@override $OrderDetailCopyWith<$Res>? get updated;

}
/// @nodoc
class __$SlotPickerStateCopyWithImpl<$Res>
    implements _$SlotPickerStateCopyWith<$Res> {
  __$SlotPickerStateCopyWithImpl(this._self, this._then);

  final _SlotPickerState _self;
  final $Res Function(_SlotPickerState) _then;

/// Create a copy of SlotPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? days = null,Object? selectedDate = freezed,Object? selectedWindowId = freezed,Object? submitting = null,Object? error = freezed,Object? submitError = freezed,Object? updated = freezed,}) {
  return _then(_SlotPickerState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SlotPickerStatus,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<SlotDay>,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedWindowId: freezed == selectedWindowId ? _self.selectedWindowId : selectedWindowId // ignore: cast_nullable_to_non_nullable
as String?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,submitError: freezed == submitError ? _self.submitError : submitError ,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as OrderDetail?,
  ));
}

/// Create a copy of SlotPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<$Res>? get updated {
    if (_self.updated == null) {
    return null;
  }

  return $OrderDetailCopyWith<$Res>(_self.updated!, (value) {
    return _then(_self.copyWith(updated: value));
  });
}
}

// dart format on
