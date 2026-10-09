// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeCategory {

 String get slug; String get name; String? get parentId; int get productCount;
/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCategoryCopyWith<HomeCategory> get copyWith => _$HomeCategoryCopyWithImpl<HomeCategory>(this as HomeCategory, _$identity);

  /// Serializes this HomeCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCategory&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,parentId,productCount);

@override
String toString() {
  return 'HomeCategory(slug: $slug, name: $name, parentId: $parentId, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class $HomeCategoryCopyWith<$Res>  {
  factory $HomeCategoryCopyWith(HomeCategory value, $Res Function(HomeCategory) _then) = _$HomeCategoryCopyWithImpl;
@useResult
$Res call({
 String slug, String name, String? parentId, int productCount
});




}
/// @nodoc
class _$HomeCategoryCopyWithImpl<$Res>
    implements $HomeCategoryCopyWith<$Res> {
  _$HomeCategoryCopyWithImpl(this._self, this._then);

  final HomeCategory _self;
  final $Res Function(HomeCategory) _then;

/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? parentId = freezed,Object? productCount = null,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeCategory].
extension HomeCategoryPatterns on HomeCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCategory value)  $default,){
final _that = this;
switch (_that) {
case _HomeCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCategory value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name,  String? parentId,  int productCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
return $default(_that.slug,_that.name,_that.parentId,_that.productCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name,  String? parentId,  int productCount)  $default,) {final _that = this;
switch (_that) {
case _HomeCategory():
return $default(_that.slug,_that.name,_that.parentId,_that.productCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name,  String? parentId,  int productCount)?  $default,) {final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
return $default(_that.slug,_that.name,_that.parentId,_that.productCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeCategory implements HomeCategory {
  const _HomeCategory({required this.slug, required this.name, this.parentId, this.productCount = 0});
  factory _HomeCategory.fromJson(Map<String, dynamic> json) => _$HomeCategoryFromJson(json);

@override final  String slug;
@override final  String name;
@override final  String? parentId;
@override@JsonKey() final  int productCount;

/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCategoryCopyWith<_HomeCategory> get copyWith => __$HomeCategoryCopyWithImpl<_HomeCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCategory&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,parentId,productCount);

@override
String toString() {
  return 'HomeCategory(slug: $slug, name: $name, parentId: $parentId, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class _$HomeCategoryCopyWith<$Res> implements $HomeCategoryCopyWith<$Res> {
  factory _$HomeCategoryCopyWith(_HomeCategory value, $Res Function(_HomeCategory) _then) = __$HomeCategoryCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name, String? parentId, int productCount
});




}
/// @nodoc
class __$HomeCategoryCopyWithImpl<$Res>
    implements _$HomeCategoryCopyWith<$Res> {
  __$HomeCategoryCopyWithImpl(this._self, this._then);

  final _HomeCategory _self;
  final $Res Function(_HomeCategory) _then;

/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? parentId = freezed,Object? productCount = null,}) {
  return _then(_HomeCategory(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeCollection {

 String get slug; String get name; String? get description; DateTime? get releasedAt;
/// Create a copy of HomeCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCollectionCopyWith<HomeCollection> get copyWith => _$HomeCollectionCopyWithImpl<HomeCollection>(this as HomeCollection, _$identity);

  /// Serializes this HomeCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCollection&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.releasedAt, releasedAt) || other.releasedAt == releasedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,description,releasedAt);

@override
String toString() {
  return 'HomeCollection(slug: $slug, name: $name, description: $description, releasedAt: $releasedAt)';
}


}

/// @nodoc
abstract mixin class $HomeCollectionCopyWith<$Res>  {
  factory $HomeCollectionCopyWith(HomeCollection value, $Res Function(HomeCollection) _then) = _$HomeCollectionCopyWithImpl;
@useResult
$Res call({
 String slug, String name, String? description, DateTime? releasedAt
});




}
/// @nodoc
class _$HomeCollectionCopyWithImpl<$Res>
    implements $HomeCollectionCopyWith<$Res> {
  _$HomeCollectionCopyWithImpl(this._self, this._then);

  final HomeCollection _self;
  final $Res Function(HomeCollection) _then;

/// Create a copy of HomeCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? description = freezed,Object? releasedAt = freezed,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,releasedAt: freezed == releasedAt ? _self.releasedAt : releasedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeCollection].
extension HomeCollectionPatterns on HomeCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCollection value)  $default,){
final _that = this;
switch (_that) {
case _HomeCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCollection value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name,  String? description,  DateTime? releasedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCollection() when $default != null:
return $default(_that.slug,_that.name,_that.description,_that.releasedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name,  String? description,  DateTime? releasedAt)  $default,) {final _that = this;
switch (_that) {
case _HomeCollection():
return $default(_that.slug,_that.name,_that.description,_that.releasedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name,  String? description,  DateTime? releasedAt)?  $default,) {final _that = this;
switch (_that) {
case _HomeCollection() when $default != null:
return $default(_that.slug,_that.name,_that.description,_that.releasedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeCollection implements HomeCollection {
  const _HomeCollection({required this.slug, required this.name, this.description, this.releasedAt});
  factory _HomeCollection.fromJson(Map<String, dynamic> json) => _$HomeCollectionFromJson(json);

@override final  String slug;
@override final  String name;
@override final  String? description;
@override final  DateTime? releasedAt;

/// Create a copy of HomeCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCollectionCopyWith<_HomeCollection> get copyWith => __$HomeCollectionCopyWithImpl<_HomeCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCollection&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.releasedAt, releasedAt) || other.releasedAt == releasedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,description,releasedAt);

@override
String toString() {
  return 'HomeCollection(slug: $slug, name: $name, description: $description, releasedAt: $releasedAt)';
}


}

/// @nodoc
abstract mixin class _$HomeCollectionCopyWith<$Res> implements $HomeCollectionCopyWith<$Res> {
  factory _$HomeCollectionCopyWith(_HomeCollection value, $Res Function(_HomeCollection) _then) = __$HomeCollectionCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name, String? description, DateTime? releasedAt
});




}
/// @nodoc
class __$HomeCollectionCopyWithImpl<$Res>
    implements _$HomeCollectionCopyWith<$Res> {
  __$HomeCollectionCopyWithImpl(this._self, this._then);

  final _HomeCollection _self;
  final $Res Function(_HomeCollection) _then;

/// Create a copy of HomeCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? description = freezed,Object? releasedAt = freezed,}) {
  return _then(_HomeCollection(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,releasedAt: freezed == releasedAt ? _self.releasedAt : releasedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Look {

 String get id; String get title; String get imageUrl; List<ProductCard> get products;
/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookCopyWith<Look> get copyWith => _$LookCopyWithImpl<Look>(this as Look, _$identity);

  /// Serializes this Look to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Look&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'Look(id: $id, title: $title, imageUrl: $imageUrl, products: $products)';
}


}

/// @nodoc
abstract mixin class $LookCopyWith<$Res>  {
  factory $LookCopyWith(Look value, $Res Function(Look) _then) = _$LookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl, List<ProductCard> products
});




}
/// @nodoc
class _$LookCopyWithImpl<$Res>
    implements $LookCopyWith<$Res> {
  _$LookCopyWithImpl(this._self, this._then);

  final Look _self;
  final $Res Function(Look) _then;

/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? products = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}

}


/// Adds pattern-matching-related methods to [Look].
extension LookPatterns on Look {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Look value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Look() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Look value)  $default,){
final _that = this;
switch (_that) {
case _Look():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Look value)?  $default,){
final _that = this;
switch (_that) {
case _Look() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  List<ProductCard> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Look() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  List<ProductCard> products)  $default,) {final _that = this;
switch (_that) {
case _Look():
return $default(_that.id,_that.title,_that.imageUrl,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl,  List<ProductCard> products)?  $default,) {final _that = this;
switch (_that) {
case _Look() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Look implements Look {
  const _Look({required this.id, this.title = '', required this.imageUrl, final  List<ProductCard> products = const <ProductCard>[]}): _products = products;
  factory _Look.fromJson(Map<String, dynamic> json) => _$LookFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override final  String imageUrl;
 final  List<ProductCard> _products;
@override@JsonKey() List<ProductCard> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookCopyWith<_Look> get copyWith => __$LookCopyWithImpl<_Look>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Look&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'Look(id: $id, title: $title, imageUrl: $imageUrl, products: $products)';
}


}

/// @nodoc
abstract mixin class _$LookCopyWith<$Res> implements $LookCopyWith<$Res> {
  factory _$LookCopyWith(_Look value, $Res Function(_Look) _then) = __$LookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl, List<ProductCard> products
});




}
/// @nodoc
class __$LookCopyWithImpl<$Res>
    implements _$LookCopyWith<$Res> {
  __$LookCopyWithImpl(this._self, this._then);

  final _Look _self;
  final $Res Function(_Look) _then;

/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? products = null,}) {
  return _then(_Look(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}


}


/// @nodoc
mixin _$HomeFeed {

 List<ProductCard> get newArrivals; List<ProductCard> get bestsellers; List<HomeCategory> get categories; List<HomeCollection> get collections; List<Look> get looks; List<ProductCard> get recentlyViewed;
/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeFeedCopyWith<HomeFeed> get copyWith => _$HomeFeedCopyWithImpl<HomeFeed>(this as HomeFeed, _$identity);

  /// Serializes this HomeFeed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeFeed&&const DeepCollectionEquality().equals(other.newArrivals, newArrivals)&&const DeepCollectionEquality().equals(other.bestsellers, bestsellers)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.collections, collections)&&const DeepCollectionEquality().equals(other.looks, looks)&&const DeepCollectionEquality().equals(other.recentlyViewed, recentlyViewed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(newArrivals),const DeepCollectionEquality().hash(bestsellers),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(collections),const DeepCollectionEquality().hash(looks),const DeepCollectionEquality().hash(recentlyViewed));

@override
String toString() {
  return 'HomeFeed(newArrivals: $newArrivals, bestsellers: $bestsellers, categories: $categories, collections: $collections, looks: $looks, recentlyViewed: $recentlyViewed)';
}


}

/// @nodoc
abstract mixin class $HomeFeedCopyWith<$Res>  {
  factory $HomeFeedCopyWith(HomeFeed value, $Res Function(HomeFeed) _then) = _$HomeFeedCopyWithImpl;
@useResult
$Res call({
 List<ProductCard> newArrivals, List<ProductCard> bestsellers, List<HomeCategory> categories, List<HomeCollection> collections, List<Look> looks, List<ProductCard> recentlyViewed
});




}
/// @nodoc
class _$HomeFeedCopyWithImpl<$Res>
    implements $HomeFeedCopyWith<$Res> {
  _$HomeFeedCopyWithImpl(this._self, this._then);

  final HomeFeed _self;
  final $Res Function(HomeFeed) _then;

/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newArrivals = null,Object? bestsellers = null,Object? categories = null,Object? collections = null,Object? looks = null,Object? recentlyViewed = null,}) {
  return _then(_self.copyWith(
newArrivals: null == newArrivals ? _self.newArrivals : newArrivals // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,bestsellers: null == bestsellers ? _self.bestsellers : bestsellers // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<HomeCategory>,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<HomeCollection>,looks: null == looks ? _self.looks : looks // ignore: cast_nullable_to_non_nullable
as List<Look>,recentlyViewed: null == recentlyViewed ? _self.recentlyViewed : recentlyViewed // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeFeed].
extension HomeFeedPatterns on HomeFeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeFeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeFeed value)  $default,){
final _that = this;
switch (_that) {
case _HomeFeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeFeed value)?  $default,){
final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCard> newArrivals,  List<ProductCard> bestsellers,  List<HomeCategory> categories,  List<HomeCollection> collections,  List<Look> looks,  List<ProductCard> recentlyViewed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
return $default(_that.newArrivals,_that.bestsellers,_that.categories,_that.collections,_that.looks,_that.recentlyViewed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCard> newArrivals,  List<ProductCard> bestsellers,  List<HomeCategory> categories,  List<HomeCollection> collections,  List<Look> looks,  List<ProductCard> recentlyViewed)  $default,) {final _that = this;
switch (_that) {
case _HomeFeed():
return $default(_that.newArrivals,_that.bestsellers,_that.categories,_that.collections,_that.looks,_that.recentlyViewed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCard> newArrivals,  List<ProductCard> bestsellers,  List<HomeCategory> categories,  List<HomeCollection> collections,  List<Look> looks,  List<ProductCard> recentlyViewed)?  $default,) {final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
return $default(_that.newArrivals,_that.bestsellers,_that.categories,_that.collections,_that.looks,_that.recentlyViewed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeFeed implements HomeFeed {
  const _HomeFeed({final  List<ProductCard> newArrivals = const <ProductCard>[], final  List<ProductCard> bestsellers = const <ProductCard>[], final  List<HomeCategory> categories = const <HomeCategory>[], final  List<HomeCollection> collections = const <HomeCollection>[], final  List<Look> looks = const <Look>[], final  List<ProductCard> recentlyViewed = const <ProductCard>[]}): _newArrivals = newArrivals,_bestsellers = bestsellers,_categories = categories,_collections = collections,_looks = looks,_recentlyViewed = recentlyViewed;
  factory _HomeFeed.fromJson(Map<String, dynamic> json) => _$HomeFeedFromJson(json);

 final  List<ProductCard> _newArrivals;
@override@JsonKey() List<ProductCard> get newArrivals {
  if (_newArrivals is EqualUnmodifiableListView) return _newArrivals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newArrivals);
}

 final  List<ProductCard> _bestsellers;
@override@JsonKey() List<ProductCard> get bestsellers {
  if (_bestsellers is EqualUnmodifiableListView) return _bestsellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestsellers);
}

 final  List<HomeCategory> _categories;
@override@JsonKey() List<HomeCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<HomeCollection> _collections;
@override@JsonKey() List<HomeCollection> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}

 final  List<Look> _looks;
@override@JsonKey() List<Look> get looks {
  if (_looks is EqualUnmodifiableListView) return _looks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_looks);
}

 final  List<ProductCard> _recentlyViewed;
@override@JsonKey() List<ProductCard> get recentlyViewed {
  if (_recentlyViewed is EqualUnmodifiableListView) return _recentlyViewed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentlyViewed);
}


/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeFeedCopyWith<_HomeFeed> get copyWith => __$HomeFeedCopyWithImpl<_HomeFeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeFeedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeFeed&&const DeepCollectionEquality().equals(other._newArrivals, _newArrivals)&&const DeepCollectionEquality().equals(other._bestsellers, _bestsellers)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._collections, _collections)&&const DeepCollectionEquality().equals(other._looks, _looks)&&const DeepCollectionEquality().equals(other._recentlyViewed, _recentlyViewed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_newArrivals),const DeepCollectionEquality().hash(_bestsellers),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_collections),const DeepCollectionEquality().hash(_looks),const DeepCollectionEquality().hash(_recentlyViewed));

@override
String toString() {
  return 'HomeFeed(newArrivals: $newArrivals, bestsellers: $bestsellers, categories: $categories, collections: $collections, looks: $looks, recentlyViewed: $recentlyViewed)';
}


}

/// @nodoc
abstract mixin class _$HomeFeedCopyWith<$Res> implements $HomeFeedCopyWith<$Res> {
  factory _$HomeFeedCopyWith(_HomeFeed value, $Res Function(_HomeFeed) _then) = __$HomeFeedCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCard> newArrivals, List<ProductCard> bestsellers, List<HomeCategory> categories, List<HomeCollection> collections, List<Look> looks, List<ProductCard> recentlyViewed
});




}
/// @nodoc
class __$HomeFeedCopyWithImpl<$Res>
    implements _$HomeFeedCopyWith<$Res> {
  __$HomeFeedCopyWithImpl(this._self, this._then);

  final _HomeFeed _self;
  final $Res Function(_HomeFeed) _then;

/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newArrivals = null,Object? bestsellers = null,Object? categories = null,Object? collections = null,Object? looks = null,Object? recentlyViewed = null,}) {
  return _then(_HomeFeed(
newArrivals: null == newArrivals ? _self._newArrivals : newArrivals // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,bestsellers: null == bestsellers ? _self._bestsellers : bestsellers // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<HomeCategory>,collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<HomeCollection>,looks: null == looks ? _self._looks : looks // ignore: cast_nullable_to_non_nullable
as List<Look>,recentlyViewed: null == recentlyViewed ? _self._recentlyViewed : recentlyViewed // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}


}

// dart format on
