// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentlyViewed {

 ProductCard get product; DateTime get viewedAt;
/// Create a copy of RecentlyViewed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentlyViewedCopyWith<RecentlyViewed> get copyWith => _$RecentlyViewedCopyWithImpl<RecentlyViewed>(this as RecentlyViewed, _$identity);

  /// Serializes this RecentlyViewed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentlyViewed&&(identical(other.product, product) || other.product == product)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,viewedAt);

@override
String toString() {
  return 'RecentlyViewed(product: $product, viewedAt: $viewedAt)';
}


}

/// @nodoc
abstract mixin class $RecentlyViewedCopyWith<$Res>  {
  factory $RecentlyViewedCopyWith(RecentlyViewed value, $Res Function(RecentlyViewed) _then) = _$RecentlyViewedCopyWithImpl;
@useResult
$Res call({
 ProductCard product, DateTime viewedAt
});


$ProductCardCopyWith<$Res> get product;

}
/// @nodoc
class _$RecentlyViewedCopyWithImpl<$Res>
    implements $RecentlyViewedCopyWith<$Res> {
  _$RecentlyViewedCopyWithImpl(this._self, this._then);

  final RecentlyViewed _self;
  final $Res Function(RecentlyViewed) _then;

/// Create a copy of RecentlyViewed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? viewedAt = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCard,viewedAt: null == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of RecentlyViewed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCardCopyWith<$Res> get product {
  
  return $ProductCardCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecentlyViewed].
extension RecentlyViewedPatterns on RecentlyViewed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentlyViewed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentlyViewed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentlyViewed value)  $default,){
final _that = this;
switch (_that) {
case _RecentlyViewed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentlyViewed value)?  $default,){
final _that = this;
switch (_that) {
case _RecentlyViewed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductCard product,  DateTime viewedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentlyViewed() when $default != null:
return $default(_that.product,_that.viewedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductCard product,  DateTime viewedAt)  $default,) {final _that = this;
switch (_that) {
case _RecentlyViewed():
return $default(_that.product,_that.viewedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductCard product,  DateTime viewedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecentlyViewed() when $default != null:
return $default(_that.product,_that.viewedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentlyViewed implements RecentlyViewed {
  const _RecentlyViewed({required this.product, required this.viewedAt});
  factory _RecentlyViewed.fromJson(Map<String, dynamic> json) => _$RecentlyViewedFromJson(json);

@override final  ProductCard product;
@override final  DateTime viewedAt;

/// Create a copy of RecentlyViewed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentlyViewedCopyWith<_RecentlyViewed> get copyWith => __$RecentlyViewedCopyWithImpl<_RecentlyViewed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentlyViewedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentlyViewed&&(identical(other.product, product) || other.product == product)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,viewedAt);

@override
String toString() {
  return 'RecentlyViewed(product: $product, viewedAt: $viewedAt)';
}


}

/// @nodoc
abstract mixin class _$RecentlyViewedCopyWith<$Res> implements $RecentlyViewedCopyWith<$Res> {
  factory _$RecentlyViewedCopyWith(_RecentlyViewed value, $Res Function(_RecentlyViewed) _then) = __$RecentlyViewedCopyWithImpl;
@override @useResult
$Res call({
 ProductCard product, DateTime viewedAt
});


@override $ProductCardCopyWith<$Res> get product;

}
/// @nodoc
class __$RecentlyViewedCopyWithImpl<$Res>
    implements _$RecentlyViewedCopyWith<$Res> {
  __$RecentlyViewedCopyWithImpl(this._self, this._then);

  final _RecentlyViewed _self;
  final $Res Function(_RecentlyViewed) _then;

/// Create a copy of RecentlyViewed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? viewedAt = null,}) {
  return _then(_RecentlyViewed(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCard,viewedAt: null == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of RecentlyViewed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCardCopyWith<$Res> get product {
  
  return $ProductCardCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$SharedWishlist {

 String get ownerFirstName; List<ProductCard> get items;
/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharedWishlistCopyWith<SharedWishlist> get copyWith => _$SharedWishlistCopyWithImpl<SharedWishlist>(this as SharedWishlist, _$identity);

  /// Serializes this SharedWishlist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharedWishlist&&(identical(other.ownerFirstName, ownerFirstName) || other.ownerFirstName == ownerFirstName)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ownerFirstName,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SharedWishlist(ownerFirstName: $ownerFirstName, items: $items)';
}


}

/// @nodoc
abstract mixin class $SharedWishlistCopyWith<$Res>  {
  factory $SharedWishlistCopyWith(SharedWishlist value, $Res Function(SharedWishlist) _then) = _$SharedWishlistCopyWithImpl;
@useResult
$Res call({
 String ownerFirstName, List<ProductCard> items
});




}
/// @nodoc
class _$SharedWishlistCopyWithImpl<$Res>
    implements $SharedWishlistCopyWith<$Res> {
  _$SharedWishlistCopyWithImpl(this._self, this._then);

  final SharedWishlist _self;
  final $Res Function(SharedWishlist) _then;

/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ownerFirstName = null,Object? items = null,}) {
  return _then(_self.copyWith(
ownerFirstName: null == ownerFirstName ? _self.ownerFirstName : ownerFirstName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}

}


/// Adds pattern-matching-related methods to [SharedWishlist].
extension SharedWishlistPatterns on SharedWishlist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharedWishlist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharedWishlist value)  $default,){
final _that = this;
switch (_that) {
case _SharedWishlist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharedWishlist value)?  $default,){
final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ownerFirstName,  List<ProductCard> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
return $default(_that.ownerFirstName,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ownerFirstName,  List<ProductCard> items)  $default,) {final _that = this;
switch (_that) {
case _SharedWishlist():
return $default(_that.ownerFirstName,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ownerFirstName,  List<ProductCard> items)?  $default,) {final _that = this;
switch (_that) {
case _SharedWishlist() when $default != null:
return $default(_that.ownerFirstName,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SharedWishlist implements SharedWishlist {
  const _SharedWishlist({this.ownerFirstName = '', final  List<ProductCard> items = const <ProductCard>[]}): _items = items;
  factory _SharedWishlist.fromJson(Map<String, dynamic> json) => _$SharedWishlistFromJson(json);

@override@JsonKey() final  String ownerFirstName;
 final  List<ProductCard> _items;
@override@JsonKey() List<ProductCard> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharedWishlistCopyWith<_SharedWishlist> get copyWith => __$SharedWishlistCopyWithImpl<_SharedWishlist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SharedWishlistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharedWishlist&&(identical(other.ownerFirstName, ownerFirstName) || other.ownerFirstName == ownerFirstName)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ownerFirstName,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SharedWishlist(ownerFirstName: $ownerFirstName, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SharedWishlistCopyWith<$Res> implements $SharedWishlistCopyWith<$Res> {
  factory _$SharedWishlistCopyWith(_SharedWishlist value, $Res Function(_SharedWishlist) _then) = __$SharedWishlistCopyWithImpl;
@override @useResult
$Res call({
 String ownerFirstName, List<ProductCard> items
});




}
/// @nodoc
class __$SharedWishlistCopyWithImpl<$Res>
    implements _$SharedWishlistCopyWith<$Res> {
  __$SharedWishlistCopyWithImpl(this._self, this._then);

  final _SharedWishlist _self;
  final $Res Function(_SharedWishlist) _then;

/// Create a copy of SharedWishlist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ownerFirstName = null,Object? items = null,}) {
  return _then(_SharedWishlist(
ownerFirstName: null == ownerFirstName ? _self.ownerFirstName : ownerFirstName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}


}


/// @nodoc
mixin _$StockAlert {

 String get id; ProductCard get product; StockAlertType get type;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; String? get colorId; DateTime get createdAt; DateTime? get notifiedAt;
/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockAlertCopyWith<StockAlert> get copyWith => _$StockAlertCopyWithImpl<StockAlert>(this as StockAlert, _$identity);

  /// Serializes this StockAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.type, type) || other.type == type)&&(identical(other.size, size) || other.size == size)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.notifiedAt, notifiedAt) || other.notifiedAt == notifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,type,size,colorId,createdAt,notifiedAt);

@override
String toString() {
  return 'StockAlert(id: $id, product: $product, type: $type, size: $size, colorId: $colorId, createdAt: $createdAt, notifiedAt: $notifiedAt)';
}


}

/// @nodoc
abstract mixin class $StockAlertCopyWith<$Res>  {
  factory $StockAlertCopyWith(StockAlert value, $Res Function(StockAlert) _then) = _$StockAlertCopyWithImpl;
@useResult
$Res call({
 String id, ProductCard product, StockAlertType type,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? colorId, DateTime createdAt, DateTime? notifiedAt
});


$ProductCardCopyWith<$Res> get product;

}
/// @nodoc
class _$StockAlertCopyWithImpl<$Res>
    implements $StockAlertCopyWith<$Res> {
  _$StockAlertCopyWithImpl(this._self, this._then);

  final StockAlert _self;
  final $Res Function(StockAlert) _then;

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? type = null,Object? size = freezed,Object? colorId = freezed,Object? createdAt = null,Object? notifiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCard,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockAlertType,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,colorId: freezed == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,notifiedAt: freezed == notifiedAt ? _self.notifiedAt : notifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCardCopyWith<$Res> get product {
  
  return $ProductCardCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockAlert].
extension StockAlertPatterns on StockAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockAlert value)  $default,){
final _that = this;
switch (_that) {
case _StockAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockAlert value)?  $default,){
final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProductCard product,  StockAlertType type, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? colorId,  DateTime createdAt,  DateTime? notifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
return $default(_that.id,_that.product,_that.type,_that.size,_that.colorId,_that.createdAt,_that.notifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProductCard product,  StockAlertType type, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? colorId,  DateTime createdAt,  DateTime? notifiedAt)  $default,) {final _that = this;
switch (_that) {
case _StockAlert():
return $default(_that.id,_that.product,_that.type,_that.size,_that.colorId,_that.createdAt,_that.notifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProductCard product,  StockAlertType type, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? colorId,  DateTime createdAt,  DateTime? notifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
return $default(_that.id,_that.product,_that.type,_that.size,_that.colorId,_that.createdAt,_that.notifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockAlert implements StockAlert {
  const _StockAlert({required this.id, required this.product, required this.type, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.colorId, required this.createdAt, this.notifiedAt});
  factory _StockAlert.fromJson(Map<String, dynamic> json) => _$StockAlertFromJson(json);

@override final  String id;
@override final  ProductCard product;
@override final  StockAlertType type;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override final  String? colorId;
@override final  DateTime createdAt;
@override final  DateTime? notifiedAt;

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockAlertCopyWith<_StockAlert> get copyWith => __$StockAlertCopyWithImpl<_StockAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockAlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.type, type) || other.type == type)&&(identical(other.size, size) || other.size == size)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.notifiedAt, notifiedAt) || other.notifiedAt == notifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,type,size,colorId,createdAt,notifiedAt);

@override
String toString() {
  return 'StockAlert(id: $id, product: $product, type: $type, size: $size, colorId: $colorId, createdAt: $createdAt, notifiedAt: $notifiedAt)';
}


}

/// @nodoc
abstract mixin class _$StockAlertCopyWith<$Res> implements $StockAlertCopyWith<$Res> {
  factory _$StockAlertCopyWith(_StockAlert value, $Res Function(_StockAlert) _then) = __$StockAlertCopyWithImpl;
@override @useResult
$Res call({
 String id, ProductCard product, StockAlertType type,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? colorId, DateTime createdAt, DateTime? notifiedAt
});


@override $ProductCardCopyWith<$Res> get product;

}
/// @nodoc
class __$StockAlertCopyWithImpl<$Res>
    implements _$StockAlertCopyWith<$Res> {
  __$StockAlertCopyWithImpl(this._self, this._then);

  final _StockAlert _self;
  final $Res Function(_StockAlert) _then;

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? type = null,Object? size = freezed,Object? colorId = freezed,Object? createdAt = null,Object? notifiedAt = freezed,}) {
  return _then(_StockAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCard,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockAlertType,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,colorId: freezed == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,notifiedAt: freezed == notifiedAt ? _self.notifiedAt : notifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCardCopyWith<$Res> get product {
  
  return $ProductCardCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
