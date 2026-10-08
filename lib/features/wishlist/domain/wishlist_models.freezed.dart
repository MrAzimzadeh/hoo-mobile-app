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
mixin _$WishlistShare {

 String get token; String get url;
/// Create a copy of WishlistShare
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistShareCopyWith<WishlistShare> get copyWith => _$WishlistShareCopyWithImpl<WishlistShare>(this as WishlistShare, _$identity);

  /// Serializes this WishlistShare to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistShare&&(identical(other.token, token) || other.token == token)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,url);

@override
String toString() {
  return 'WishlistShare(token: $token, url: $url)';
}


}

/// @nodoc
abstract mixin class $WishlistShareCopyWith<$Res>  {
  factory $WishlistShareCopyWith(WishlistShare value, $Res Function(WishlistShare) _then) = _$WishlistShareCopyWithImpl;
@useResult
$Res call({
 String token, String url
});




}
/// @nodoc
class _$WishlistShareCopyWithImpl<$Res>
    implements $WishlistShareCopyWith<$Res> {
  _$WishlistShareCopyWithImpl(this._self, this._then);

  final WishlistShare _self;
  final $Res Function(WishlistShare) _then;

/// Create a copy of WishlistShare
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? url = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WishlistShare].
extension WishlistSharePatterns on WishlistShare {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistShare value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistShare() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistShare value)  $default,){
final _that = this;
switch (_that) {
case _WishlistShare():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistShare value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistShare() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistShare() when $default != null:
return $default(_that.token,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String url)  $default,) {final _that = this;
switch (_that) {
case _WishlistShare():
return $default(_that.token,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String url)?  $default,) {final _that = this;
switch (_that) {
case _WishlistShare() when $default != null:
return $default(_that.token,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishlistShare implements WishlistShare {
  const _WishlistShare({required this.token, required this.url});
  factory _WishlistShare.fromJson(Map<String, dynamic> json) => _$WishlistShareFromJson(json);

@override final  String token;
@override final  String url;

/// Create a copy of WishlistShare
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistShareCopyWith<_WishlistShare> get copyWith => __$WishlistShareCopyWithImpl<_WishlistShare>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishlistShareToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistShare&&(identical(other.token, token) || other.token == token)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,url);

@override
String toString() {
  return 'WishlistShare(token: $token, url: $url)';
}


}

/// @nodoc
abstract mixin class _$WishlistShareCopyWith<$Res> implements $WishlistShareCopyWith<$Res> {
  factory _$WishlistShareCopyWith(_WishlistShare value, $Res Function(_WishlistShare) _then) = __$WishlistShareCopyWithImpl;
@override @useResult
$Res call({
 String token, String url
});




}
/// @nodoc
class __$WishlistShareCopyWithImpl<$Res>
    implements _$WishlistShareCopyWith<$Res> {
  __$WishlistShareCopyWithImpl(this._self, this._then);

  final _WishlistShare _self;
  final $Res Function(_WishlistShare) _then;

/// Create a copy of WishlistShare
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? url = null,}) {
  return _then(_WishlistShare(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

 String get id; ProductCard get product;/// Null when the server sends a type this app version does not know yet.
@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StockAlertType? get type;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; String? get colorId; DateTime get createdAt; DateTime? get notifiedAt;
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
 String id, ProductCard product,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StockAlertType? type,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? colorId, DateTime createdAt, DateTime? notifiedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? type = freezed,Object? size = freezed,Object? colorId = freezed,Object? createdAt = null,Object? notifiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCard,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockAlertType?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProductCard product, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StockAlertType? type, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? colorId,  DateTime createdAt,  DateTime? notifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProductCard product, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StockAlertType? type, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? colorId,  DateTime createdAt,  DateTime? notifiedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProductCard product, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StockAlertType? type, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? colorId,  DateTime createdAt,  DateTime? notifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
return $default(_that.id,_that.product,_that.type,_that.size,_that.colorId,_that.createdAt,_that.notifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockAlert extends StockAlert {
  const _StockAlert({required this.id, required this.product, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.type, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.colorId, required this.createdAt, this.notifiedAt}): super._();
  factory _StockAlert.fromJson(Map<String, dynamic> json) => _$StockAlertFromJson(json);

@override final  String id;
@override final  ProductCard product;
/// Null when the server sends a type this app version does not know yet.
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  StockAlertType? type;
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
 String id, ProductCard product,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StockAlertType? type,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? colorId, DateTime createdAt, DateTime? notifiedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? type = freezed,Object? size = freezed,Object? colorId = freezed,Object? createdAt = null,Object? notifiedAt = freezed,}) {
  return _then(_StockAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCard,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockAlertType?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$PickerProduct {

 String get id; String get slug; String get name; double get price; double? get compareAtPrice; int? get discountPercent; List<PickerColor> get colors;
/// Create a copy of PickerProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickerProductCopyWith<PickerProduct> get copyWith => _$PickerProductCopyWithImpl<PickerProduct>(this as PickerProduct, _$identity);

  /// Serializes this PickerProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickerProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAtPrice, compareAtPrice) || other.compareAtPrice == compareAtPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&const DeepCollectionEquality().equals(other.colors, colors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,price,compareAtPrice,discountPercent,const DeepCollectionEquality().hash(colors));

@override
String toString() {
  return 'PickerProduct(id: $id, slug: $slug, name: $name, price: $price, compareAtPrice: $compareAtPrice, discountPercent: $discountPercent, colors: $colors)';
}


}

/// @nodoc
abstract mixin class $PickerProductCopyWith<$Res>  {
  factory $PickerProductCopyWith(PickerProduct value, $Res Function(PickerProduct) _then) = _$PickerProductCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, double price, double? compareAtPrice, int? discountPercent, List<PickerColor> colors
});




}
/// @nodoc
class _$PickerProductCopyWithImpl<$Res>
    implements $PickerProductCopyWith<$Res> {
  _$PickerProductCopyWithImpl(this._self, this._then);

  final PickerProduct _self;
  final $Res Function(PickerProduct) _then;

/// Create a copy of PickerProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? price = null,Object? compareAtPrice = freezed,Object? discountPercent = freezed,Object? colors = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,compareAtPrice: freezed == compareAtPrice ? _self.compareAtPrice : compareAtPrice // ignore: cast_nullable_to_non_nullable
as double?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<PickerColor>,
  ));
}

}


/// Adds pattern-matching-related methods to [PickerProduct].
extension PickerProductPatterns on PickerProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickerProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickerProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickerProduct value)  $default,){
final _that = this;
switch (_that) {
case _PickerProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickerProduct value)?  $default,){
final _that = this;
switch (_that) {
case _PickerProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  double price,  double? compareAtPrice,  int? discountPercent,  List<PickerColor> colors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickerProduct() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.price,_that.compareAtPrice,_that.discountPercent,_that.colors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  double price,  double? compareAtPrice,  int? discountPercent,  List<PickerColor> colors)  $default,) {final _that = this;
switch (_that) {
case _PickerProduct():
return $default(_that.id,_that.slug,_that.name,_that.price,_that.compareAtPrice,_that.discountPercent,_that.colors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  double price,  double? compareAtPrice,  int? discountPercent,  List<PickerColor> colors)?  $default,) {final _that = this;
switch (_that) {
case _PickerProduct() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.price,_that.compareAtPrice,_that.discountPercent,_that.colors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickerProduct implements PickerProduct {
  const _PickerProduct({required this.id, required this.slug, required this.name, required this.price, this.compareAtPrice, this.discountPercent, final  List<PickerColor> colors = const <PickerColor>[]}): _colors = colors;
  factory _PickerProduct.fromJson(Map<String, dynamic> json) => _$PickerProductFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  double price;
@override final  double? compareAtPrice;
@override final  int? discountPercent;
 final  List<PickerColor> _colors;
@override@JsonKey() List<PickerColor> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}


/// Create a copy of PickerProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickerProductCopyWith<_PickerProduct> get copyWith => __$PickerProductCopyWithImpl<_PickerProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickerProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickerProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAtPrice, compareAtPrice) || other.compareAtPrice == compareAtPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&const DeepCollectionEquality().equals(other._colors, _colors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,price,compareAtPrice,discountPercent,const DeepCollectionEquality().hash(_colors));

@override
String toString() {
  return 'PickerProduct(id: $id, slug: $slug, name: $name, price: $price, compareAtPrice: $compareAtPrice, discountPercent: $discountPercent, colors: $colors)';
}


}

/// @nodoc
abstract mixin class _$PickerProductCopyWith<$Res> implements $PickerProductCopyWith<$Res> {
  factory _$PickerProductCopyWith(_PickerProduct value, $Res Function(_PickerProduct) _then) = __$PickerProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, double price, double? compareAtPrice, int? discountPercent, List<PickerColor> colors
});




}
/// @nodoc
class __$PickerProductCopyWithImpl<$Res>
    implements _$PickerProductCopyWith<$Res> {
  __$PickerProductCopyWithImpl(this._self, this._then);

  final _PickerProduct _self;
  final $Res Function(_PickerProduct) _then;

/// Create a copy of PickerProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? price = null,Object? compareAtPrice = freezed,Object? discountPercent = freezed,Object? colors = null,}) {
  return _then(_PickerProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,compareAtPrice: freezed == compareAtPrice ? _self.compareAtPrice : compareAtPrice // ignore: cast_nullable_to_non_nullable
as double?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<PickerColor>,
  ));
}


}


/// @nodoc
mixin _$PickerColor {

 ColorInfo get color; List<String> get images; List<PickerVariant> get variants;
/// Create a copy of PickerColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickerColorCopyWith<PickerColor> get copyWith => _$PickerColorCopyWithImpl<PickerColor>(this as PickerColor, _$identity);

  /// Serializes this PickerColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickerColor&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'PickerColor(color: $color, images: $images, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $PickerColorCopyWith<$Res>  {
  factory $PickerColorCopyWith(PickerColor value, $Res Function(PickerColor) _then) = _$PickerColorCopyWithImpl;
@useResult
$Res call({
 ColorInfo color, List<String> images, List<PickerVariant> variants
});


$ColorInfoCopyWith<$Res> get color;

}
/// @nodoc
class _$PickerColorCopyWithImpl<$Res>
    implements $PickerColorCopyWith<$Res> {
  _$PickerColorCopyWithImpl(this._self, this._then);

  final PickerColor _self;
  final $Res Function(PickerColor) _then;

/// Create a copy of PickerColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? images = null,Object? variants = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorInfo,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<PickerVariant>,
  ));
}
/// Create a copy of PickerColor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res> get color {
  
  return $ColorInfoCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [PickerColor].
extension PickerColorPatterns on PickerColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickerColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickerColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickerColor value)  $default,){
final _that = this;
switch (_that) {
case _PickerColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickerColor value)?  $default,){
final _that = this;
switch (_that) {
case _PickerColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ColorInfo color,  List<String> images,  List<PickerVariant> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickerColor() when $default != null:
return $default(_that.color,_that.images,_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ColorInfo color,  List<String> images,  List<PickerVariant> variants)  $default,) {final _that = this;
switch (_that) {
case _PickerColor():
return $default(_that.color,_that.images,_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ColorInfo color,  List<String> images,  List<PickerVariant> variants)?  $default,) {final _that = this;
switch (_that) {
case _PickerColor() when $default != null:
return $default(_that.color,_that.images,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickerColor implements PickerColor {
  const _PickerColor({required this.color, final  List<String> images = const <String>[], final  List<PickerVariant> variants = const <PickerVariant>[]}): _images = images,_variants = variants;
  factory _PickerColor.fromJson(Map<String, dynamic> json) => _$PickerColorFromJson(json);

@override final  ColorInfo color;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<PickerVariant> _variants;
@override@JsonKey() List<PickerVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of PickerColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickerColorCopyWith<_PickerColor> get copyWith => __$PickerColorCopyWithImpl<_PickerColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickerColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickerColor&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'PickerColor(color: $color, images: $images, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$PickerColorCopyWith<$Res> implements $PickerColorCopyWith<$Res> {
  factory _$PickerColorCopyWith(_PickerColor value, $Res Function(_PickerColor) _then) = __$PickerColorCopyWithImpl;
@override @useResult
$Res call({
 ColorInfo color, List<String> images, List<PickerVariant> variants
});


@override $ColorInfoCopyWith<$Res> get color;

}
/// @nodoc
class __$PickerColorCopyWithImpl<$Res>
    implements _$PickerColorCopyWith<$Res> {
  __$PickerColorCopyWithImpl(this._self, this._then);

  final _PickerColor _self;
  final $Res Function(_PickerColor) _then;

/// Create a copy of PickerColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? images = null,Object? variants = null,}) {
  return _then(_PickerColor(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorInfo,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<PickerVariant>,
  ));
}

/// Create a copy of PickerColor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res> get color {
  
  return $ColorInfoCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// @nodoc
mixin _$PickerVariant {

 String get id;@JsonKey(unknownEnumValue: Size.unknown) Size get size; String get sku; double get price; bool get inStock; int? get lowStockLeft; bool get preorder;
/// Create a copy of PickerVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickerVariantCopyWith<PickerVariant> get copyWith => _$PickerVariantCopyWithImpl<PickerVariant>(this as PickerVariant, _$identity);

  /// Serializes this PickerVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickerVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.lowStockLeft, lowStockLeft) || other.lowStockLeft == lowStockLeft)&&(identical(other.preorder, preorder) || other.preorder == preorder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,size,sku,price,inStock,lowStockLeft,preorder);

@override
String toString() {
  return 'PickerVariant(id: $id, size: $size, sku: $sku, price: $price, inStock: $inStock, lowStockLeft: $lowStockLeft, preorder: $preorder)';
}


}

/// @nodoc
abstract mixin class $PickerVariantCopyWith<$Res>  {
  factory $PickerVariantCopyWith(PickerVariant value, $Res Function(PickerVariant) _then) = _$PickerVariantCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: Size.unknown) Size size, String sku, double price, bool inStock, int? lowStockLeft, bool preorder
});




}
/// @nodoc
class _$PickerVariantCopyWithImpl<$Res>
    implements $PickerVariantCopyWith<$Res> {
  _$PickerVariantCopyWithImpl(this._self, this._then);

  final PickerVariant _self;
  final $Res Function(PickerVariant) _then;

/// Create a copy of PickerVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? size = null,Object? sku = null,Object? price = null,Object? inStock = null,Object? lowStockLeft = freezed,Object? preorder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,lowStockLeft: freezed == lowStockLeft ? _self.lowStockLeft : lowStockLeft // ignore: cast_nullable_to_non_nullable
as int?,preorder: null == preorder ? _self.preorder : preorder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PickerVariant].
extension PickerVariantPatterns on PickerVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickerVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickerVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickerVariant value)  $default,){
final _that = this;
switch (_that) {
case _PickerVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickerVariant value)?  $default,){
final _that = this;
switch (_that) {
case _PickerVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: Size.unknown)  Size size,  String sku,  double price,  bool inStock,  int? lowStockLeft,  bool preorder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickerVariant() when $default != null:
return $default(_that.id,_that.size,_that.sku,_that.price,_that.inStock,_that.lowStockLeft,_that.preorder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: Size.unknown)  Size size,  String sku,  double price,  bool inStock,  int? lowStockLeft,  bool preorder)  $default,) {final _that = this;
switch (_that) {
case _PickerVariant():
return $default(_that.id,_that.size,_that.sku,_that.price,_that.inStock,_that.lowStockLeft,_that.preorder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(unknownEnumValue: Size.unknown)  Size size,  String sku,  double price,  bool inStock,  int? lowStockLeft,  bool preorder)?  $default,) {final _that = this;
switch (_that) {
case _PickerVariant() when $default != null:
return $default(_that.id,_that.size,_that.sku,_that.price,_that.inStock,_that.lowStockLeft,_that.preorder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickerVariant extends PickerVariant {
  const _PickerVariant({required this.id, @JsonKey(unknownEnumValue: Size.unknown) this.size = Size.unknown, this.sku = '', required this.price, this.inStock = false, this.lowStockLeft, this.preorder = false}): super._();
  factory _PickerVariant.fromJson(Map<String, dynamic> json) => _$PickerVariantFromJson(json);

@override final  String id;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size size;
@override@JsonKey() final  String sku;
@override final  double price;
@override@JsonKey() final  bool inStock;
@override final  int? lowStockLeft;
@override@JsonKey() final  bool preorder;

/// Create a copy of PickerVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickerVariantCopyWith<_PickerVariant> get copyWith => __$PickerVariantCopyWithImpl<_PickerVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickerVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickerVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.lowStockLeft, lowStockLeft) || other.lowStockLeft == lowStockLeft)&&(identical(other.preorder, preorder) || other.preorder == preorder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,size,sku,price,inStock,lowStockLeft,preorder);

@override
String toString() {
  return 'PickerVariant(id: $id, size: $size, sku: $sku, price: $price, inStock: $inStock, lowStockLeft: $lowStockLeft, preorder: $preorder)';
}


}

/// @nodoc
abstract mixin class _$PickerVariantCopyWith<$Res> implements $PickerVariantCopyWith<$Res> {
  factory _$PickerVariantCopyWith(_PickerVariant value, $Res Function(_PickerVariant) _then) = __$PickerVariantCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: Size.unknown) Size size, String sku, double price, bool inStock, int? lowStockLeft, bool preorder
});




}
/// @nodoc
class __$PickerVariantCopyWithImpl<$Res>
    implements _$PickerVariantCopyWith<$Res> {
  __$PickerVariantCopyWithImpl(this._self, this._then);

  final _PickerVariant _self;
  final $Res Function(_PickerVariant) _then;

/// Create a copy of PickerVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? size = null,Object? sku = null,Object? price = null,Object? inStock = null,Object? lowStockLeft = freezed,Object? preorder = null,}) {
  return _then(_PickerVariant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,lowStockLeft: freezed == lowStockLeft ? _self.lowStockLeft : lowStockLeft // ignore: cast_nullable_to_non_nullable
as int?,preorder: null == preorder ? _self.preorder : preorder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
