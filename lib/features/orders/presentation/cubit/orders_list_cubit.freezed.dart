// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersListState {

 ListStatus get status; List<OrderListItem> get items; int get page; bool get canLoadMore; bool get loadingMore; bool get stale; OrderFilter get filter; Object? get error; Object? get loadMoreError;
/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersListStateCopyWith<OrdersListState> get copyWith => _$OrdersListStateCopyWithImpl<OrdersListState>(this as OrdersListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&(identical(other.stale, stale) || other.stale == stale)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.loadMoreError, loadMoreError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),page,canLoadMore,loadingMore,stale,filter,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(loadMoreError));

@override
String toString() {
  return 'OrdersListState(status: $status, items: $items, page: $page, canLoadMore: $canLoadMore, loadingMore: $loadingMore, stale: $stale, filter: $filter, error: $error, loadMoreError: $loadMoreError)';
}


}

/// @nodoc
abstract mixin class $OrdersListStateCopyWith<$Res>  {
  factory $OrdersListStateCopyWith(OrdersListState value, $Res Function(OrdersListState) _then) = _$OrdersListStateCopyWithImpl;
@useResult
$Res call({
 ListStatus status, List<OrderListItem> items, int page, bool canLoadMore, bool loadingMore, bool stale, OrderFilter filter, Object? error, Object? loadMoreError
});




}
/// @nodoc
class _$OrdersListStateCopyWithImpl<$Res>
    implements $OrdersListStateCopyWith<$Res> {
  _$OrdersListStateCopyWithImpl(this._self, this._then);

  final OrdersListState _self;
  final $Res Function(OrdersListState) _then;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? page = null,Object? canLoadMore = null,Object? loadingMore = null,Object? stale = null,Object? filter = null,Object? error = freezed,Object? loadMoreError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as bool,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OrderFilter,error: freezed == error ? _self.error : error ,loadMoreError: freezed == loadMoreError ? _self.loadMoreError : loadMoreError ,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersListState].
extension OrdersListStatePatterns on OrdersListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersListState value)  $default,){
final _that = this;
switch (_that) {
case _OrdersListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersListState value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListStatus status,  List<OrderListItem> items,  int page,  bool canLoadMore,  bool loadingMore,  bool stale,  OrderFilter filter,  Object? error,  Object? loadMoreError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.canLoadMore,_that.loadingMore,_that.stale,_that.filter,_that.error,_that.loadMoreError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListStatus status,  List<OrderListItem> items,  int page,  bool canLoadMore,  bool loadingMore,  bool stale,  OrderFilter filter,  Object? error,  Object? loadMoreError)  $default,) {final _that = this;
switch (_that) {
case _OrdersListState():
return $default(_that.status,_that.items,_that.page,_that.canLoadMore,_that.loadingMore,_that.stale,_that.filter,_that.error,_that.loadMoreError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListStatus status,  List<OrderListItem> items,  int page,  bool canLoadMore,  bool loadingMore,  bool stale,  OrderFilter filter,  Object? error,  Object? loadMoreError)?  $default,) {final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.canLoadMore,_that.loadingMore,_that.stale,_that.filter,_that.error,_that.loadMoreError);case _:
  return null;

}
}

}

/// @nodoc


class _OrdersListState extends OrdersListState {
  const _OrdersListState({this.status = ListStatus.loading, final  List<OrderListItem> items = const <OrderListItem>[], this.page = 1, this.canLoadMore = false, this.loadingMore = false, this.stale = false, this.filter = OrderFilter.all, this.error, this.loadMoreError}): _items = items,super._();
  

@override@JsonKey() final  ListStatus status;
 final  List<OrderListItem> _items;
@override@JsonKey() List<OrderListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool canLoadMore;
@override@JsonKey() final  bool loadingMore;
@override@JsonKey() final  bool stale;
@override@JsonKey() final  OrderFilter filter;
@override final  Object? error;
@override final  Object? loadMoreError;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersListStateCopyWith<_OrdersListState> get copyWith => __$OrdersListStateCopyWithImpl<_OrdersListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&(identical(other.stale, stale) || other.stale == stale)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.loadMoreError, loadMoreError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),page,canLoadMore,loadingMore,stale,filter,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(loadMoreError));

@override
String toString() {
  return 'OrdersListState(status: $status, items: $items, page: $page, canLoadMore: $canLoadMore, loadingMore: $loadingMore, stale: $stale, filter: $filter, error: $error, loadMoreError: $loadMoreError)';
}


}

/// @nodoc
abstract mixin class _$OrdersListStateCopyWith<$Res> implements $OrdersListStateCopyWith<$Res> {
  factory _$OrdersListStateCopyWith(_OrdersListState value, $Res Function(_OrdersListState) _then) = __$OrdersListStateCopyWithImpl;
@override @useResult
$Res call({
 ListStatus status, List<OrderListItem> items, int page, bool canLoadMore, bool loadingMore, bool stale, OrderFilter filter, Object? error, Object? loadMoreError
});




}
/// @nodoc
class __$OrdersListStateCopyWithImpl<$Res>
    implements _$OrdersListStateCopyWith<$Res> {
  __$OrdersListStateCopyWithImpl(this._self, this._then);

  final _OrdersListState _self;
  final $Res Function(_OrdersListState) _then;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? page = null,Object? canLoadMore = null,Object? loadingMore = null,Object? stale = null,Object? filter = null,Object? error = freezed,Object? loadMoreError = freezed,}) {
  return _then(_OrdersListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as bool,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OrderFilter,error: freezed == error ? _self.error : error ,loadMoreError: freezed == loadMoreError ? _self.loadMoreError : loadMoreError ,
  ));
}


}

/// @nodoc
mixin _$ReturnsListState {

 ListStatus get status; List<ReturnInfo> get items; bool get stale; Object? get error; Object? get refreshError;
/// Create a copy of ReturnsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnsListStateCopyWith<ReturnsListState> get copyWith => _$ReturnsListStateCopyWithImpl<ReturnsListState>(this as ReturnsListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnsListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.stale, stale) || other.stale == stale)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.refreshError, refreshError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),stale,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(refreshError));

@override
String toString() {
  return 'ReturnsListState(status: $status, items: $items, stale: $stale, error: $error, refreshError: $refreshError)';
}


}

/// @nodoc
abstract mixin class $ReturnsListStateCopyWith<$Res>  {
  factory $ReturnsListStateCopyWith(ReturnsListState value, $Res Function(ReturnsListState) _then) = _$ReturnsListStateCopyWithImpl;
@useResult
$Res call({
 ListStatus status, List<ReturnInfo> items, bool stale, Object? error, Object? refreshError
});




}
/// @nodoc
class _$ReturnsListStateCopyWithImpl<$Res>
    implements $ReturnsListStateCopyWith<$Res> {
  _$ReturnsListStateCopyWithImpl(this._self, this._then);

  final ReturnsListState _self;
  final $Res Function(ReturnsListState) _then;

/// Create a copy of ReturnsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? stale = null,Object? error = freezed,Object? refreshError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReturnInfo>,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,refreshError: freezed == refreshError ? _self.refreshError : refreshError ,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnsListState].
extension ReturnsListStatePatterns on ReturnsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnsListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnsListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnsListState value)  $default,){
final _that = this;
switch (_that) {
case _ReturnsListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnsListState value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnsListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListStatus status,  List<ReturnInfo> items,  bool stale,  Object? error,  Object? refreshError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnsListState() when $default != null:
return $default(_that.status,_that.items,_that.stale,_that.error,_that.refreshError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListStatus status,  List<ReturnInfo> items,  bool stale,  Object? error,  Object? refreshError)  $default,) {final _that = this;
switch (_that) {
case _ReturnsListState():
return $default(_that.status,_that.items,_that.stale,_that.error,_that.refreshError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListStatus status,  List<ReturnInfo> items,  bool stale,  Object? error,  Object? refreshError)?  $default,) {final _that = this;
switch (_that) {
case _ReturnsListState() when $default != null:
return $default(_that.status,_that.items,_that.stale,_that.error,_that.refreshError);case _:
  return null;

}
}

}

/// @nodoc


class _ReturnsListState implements ReturnsListState {
  const _ReturnsListState({this.status = ListStatus.loading, final  List<ReturnInfo> items = const <ReturnInfo>[], this.stale = false, this.error, this.refreshError}): _items = items;
  

@override@JsonKey() final  ListStatus status;
 final  List<ReturnInfo> _items;
@override@JsonKey() List<ReturnInfo> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool stale;
@override final  Object? error;
@override final  Object? refreshError;

/// Create a copy of ReturnsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnsListStateCopyWith<_ReturnsListState> get copyWith => __$ReturnsListStateCopyWithImpl<_ReturnsListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnsListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.stale, stale) || other.stale == stale)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.refreshError, refreshError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),stale,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(refreshError));

@override
String toString() {
  return 'ReturnsListState(status: $status, items: $items, stale: $stale, error: $error, refreshError: $refreshError)';
}


}

/// @nodoc
abstract mixin class _$ReturnsListStateCopyWith<$Res> implements $ReturnsListStateCopyWith<$Res> {
  factory _$ReturnsListStateCopyWith(_ReturnsListState value, $Res Function(_ReturnsListState) _then) = __$ReturnsListStateCopyWithImpl;
@override @useResult
$Res call({
 ListStatus status, List<ReturnInfo> items, bool stale, Object? error, Object? refreshError
});




}
/// @nodoc
class __$ReturnsListStateCopyWithImpl<$Res>
    implements _$ReturnsListStateCopyWith<$Res> {
  __$ReturnsListStateCopyWithImpl(this._self, this._then);

  final _ReturnsListState _self;
  final $Res Function(_ReturnsListState) _then;

/// Create a copy of ReturnsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? stale = null,Object? error = freezed,Object? refreshError = freezed,}) {
  return _then(_ReturnsListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReturnInfo>,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,refreshError: freezed == refreshError ? _self.refreshError : refreshError ,
  ));
}


}

// dart format on
