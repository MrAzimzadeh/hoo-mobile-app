// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColorInfo {

 String get id; String get code; String get name; String get hex;@JsonKey(unknownEnumValue: ColorFamily.unknown) ColorFamily get family;
/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<ColorInfo> get copyWith => _$ColorInfoCopyWithImpl<ColorInfo>(this as ColorInfo, _$identity);

  /// Serializes this ColorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.family, family) || other.family == family));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,hex,family);

@override
String toString() {
  return 'ColorInfo(id: $id, code: $code, name: $name, hex: $hex, family: $family)';
}


}

/// @nodoc
abstract mixin class $ColorInfoCopyWith<$Res>  {
  factory $ColorInfoCopyWith(ColorInfo value, $Res Function(ColorInfo) _then) = _$ColorInfoCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String hex,@JsonKey(unknownEnumValue: ColorFamily.unknown) ColorFamily family
});




}
/// @nodoc
class _$ColorInfoCopyWithImpl<$Res>
    implements $ColorInfoCopyWith<$Res> {
  _$ColorInfoCopyWithImpl(this._self, this._then);

  final ColorInfo _self;
  final $Res Function(ColorInfo) _then;

/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? hex = null,Object? family = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as ColorFamily,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorInfo].
extension ColorInfoPatterns on ColorInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorInfo value)  $default,){
final _that = this;
switch (_that) {
case _ColorInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ColorInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String hex, @JsonKey(unknownEnumValue: ColorFamily.unknown)  ColorFamily family)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorInfo() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.hex,_that.family);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String hex, @JsonKey(unknownEnumValue: ColorFamily.unknown)  ColorFamily family)  $default,) {final _that = this;
switch (_that) {
case _ColorInfo():
return $default(_that.id,_that.code,_that.name,_that.hex,_that.family);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String hex, @JsonKey(unknownEnumValue: ColorFamily.unknown)  ColorFamily family)?  $default,) {final _that = this;
switch (_that) {
case _ColorInfo() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.hex,_that.family);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorInfo implements ColorInfo {
  const _ColorInfo({required this.id, required this.code, required this.name, required this.hex, @JsonKey(unknownEnumValue: ColorFamily.unknown) this.family = ColorFamily.unknown});
  factory _ColorInfo.fromJson(Map<String, dynamic> json) => _$ColorInfoFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  String hex;
@override@JsonKey(unknownEnumValue: ColorFamily.unknown) final  ColorFamily family;

/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorInfoCopyWith<_ColorInfo> get copyWith => __$ColorInfoCopyWithImpl<_ColorInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.family, family) || other.family == family));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,hex,family);

@override
String toString() {
  return 'ColorInfo(id: $id, code: $code, name: $name, hex: $hex, family: $family)';
}


}

/// @nodoc
abstract mixin class _$ColorInfoCopyWith<$Res> implements $ColorInfoCopyWith<$Res> {
  factory _$ColorInfoCopyWith(_ColorInfo value, $Res Function(_ColorInfo) _then) = __$ColorInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String hex,@JsonKey(unknownEnumValue: ColorFamily.unknown) ColorFamily family
});




}
/// @nodoc
class __$ColorInfoCopyWithImpl<$Res>
    implements _$ColorInfoCopyWith<$Res> {
  __$ColorInfoCopyWithImpl(this._self, this._then);

  final _ColorInfo _self;
  final $Res Function(_ColorInfo) _then;

/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? hex = null,Object? family = null,}) {
  return _then(_ColorInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as ColorFamily,
  ));
}


}


/// @nodoc
mixin _$ProductCard {

 String get id; String get slug; String get name; double get price; double? get compareAtPrice; int? get discountPercent; List<String> get badges; int get colorsCount; ColorInfo? get defaultColor; List<String> get colorHexes; String? get imageUrl; double? get rating; int get reviewCount; bool get inStock;
/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCardCopyWith<ProductCard> get copyWith => _$ProductCardCopyWithImpl<ProductCard>(this as ProductCard, _$identity);

  /// Serializes this ProductCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAtPrice, compareAtPrice) || other.compareAtPrice == compareAtPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&const DeepCollectionEquality().equals(other.badges, badges)&&(identical(other.colorsCount, colorsCount) || other.colorsCount == colorsCount)&&(identical(other.defaultColor, defaultColor) || other.defaultColor == defaultColor)&&const DeepCollectionEquality().equals(other.colorHexes, colorHexes)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.inStock, inStock) || other.inStock == inStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,price,compareAtPrice,discountPercent,const DeepCollectionEquality().hash(badges),colorsCount,defaultColor,const DeepCollectionEquality().hash(colorHexes),imageUrl,rating,reviewCount,inStock);

@override
String toString() {
  return 'ProductCard(id: $id, slug: $slug, name: $name, price: $price, compareAtPrice: $compareAtPrice, discountPercent: $discountPercent, badges: $badges, colorsCount: $colorsCount, defaultColor: $defaultColor, colorHexes: $colorHexes, imageUrl: $imageUrl, rating: $rating, reviewCount: $reviewCount, inStock: $inStock)';
}


}

/// @nodoc
abstract mixin class $ProductCardCopyWith<$Res>  {
  factory $ProductCardCopyWith(ProductCard value, $Res Function(ProductCard) _then) = _$ProductCardCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, double price, double? compareAtPrice, int? discountPercent, List<String> badges, int colorsCount, ColorInfo? defaultColor, List<String> colorHexes, String? imageUrl, double? rating, int reviewCount, bool inStock
});


$ColorInfoCopyWith<$Res>? get defaultColor;

}
/// @nodoc
class _$ProductCardCopyWithImpl<$Res>
    implements $ProductCardCopyWith<$Res> {
  _$ProductCardCopyWithImpl(this._self, this._then);

  final ProductCard _self;
  final $Res Function(ProductCard) _then;

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? price = null,Object? compareAtPrice = freezed,Object? discountPercent = freezed,Object? badges = null,Object? colorsCount = null,Object? defaultColor = freezed,Object? colorHexes = null,Object? imageUrl = freezed,Object? rating = freezed,Object? reviewCount = null,Object? inStock = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,compareAtPrice: freezed == compareAtPrice ? _self.compareAtPrice : compareAtPrice // ignore: cast_nullable_to_non_nullable
as double?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,colorsCount: null == colorsCount ? _self.colorsCount : colorsCount // ignore: cast_nullable_to_non_nullable
as int,defaultColor: freezed == defaultColor ? _self.defaultColor : defaultColor // ignore: cast_nullable_to_non_nullable
as ColorInfo?,colorHexes: null == colorHexes ? _self.colorHexes : colorHexes // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res>? get defaultColor {
    if (_self.defaultColor == null) {
    return null;
  }

  return $ColorInfoCopyWith<$Res>(_self.defaultColor!, (value) {
    return _then(_self.copyWith(defaultColor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductCard].
extension ProductCardPatterns on ProductCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCard value)  $default,){
final _that = this;
switch (_that) {
case _ProductCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCard value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  double price,  double? compareAtPrice,  int? discountPercent,  List<String> badges,  int colorsCount,  ColorInfo? defaultColor,  List<String> colorHexes,  String? imageUrl,  double? rating,  int reviewCount,  bool inStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.price,_that.compareAtPrice,_that.discountPercent,_that.badges,_that.colorsCount,_that.defaultColor,_that.colorHexes,_that.imageUrl,_that.rating,_that.reviewCount,_that.inStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  double price,  double? compareAtPrice,  int? discountPercent,  List<String> badges,  int colorsCount,  ColorInfo? defaultColor,  List<String> colorHexes,  String? imageUrl,  double? rating,  int reviewCount,  bool inStock)  $default,) {final _that = this;
switch (_that) {
case _ProductCard():
return $default(_that.id,_that.slug,_that.name,_that.price,_that.compareAtPrice,_that.discountPercent,_that.badges,_that.colorsCount,_that.defaultColor,_that.colorHexes,_that.imageUrl,_that.rating,_that.reviewCount,_that.inStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  double price,  double? compareAtPrice,  int? discountPercent,  List<String> badges,  int colorsCount,  ColorInfo? defaultColor,  List<String> colorHexes,  String? imageUrl,  double? rating,  int reviewCount,  bool inStock)?  $default,) {final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.price,_that.compareAtPrice,_that.discountPercent,_that.badges,_that.colorsCount,_that.defaultColor,_that.colorHexes,_that.imageUrl,_that.rating,_that.reviewCount,_that.inStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductCard extends ProductCard {
  const _ProductCard({required this.id, required this.slug, required this.name, required this.price, this.compareAtPrice, this.discountPercent, final  List<String> badges = const <String>[], this.colorsCount = 0, this.defaultColor, final  List<String> colorHexes = const <String>[], this.imageUrl, this.rating, this.reviewCount = 0, this.inStock = true}): _badges = badges,_colorHexes = colorHexes,super._();
  factory _ProductCard.fromJson(Map<String, dynamic> json) => _$ProductCardFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  double price;
@override final  double? compareAtPrice;
@override final  int? discountPercent;
 final  List<String> _badges;
@override@JsonKey() List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

@override@JsonKey() final  int colorsCount;
@override final  ColorInfo? defaultColor;
 final  List<String> _colorHexes;
@override@JsonKey() List<String> get colorHexes {
  if (_colorHexes is EqualUnmodifiableListView) return _colorHexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorHexes);
}

@override final  String? imageUrl;
@override final  double? rating;
@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  bool inStock;

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCardCopyWith<_ProductCard> get copyWith => __$ProductCardCopyWithImpl<_ProductCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAtPrice, compareAtPrice) || other.compareAtPrice == compareAtPrice)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&const DeepCollectionEquality().equals(other._badges, _badges)&&(identical(other.colorsCount, colorsCount) || other.colorsCount == colorsCount)&&(identical(other.defaultColor, defaultColor) || other.defaultColor == defaultColor)&&const DeepCollectionEquality().equals(other._colorHexes, _colorHexes)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.inStock, inStock) || other.inStock == inStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,price,compareAtPrice,discountPercent,const DeepCollectionEquality().hash(_badges),colorsCount,defaultColor,const DeepCollectionEquality().hash(_colorHexes),imageUrl,rating,reviewCount,inStock);

@override
String toString() {
  return 'ProductCard(id: $id, slug: $slug, name: $name, price: $price, compareAtPrice: $compareAtPrice, discountPercent: $discountPercent, badges: $badges, colorsCount: $colorsCount, defaultColor: $defaultColor, colorHexes: $colorHexes, imageUrl: $imageUrl, rating: $rating, reviewCount: $reviewCount, inStock: $inStock)';
}


}

/// @nodoc
abstract mixin class _$ProductCardCopyWith<$Res> implements $ProductCardCopyWith<$Res> {
  factory _$ProductCardCopyWith(_ProductCard value, $Res Function(_ProductCard) _then) = __$ProductCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, double price, double? compareAtPrice, int? discountPercent, List<String> badges, int colorsCount, ColorInfo? defaultColor, List<String> colorHexes, String? imageUrl, double? rating, int reviewCount, bool inStock
});


@override $ColorInfoCopyWith<$Res>? get defaultColor;

}
/// @nodoc
class __$ProductCardCopyWithImpl<$Res>
    implements _$ProductCardCopyWith<$Res> {
  __$ProductCardCopyWithImpl(this._self, this._then);

  final _ProductCard _self;
  final $Res Function(_ProductCard) _then;

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? price = null,Object? compareAtPrice = freezed,Object? discountPercent = freezed,Object? badges = null,Object? colorsCount = null,Object? defaultColor = freezed,Object? colorHexes = null,Object? imageUrl = freezed,Object? rating = freezed,Object? reviewCount = null,Object? inStock = null,}) {
  return _then(_ProductCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,compareAtPrice: freezed == compareAtPrice ? _self.compareAtPrice : compareAtPrice // ignore: cast_nullable_to_non_nullable
as double?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,colorsCount: null == colorsCount ? _self.colorsCount : colorsCount // ignore: cast_nullable_to_non_nullable
as int,defaultColor: freezed == defaultColor ? _self.defaultColor : defaultColor // ignore: cast_nullable_to_non_nullable
as ColorInfo?,colorHexes: null == colorHexes ? _self._colorHexes : colorHexes // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res>? get defaultColor {
    if (_self.defaultColor == null) {
    return null;
  }

  return $ColorInfoCopyWith<$Res>(_self.defaultColor!, (value) {
    return _then(_self.copyWith(defaultColor: value));
  });
}
}


/// @nodoc
mixin _$Paged<T> {

 List<T> get items; int get page; int get pageSize; int get totalCount; int? get totalPages; bool? get hasMore;
/// Create a copy of Paged
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedCopyWith<T, Paged<T>> get copyWith => _$PagedCopyWithImpl<T, Paged<T>>(this as Paged<T>, _$identity);

  /// Serializes this Paged to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paged<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,pageSize,totalCount,totalPages,hasMore);

@override
String toString() {
  return 'Paged<$T>(items: $items, page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PagedCopyWith<T,$Res>  {
  factory $PagedCopyWith(Paged<T> value, $Res Function(Paged<T>) _then) = _$PagedCopyWithImpl;
@useResult
$Res call({
 List<T> items, int page, int pageSize, int totalCount, int? totalPages, bool? hasMore
});




}
/// @nodoc
class _$PagedCopyWithImpl<T,$Res>
    implements $PagedCopyWith<T, $Res> {
  _$PagedCopyWithImpl(this._self, this._then);

  final Paged<T> _self;
  final $Res Function(Paged<T>) _then;

/// Create a copy of Paged
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = freezed,Object? hasMore = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,hasMore: freezed == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Paged].
extension PagedPatterns<T> on Paged<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Paged<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Paged() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Paged<T> value)  $default,){
final _that = this;
switch (_that) {
case _Paged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Paged<T> value)?  $default,){
final _that = this;
switch (_that) {
case _Paged() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  int page,  int pageSize,  int totalCount,  int? totalPages,  bool? hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Paged() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.totalPages,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  int page,  int pageSize,  int totalCount,  int? totalPages,  bool? hasMore)  $default,) {final _that = this;
switch (_that) {
case _Paged():
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.totalPages,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  int page,  int pageSize,  int totalCount,  int? totalPages,  bool? hasMore)?  $default,) {final _that = this;
switch (_that) {
case _Paged() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.totalPages,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Paged<T> extends Paged<T> {
  const _Paged({final  List<T> items = const [], this.page = 1, this.pageSize = 20, this.totalCount = 0, this.totalPages, this.hasMore}): _items = items,super._();
  factory _Paged.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PagedFromJson(json,fromJsonT);

 final  List<T> _items;
@override@JsonKey() List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int totalCount;
@override final  int? totalPages;
@override final  bool? hasMore;

/// Create a copy of Paged
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedCopyWith<T, _Paged<T>> get copyWith => __$PagedCopyWithImpl<T, _Paged<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PagedToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paged<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,pageSize,totalCount,totalPages,hasMore);

@override
String toString() {
  return 'Paged<$T>(items: $items, page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PagedCopyWith<T,$Res> implements $PagedCopyWith<T, $Res> {
  factory _$PagedCopyWith(_Paged<T> value, $Res Function(_Paged<T>) _then) = __$PagedCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int page, int pageSize, int totalCount, int? totalPages, bool? hasMore
});




}
/// @nodoc
class __$PagedCopyWithImpl<T,$Res>
    implements _$PagedCopyWith<T, $Res> {
  __$PagedCopyWithImpl(this._self, this._then);

  final _Paged<T> _self;
  final $Res Function(_Paged<T>) _then;

/// Create a copy of Paged
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = freezed,Object? hasMore = freezed,}) {
  return _then(_Paged<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,hasMore: freezed == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Me {

 String get id; String get fullName; String? get email; String? get phone; bool get emailVerified; bool get phoneVerified; AppLanguage get language; bool get marketingConsent; bool get hasPassword; bool get hasStyleProfile; List<String> get roles; List<String> get permissions;
/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeCopyWith<Me> get copyWith => _$MeCopyWithImpl<Me>(this as Me, _$identity);

  /// Serializes this Me to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Me&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.language, language) || other.language == language)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.hasStyleProfile, hasStyleProfile) || other.hasStyleProfile == hasStyleProfile)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phone,emailVerified,phoneVerified,language,marketingConsent,hasPassword,hasStyleProfile,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'Me(id: $id, fullName: $fullName, email: $email, phone: $phone, emailVerified: $emailVerified, phoneVerified: $phoneVerified, language: $language, marketingConsent: $marketingConsent, hasPassword: $hasPassword, hasStyleProfile: $hasStyleProfile, roles: $roles, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $MeCopyWith<$Res>  {
  factory $MeCopyWith(Me value, $Res Function(Me) _then) = _$MeCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String? email, String? phone, bool emailVerified, bool phoneVerified, AppLanguage language, bool marketingConsent, bool hasPassword, bool hasStyleProfile, List<String> roles, List<String> permissions
});




}
/// @nodoc
class _$MeCopyWithImpl<$Res>
    implements $MeCopyWith<$Res> {
  _$MeCopyWithImpl(this._self, this._then);

  final Me _self;
  final $Res Function(Me) _then;

/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = freezed,Object? phone = freezed,Object? emailVerified = null,Object? phoneVerified = null,Object? language = null,Object? marketingConsent = null,Object? hasPassword = null,Object? hasStyleProfile = null,Object? roles = null,Object? permissions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,hasStyleProfile: null == hasStyleProfile ? _self.hasStyleProfile : hasStyleProfile // ignore: cast_nullable_to_non_nullable
as bool,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Me].
extension MePatterns on Me {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Me value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Me() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Me value)  $default,){
final _that = this;
switch (_that) {
case _Me():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Me value)?  $default,){
final _that = this;
switch (_that) {
case _Me() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String? email,  String? phone,  bool emailVerified,  bool phoneVerified,  AppLanguage language,  bool marketingConsent,  bool hasPassword,  bool hasStyleProfile,  List<String> roles,  List<String> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Me() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.emailVerified,_that.phoneVerified,_that.language,_that.marketingConsent,_that.hasPassword,_that.hasStyleProfile,_that.roles,_that.permissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String? email,  String? phone,  bool emailVerified,  bool phoneVerified,  AppLanguage language,  bool marketingConsent,  bool hasPassword,  bool hasStyleProfile,  List<String> roles,  List<String> permissions)  $default,) {final _that = this;
switch (_that) {
case _Me():
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.emailVerified,_that.phoneVerified,_that.language,_that.marketingConsent,_that.hasPassword,_that.hasStyleProfile,_that.roles,_that.permissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String? email,  String? phone,  bool emailVerified,  bool phoneVerified,  AppLanguage language,  bool marketingConsent,  bool hasPassword,  bool hasStyleProfile,  List<String> roles,  List<String> permissions)?  $default,) {final _that = this;
switch (_that) {
case _Me() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.emailVerified,_that.phoneVerified,_that.language,_that.marketingConsent,_that.hasPassword,_that.hasStyleProfile,_that.roles,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Me extends Me {
  const _Me({required this.id, required this.fullName, this.email, this.phone, this.emailVerified = false, this.phoneVerified = false, this.language = AppLanguage.az, this.marketingConsent = false, this.hasPassword = false, this.hasStyleProfile = false, final  List<String> roles = const <String>[], final  List<String> permissions = const <String>[]}): _roles = roles,_permissions = permissions,super._();
  factory _Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  String? email;
@override final  String? phone;
@override@JsonKey() final  bool emailVerified;
@override@JsonKey() final  bool phoneVerified;
@override@JsonKey() final  AppLanguage language;
@override@JsonKey() final  bool marketingConsent;
@override@JsonKey() final  bool hasPassword;
@override@JsonKey() final  bool hasStyleProfile;
 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  List<String> _permissions;
@override@JsonKey() List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}


/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeCopyWith<_Me> get copyWith => __$MeCopyWithImpl<_Me>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Me&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.language, language) || other.language == language)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.hasStyleProfile, hasStyleProfile) || other.hasStyleProfile == hasStyleProfile)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phone,emailVerified,phoneVerified,language,marketingConsent,hasPassword,hasStyleProfile,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'Me(id: $id, fullName: $fullName, email: $email, phone: $phone, emailVerified: $emailVerified, phoneVerified: $phoneVerified, language: $language, marketingConsent: $marketingConsent, hasPassword: $hasPassword, hasStyleProfile: $hasStyleProfile, roles: $roles, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$MeCopyWith<$Res> implements $MeCopyWith<$Res> {
  factory _$MeCopyWith(_Me value, $Res Function(_Me) _then) = __$MeCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String? email, String? phone, bool emailVerified, bool phoneVerified, AppLanguage language, bool marketingConsent, bool hasPassword, bool hasStyleProfile, List<String> roles, List<String> permissions
});




}
/// @nodoc
class __$MeCopyWithImpl<$Res>
    implements _$MeCopyWith<$Res> {
  __$MeCopyWithImpl(this._self, this._then);

  final _Me _self;
  final $Res Function(_Me) _then;

/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = freezed,Object? phone = freezed,Object? emailVerified = null,Object? phoneVerified = null,Object? language = null,Object? marketingConsent = null,Object? hasPassword = null,Object? hasStyleProfile = null,Object? roles = null,Object? permissions = null,}) {
  return _then(_Me(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,hasStyleProfile: null == hasStyleProfile ? _self.hasStyleProfile : hasStyleProfile // ignore: cast_nullable_to_non_nullable
as bool,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$StoreContacts {

 String get phone; String? get whatsApp; String? get email; String? get instagram; String? get tikTok; String? get telegram;
/// Create a copy of StoreContacts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreContactsCopyWith<StoreContacts> get copyWith => _$StoreContactsCopyWithImpl<StoreContacts>(this as StoreContacts, _$identity);

  /// Serializes this StoreContacts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreContacts&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.whatsApp, whatsApp) || other.whatsApp == whatsApp)&&(identical(other.email, email) || other.email == email)&&(identical(other.instagram, instagram) || other.instagram == instagram)&&(identical(other.tikTok, tikTok) || other.tikTok == tikTok)&&(identical(other.telegram, telegram) || other.telegram == telegram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,whatsApp,email,instagram,tikTok,telegram);

@override
String toString() {
  return 'StoreContacts(phone: $phone, whatsApp: $whatsApp, email: $email, instagram: $instagram, tikTok: $tikTok, telegram: $telegram)';
}


}

/// @nodoc
abstract mixin class $StoreContactsCopyWith<$Res>  {
  factory $StoreContactsCopyWith(StoreContacts value, $Res Function(StoreContacts) _then) = _$StoreContactsCopyWithImpl;
@useResult
$Res call({
 String phone, String? whatsApp, String? email, String? instagram, String? tikTok, String? telegram
});




}
/// @nodoc
class _$StoreContactsCopyWithImpl<$Res>
    implements $StoreContactsCopyWith<$Res> {
  _$StoreContactsCopyWithImpl(this._self, this._then);

  final StoreContacts _self;
  final $Res Function(StoreContacts) _then;

/// Create a copy of StoreContacts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? whatsApp = freezed,Object? email = freezed,Object? instagram = freezed,Object? tikTok = freezed,Object? telegram = freezed,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,whatsApp: freezed == whatsApp ? _self.whatsApp : whatsApp // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,instagram: freezed == instagram ? _self.instagram : instagram // ignore: cast_nullable_to_non_nullable
as String?,tikTok: freezed == tikTok ? _self.tikTok : tikTok // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreContacts].
extension StoreContactsPatterns on StoreContacts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreContacts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreContacts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreContacts value)  $default,){
final _that = this;
switch (_that) {
case _StoreContacts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreContacts value)?  $default,){
final _that = this;
switch (_that) {
case _StoreContacts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String? whatsApp,  String? email,  String? instagram,  String? tikTok,  String? telegram)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreContacts() when $default != null:
return $default(_that.phone,_that.whatsApp,_that.email,_that.instagram,_that.tikTok,_that.telegram);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String? whatsApp,  String? email,  String? instagram,  String? tikTok,  String? telegram)  $default,) {final _that = this;
switch (_that) {
case _StoreContacts():
return $default(_that.phone,_that.whatsApp,_that.email,_that.instagram,_that.tikTok,_that.telegram);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String? whatsApp,  String? email,  String? instagram,  String? tikTok,  String? telegram)?  $default,) {final _that = this;
switch (_that) {
case _StoreContacts() when $default != null:
return $default(_that.phone,_that.whatsApp,_that.email,_that.instagram,_that.tikTok,_that.telegram);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreContacts implements StoreContacts {
  const _StoreContacts({this.phone = '', this.whatsApp, this.email, this.instagram, this.tikTok, this.telegram});
  factory _StoreContacts.fromJson(Map<String, dynamic> json) => _$StoreContactsFromJson(json);

@override@JsonKey() final  String phone;
@override final  String? whatsApp;
@override final  String? email;
@override final  String? instagram;
@override final  String? tikTok;
@override final  String? telegram;

/// Create a copy of StoreContacts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreContactsCopyWith<_StoreContacts> get copyWith => __$StoreContactsCopyWithImpl<_StoreContacts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreContactsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreContacts&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.whatsApp, whatsApp) || other.whatsApp == whatsApp)&&(identical(other.email, email) || other.email == email)&&(identical(other.instagram, instagram) || other.instagram == instagram)&&(identical(other.tikTok, tikTok) || other.tikTok == tikTok)&&(identical(other.telegram, telegram) || other.telegram == telegram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,whatsApp,email,instagram,tikTok,telegram);

@override
String toString() {
  return 'StoreContacts(phone: $phone, whatsApp: $whatsApp, email: $email, instagram: $instagram, tikTok: $tikTok, telegram: $telegram)';
}


}

/// @nodoc
abstract mixin class _$StoreContactsCopyWith<$Res> implements $StoreContactsCopyWith<$Res> {
  factory _$StoreContactsCopyWith(_StoreContacts value, $Res Function(_StoreContacts) _then) = __$StoreContactsCopyWithImpl;
@override @useResult
$Res call({
 String phone, String? whatsApp, String? email, String? instagram, String? tikTok, String? telegram
});




}
/// @nodoc
class __$StoreContactsCopyWithImpl<$Res>
    implements _$StoreContactsCopyWith<$Res> {
  __$StoreContactsCopyWithImpl(this._self, this._then);

  final _StoreContacts _self;
  final $Res Function(_StoreContacts) _then;

/// Create a copy of StoreContacts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? whatsApp = freezed,Object? email = freezed,Object? instagram = freezed,Object? tikTok = freezed,Object? telegram = freezed,}) {
  return _then(_StoreContacts(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,whatsApp: freezed == whatsApp ? _self.whatsApp : whatsApp // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,instagram: freezed == instagram ? _self.instagram : instagram // ignore: cast_nullable_to_non_nullable
as String?,tikTok: freezed == tikTok ? _self.tikTok : tikTok // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StoreInfo {

 StoreMode get mode; DateTime? get launchAt; StoreContacts get contacts; String get currency; AppLanguage get defaultLanguage; List<AppLanguage> get languages; double get vatRate;
/// Create a copy of StoreInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreInfoCopyWith<StoreInfo> get copyWith => _$StoreInfoCopyWithImpl<StoreInfo>(this as StoreInfo, _$identity);

  /// Serializes this StoreInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreInfo&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.launchAt, launchAt) || other.launchAt == launchAt)&&(identical(other.contacts, contacts) || other.contacts == contacts)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.defaultLanguage, defaultLanguage) || other.defaultLanguage == defaultLanguage)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.vatRate, vatRate) || other.vatRate == vatRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,launchAt,contacts,currency,defaultLanguage,const DeepCollectionEquality().hash(languages),vatRate);

@override
String toString() {
  return 'StoreInfo(mode: $mode, launchAt: $launchAt, contacts: $contacts, currency: $currency, defaultLanguage: $defaultLanguage, languages: $languages, vatRate: $vatRate)';
}


}

/// @nodoc
abstract mixin class $StoreInfoCopyWith<$Res>  {
  factory $StoreInfoCopyWith(StoreInfo value, $Res Function(StoreInfo) _then) = _$StoreInfoCopyWithImpl;
@useResult
$Res call({
 StoreMode mode, DateTime? launchAt, StoreContacts contacts, String currency, AppLanguage defaultLanguage, List<AppLanguage> languages, double vatRate
});


$StoreContactsCopyWith<$Res> get contacts;

}
/// @nodoc
class _$StoreInfoCopyWithImpl<$Res>
    implements $StoreInfoCopyWith<$Res> {
  _$StoreInfoCopyWithImpl(this._self, this._then);

  final StoreInfo _self;
  final $Res Function(StoreInfo) _then;

/// Create a copy of StoreInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? launchAt = freezed,Object? contacts = null,Object? currency = null,Object? defaultLanguage = null,Object? languages = null,Object? vatRate = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as StoreMode,launchAt: freezed == launchAt ? _self.launchAt : launchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as StoreContacts,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,defaultLanguage: null == defaultLanguage ? _self.defaultLanguage : defaultLanguage // ignore: cast_nullable_to_non_nullable
as AppLanguage,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<AppLanguage>,vatRate: null == vatRate ? _self.vatRate : vatRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of StoreInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreContactsCopyWith<$Res> get contacts {
  
  return $StoreContactsCopyWith<$Res>(_self.contacts, (value) {
    return _then(_self.copyWith(contacts: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreInfo].
extension StoreInfoPatterns on StoreInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreInfo value)  $default,){
final _that = this;
switch (_that) {
case _StoreInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreInfo value)?  $default,){
final _that = this;
switch (_that) {
case _StoreInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreMode mode,  DateTime? launchAt,  StoreContacts contacts,  String currency,  AppLanguage defaultLanguage,  List<AppLanguage> languages,  double vatRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreInfo() when $default != null:
return $default(_that.mode,_that.launchAt,_that.contacts,_that.currency,_that.defaultLanguage,_that.languages,_that.vatRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreMode mode,  DateTime? launchAt,  StoreContacts contacts,  String currency,  AppLanguage defaultLanguage,  List<AppLanguage> languages,  double vatRate)  $default,) {final _that = this;
switch (_that) {
case _StoreInfo():
return $default(_that.mode,_that.launchAt,_that.contacts,_that.currency,_that.defaultLanguage,_that.languages,_that.vatRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreMode mode,  DateTime? launchAt,  StoreContacts contacts,  String currency,  AppLanguage defaultLanguage,  List<AppLanguage> languages,  double vatRate)?  $default,) {final _that = this;
switch (_that) {
case _StoreInfo() when $default != null:
return $default(_that.mode,_that.launchAt,_that.contacts,_that.currency,_that.defaultLanguage,_that.languages,_that.vatRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreInfo implements StoreInfo {
  const _StoreInfo({this.mode = StoreMode.live, this.launchAt, this.contacts = const StoreContacts(), this.currency = 'AZN', this.defaultLanguage = AppLanguage.az, final  List<AppLanguage> languages = AppLanguage.values, this.vatRate = 0}): _languages = languages;
  factory _StoreInfo.fromJson(Map<String, dynamic> json) => _$StoreInfoFromJson(json);

@override@JsonKey() final  StoreMode mode;
@override final  DateTime? launchAt;
@override@JsonKey() final  StoreContacts contacts;
@override@JsonKey() final  String currency;
@override@JsonKey() final  AppLanguage defaultLanguage;
 final  List<AppLanguage> _languages;
@override@JsonKey() List<AppLanguage> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override@JsonKey() final  double vatRate;

/// Create a copy of StoreInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreInfoCopyWith<_StoreInfo> get copyWith => __$StoreInfoCopyWithImpl<_StoreInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreInfo&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.launchAt, launchAt) || other.launchAt == launchAt)&&(identical(other.contacts, contacts) || other.contacts == contacts)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.defaultLanguage, defaultLanguage) || other.defaultLanguage == defaultLanguage)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.vatRate, vatRate) || other.vatRate == vatRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,launchAt,contacts,currency,defaultLanguage,const DeepCollectionEquality().hash(_languages),vatRate);

@override
String toString() {
  return 'StoreInfo(mode: $mode, launchAt: $launchAt, contacts: $contacts, currency: $currency, defaultLanguage: $defaultLanguage, languages: $languages, vatRate: $vatRate)';
}


}

/// @nodoc
abstract mixin class _$StoreInfoCopyWith<$Res> implements $StoreInfoCopyWith<$Res> {
  factory _$StoreInfoCopyWith(_StoreInfo value, $Res Function(_StoreInfo) _then) = __$StoreInfoCopyWithImpl;
@override @useResult
$Res call({
 StoreMode mode, DateTime? launchAt, StoreContacts contacts, String currency, AppLanguage defaultLanguage, List<AppLanguage> languages, double vatRate
});


@override $StoreContactsCopyWith<$Res> get contacts;

}
/// @nodoc
class __$StoreInfoCopyWithImpl<$Res>
    implements _$StoreInfoCopyWith<$Res> {
  __$StoreInfoCopyWithImpl(this._self, this._then);

  final _StoreInfo _self;
  final $Res Function(_StoreInfo) _then;

/// Create a copy of StoreInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? launchAt = freezed,Object? contacts = null,Object? currency = null,Object? defaultLanguage = null,Object? languages = null,Object? vatRate = null,}) {
  return _then(_StoreInfo(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as StoreMode,launchAt: freezed == launchAt ? _self.launchAt : launchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as StoreContacts,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,defaultLanguage: null == defaultLanguage ? _self.defaultLanguage : defaultLanguage // ignore: cast_nullable_to_non_nullable
as AppLanguage,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<AppLanguage>,vatRate: null == vatRate ? _self.vatRate : vatRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of StoreInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreContactsCopyWith<$Res> get contacts {
  
  return $StoreContactsCopyWith<$Res>(_self.contacts, (value) {
    return _then(_self.copyWith(contacts: value));
  });
}
}


/// @nodoc
mixin _$DeliveryAddress {

 String get city; String? get district; String get street; String? get apartment; String? get courierNote;
/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<DeliveryAddress> get copyWith => _$DeliveryAddressCopyWithImpl<DeliveryAddress>(this as DeliveryAddress, _$identity);

  /// Serializes this DeliveryAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAddress&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.street, street) || other.street == street)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.courierNote, courierNote) || other.courierNote == courierNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,district,street,apartment,courierNote);

@override
String toString() {
  return 'DeliveryAddress(city: $city, district: $district, street: $street, apartment: $apartment, courierNote: $courierNote)';
}


}

/// @nodoc
abstract mixin class $DeliveryAddressCopyWith<$Res>  {
  factory $DeliveryAddressCopyWith(DeliveryAddress value, $Res Function(DeliveryAddress) _then) = _$DeliveryAddressCopyWithImpl;
@useResult
$Res call({
 String city, String? district, String street, String? apartment, String? courierNote
});




}
/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._self, this._then);

  final DeliveryAddress _self;
  final $Res Function(DeliveryAddress) _then;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? district = freezed,Object? street = null,Object? apartment = freezed,Object? courierNote = freezed,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,apartment: freezed == apartment ? _self.apartment : apartment // ignore: cast_nullable_to_non_nullable
as String?,courierNote: freezed == courierNote ? _self.courierNote : courierNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryAddress].
extension DeliveryAddressPatterns on DeliveryAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryAddress value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryAddress value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String city,  String? district,  String street,  String? apartment,  String? courierNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that.city,_that.district,_that.street,_that.apartment,_that.courierNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String city,  String? district,  String street,  String? apartment,  String? courierNote)  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddress():
return $default(_that.city,_that.district,_that.street,_that.apartment,_that.courierNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String city,  String? district,  String street,  String? apartment,  String? courierNote)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that.city,_that.district,_that.street,_that.apartment,_that.courierNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryAddress extends DeliveryAddress {
  const _DeliveryAddress({required this.city, this.district, required this.street, this.apartment, this.courierNote}): super._();
  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) => _$DeliveryAddressFromJson(json);

@override final  String city;
@override final  String? district;
@override final  String street;
@override final  String? apartment;
@override final  String? courierNote;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAddressCopyWith<_DeliveryAddress> get copyWith => __$DeliveryAddressCopyWithImpl<_DeliveryAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAddress&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.street, street) || other.street == street)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.courierNote, courierNote) || other.courierNote == courierNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,district,street,apartment,courierNote);

@override
String toString() {
  return 'DeliveryAddress(city: $city, district: $district, street: $street, apartment: $apartment, courierNote: $courierNote)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAddressCopyWith<$Res> implements $DeliveryAddressCopyWith<$Res> {
  factory _$DeliveryAddressCopyWith(_DeliveryAddress value, $Res Function(_DeliveryAddress) _then) = __$DeliveryAddressCopyWithImpl;
@override @useResult
$Res call({
 String city, String? district, String street, String? apartment, String? courierNote
});




}
/// @nodoc
class __$DeliveryAddressCopyWithImpl<$Res>
    implements _$DeliveryAddressCopyWith<$Res> {
  __$DeliveryAddressCopyWithImpl(this._self, this._then);

  final _DeliveryAddress _self;
  final $Res Function(_DeliveryAddress) _then;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? district = freezed,Object? street = null,Object? apartment = freezed,Object? courierNote = freezed,}) {
  return _then(_DeliveryAddress(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,apartment: freezed == apartment ? _self.apartment : apartment // ignore: cast_nullable_to_non_nullable
as String?,courierNote: freezed == courierNote ? _self.courierNote : courierNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ContactInfo {

 String get fullName; String get phone; String? get email;
/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<ContactInfo> get copyWith => _$ContactInfoCopyWithImpl<ContactInfo>(this as ContactInfo, _$identity);

  /// Serializes this ContactInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phone,email);

@override
String toString() {
  return 'ContactInfo(fullName: $fullName, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $ContactInfoCopyWith<$Res>  {
  factory $ContactInfoCopyWith(ContactInfo value, $Res Function(ContactInfo) _then) = _$ContactInfoCopyWithImpl;
@useResult
$Res call({
 String fullName, String phone, String? email
});




}
/// @nodoc
class _$ContactInfoCopyWithImpl<$Res>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._self, this._then);

  final ContactInfo _self;
  final $Res Function(ContactInfo) _then;

/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phone = null,Object? email = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactInfo].
extension ContactInfoPatterns on ContactInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactInfo value)  $default,){
final _that = this;
switch (_that) {
case _ContactInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String phone,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
return $default(_that.fullName,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String phone,  String? email)  $default,) {final _that = this;
switch (_that) {
case _ContactInfo():
return $default(_that.fullName,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String phone,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
return $default(_that.fullName,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactInfo implements ContactInfo {
  const _ContactInfo({required this.fullName, required this.phone, this.email});
  factory _ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);

@override final  String fullName;
@override final  String phone;
@override final  String? email;

/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactInfoCopyWith<_ContactInfo> get copyWith => __$ContactInfoCopyWithImpl<_ContactInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phone,email);

@override
String toString() {
  return 'ContactInfo(fullName: $fullName, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ContactInfoCopyWith<$Res> implements $ContactInfoCopyWith<$Res> {
  factory _$ContactInfoCopyWith(_ContactInfo value, $Res Function(_ContactInfo) _then) = __$ContactInfoCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String phone, String? email
});




}
/// @nodoc
class __$ContactInfoCopyWithImpl<$Res>
    implements _$ContactInfoCopyWith<$Res> {
  __$ContactInfoCopyWithImpl(this._self, this._then);

  final _ContactInfo _self;
  final $Res Function(_ContactInfo) _then;

/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phone = null,Object? email = freezed,}) {
  return _then(_ContactInfo(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SavedAddress {

 String get id; String get label; DeliveryAddress get address; bool get isDefault;
/// Create a copy of SavedAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedAddressCopyWith<SavedAddress> get copyWith => _$SavedAddressCopyWithImpl<SavedAddress>(this as SavedAddress, _$identity);

  /// Serializes this SavedAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.address, address) || other.address == address)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,address,isDefault);

@override
String toString() {
  return 'SavedAddress(id: $id, label: $label, address: $address, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $SavedAddressCopyWith<$Res>  {
  factory $SavedAddressCopyWith(SavedAddress value, $Res Function(SavedAddress) _then) = _$SavedAddressCopyWithImpl;
@useResult
$Res call({
 String id, String label, DeliveryAddress address, bool isDefault
});


$DeliveryAddressCopyWith<$Res> get address;

}
/// @nodoc
class _$SavedAddressCopyWithImpl<$Res>
    implements $SavedAddressCopyWith<$Res> {
  _$SavedAddressCopyWithImpl(this._self, this._then);

  final SavedAddress _self;
  final $Res Function(SavedAddress) _then;

/// Create a copy of SavedAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? address = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SavedAddress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res> get address {
  
  return $DeliveryAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedAddress].
extension SavedAddressPatterns on SavedAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedAddress value)  $default,){
final _that = this;
switch (_that) {
case _SavedAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedAddress value)?  $default,){
final _that = this;
switch (_that) {
case _SavedAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  DeliveryAddress address,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedAddress() when $default != null:
return $default(_that.id,_that.label,_that.address,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  DeliveryAddress address,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _SavedAddress():
return $default(_that.id,_that.label,_that.address,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  DeliveryAddress address,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _SavedAddress() when $default != null:
return $default(_that.id,_that.label,_that.address,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedAddress implements SavedAddress {
  const _SavedAddress({required this.id, required this.label, required this.address, this.isDefault = false});
  factory _SavedAddress.fromJson(Map<String, dynamic> json) => _$SavedAddressFromJson(json);

@override final  String id;
@override final  String label;
@override final  DeliveryAddress address;
@override@JsonKey() final  bool isDefault;

/// Create a copy of SavedAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedAddressCopyWith<_SavedAddress> get copyWith => __$SavedAddressCopyWithImpl<_SavedAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.address, address) || other.address == address)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,address,isDefault);

@override
String toString() {
  return 'SavedAddress(id: $id, label: $label, address: $address, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$SavedAddressCopyWith<$Res> implements $SavedAddressCopyWith<$Res> {
  factory _$SavedAddressCopyWith(_SavedAddress value, $Res Function(_SavedAddress) _then) = __$SavedAddressCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, DeliveryAddress address, bool isDefault
});


@override $DeliveryAddressCopyWith<$Res> get address;

}
/// @nodoc
class __$SavedAddressCopyWithImpl<$Res>
    implements _$SavedAddressCopyWith<$Res> {
  __$SavedAddressCopyWithImpl(this._self, this._then);

  final _SavedAddress _self;
  final $Res Function(_SavedAddress) _then;

/// Create a copy of SavedAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? address = null,Object? isDefault = null,}) {
  return _then(_SavedAddress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SavedAddress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res> get address {
  
  return $DeliveryAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$SavedCard {

 String get id; String get brand; String get maskedPan; DateTime? get createdAt;
/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedCardCopyWith<SavedCard> get copyWith => _$SavedCardCopyWithImpl<SavedCard>(this as SavedCard, _$identity);

  /// Serializes this SavedCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedCard&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.maskedPan, maskedPan) || other.maskedPan == maskedPan)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brand,maskedPan,createdAt);

@override
String toString() {
  return 'SavedCard(id: $id, brand: $brand, maskedPan: $maskedPan, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SavedCardCopyWith<$Res>  {
  factory $SavedCardCopyWith(SavedCard value, $Res Function(SavedCard) _then) = _$SavedCardCopyWithImpl;
@useResult
$Res call({
 String id, String brand, String maskedPan, DateTime? createdAt
});




}
/// @nodoc
class _$SavedCardCopyWithImpl<$Res>
    implements $SavedCardCopyWith<$Res> {
  _$SavedCardCopyWithImpl(this._self, this._then);

  final SavedCard _self;
  final $Res Function(SavedCard) _then;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brand = null,Object? maskedPan = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,maskedPan: null == maskedPan ? _self.maskedPan : maskedPan // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedCard].
extension SavedCardPatterns on SavedCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedCard value)  $default,){
final _that = this;
switch (_that) {
case _SavedCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedCard value)?  $default,){
final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String brand,  String maskedPan,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
return $default(_that.id,_that.brand,_that.maskedPan,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String brand,  String maskedPan,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SavedCard():
return $default(_that.id,_that.brand,_that.maskedPan,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String brand,  String maskedPan,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
return $default(_that.id,_that.brand,_that.maskedPan,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedCard implements SavedCard {
  const _SavedCard({required this.id, required this.brand, required this.maskedPan, this.createdAt});
  factory _SavedCard.fromJson(Map<String, dynamic> json) => _$SavedCardFromJson(json);

@override final  String id;
@override final  String brand;
@override final  String maskedPan;
@override final  DateTime? createdAt;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCardCopyWith<_SavedCard> get copyWith => __$SavedCardCopyWithImpl<_SavedCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedCard&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.maskedPan, maskedPan) || other.maskedPan == maskedPan)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brand,maskedPan,createdAt);

@override
String toString() {
  return 'SavedCard(id: $id, brand: $brand, maskedPan: $maskedPan, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SavedCardCopyWith<$Res> implements $SavedCardCopyWith<$Res> {
  factory _$SavedCardCopyWith(_SavedCard value, $Res Function(_SavedCard) _then) = __$SavedCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String brand, String maskedPan, DateTime? createdAt
});




}
/// @nodoc
class __$SavedCardCopyWithImpl<$Res>
    implements _$SavedCardCopyWith<$Res> {
  __$SavedCardCopyWithImpl(this._self, this._then);

  final _SavedCard _self;
  final $Res Function(_SavedCard) _then;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brand = null,Object? maskedPan = null,Object? createdAt = freezed,}) {
  return _then(_SavedCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,maskedPan: null == maskedPan ? _self.maskedPan : maskedPan // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MessageResponse {

 String get code; String get message;
/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageResponseCopyWith<MessageResponse> get copyWith => _$MessageResponseCopyWithImpl<MessageResponse>(this as MessageResponse, _$identity);

  /// Serializes this MessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'MessageResponse(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageResponseCopyWith<$Res>  {
  factory $MessageResponseCopyWith(MessageResponse value, $Res Function(MessageResponse) _then) = _$MessageResponseCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$MessageResponseCopyWithImpl<$Res>
    implements $MessageResponseCopyWith<$Res> {
  _$MessageResponseCopyWithImpl(this._self, this._then);

  final MessageResponse _self;
  final $Res Function(MessageResponse) _then;

/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageResponse].
extension MessageResponsePatterns on MessageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _MessageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message)  $default,) {final _that = this;
switch (_that) {
case _MessageResponse():
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message)?  $default,) {final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
return $default(_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageResponse implements MessageResponse {
  const _MessageResponse({this.code = '', this.message = ''});
  factory _MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);

@override@JsonKey() final  String code;
@override@JsonKey() final  String message;

/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageResponseCopyWith<_MessageResponse> get copyWith => __$MessageResponseCopyWithImpl<_MessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'MessageResponse(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$MessageResponseCopyWith<$Res> implements $MessageResponseCopyWith<$Res> {
  factory _$MessageResponseCopyWith(_MessageResponse value, $Res Function(_MessageResponse) _then) = __$MessageResponseCopyWithImpl;
@override @useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class __$MessageResponseCopyWithImpl<$Res>
    implements _$MessageResponseCopyWith<$Res> {
  __$MessageResponseCopyWithImpl(this._self, this._then);

  final _MessageResponse _self;
  final $Res Function(_MessageResponse) _then;

/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(_MessageResponse(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LineAdjustment {

@JsonKey(unknownEnumValue: AdjustmentType.unknown) AdjustmentType get type; double get amount;
/// Create a copy of LineAdjustment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineAdjustmentCopyWith<LineAdjustment> get copyWith => _$LineAdjustmentCopyWithImpl<LineAdjustment>(this as LineAdjustment, _$identity);

  /// Serializes this LineAdjustment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineAdjustment&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,amount);

@override
String toString() {
  return 'LineAdjustment(type: $type, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $LineAdjustmentCopyWith<$Res>  {
  factory $LineAdjustmentCopyWith(LineAdjustment value, $Res Function(LineAdjustment) _then) = _$LineAdjustmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: AdjustmentType.unknown) AdjustmentType type, double amount
});




}
/// @nodoc
class _$LineAdjustmentCopyWithImpl<$Res>
    implements $LineAdjustmentCopyWith<$Res> {
  _$LineAdjustmentCopyWithImpl(this._self, this._then);

  final LineAdjustment _self;
  final $Res Function(LineAdjustment) _then;

/// Create a copy of LineAdjustment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? amount = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AdjustmentType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LineAdjustment].
extension LineAdjustmentPatterns on LineAdjustment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineAdjustment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineAdjustment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineAdjustment value)  $default,){
final _that = this;
switch (_that) {
case _LineAdjustment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineAdjustment value)?  $default,){
final _that = this;
switch (_that) {
case _LineAdjustment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: AdjustmentType.unknown)  AdjustmentType type,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineAdjustment() when $default != null:
return $default(_that.type,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: AdjustmentType.unknown)  AdjustmentType type,  double amount)  $default,) {final _that = this;
switch (_that) {
case _LineAdjustment():
return $default(_that.type,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: AdjustmentType.unknown)  AdjustmentType type,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _LineAdjustment() when $default != null:
return $default(_that.type,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LineAdjustment implements LineAdjustment {
  const _LineAdjustment({@JsonKey(unknownEnumValue: AdjustmentType.unknown) required this.type, required this.amount});
  factory _LineAdjustment.fromJson(Map<String, dynamic> json) => _$LineAdjustmentFromJson(json);

@override@JsonKey(unknownEnumValue: AdjustmentType.unknown) final  AdjustmentType type;
@override final  double amount;

/// Create a copy of LineAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineAdjustmentCopyWith<_LineAdjustment> get copyWith => __$LineAdjustmentCopyWithImpl<_LineAdjustment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineAdjustmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineAdjustment&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,amount);

@override
String toString() {
  return 'LineAdjustment(type: $type, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$LineAdjustmentCopyWith<$Res> implements $LineAdjustmentCopyWith<$Res> {
  factory _$LineAdjustmentCopyWith(_LineAdjustment value, $Res Function(_LineAdjustment) _then) = __$LineAdjustmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: AdjustmentType.unknown) AdjustmentType type, double amount
});




}
/// @nodoc
class __$LineAdjustmentCopyWithImpl<$Res>
    implements _$LineAdjustmentCopyWith<$Res> {
  __$LineAdjustmentCopyWithImpl(this._self, this._then);

  final _LineAdjustment _self;
  final $Res Function(_LineAdjustment) _then;

/// Create a copy of LineAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? amount = null,}) {
  return _then(_LineAdjustment(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AdjustmentType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
