// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {

 String get id; String get slug; String get name; String? get parentId; int get productCount;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,parentId,productCount);

@override
String toString() {
  return 'Category(id: $id, slug: $slug, name: $name, parentId: $parentId, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String? parentId, int productCount
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? parentId = freezed,Object? productCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String? parentId,  int productCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.parentId,_that.productCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String? parentId,  int productCount)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.slug,_that.name,_that.parentId,_that.productCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String? parentId,  int productCount)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.parentId,_that.productCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({required this.id, required this.slug, required this.name, this.parentId, this.productCount = 0});
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  String? parentId;
@override@JsonKey() final  int productCount;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,parentId,productCount);

@override
String toString() {
  return 'Category(id: $id, slug: $slug, name: $name, parentId: $parentId, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String? parentId, int productCount
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? parentId = freezed,Object? productCount = null,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Collection {

 String get id; String get slug; String get name; String? get description; DateTime? get releasedAt;
/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionCopyWith<Collection> get copyWith => _$CollectionCopyWithImpl<Collection>(this as Collection, _$identity);

  /// Serializes this Collection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Collection&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.releasedAt, releasedAt) || other.releasedAt == releasedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,description,releasedAt);

@override
String toString() {
  return 'Collection(id: $id, slug: $slug, name: $name, description: $description, releasedAt: $releasedAt)';
}


}

/// @nodoc
abstract mixin class $CollectionCopyWith<$Res>  {
  factory $CollectionCopyWith(Collection value, $Res Function(Collection) _then) = _$CollectionCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String? description, DateTime? releasedAt
});




}
/// @nodoc
class _$CollectionCopyWithImpl<$Res>
    implements $CollectionCopyWith<$Res> {
  _$CollectionCopyWithImpl(this._self, this._then);

  final Collection _self;
  final $Res Function(Collection) _then;

/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = freezed,Object? releasedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,releasedAt: freezed == releasedAt ? _self.releasedAt : releasedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Collection].
extension CollectionPatterns on Collection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Collection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Collection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Collection value)  $default,){
final _that = this;
switch (_that) {
case _Collection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Collection value)?  $default,){
final _that = this;
switch (_that) {
case _Collection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String? description,  DateTime? releasedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Collection() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.releasedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String? description,  DateTime? releasedAt)  $default,) {final _that = this;
switch (_that) {
case _Collection():
return $default(_that.id,_that.slug,_that.name,_that.description,_that.releasedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String? description,  DateTime? releasedAt)?  $default,) {final _that = this;
switch (_that) {
case _Collection() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.releasedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Collection implements Collection {
  const _Collection({required this.id, required this.slug, required this.name, this.description, this.releasedAt});
  factory _Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  String? description;
@override final  DateTime? releasedAt;

/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionCopyWith<_Collection> get copyWith => __$CollectionCopyWithImpl<_Collection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Collection&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.releasedAt, releasedAt) || other.releasedAt == releasedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,description,releasedAt);

@override
String toString() {
  return 'Collection(id: $id, slug: $slug, name: $name, description: $description, releasedAt: $releasedAt)';
}


}

/// @nodoc
abstract mixin class _$CollectionCopyWith<$Res> implements $CollectionCopyWith<$Res> {
  factory _$CollectionCopyWith(_Collection value, $Res Function(_Collection) _then) = __$CollectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String? description, DateTime? releasedAt
});




}
/// @nodoc
class __$CollectionCopyWithImpl<$Res>
    implements _$CollectionCopyWith<$Res> {
  __$CollectionCopyWithImpl(this._self, this._then);

  final _Collection _self;
  final $Res Function(_Collection) _then;

/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = freezed,Object? releasedAt = freezed,}) {
  return _then(_Collection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,releasedAt: freezed == releasedAt ? _self.releasedAt : releasedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$FacetValue {

 String get value; String get label; int get count;
/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacetValueCopyWith<FacetValue> get copyWith => _$FacetValueCopyWithImpl<FacetValue>(this as FacetValue, _$identity);

  /// Serializes this FacetValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacetValue&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,count);

@override
String toString() {
  return 'FacetValue(value: $value, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class $FacetValueCopyWith<$Res>  {
  factory $FacetValueCopyWith(FacetValue value, $Res Function(FacetValue) _then) = _$FacetValueCopyWithImpl;
@useResult
$Res call({
 String value, String label, int count
});




}
/// @nodoc
class _$FacetValueCopyWithImpl<$Res>
    implements $FacetValueCopyWith<$Res> {
  _$FacetValueCopyWithImpl(this._self, this._then);

  final FacetValue _self;
  final $Res Function(FacetValue) _then;

/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? count = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FacetValue].
extension FacetValuePatterns on FacetValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacetValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacetValue value)  $default,){
final _that = this;
switch (_that) {
case _FacetValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacetValue value)?  $default,){
final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
return $default(_that.value,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  int count)  $default,) {final _that = this;
switch (_that) {
case _FacetValue():
return $default(_that.value,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  int count)?  $default,) {final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
return $default(_that.value,_that.label,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FacetValue implements FacetValue {
  const _FacetValue({required this.value, required this.label, this.count = 0});
  factory _FacetValue.fromJson(Map<String, dynamic> json) => _$FacetValueFromJson(json);

@override final  String value;
@override final  String label;
@override@JsonKey() final  int count;

/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacetValueCopyWith<_FacetValue> get copyWith => __$FacetValueCopyWithImpl<_FacetValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacetValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacetValue&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,count);

@override
String toString() {
  return 'FacetValue(value: $value, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class _$FacetValueCopyWith<$Res> implements $FacetValueCopyWith<$Res> {
  factory _$FacetValueCopyWith(_FacetValue value, $Res Function(_FacetValue) _then) = __$FacetValueCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, int count
});




}
/// @nodoc
class __$FacetValueCopyWithImpl<$Res>
    implements _$FacetValueCopyWith<$Res> {
  __$FacetValueCopyWithImpl(this._self, this._then);

  final _FacetValue _self;
  final $Res Function(_FacetValue) _then;

/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? count = null,}) {
  return _then(_FacetValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductFacets {

 List<FacetValue> get categories; List<FacetValue> get sizes; List<FacetValue> get colors; List<FacetValue> get fits; List<FacetValue> get fabrics; double? get minPrice; double? get maxPrice;
/// Create a copy of ProductFacets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFacetsCopyWith<ProductFacets> get copyWith => _$ProductFacetsCopyWithImpl<ProductFacets>(this as ProductFacets, _$identity);

  /// Serializes this ProductFacets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFacets&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&const DeepCollectionEquality().equals(other.colors, colors)&&const DeepCollectionEquality().equals(other.fits, fits)&&const DeepCollectionEquality().equals(other.fabrics, fabrics)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(sizes),const DeepCollectionEquality().hash(colors),const DeepCollectionEquality().hash(fits),const DeepCollectionEquality().hash(fabrics),minPrice,maxPrice);

@override
String toString() {
  return 'ProductFacets(categories: $categories, sizes: $sizes, colors: $colors, fits: $fits, fabrics: $fabrics, minPrice: $minPrice, maxPrice: $maxPrice)';
}


}

/// @nodoc
abstract mixin class $ProductFacetsCopyWith<$Res>  {
  factory $ProductFacetsCopyWith(ProductFacets value, $Res Function(ProductFacets) _then) = _$ProductFacetsCopyWithImpl;
@useResult
$Res call({
 List<FacetValue> categories, List<FacetValue> sizes, List<FacetValue> colors, List<FacetValue> fits, List<FacetValue> fabrics, double? minPrice, double? maxPrice
});




}
/// @nodoc
class _$ProductFacetsCopyWithImpl<$Res>
    implements $ProductFacetsCopyWith<$Res> {
  _$ProductFacetsCopyWithImpl(this._self, this._then);

  final ProductFacets _self;
  final $Res Function(ProductFacets) _then;

/// Create a copy of ProductFacets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? sizes = null,Object? colors = null,Object? fits = null,Object? fabrics = null,Object? minPrice = freezed,Object? maxPrice = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,fits: null == fits ? _self.fits : fits // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,fabrics: null == fabrics ? _self.fabrics : fabrics // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFacets].
extension ProductFacetsPatterns on ProductFacets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFacets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFacets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFacets value)  $default,){
final _that = this;
switch (_that) {
case _ProductFacets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFacets value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFacets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FacetValue> categories,  List<FacetValue> sizes,  List<FacetValue> colors,  List<FacetValue> fits,  List<FacetValue> fabrics,  double? minPrice,  double? maxPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFacets() when $default != null:
return $default(_that.categories,_that.sizes,_that.colors,_that.fits,_that.fabrics,_that.minPrice,_that.maxPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FacetValue> categories,  List<FacetValue> sizes,  List<FacetValue> colors,  List<FacetValue> fits,  List<FacetValue> fabrics,  double? minPrice,  double? maxPrice)  $default,) {final _that = this;
switch (_that) {
case _ProductFacets():
return $default(_that.categories,_that.sizes,_that.colors,_that.fits,_that.fabrics,_that.minPrice,_that.maxPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FacetValue> categories,  List<FacetValue> sizes,  List<FacetValue> colors,  List<FacetValue> fits,  List<FacetValue> fabrics,  double? minPrice,  double? maxPrice)?  $default,) {final _that = this;
switch (_that) {
case _ProductFacets() when $default != null:
return $default(_that.categories,_that.sizes,_that.colors,_that.fits,_that.fabrics,_that.minPrice,_that.maxPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductFacets implements ProductFacets {
  const _ProductFacets({final  List<FacetValue> categories = const <FacetValue>[], final  List<FacetValue> sizes = const <FacetValue>[], final  List<FacetValue> colors = const <FacetValue>[], final  List<FacetValue> fits = const <FacetValue>[], final  List<FacetValue> fabrics = const <FacetValue>[], this.minPrice, this.maxPrice}): _categories = categories,_sizes = sizes,_colors = colors,_fits = fits,_fabrics = fabrics;
  factory _ProductFacets.fromJson(Map<String, dynamic> json) => _$ProductFacetsFromJson(json);

 final  List<FacetValue> _categories;
@override@JsonKey() List<FacetValue> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<FacetValue> _sizes;
@override@JsonKey() List<FacetValue> get sizes {
  if (_sizes is EqualUnmodifiableListView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizes);
}

 final  List<FacetValue> _colors;
@override@JsonKey() List<FacetValue> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

 final  List<FacetValue> _fits;
@override@JsonKey() List<FacetValue> get fits {
  if (_fits is EqualUnmodifiableListView) return _fits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fits);
}

 final  List<FacetValue> _fabrics;
@override@JsonKey() List<FacetValue> get fabrics {
  if (_fabrics is EqualUnmodifiableListView) return _fabrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fabrics);
}

@override final  double? minPrice;
@override final  double? maxPrice;

/// Create a copy of ProductFacets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFacetsCopyWith<_ProductFacets> get copyWith => __$ProductFacetsCopyWithImpl<_ProductFacets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductFacetsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFacets&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&const DeepCollectionEquality().equals(other._colors, _colors)&&const DeepCollectionEquality().equals(other._fits, _fits)&&const DeepCollectionEquality().equals(other._fabrics, _fabrics)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_sizes),const DeepCollectionEquality().hash(_colors),const DeepCollectionEquality().hash(_fits),const DeepCollectionEquality().hash(_fabrics),minPrice,maxPrice);

@override
String toString() {
  return 'ProductFacets(categories: $categories, sizes: $sizes, colors: $colors, fits: $fits, fabrics: $fabrics, minPrice: $minPrice, maxPrice: $maxPrice)';
}


}

/// @nodoc
abstract mixin class _$ProductFacetsCopyWith<$Res> implements $ProductFacetsCopyWith<$Res> {
  factory _$ProductFacetsCopyWith(_ProductFacets value, $Res Function(_ProductFacets) _then) = __$ProductFacetsCopyWithImpl;
@override @useResult
$Res call({
 List<FacetValue> categories, List<FacetValue> sizes, List<FacetValue> colors, List<FacetValue> fits, List<FacetValue> fabrics, double? minPrice, double? maxPrice
});




}
/// @nodoc
class __$ProductFacetsCopyWithImpl<$Res>
    implements _$ProductFacetsCopyWith<$Res> {
  __$ProductFacetsCopyWithImpl(this._self, this._then);

  final _ProductFacets _self;
  final $Res Function(_ProductFacets) _then;

/// Create a copy of ProductFacets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? sizes = null,Object? colors = null,Object? fits = null,Object? fabrics = null,Object? minPrice = freezed,Object? maxPrice = freezed,}) {
  return _then(_ProductFacets(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,fits: null == fits ? _self._fits : fits // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,fabrics: null == fabrics ? _self._fabrics : fabrics // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ProductListPage {

 List<ProductCard> get items; int get page; int get pageSize; int get totalCount; bool get hasMore; ProductFacets get facets;
/// Create a copy of ProductListPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListPageCopyWith<ProductListPage> get copyWith => _$ProductListPageCopyWithImpl<ProductListPage>(this as ProductListPage, _$identity);

  /// Serializes this ProductListPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListPage&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.facets, facets) || other.facets == facets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,pageSize,totalCount,hasMore,facets);

@override
String toString() {
  return 'ProductListPage(items: $items, page: $page, pageSize: $pageSize, totalCount: $totalCount, hasMore: $hasMore, facets: $facets)';
}


}

/// @nodoc
abstract mixin class $ProductListPageCopyWith<$Res>  {
  factory $ProductListPageCopyWith(ProductListPage value, $Res Function(ProductListPage) _then) = _$ProductListPageCopyWithImpl;
@useResult
$Res call({
 List<ProductCard> items, int page, int pageSize, int totalCount, bool hasMore, ProductFacets facets
});


$ProductFacetsCopyWith<$Res> get facets;

}
/// @nodoc
class _$ProductListPageCopyWithImpl<$Res>
    implements $ProductListPageCopyWith<$Res> {
  _$ProductListPageCopyWithImpl(this._self, this._then);

  final ProductListPage _self;
  final $Res Function(ProductListPage) _then;

/// Create a copy of ProductListPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? hasMore = null,Object? facets = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,facets: null == facets ? _self.facets : facets // ignore: cast_nullable_to_non_nullable
as ProductFacets,
  ));
}
/// Create a copy of ProductListPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductFacetsCopyWith<$Res> get facets {
  
  return $ProductFacetsCopyWith<$Res>(_self.facets, (value) {
    return _then(_self.copyWith(facets: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductListPage].
extension ProductListPagePatterns on ProductListPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductListPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductListPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductListPage value)  $default,){
final _that = this;
switch (_that) {
case _ProductListPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductListPage value)?  $default,){
final _that = this;
switch (_that) {
case _ProductListPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCard> items,  int page,  int pageSize,  int totalCount,  bool hasMore,  ProductFacets facets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductListPage() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.hasMore,_that.facets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCard> items,  int page,  int pageSize,  int totalCount,  bool hasMore,  ProductFacets facets)  $default,) {final _that = this;
switch (_that) {
case _ProductListPage():
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.hasMore,_that.facets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCard> items,  int page,  int pageSize,  int totalCount,  bool hasMore,  ProductFacets facets)?  $default,) {final _that = this;
switch (_that) {
case _ProductListPage() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.hasMore,_that.facets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductListPage implements ProductListPage {
  const _ProductListPage({final  List<ProductCard> items = const <ProductCard>[], this.page = 1, this.pageSize = 12, this.totalCount = 0, this.hasMore = false, this.facets = const ProductFacets()}): _items = items;
  factory _ProductListPage.fromJson(Map<String, dynamic> json) => _$ProductListPageFromJson(json);

 final  List<ProductCard> _items;
@override@JsonKey() List<ProductCard> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int totalCount;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  ProductFacets facets;

/// Create a copy of ProductListPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductListPageCopyWith<_ProductListPage> get copyWith => __$ProductListPageCopyWithImpl<_ProductListPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductListPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductListPage&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.facets, facets) || other.facets == facets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,pageSize,totalCount,hasMore,facets);

@override
String toString() {
  return 'ProductListPage(items: $items, page: $page, pageSize: $pageSize, totalCount: $totalCount, hasMore: $hasMore, facets: $facets)';
}


}

/// @nodoc
abstract mixin class _$ProductListPageCopyWith<$Res> implements $ProductListPageCopyWith<$Res> {
  factory _$ProductListPageCopyWith(_ProductListPage value, $Res Function(_ProductListPage) _then) = __$ProductListPageCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCard> items, int page, int pageSize, int totalCount, bool hasMore, ProductFacets facets
});


@override $ProductFacetsCopyWith<$Res> get facets;

}
/// @nodoc
class __$ProductListPageCopyWithImpl<$Res>
    implements _$ProductListPageCopyWith<$Res> {
  __$ProductListPageCopyWithImpl(this._self, this._then);

  final _ProductListPage _self;
  final $Res Function(_ProductListPage) _then;

/// Create a copy of ProductListPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? hasMore = null,Object? facets = null,}) {
  return _then(_ProductListPage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,facets: null == facets ? _self.facets : facets // ignore: cast_nullable_to_non_nullable
as ProductFacets,
  ));
}

/// Create a copy of ProductListPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductFacetsCopyWith<$Res> get facets {
  
  return $ProductFacetsCopyWith<$Res>(_self.facets, (value) {
    return _then(_self.copyWith(facets: value));
  });
}
}


/// @nodoc
mixin _$ProductVariant {

 String get id;@JsonKey(unknownEnumValue: Size.unknown) Size get size; String get sku; double get price; bool get inStock; int? get lowStockLeft; bool get preorder;
/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantCopyWith<ProductVariant> get copyWith => _$ProductVariantCopyWithImpl<ProductVariant>(this as ProductVariant, _$identity);

  /// Serializes this ProductVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.lowStockLeft, lowStockLeft) || other.lowStockLeft == lowStockLeft)&&(identical(other.preorder, preorder) || other.preorder == preorder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,size,sku,price,inStock,lowStockLeft,preorder);

@override
String toString() {
  return 'ProductVariant(id: $id, size: $size, sku: $sku, price: $price, inStock: $inStock, lowStockLeft: $lowStockLeft, preorder: $preorder)';
}


}

/// @nodoc
abstract mixin class $ProductVariantCopyWith<$Res>  {
  factory $ProductVariantCopyWith(ProductVariant value, $Res Function(ProductVariant) _then) = _$ProductVariantCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: Size.unknown) Size size, String sku, double price, bool inStock, int? lowStockLeft, bool preorder
});




}
/// @nodoc
class _$ProductVariantCopyWithImpl<$Res>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._self, this._then);

  final ProductVariant _self;
  final $Res Function(ProductVariant) _then;

/// Create a copy of ProductVariant
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


/// Adds pattern-matching-related methods to [ProductVariant].
extension ProductVariantPatterns on ProductVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariant value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariant value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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
case _ProductVariant() when $default != null:
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
case _ProductVariant():
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
case _ProductVariant() when $default != null:
return $default(_that.id,_that.size,_that.sku,_that.price,_that.inStock,_that.lowStockLeft,_that.preorder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariant extends ProductVariant {
  const _ProductVariant({required this.id, @JsonKey(unknownEnumValue: Size.unknown) required this.size, this.sku = '', required this.price, this.inStock = false, this.lowStockLeft, this.preorder = false}): super._();
  factory _ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);

@override final  String id;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size size;
@override@JsonKey() final  String sku;
@override final  double price;
@override@JsonKey() final  bool inStock;
@override final  int? lowStockLeft;
@override@JsonKey() final  bool preorder;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantCopyWith<_ProductVariant> get copyWith => __$ProductVariantCopyWithImpl<_ProductVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.lowStockLeft, lowStockLeft) || other.lowStockLeft == lowStockLeft)&&(identical(other.preorder, preorder) || other.preorder == preorder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,size,sku,price,inStock,lowStockLeft,preorder);

@override
String toString() {
  return 'ProductVariant(id: $id, size: $size, sku: $sku, price: $price, inStock: $inStock, lowStockLeft: $lowStockLeft, preorder: $preorder)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantCopyWith<$Res> implements $ProductVariantCopyWith<$Res> {
  factory _$ProductVariantCopyWith(_ProductVariant value, $Res Function(_ProductVariant) _then) = __$ProductVariantCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: Size.unknown) Size size, String sku, double price, bool inStock, int? lowStockLeft, bool preorder
});




}
/// @nodoc
class __$ProductVariantCopyWithImpl<$Res>
    implements _$ProductVariantCopyWith<$Res> {
  __$ProductVariantCopyWithImpl(this._self, this._then);

  final _ProductVariant _self;
  final $Res Function(_ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? size = null,Object? sku = null,Object? price = null,Object? inStock = null,Object? lowStockLeft = freezed,Object? preorder = null,}) {
  return _then(_ProductVariant(
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


/// @nodoc
mixin _$ProductColor {

 ColorInfo get color; List<String> get images; List<ProductVariant> get variants;
/// Create a copy of ProductColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductColorCopyWith<ProductColor> get copyWith => _$ProductColorCopyWithImpl<ProductColor>(this as ProductColor, _$identity);

  /// Serializes this ProductColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductColor&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'ProductColor(color: $color, images: $images, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $ProductColorCopyWith<$Res>  {
  factory $ProductColorCopyWith(ProductColor value, $Res Function(ProductColor) _then) = _$ProductColorCopyWithImpl;
@useResult
$Res call({
 ColorInfo color, List<String> images, List<ProductVariant> variants
});


$ColorInfoCopyWith<$Res> get color;

}
/// @nodoc
class _$ProductColorCopyWithImpl<$Res>
    implements $ProductColorCopyWith<$Res> {
  _$ProductColorCopyWithImpl(this._self, this._then);

  final ProductColor _self;
  final $Res Function(ProductColor) _then;

/// Create a copy of ProductColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? images = null,Object? variants = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorInfo,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductVariant>,
  ));
}
/// Create a copy of ProductColor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res> get color {
  
  return $ColorInfoCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductColor].
extension ProductColorPatterns on ProductColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductColor value)  $default,){
final _that = this;
switch (_that) {
case _ProductColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductColor value)?  $default,){
final _that = this;
switch (_that) {
case _ProductColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ColorInfo color,  List<String> images,  List<ProductVariant> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductColor() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ColorInfo color,  List<String> images,  List<ProductVariant> variants)  $default,) {final _that = this;
switch (_that) {
case _ProductColor():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ColorInfo color,  List<String> images,  List<ProductVariant> variants)?  $default,) {final _that = this;
switch (_that) {
case _ProductColor() when $default != null:
return $default(_that.color,_that.images,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductColor extends ProductColor {
  const _ProductColor({required this.color, final  List<String> images = const <String>[], final  List<ProductVariant> variants = const <ProductVariant>[]}): _images = images,_variants = variants,super._();
  factory _ProductColor.fromJson(Map<String, dynamic> json) => _$ProductColorFromJson(json);

@override final  ColorInfo color;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<ProductVariant> _variants;
@override@JsonKey() List<ProductVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of ProductColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductColorCopyWith<_ProductColor> get copyWith => __$ProductColorCopyWithImpl<_ProductColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductColor&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'ProductColor(color: $color, images: $images, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$ProductColorCopyWith<$Res> implements $ProductColorCopyWith<$Res> {
  factory _$ProductColorCopyWith(_ProductColor value, $Res Function(_ProductColor) _then) = __$ProductColorCopyWithImpl;
@override @useResult
$Res call({
 ColorInfo color, List<String> images, List<ProductVariant> variants
});


@override $ColorInfoCopyWith<$Res> get color;

}
/// @nodoc
class __$ProductColorCopyWithImpl<$Res>
    implements _$ProductColorCopyWith<$Res> {
  __$ProductColorCopyWithImpl(this._self, this._then);

  final _ProductColor _self;
  final $Res Function(_ProductColor) _then;

/// Create a copy of ProductColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? images = null,Object? variants = null,}) {
  return _then(_ProductColor(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorInfo,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductVariant>,
  ));
}

/// Create a copy of ProductColor
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
mixin _$SizeChartRow {

@JsonKey(unknownEnumValue: Size.unknown) Size get size; double get chestCm; double get lengthCm; double get sleeveCm; double get chestIn; double get lengthIn; double get sleeveIn;
/// Create a copy of SizeChartRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeChartRowCopyWith<SizeChartRow> get copyWith => _$SizeChartRowCopyWithImpl<SizeChartRow>(this as SizeChartRow, _$identity);

  /// Serializes this SizeChartRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeChartRow&&(identical(other.size, size) || other.size == size)&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.sleeveCm, sleeveCm) || other.sleeveCm == sleeveCm)&&(identical(other.chestIn, chestIn) || other.chestIn == chestIn)&&(identical(other.lengthIn, lengthIn) || other.lengthIn == lengthIn)&&(identical(other.sleeveIn, sleeveIn) || other.sleeveIn == sleeveIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,chestCm,lengthCm,sleeveCm,chestIn,lengthIn,sleeveIn);

@override
String toString() {
  return 'SizeChartRow(size: $size, chestCm: $chestCm, lengthCm: $lengthCm, sleeveCm: $sleeveCm, chestIn: $chestIn, lengthIn: $lengthIn, sleeveIn: $sleeveIn)';
}


}

/// @nodoc
abstract mixin class $SizeChartRowCopyWith<$Res>  {
  factory $SizeChartRowCopyWith(SizeChartRow value, $Res Function(SizeChartRow) _then) = _$SizeChartRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: Size.unknown) Size size, double chestCm, double lengthCm, double sleeveCm, double chestIn, double lengthIn, double sleeveIn
});




}
/// @nodoc
class _$SizeChartRowCopyWithImpl<$Res>
    implements $SizeChartRowCopyWith<$Res> {
  _$SizeChartRowCopyWithImpl(this._self, this._then);

  final SizeChartRow _self;
  final $Res Function(SizeChartRow) _then;

/// Create a copy of SizeChartRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? chestCm = null,Object? lengthCm = null,Object? sleeveCm = null,Object? chestIn = null,Object? lengthIn = null,Object? sleeveIn = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,chestCm: null == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as double,lengthCm: null == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as double,sleeveCm: null == sleeveCm ? _self.sleeveCm : sleeveCm // ignore: cast_nullable_to_non_nullable
as double,chestIn: null == chestIn ? _self.chestIn : chestIn // ignore: cast_nullable_to_non_nullable
as double,lengthIn: null == lengthIn ? _self.lengthIn : lengthIn // ignore: cast_nullable_to_non_nullable
as double,sleeveIn: null == sleeveIn ? _self.sleeveIn : sleeveIn // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SizeChartRow].
extension SizeChartRowPatterns on SizeChartRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SizeChartRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SizeChartRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SizeChartRow value)  $default,){
final _that = this;
switch (_that) {
case _SizeChartRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SizeChartRow value)?  $default,){
final _that = this;
switch (_that) {
case _SizeChartRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size,  double chestCm,  double lengthCm,  double sleeveCm,  double chestIn,  double lengthIn,  double sleeveIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SizeChartRow() when $default != null:
return $default(_that.size,_that.chestCm,_that.lengthCm,_that.sleeveCm,_that.chestIn,_that.lengthIn,_that.sleeveIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size,  double chestCm,  double lengthCm,  double sleeveCm,  double chestIn,  double lengthIn,  double sleeveIn)  $default,) {final _that = this;
switch (_that) {
case _SizeChartRow():
return $default(_that.size,_that.chestCm,_that.lengthCm,_that.sleeveCm,_that.chestIn,_that.lengthIn,_that.sleeveIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size,  double chestCm,  double lengthCm,  double sleeveCm,  double chestIn,  double lengthIn,  double sleeveIn)?  $default,) {final _that = this;
switch (_that) {
case _SizeChartRow() when $default != null:
return $default(_that.size,_that.chestCm,_that.lengthCm,_that.sleeveCm,_that.chestIn,_that.lengthIn,_that.sleeveIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SizeChartRow implements SizeChartRow {
  const _SizeChartRow({@JsonKey(unknownEnumValue: Size.unknown) required this.size, required this.chestCm, required this.lengthCm, required this.sleeveCm, required this.chestIn, required this.lengthIn, required this.sleeveIn});
  factory _SizeChartRow.fromJson(Map<String, dynamic> json) => _$SizeChartRowFromJson(json);

@override@JsonKey(unknownEnumValue: Size.unknown) final  Size size;
@override final  double chestCm;
@override final  double lengthCm;
@override final  double sleeveCm;
@override final  double chestIn;
@override final  double lengthIn;
@override final  double sleeveIn;

/// Create a copy of SizeChartRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeChartRowCopyWith<_SizeChartRow> get copyWith => __$SizeChartRowCopyWithImpl<_SizeChartRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizeChartRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeChartRow&&(identical(other.size, size) || other.size == size)&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.sleeveCm, sleeveCm) || other.sleeveCm == sleeveCm)&&(identical(other.chestIn, chestIn) || other.chestIn == chestIn)&&(identical(other.lengthIn, lengthIn) || other.lengthIn == lengthIn)&&(identical(other.sleeveIn, sleeveIn) || other.sleeveIn == sleeveIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,chestCm,lengthCm,sleeveCm,chestIn,lengthIn,sleeveIn);

@override
String toString() {
  return 'SizeChartRow(size: $size, chestCm: $chestCm, lengthCm: $lengthCm, sleeveCm: $sleeveCm, chestIn: $chestIn, lengthIn: $lengthIn, sleeveIn: $sleeveIn)';
}


}

/// @nodoc
abstract mixin class _$SizeChartRowCopyWith<$Res> implements $SizeChartRowCopyWith<$Res> {
  factory _$SizeChartRowCopyWith(_SizeChartRow value, $Res Function(_SizeChartRow) _then) = __$SizeChartRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: Size.unknown) Size size, double chestCm, double lengthCm, double sleeveCm, double chestIn, double lengthIn, double sleeveIn
});




}
/// @nodoc
class __$SizeChartRowCopyWithImpl<$Res>
    implements _$SizeChartRowCopyWith<$Res> {
  __$SizeChartRowCopyWithImpl(this._self, this._then);

  final _SizeChartRow _self;
  final $Res Function(_SizeChartRow) _then;

/// Create a copy of SizeChartRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? chestCm = null,Object? lengthCm = null,Object? sleeveCm = null,Object? chestIn = null,Object? lengthIn = null,Object? sleeveIn = null,}) {
  return _then(_SizeChartRow(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,chestCm: null == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as double,lengthCm: null == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as double,sleeveCm: null == sleeveCm ? _self.sleeveCm : sleeveCm // ignore: cast_nullable_to_non_nullable
as double,chestIn: null == chestIn ? _self.chestIn : chestIn // ignore: cast_nullable_to_non_nullable
as double,lengthIn: null == lengthIn ? _self.lengthIn : lengthIn // ignore: cast_nullable_to_non_nullable
as double,sleeveIn: null == sleeveIn ? _self.sleeveIn : sleeveIn // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SizeRecommendation {

@JsonKey(unknownEnumValue: Size.unknown) Size get size;@JsonKey(unknownEnumValue: RecommendationBasis.unknown) RecommendationBasis get basis;@JsonKey(unknownEnumValue: Fit.unknown) Fit get fit;
/// Create a copy of SizeRecommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeRecommendationCopyWith<SizeRecommendation> get copyWith => _$SizeRecommendationCopyWithImpl<SizeRecommendation>(this as SizeRecommendation, _$identity);

  /// Serializes this SizeRecommendation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeRecommendation&&(identical(other.size, size) || other.size == size)&&(identical(other.basis, basis) || other.basis == basis)&&(identical(other.fit, fit) || other.fit == fit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,basis,fit);

@override
String toString() {
  return 'SizeRecommendation(size: $size, basis: $basis, fit: $fit)';
}


}

/// @nodoc
abstract mixin class $SizeRecommendationCopyWith<$Res>  {
  factory $SizeRecommendationCopyWith(SizeRecommendation value, $Res Function(SizeRecommendation) _then) = _$SizeRecommendationCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: Size.unknown) Size size,@JsonKey(unknownEnumValue: RecommendationBasis.unknown) RecommendationBasis basis,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit
});




}
/// @nodoc
class _$SizeRecommendationCopyWithImpl<$Res>
    implements $SizeRecommendationCopyWith<$Res> {
  _$SizeRecommendationCopyWithImpl(this._self, this._then);

  final SizeRecommendation _self;
  final $Res Function(SizeRecommendation) _then;

/// Create a copy of SizeRecommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? basis = null,Object? fit = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,basis: null == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as RecommendationBasis,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,
  ));
}

}


/// Adds pattern-matching-related methods to [SizeRecommendation].
extension SizeRecommendationPatterns on SizeRecommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SizeRecommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SizeRecommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SizeRecommendation value)  $default,){
final _that = this;
switch (_that) {
case _SizeRecommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SizeRecommendation value)?  $default,){
final _that = this;
switch (_that) {
case _SizeRecommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size, @JsonKey(unknownEnumValue: RecommendationBasis.unknown)  RecommendationBasis basis, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SizeRecommendation() when $default != null:
return $default(_that.size,_that.basis,_that.fit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size, @JsonKey(unknownEnumValue: RecommendationBasis.unknown)  RecommendationBasis basis, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit)  $default,) {final _that = this;
switch (_that) {
case _SizeRecommendation():
return $default(_that.size,_that.basis,_that.fit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: Size.unknown)  Size size, @JsonKey(unknownEnumValue: RecommendationBasis.unknown)  RecommendationBasis basis, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit)?  $default,) {final _that = this;
switch (_that) {
case _SizeRecommendation() when $default != null:
return $default(_that.size,_that.basis,_that.fit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SizeRecommendation implements SizeRecommendation {
  const _SizeRecommendation({@JsonKey(unknownEnumValue: Size.unknown) required this.size, @JsonKey(unknownEnumValue: RecommendationBasis.unknown) this.basis = RecommendationBasis.unknown, @JsonKey(unknownEnumValue: Fit.unknown) this.fit = Fit.unknown});
  factory _SizeRecommendation.fromJson(Map<String, dynamic> json) => _$SizeRecommendationFromJson(json);

@override@JsonKey(unknownEnumValue: Size.unknown) final  Size size;
@override@JsonKey(unknownEnumValue: RecommendationBasis.unknown) final  RecommendationBasis basis;
@override@JsonKey(unknownEnumValue: Fit.unknown) final  Fit fit;

/// Create a copy of SizeRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeRecommendationCopyWith<_SizeRecommendation> get copyWith => __$SizeRecommendationCopyWithImpl<_SizeRecommendation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizeRecommendationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeRecommendation&&(identical(other.size, size) || other.size == size)&&(identical(other.basis, basis) || other.basis == basis)&&(identical(other.fit, fit) || other.fit == fit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,basis,fit);

@override
String toString() {
  return 'SizeRecommendation(size: $size, basis: $basis, fit: $fit)';
}


}

/// @nodoc
abstract mixin class _$SizeRecommendationCopyWith<$Res> implements $SizeRecommendationCopyWith<$Res> {
  factory _$SizeRecommendationCopyWith(_SizeRecommendation value, $Res Function(_SizeRecommendation) _then) = __$SizeRecommendationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: Size.unknown) Size size,@JsonKey(unknownEnumValue: RecommendationBasis.unknown) RecommendationBasis basis,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit
});




}
/// @nodoc
class __$SizeRecommendationCopyWithImpl<$Res>
    implements _$SizeRecommendationCopyWith<$Res> {
  __$SizeRecommendationCopyWithImpl(this._self, this._then);

  final _SizeRecommendation _self;
  final $Res Function(_SizeRecommendation) _then;

/// Create a copy of SizeRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? basis = null,Object? fit = null,}) {
  return _then(_SizeRecommendation(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size,basis: null == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as RecommendationBasis,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,
  ));
}


}


/// @nodoc
mixin _$DeliveryPromise {

 int get orderWithinMinutes; DateTime get deliveryDate; String get zoneCode;
/// Create a copy of DeliveryPromise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryPromiseCopyWith<DeliveryPromise> get copyWith => _$DeliveryPromiseCopyWithImpl<DeliveryPromise>(this as DeliveryPromise, _$identity);

  /// Serializes this DeliveryPromise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryPromise&&(identical(other.orderWithinMinutes, orderWithinMinutes) || other.orderWithinMinutes == orderWithinMinutes)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderWithinMinutes,deliveryDate,zoneCode);

@override
String toString() {
  return 'DeliveryPromise(orderWithinMinutes: $orderWithinMinutes, deliveryDate: $deliveryDate, zoneCode: $zoneCode)';
}


}

/// @nodoc
abstract mixin class $DeliveryPromiseCopyWith<$Res>  {
  factory $DeliveryPromiseCopyWith(DeliveryPromise value, $Res Function(DeliveryPromise) _then) = _$DeliveryPromiseCopyWithImpl;
@useResult
$Res call({
 int orderWithinMinutes, DateTime deliveryDate, String zoneCode
});




}
/// @nodoc
class _$DeliveryPromiseCopyWithImpl<$Res>
    implements $DeliveryPromiseCopyWith<$Res> {
  _$DeliveryPromiseCopyWithImpl(this._self, this._then);

  final DeliveryPromise _self;
  final $Res Function(DeliveryPromise) _then;

/// Create a copy of DeliveryPromise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderWithinMinutes = null,Object? deliveryDate = null,Object? zoneCode = null,}) {
  return _then(_self.copyWith(
orderWithinMinutes: null == orderWithinMinutes ? _self.orderWithinMinutes : orderWithinMinutes // ignore: cast_nullable_to_non_nullable
as int,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryPromise].
extension DeliveryPromisePatterns on DeliveryPromise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryPromise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryPromise() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryPromise value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryPromise():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryPromise value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryPromise() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderWithinMinutes,  DateTime deliveryDate,  String zoneCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryPromise() when $default != null:
return $default(_that.orderWithinMinutes,_that.deliveryDate,_that.zoneCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderWithinMinutes,  DateTime deliveryDate,  String zoneCode)  $default,) {final _that = this;
switch (_that) {
case _DeliveryPromise():
return $default(_that.orderWithinMinutes,_that.deliveryDate,_that.zoneCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderWithinMinutes,  DateTime deliveryDate,  String zoneCode)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryPromise() when $default != null:
return $default(_that.orderWithinMinutes,_that.deliveryDate,_that.zoneCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryPromise implements DeliveryPromise {
  const _DeliveryPromise({required this.orderWithinMinutes, required this.deliveryDate, this.zoneCode = ''});
  factory _DeliveryPromise.fromJson(Map<String, dynamic> json) => _$DeliveryPromiseFromJson(json);

@override final  int orderWithinMinutes;
@override final  DateTime deliveryDate;
@override@JsonKey() final  String zoneCode;

/// Create a copy of DeliveryPromise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryPromiseCopyWith<_DeliveryPromise> get copyWith => __$DeliveryPromiseCopyWithImpl<_DeliveryPromise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryPromiseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryPromise&&(identical(other.orderWithinMinutes, orderWithinMinutes) || other.orderWithinMinutes == orderWithinMinutes)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderWithinMinutes,deliveryDate,zoneCode);

@override
String toString() {
  return 'DeliveryPromise(orderWithinMinutes: $orderWithinMinutes, deliveryDate: $deliveryDate, zoneCode: $zoneCode)';
}


}

/// @nodoc
abstract mixin class _$DeliveryPromiseCopyWith<$Res> implements $DeliveryPromiseCopyWith<$Res> {
  factory _$DeliveryPromiseCopyWith(_DeliveryPromise value, $Res Function(_DeliveryPromise) _then) = __$DeliveryPromiseCopyWithImpl;
@override @useResult
$Res call({
 int orderWithinMinutes, DateTime deliveryDate, String zoneCode
});




}
/// @nodoc
class __$DeliveryPromiseCopyWithImpl<$Res>
    implements _$DeliveryPromiseCopyWith<$Res> {
  __$DeliveryPromiseCopyWithImpl(this._self, this._then);

  final _DeliveryPromise _self;
  final $Res Function(_DeliveryPromise) _then;

/// Create a copy of DeliveryPromise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderWithinMinutes = null,Object? deliveryDate = null,Object? zoneCode = null,}) {
  return _then(_DeliveryPromise(
orderWithinMinutes: null == orderWithinMinutes ? _self.orderWithinMinutes : orderWithinMinutes // ignore: cast_nullable_to_non_nullable
as int,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductModel3D {

 String get modelUrl; double get heightCm; bool get tintable;
/// Create a copy of ProductModel3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModel3DCopyWith<ProductModel3D> get copyWith => _$ProductModel3DCopyWithImpl<ProductModel3D>(this as ProductModel3D, _$identity);

  /// Serializes this ProductModel3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel3D&&(identical(other.modelUrl, modelUrl) || other.modelUrl == modelUrl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.tintable, tintable) || other.tintable == tintable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelUrl,heightCm,tintable);

@override
String toString() {
  return 'ProductModel3D(modelUrl: $modelUrl, heightCm: $heightCm, tintable: $tintable)';
}


}

/// @nodoc
abstract mixin class $ProductModel3DCopyWith<$Res>  {
  factory $ProductModel3DCopyWith(ProductModel3D value, $Res Function(ProductModel3D) _then) = _$ProductModel3DCopyWithImpl;
@useResult
$Res call({
 String modelUrl, double heightCm, bool tintable
});




}
/// @nodoc
class _$ProductModel3DCopyWithImpl<$Res>
    implements $ProductModel3DCopyWith<$Res> {
  _$ProductModel3DCopyWithImpl(this._self, this._then);

  final ProductModel3D _self;
  final $Res Function(ProductModel3D) _then;

/// Create a copy of ProductModel3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelUrl = null,Object? heightCm = null,Object? tintable = null,}) {
  return _then(_self.copyWith(
modelUrl: null == modelUrl ? _self.modelUrl : modelUrl // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,tintable: null == tintable ? _self.tintable : tintable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel3D].
extension ProductModel3DPatterns on ProductModel3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel3D() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel3D value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel3D():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel3D value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel3D() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String modelUrl,  double heightCm,  bool tintable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel3D() when $default != null:
return $default(_that.modelUrl,_that.heightCm,_that.tintable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String modelUrl,  double heightCm,  bool tintable)  $default,) {final _that = this;
switch (_that) {
case _ProductModel3D():
return $default(_that.modelUrl,_that.heightCm,_that.tintable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String modelUrl,  double heightCm,  bool tintable)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel3D() when $default != null:
return $default(_that.modelUrl,_that.heightCm,_that.tintable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel3D implements ProductModel3D {
  const _ProductModel3D({required this.modelUrl, required this.heightCm, this.tintable = false});
  factory _ProductModel3D.fromJson(Map<String, dynamic> json) => _$ProductModel3DFromJson(json);

@override final  String modelUrl;
@override final  double heightCm;
@override@JsonKey() final  bool tintable;

/// Create a copy of ProductModel3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModel3DCopyWith<_ProductModel3D> get copyWith => __$ProductModel3DCopyWithImpl<_ProductModel3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModel3DToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel3D&&(identical(other.modelUrl, modelUrl) || other.modelUrl == modelUrl)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.tintable, tintable) || other.tintable == tintable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelUrl,heightCm,tintable);

@override
String toString() {
  return 'ProductModel3D(modelUrl: $modelUrl, heightCm: $heightCm, tintable: $tintable)';
}


}

/// @nodoc
abstract mixin class _$ProductModel3DCopyWith<$Res> implements $ProductModel3DCopyWith<$Res> {
  factory _$ProductModel3DCopyWith(_ProductModel3D value, $Res Function(_ProductModel3D) _then) = __$ProductModel3DCopyWithImpl;
@override @useResult
$Res call({
 String modelUrl, double heightCm, bool tintable
});




}
/// @nodoc
class __$ProductModel3DCopyWithImpl<$Res>
    implements _$ProductModel3DCopyWith<$Res> {
  __$ProductModel3DCopyWithImpl(this._self, this._then);

  final _ProductModel3D _self;
  final $Res Function(_ProductModel3D) _then;

/// Create a copy of ProductModel3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelUrl = null,Object? heightCm = null,Object? tintable = null,}) {
  return _then(_ProductModel3D(
modelUrl: null == modelUrl ? _self.modelUrl : modelUrl // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,tintable: null == tintable ? _self.tintable : tintable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ProductDetail {

 String get id; String get slug; String get name; String get description; String? get fabricAndCare; String? get sizeAndFit; Category? get category; Collection? get collection;@JsonKey(unknownEnumValue: ProductType.unknown) ProductType get productType;@JsonKey(unknownEnumValue: Fit.unknown) Fit get fit; String? get fabric; double get price; double? get compareAtPrice; int? get discountPercent; List<String> get badges; List<String> get tags; List<ProductColor> get colors; List<SizeChartRow> get sizeChart; double? get rating; int get reviewCount; SizeRecommendation? get recommendedSize; DeliveryPromise? get deliveryPromise; bool get availableInStudio; bool get isWishlisted;@JsonKey(name: 'model3D') ProductModel3D? get model3D;
/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailCopyWith<ProductDetail> get copyWith => _$ProductDetailCopyWithImpl<ProductDetail>(this as ProductDetail, _$identity);

  /// Serializes this ProductDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.fabricAndCare, fabricAndCare) || other.fabricAndCare == fabricAndCare)&&(identical(other.sizeAndFit, sizeAndFit) || other.sizeAndFit == sizeAndFit)&&(identical(other.category, category) || other.category == category)&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.fabric, fabric) || other.fabric == fabric)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAtPrice, compareAtPrice) || other.compareAtPrice == compareAtPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&const DeepCollectionEquality().equals(other.badges, badges)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.colors, colors)&&const DeepCollectionEquality().equals(other.sizeChart, sizeChart)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.recommendedSize, recommendedSize) || other.recommendedSize == recommendedSize)&&(identical(other.deliveryPromise, deliveryPromise) || other.deliveryPromise == deliveryPromise)&&(identical(other.availableInStudio, availableInStudio) || other.availableInStudio == availableInStudio)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.model3D, model3D) || other.model3D == model3D));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,slug,name,description,fabricAndCare,sizeAndFit,category,collection,productType,fit,fabric,price,compareAtPrice,discountPercent,const DeepCollectionEquality().hash(badges),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(colors),const DeepCollectionEquality().hash(sizeChart),rating,reviewCount,recommendedSize,deliveryPromise,availableInStudio,isWishlisted,model3D]);

@override
String toString() {
  return 'ProductDetail(id: $id, slug: $slug, name: $name, description: $description, fabricAndCare: $fabricAndCare, sizeAndFit: $sizeAndFit, category: $category, collection: $collection, productType: $productType, fit: $fit, fabric: $fabric, price: $price, compareAtPrice: $compareAtPrice, discountPercent: $discountPercent, badges: $badges, tags: $tags, colors: $colors, sizeChart: $sizeChart, rating: $rating, reviewCount: $reviewCount, recommendedSize: $recommendedSize, deliveryPromise: $deliveryPromise, availableInStudio: $availableInStudio, isWishlisted: $isWishlisted, model3D: $model3D)';
}


}

/// @nodoc
abstract mixin class $ProductDetailCopyWith<$Res>  {
  factory $ProductDetailCopyWith(ProductDetail value, $Res Function(ProductDetail) _then) = _$ProductDetailCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String description, String? fabricAndCare, String? sizeAndFit, Category? category, Collection? collection,@JsonKey(unknownEnumValue: ProductType.unknown) ProductType productType,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, String? fabric, double price, double? compareAtPrice, int? discountPercent, List<String> badges, List<String> tags, List<ProductColor> colors, List<SizeChartRow> sizeChart, double? rating, int reviewCount, SizeRecommendation? recommendedSize, DeliveryPromise? deliveryPromise, bool availableInStudio, bool isWishlisted,@JsonKey(name: 'model3D') ProductModel3D? model3D
});


$CategoryCopyWith<$Res>? get category;$CollectionCopyWith<$Res>? get collection;$SizeRecommendationCopyWith<$Res>? get recommendedSize;$DeliveryPromiseCopyWith<$Res>? get deliveryPromise;$ProductModel3DCopyWith<$Res>? get model3D;

}
/// @nodoc
class _$ProductDetailCopyWithImpl<$Res>
    implements $ProductDetailCopyWith<$Res> {
  _$ProductDetailCopyWithImpl(this._self, this._then);

  final ProductDetail _self;
  final $Res Function(ProductDetail) _then;

/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? fabricAndCare = freezed,Object? sizeAndFit = freezed,Object? category = freezed,Object? collection = freezed,Object? productType = null,Object? fit = null,Object? fabric = freezed,Object? price = null,Object? compareAtPrice = freezed,Object? discountPercent = freezed,Object? badges = null,Object? tags = null,Object? colors = null,Object? sizeChart = null,Object? rating = freezed,Object? reviewCount = null,Object? recommendedSize = freezed,Object? deliveryPromise = freezed,Object? availableInStudio = null,Object? isWishlisted = null,Object? model3D = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fabricAndCare: freezed == fabricAndCare ? _self.fabricAndCare : fabricAndCare // ignore: cast_nullable_to_non_nullable
as String?,sizeAndFit: freezed == sizeAndFit ? _self.sizeAndFit : sizeAndFit // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,collection: freezed == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as Collection?,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as ProductType,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,fabric: freezed == fabric ? _self.fabric : fabric // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,compareAtPrice: freezed == compareAtPrice ? _self.compareAtPrice : compareAtPrice // ignore: cast_nullable_to_non_nullable
as double?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<ProductColor>,sizeChart: null == sizeChart ? _self.sizeChart : sizeChart // ignore: cast_nullable_to_non_nullable
as List<SizeChartRow>,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,recommendedSize: freezed == recommendedSize ? _self.recommendedSize : recommendedSize // ignore: cast_nullable_to_non_nullable
as SizeRecommendation?,deliveryPromise: freezed == deliveryPromise ? _self.deliveryPromise : deliveryPromise // ignore: cast_nullable_to_non_nullable
as DeliveryPromise?,availableInStudio: null == availableInStudio ? _self.availableInStudio : availableInStudio // ignore: cast_nullable_to_non_nullable
as bool,isWishlisted: null == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool,model3D: freezed == model3D ? _self.model3D : model3D // ignore: cast_nullable_to_non_nullable
as ProductModel3D?,
  ));
}
/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectionCopyWith<$Res>? get collection {
    if (_self.collection == null) {
    return null;
  }

  return $CollectionCopyWith<$Res>(_self.collection!, (value) {
    return _then(_self.copyWith(collection: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SizeRecommendationCopyWith<$Res>? get recommendedSize {
    if (_self.recommendedSize == null) {
    return null;
  }

  return $SizeRecommendationCopyWith<$Res>(_self.recommendedSize!, (value) {
    return _then(_self.copyWith(recommendedSize: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryPromiseCopyWith<$Res>? get deliveryPromise {
    if (_self.deliveryPromise == null) {
    return null;
  }

  return $DeliveryPromiseCopyWith<$Res>(_self.deliveryPromise!, (value) {
    return _then(_self.copyWith(deliveryPromise: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModel3DCopyWith<$Res>? get model3D {
    if (_self.model3D == null) {
    return null;
  }

  return $ProductModel3DCopyWith<$Res>(_self.model3D!, (value) {
    return _then(_self.copyWith(model3D: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetail].
extension ProductDetailPatterns on ProductDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetail value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? fabricAndCare,  String? sizeAndFit,  Category? category,  Collection? collection, @JsonKey(unknownEnumValue: ProductType.unknown)  ProductType productType, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  String? fabric,  double price,  double? compareAtPrice,  int? discountPercent,  List<String> badges,  List<String> tags,  List<ProductColor> colors,  List<SizeChartRow> sizeChart,  double? rating,  int reviewCount,  SizeRecommendation? recommendedSize,  DeliveryPromise? deliveryPromise,  bool availableInStudio,  bool isWishlisted, @JsonKey(name: 'model3D')  ProductModel3D? model3D)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.fabricAndCare,_that.sizeAndFit,_that.category,_that.collection,_that.productType,_that.fit,_that.fabric,_that.price,_that.compareAtPrice,_that.discountPercent,_that.badges,_that.tags,_that.colors,_that.sizeChart,_that.rating,_that.reviewCount,_that.recommendedSize,_that.deliveryPromise,_that.availableInStudio,_that.isWishlisted,_that.model3D);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String description,  String? fabricAndCare,  String? sizeAndFit,  Category? category,  Collection? collection, @JsonKey(unknownEnumValue: ProductType.unknown)  ProductType productType, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  String? fabric,  double price,  double? compareAtPrice,  int? discountPercent,  List<String> badges,  List<String> tags,  List<ProductColor> colors,  List<SizeChartRow> sizeChart,  double? rating,  int reviewCount,  SizeRecommendation? recommendedSize,  DeliveryPromise? deliveryPromise,  bool availableInStudio,  bool isWishlisted, @JsonKey(name: 'model3D')  ProductModel3D? model3D)  $default,) {final _that = this;
switch (_that) {
case _ProductDetail():
return $default(_that.id,_that.slug,_that.name,_that.description,_that.fabricAndCare,_that.sizeAndFit,_that.category,_that.collection,_that.productType,_that.fit,_that.fabric,_that.price,_that.compareAtPrice,_that.discountPercent,_that.badges,_that.tags,_that.colors,_that.sizeChart,_that.rating,_that.reviewCount,_that.recommendedSize,_that.deliveryPromise,_that.availableInStudio,_that.isWishlisted,_that.model3D);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String description,  String? fabricAndCare,  String? sizeAndFit,  Category? category,  Collection? collection, @JsonKey(unknownEnumValue: ProductType.unknown)  ProductType productType, @JsonKey(unknownEnumValue: Fit.unknown)  Fit fit,  String? fabric,  double price,  double? compareAtPrice,  int? discountPercent,  List<String> badges,  List<String> tags,  List<ProductColor> colors,  List<SizeChartRow> sizeChart,  double? rating,  int reviewCount,  SizeRecommendation? recommendedSize,  DeliveryPromise? deliveryPromise,  bool availableInStudio,  bool isWishlisted, @JsonKey(name: 'model3D')  ProductModel3D? model3D)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.description,_that.fabricAndCare,_that.sizeAndFit,_that.category,_that.collection,_that.productType,_that.fit,_that.fabric,_that.price,_that.compareAtPrice,_that.discountPercent,_that.badges,_that.tags,_that.colors,_that.sizeChart,_that.rating,_that.reviewCount,_that.recommendedSize,_that.deliveryPromise,_that.availableInStudio,_that.isWishlisted,_that.model3D);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetail extends ProductDetail {
  const _ProductDetail({required this.id, required this.slug, required this.name, this.description = '', this.fabricAndCare, this.sizeAndFit, this.category, this.collection, @JsonKey(unknownEnumValue: ProductType.unknown) this.productType = ProductType.unknown, @JsonKey(unknownEnumValue: Fit.unknown) this.fit = Fit.unknown, this.fabric, required this.price, this.compareAtPrice, this.discountPercent, final  List<String> badges = const <String>[], final  List<String> tags = const <String>[], final  List<ProductColor> colors = const <ProductColor>[], final  List<SizeChartRow> sizeChart = const <SizeChartRow>[], this.rating, this.reviewCount = 0, this.recommendedSize, this.deliveryPromise, this.availableInStudio = false, this.isWishlisted = false, @JsonKey(name: 'model3D') this.model3D}): _badges = badges,_tags = tags,_colors = colors,_sizeChart = sizeChart,super._();
  factory _ProductDetail.fromJson(Map<String, dynamic> json) => _$ProductDetailFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String? fabricAndCare;
@override final  String? sizeAndFit;
@override final  Category? category;
@override final  Collection? collection;
@override@JsonKey(unknownEnumValue: ProductType.unknown) final  ProductType productType;
@override@JsonKey(unknownEnumValue: Fit.unknown) final  Fit fit;
@override final  String? fabric;
@override final  double price;
@override final  double? compareAtPrice;
@override final  int? discountPercent;
 final  List<String> _badges;
@override@JsonKey() List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<ProductColor> _colors;
@override@JsonKey() List<ProductColor> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

 final  List<SizeChartRow> _sizeChart;
@override@JsonKey() List<SizeChartRow> get sizeChart {
  if (_sizeChart is EqualUnmodifiableListView) return _sizeChart;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeChart);
}

@override final  double? rating;
@override@JsonKey() final  int reviewCount;
@override final  SizeRecommendation? recommendedSize;
@override final  DeliveryPromise? deliveryPromise;
@override@JsonKey() final  bool availableInStudio;
@override@JsonKey() final  bool isWishlisted;
@override@JsonKey(name: 'model3D') final  ProductModel3D? model3D;

/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailCopyWith<_ProductDetail> get copyWith => __$ProductDetailCopyWithImpl<_ProductDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.fabricAndCare, fabricAndCare) || other.fabricAndCare == fabricAndCare)&&(identical(other.sizeAndFit, sizeAndFit) || other.sizeAndFit == sizeAndFit)&&(identical(other.category, category) || other.category == category)&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.fabric, fabric) || other.fabric == fabric)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAtPrice, compareAtPrice) || other.compareAtPrice == compareAtPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&const DeepCollectionEquality().equals(other._badges, _badges)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._colors, _colors)&&const DeepCollectionEquality().equals(other._sizeChart, _sizeChart)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.recommendedSize, recommendedSize) || other.recommendedSize == recommendedSize)&&(identical(other.deliveryPromise, deliveryPromise) || other.deliveryPromise == deliveryPromise)&&(identical(other.availableInStudio, availableInStudio) || other.availableInStudio == availableInStudio)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.model3D, model3D) || other.model3D == model3D));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,slug,name,description,fabricAndCare,sizeAndFit,category,collection,productType,fit,fabric,price,compareAtPrice,discountPercent,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_colors),const DeepCollectionEquality().hash(_sizeChart),rating,reviewCount,recommendedSize,deliveryPromise,availableInStudio,isWishlisted,model3D]);

@override
String toString() {
  return 'ProductDetail(id: $id, slug: $slug, name: $name, description: $description, fabricAndCare: $fabricAndCare, sizeAndFit: $sizeAndFit, category: $category, collection: $collection, productType: $productType, fit: $fit, fabric: $fabric, price: $price, compareAtPrice: $compareAtPrice, discountPercent: $discountPercent, badges: $badges, tags: $tags, colors: $colors, sizeChart: $sizeChart, rating: $rating, reviewCount: $reviewCount, recommendedSize: $recommendedSize, deliveryPromise: $deliveryPromise, availableInStudio: $availableInStudio, isWishlisted: $isWishlisted, model3D: $model3D)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailCopyWith<$Res> implements $ProductDetailCopyWith<$Res> {
  factory _$ProductDetailCopyWith(_ProductDetail value, $Res Function(_ProductDetail) _then) = __$ProductDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String description, String? fabricAndCare, String? sizeAndFit, Category? category, Collection? collection,@JsonKey(unknownEnumValue: ProductType.unknown) ProductType productType,@JsonKey(unknownEnumValue: Fit.unknown) Fit fit, String? fabric, double price, double? compareAtPrice, int? discountPercent, List<String> badges, List<String> tags, List<ProductColor> colors, List<SizeChartRow> sizeChart, double? rating, int reviewCount, SizeRecommendation? recommendedSize, DeliveryPromise? deliveryPromise, bool availableInStudio, bool isWishlisted,@JsonKey(name: 'model3D') ProductModel3D? model3D
});


@override $CategoryCopyWith<$Res>? get category;@override $CollectionCopyWith<$Res>? get collection;@override $SizeRecommendationCopyWith<$Res>? get recommendedSize;@override $DeliveryPromiseCopyWith<$Res>? get deliveryPromise;@override $ProductModel3DCopyWith<$Res>? get model3D;

}
/// @nodoc
class __$ProductDetailCopyWithImpl<$Res>
    implements _$ProductDetailCopyWith<$Res> {
  __$ProductDetailCopyWithImpl(this._self, this._then);

  final _ProductDetail _self;
  final $Res Function(_ProductDetail) _then;

/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? description = null,Object? fabricAndCare = freezed,Object? sizeAndFit = freezed,Object? category = freezed,Object? collection = freezed,Object? productType = null,Object? fit = null,Object? fabric = freezed,Object? price = null,Object? compareAtPrice = freezed,Object? discountPercent = freezed,Object? badges = null,Object? tags = null,Object? colors = null,Object? sizeChart = null,Object? rating = freezed,Object? reviewCount = null,Object? recommendedSize = freezed,Object? deliveryPromise = freezed,Object? availableInStudio = null,Object? isWishlisted = null,Object? model3D = freezed,}) {
  return _then(_ProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fabricAndCare: freezed == fabricAndCare ? _self.fabricAndCare : fabricAndCare // ignore: cast_nullable_to_non_nullable
as String?,sizeAndFit: freezed == sizeAndFit ? _self.sizeAndFit : sizeAndFit // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,collection: freezed == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as Collection?,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as ProductType,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as Fit,fabric: freezed == fabric ? _self.fabric : fabric // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,compareAtPrice: freezed == compareAtPrice ? _self.compareAtPrice : compareAtPrice // ignore: cast_nullable_to_non_nullable
as double?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<ProductColor>,sizeChart: null == sizeChart ? _self._sizeChart : sizeChart // ignore: cast_nullable_to_non_nullable
as List<SizeChartRow>,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,recommendedSize: freezed == recommendedSize ? _self.recommendedSize : recommendedSize // ignore: cast_nullable_to_non_nullable
as SizeRecommendation?,deliveryPromise: freezed == deliveryPromise ? _self.deliveryPromise : deliveryPromise // ignore: cast_nullable_to_non_nullable
as DeliveryPromise?,availableInStudio: null == availableInStudio ? _self.availableInStudio : availableInStudio // ignore: cast_nullable_to_non_nullable
as bool,isWishlisted: null == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool,model3D: freezed == model3D ? _self.model3D : model3D // ignore: cast_nullable_to_non_nullable
as ProductModel3D?,
  ));
}

/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectionCopyWith<$Res>? get collection {
    if (_self.collection == null) {
    return null;
  }

  return $CollectionCopyWith<$Res>(_self.collection!, (value) {
    return _then(_self.copyWith(collection: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SizeRecommendationCopyWith<$Res>? get recommendedSize {
    if (_self.recommendedSize == null) {
    return null;
  }

  return $SizeRecommendationCopyWith<$Res>(_self.recommendedSize!, (value) {
    return _then(_self.copyWith(recommendedSize: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryPromiseCopyWith<$Res>? get deliveryPromise {
    if (_self.deliveryPromise == null) {
    return null;
  }

  return $DeliveryPromiseCopyWith<$Res>(_self.deliveryPromise!, (value) {
    return _then(_self.copyWith(deliveryPromise: value));
  });
}/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModel3DCopyWith<$Res>? get model3D {
    if (_self.model3D == null) {
    return null;
  }

  return $ProductModel3DCopyWith<$Res>(_self.model3D!, (value) {
    return _then(_self.copyWith(model3D: value));
  });
}
}


/// @nodoc
mixin _$Recommendations {

 List<ProductCard> get youMayAlsoLike; List<ProductCard> get completeTheLook;
/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationsCopyWith<Recommendations> get copyWith => _$RecommendationsCopyWithImpl<Recommendations>(this as Recommendations, _$identity);

  /// Serializes this Recommendations to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recommendations&&const DeepCollectionEquality().equals(other.youMayAlsoLike, youMayAlsoLike)&&const DeepCollectionEquality().equals(other.completeTheLook, completeTheLook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(youMayAlsoLike),const DeepCollectionEquality().hash(completeTheLook));

@override
String toString() {
  return 'Recommendations(youMayAlsoLike: $youMayAlsoLike, completeTheLook: $completeTheLook)';
}


}

/// @nodoc
abstract mixin class $RecommendationsCopyWith<$Res>  {
  factory $RecommendationsCopyWith(Recommendations value, $Res Function(Recommendations) _then) = _$RecommendationsCopyWithImpl;
@useResult
$Res call({
 List<ProductCard> youMayAlsoLike, List<ProductCard> completeTheLook
});




}
/// @nodoc
class _$RecommendationsCopyWithImpl<$Res>
    implements $RecommendationsCopyWith<$Res> {
  _$RecommendationsCopyWithImpl(this._self, this._then);

  final Recommendations _self;
  final $Res Function(Recommendations) _then;

/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? youMayAlsoLike = null,Object? completeTheLook = null,}) {
  return _then(_self.copyWith(
youMayAlsoLike: null == youMayAlsoLike ? _self.youMayAlsoLike : youMayAlsoLike // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,completeTheLook: null == completeTheLook ? _self.completeTheLook : completeTheLook // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}

}


/// Adds pattern-matching-related methods to [Recommendations].
extension RecommendationsPatterns on Recommendations {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recommendations value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recommendations value)  $default,){
final _that = this;
switch (_that) {
case _Recommendations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recommendations value)?  $default,){
final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCard> youMayAlsoLike,  List<ProductCard> completeTheLook)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
return $default(_that.youMayAlsoLike,_that.completeTheLook);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCard> youMayAlsoLike,  List<ProductCard> completeTheLook)  $default,) {final _that = this;
switch (_that) {
case _Recommendations():
return $default(_that.youMayAlsoLike,_that.completeTheLook);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCard> youMayAlsoLike,  List<ProductCard> completeTheLook)?  $default,) {final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
return $default(_that.youMayAlsoLike,_that.completeTheLook);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recommendations extends Recommendations {
  const _Recommendations({final  List<ProductCard> youMayAlsoLike = const <ProductCard>[], final  List<ProductCard> completeTheLook = const <ProductCard>[]}): _youMayAlsoLike = youMayAlsoLike,_completeTheLook = completeTheLook,super._();
  factory _Recommendations.fromJson(Map<String, dynamic> json) => _$RecommendationsFromJson(json);

 final  List<ProductCard> _youMayAlsoLike;
@override@JsonKey() List<ProductCard> get youMayAlsoLike {
  if (_youMayAlsoLike is EqualUnmodifiableListView) return _youMayAlsoLike;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_youMayAlsoLike);
}

 final  List<ProductCard> _completeTheLook;
@override@JsonKey() List<ProductCard> get completeTheLook {
  if (_completeTheLook is EqualUnmodifiableListView) return _completeTheLook;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completeTheLook);
}


/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationsCopyWith<_Recommendations> get copyWith => __$RecommendationsCopyWithImpl<_Recommendations>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recommendations&&const DeepCollectionEquality().equals(other._youMayAlsoLike, _youMayAlsoLike)&&const DeepCollectionEquality().equals(other._completeTheLook, _completeTheLook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_youMayAlsoLike),const DeepCollectionEquality().hash(_completeTheLook));

@override
String toString() {
  return 'Recommendations(youMayAlsoLike: $youMayAlsoLike, completeTheLook: $completeTheLook)';
}


}

/// @nodoc
abstract mixin class _$RecommendationsCopyWith<$Res> implements $RecommendationsCopyWith<$Res> {
  factory _$RecommendationsCopyWith(_Recommendations value, $Res Function(_Recommendations) _then) = __$RecommendationsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCard> youMayAlsoLike, List<ProductCard> completeTheLook
});




}
/// @nodoc
class __$RecommendationsCopyWithImpl<$Res>
    implements _$RecommendationsCopyWith<$Res> {
  __$RecommendationsCopyWithImpl(this._self, this._then);

  final _Recommendations _self;
  final $Res Function(_Recommendations) _then;

/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? youMayAlsoLike = null,Object? completeTheLook = null,}) {
  return _then(_Recommendations(
youMayAlsoLike: null == youMayAlsoLike ? _self._youMayAlsoLike : youMayAlsoLike // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,completeTheLook: null == completeTheLook ? _self._completeTheLook : completeTheLook // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}


}


/// @nodoc
mixin _$Review {

 String get id; String get authorName; int get rating; String? get title; String get body; DateTime get createdAt;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorName,rating,title,body,createdAt);

@override
String toString() {
  return 'Review(id: $id, authorName: $authorName, rating: $rating, title: $title, body: $body, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 String id, String authorName, int rating, String? title, String body, DateTime createdAt
});




}
/// @nodoc
class _$ReviewCopyWithImpl<$Res>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorName = null,Object? rating = null,Object? title = freezed,Object? body = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Review].
extension ReviewPatterns on Review {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Review value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Review value)  $default,){
final _that = this;
switch (_that) {
case _Review():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Review value)?  $default,){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorName,  int rating,  String? title,  String body,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.id,_that.authorName,_that.rating,_that.title,_that.body,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorName,  int rating,  String? title,  String body,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Review():
return $default(_that.id,_that.authorName,_that.rating,_that.title,_that.body,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorName,  int rating,  String? title,  String body,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.id,_that.authorName,_that.rating,_that.title,_that.body,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Review implements Review {
  const _Review({required this.id, this.authorName = '', required this.rating, this.title, this.body = '', required this.createdAt});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

@override final  String id;
@override@JsonKey() final  String authorName;
@override final  int rating;
@override final  String? title;
@override@JsonKey() final  String body;
@override final  DateTime createdAt;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorName,rating,title,body,createdAt);

@override
String toString() {
  return 'Review(id: $id, authorName: $authorName, rating: $rating, title: $title, body: $body, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorName, int rating, String? title, String body, DateTime createdAt
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorName = null,Object? rating = null,Object? title = freezed,Object? body = null,Object? createdAt = null,}) {
  return _then(_Review(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
