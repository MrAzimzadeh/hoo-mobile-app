// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountOverview {

 String get fullName; int get ordersCount; int get designsCount; int get wishlistCount; int get activeOrders;
/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountOverviewCopyWith<AccountOverview> get copyWith => _$AccountOverviewCopyWithImpl<AccountOverview>(this as AccountOverview, _$identity);

  /// Serializes this AccountOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountOverview&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount)&&(identical(other.designsCount, designsCount) || other.designsCount == designsCount)&&(identical(other.wishlistCount, wishlistCount) || other.wishlistCount == wishlistCount)&&(identical(other.activeOrders, activeOrders) || other.activeOrders == activeOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,ordersCount,designsCount,wishlistCount,activeOrders);

@override
String toString() {
  return 'AccountOverview(fullName: $fullName, ordersCount: $ordersCount, designsCount: $designsCount, wishlistCount: $wishlistCount, activeOrders: $activeOrders)';
}


}

/// @nodoc
abstract mixin class $AccountOverviewCopyWith<$Res>  {
  factory $AccountOverviewCopyWith(AccountOverview value, $Res Function(AccountOverview) _then) = _$AccountOverviewCopyWithImpl;
@useResult
$Res call({
 String fullName, int ordersCount, int designsCount, int wishlistCount, int activeOrders
});




}
/// @nodoc
class _$AccountOverviewCopyWithImpl<$Res>
    implements $AccountOverviewCopyWith<$Res> {
  _$AccountOverviewCopyWithImpl(this._self, this._then);

  final AccountOverview _self;
  final $Res Function(AccountOverview) _then;

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? ordersCount = null,Object? designsCount = null,Object? wishlistCount = null,Object? activeOrders = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,designsCount: null == designsCount ? _self.designsCount : designsCount // ignore: cast_nullable_to_non_nullable
as int,wishlistCount: null == wishlistCount ? _self.wishlistCount : wishlistCount // ignore: cast_nullable_to_non_nullable
as int,activeOrders: null == activeOrders ? _self.activeOrders : activeOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountOverview].
extension AccountOverviewPatterns on AccountOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountOverview value)  $default,){
final _that = this;
switch (_that) {
case _AccountOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountOverview value)?  $default,){
final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  int ordersCount,  int designsCount,  int wishlistCount,  int activeOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
return $default(_that.fullName,_that.ordersCount,_that.designsCount,_that.wishlistCount,_that.activeOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  int ordersCount,  int designsCount,  int wishlistCount,  int activeOrders)  $default,) {final _that = this;
switch (_that) {
case _AccountOverview():
return $default(_that.fullName,_that.ordersCount,_that.designsCount,_that.wishlistCount,_that.activeOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  int ordersCount,  int designsCount,  int wishlistCount,  int activeOrders)?  $default,) {final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
return $default(_that.fullName,_that.ordersCount,_that.designsCount,_that.wishlistCount,_that.activeOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountOverview implements AccountOverview {
  const _AccountOverview({this.fullName = '', this.ordersCount = 0, this.designsCount = 0, this.wishlistCount = 0, this.activeOrders = 0});
  factory _AccountOverview.fromJson(Map<String, dynamic> json) => _$AccountOverviewFromJson(json);

@override@JsonKey() final  String fullName;
@override@JsonKey() final  int ordersCount;
@override@JsonKey() final  int designsCount;
@override@JsonKey() final  int wishlistCount;
@override@JsonKey() final  int activeOrders;

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountOverviewCopyWith<_AccountOverview> get copyWith => __$AccountOverviewCopyWithImpl<_AccountOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountOverview&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount)&&(identical(other.designsCount, designsCount) || other.designsCount == designsCount)&&(identical(other.wishlistCount, wishlistCount) || other.wishlistCount == wishlistCount)&&(identical(other.activeOrders, activeOrders) || other.activeOrders == activeOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,ordersCount,designsCount,wishlistCount,activeOrders);

@override
String toString() {
  return 'AccountOverview(fullName: $fullName, ordersCount: $ordersCount, designsCount: $designsCount, wishlistCount: $wishlistCount, activeOrders: $activeOrders)';
}


}

/// @nodoc
abstract mixin class _$AccountOverviewCopyWith<$Res> implements $AccountOverviewCopyWith<$Res> {
  factory _$AccountOverviewCopyWith(_AccountOverview value, $Res Function(_AccountOverview) _then) = __$AccountOverviewCopyWithImpl;
@override @useResult
$Res call({
 String fullName, int ordersCount, int designsCount, int wishlistCount, int activeOrders
});




}
/// @nodoc
class __$AccountOverviewCopyWithImpl<$Res>
    implements _$AccountOverviewCopyWith<$Res> {
  __$AccountOverviewCopyWithImpl(this._self, this._then);

  final _AccountOverview _self;
  final $Res Function(_AccountOverview) _then;

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? ordersCount = null,Object? designsCount = null,Object? wishlistCount = null,Object? activeOrders = null,}) {
  return _then(_AccountOverview(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,designsCount: null == designsCount ? _self.designsCount : designsCount // ignore: cast_nullable_to_non_nullable
as int,wishlistCount: null == wishlistCount ? _self.wishlistCount : wishlistCount // ignore: cast_nullable_to_non_nullable
as int,activeOrders: null == activeOrders ? _self.activeOrders : activeOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UpdateProfileRequest {

 String get fullName; AppLanguage get language; bool get marketingConsent;
/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith => _$UpdateProfileRequestCopyWithImpl<UpdateProfileRequest>(this as UpdateProfileRequest, _$identity);

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.language, language) || other.language == language)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,language,marketingConsent);

@override
String toString() {
  return 'UpdateProfileRequest(fullName: $fullName, language: $language, marketingConsent: $marketingConsent)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileRequestCopyWith<$Res>  {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value, $Res Function(UpdateProfileRequest) _then) = _$UpdateProfileRequestCopyWithImpl;
@useResult
$Res call({
 String fullName, AppLanguage language, bool marketingConsent
});




}
/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateProfileRequest _self;
  final $Res Function(UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? language = null,Object? marketingConsent = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileRequest].
extension UpdateProfileRequestPatterns on UpdateProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  AppLanguage language,  bool marketingConsent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.fullName,_that.language,_that.marketingConsent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  AppLanguage language,  bool marketingConsent)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest():
return $default(_that.fullName,_that.language,_that.marketingConsent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  AppLanguage language,  bool marketingConsent)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.fullName,_that.language,_that.marketingConsent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileRequest implements UpdateProfileRequest {
  const _UpdateProfileRequest({required this.fullName, required this.language, required this.marketingConsent});
  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestFromJson(json);

@override final  String fullName;
@override final  AppLanguage language;
@override final  bool marketingConsent;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileRequestCopyWith<_UpdateProfileRequest> get copyWith => __$UpdateProfileRequestCopyWithImpl<_UpdateProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.language, language) || other.language == language)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,language,marketingConsent);

@override
String toString() {
  return 'UpdateProfileRequest(fullName: $fullName, language: $language, marketingConsent: $marketingConsent)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileRequestCopyWith<$Res> implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$UpdateProfileRequestCopyWith(_UpdateProfileRequest value, $Res Function(_UpdateProfileRequest) _then) = __$UpdateProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String fullName, AppLanguage language, bool marketingConsent
});




}
/// @nodoc
class __$UpdateProfileRequestCopyWithImpl<$Res>
    implements _$UpdateProfileRequestCopyWith<$Res> {
  __$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateProfileRequest _self;
  final $Res Function(_UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? language = null,Object? marketingConsent = null,}) {
  return _then(_UpdateProfileRequest(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$StyleProfile {

 int? get heightCm; int? get weightKg; int? get chestCm; int? get waistCm;@JsonKey(unknownEnumValue: Size.unknown) Size? get usualSize;@JsonKey(unknownEnumValue: Fit.unknown) Fit? get preferredFit;@JsonKey(unknownEnumValue: ColorFamily.unknown) List<ColorFamily> get favoriteColors;@JsonKey(unknownEnumValue: StyleTag.unknown) List<StyleTag> get styles;
/// Create a copy of StyleProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StyleProfileCopyWith<StyleProfile> get copyWith => _$StyleProfileCopyWithImpl<StyleProfile>(this as StyleProfile, _$identity);

  /// Serializes this StyleProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StyleProfile&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.usualSize, usualSize) || other.usualSize == usualSize)&&(identical(other.preferredFit, preferredFit) || other.preferredFit == preferredFit)&&const DeepCollectionEquality().equals(other.favoriteColors, favoriteColors)&&const DeepCollectionEquality().equals(other.styles, styles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,heightCm,weightKg,chestCm,waistCm,usualSize,preferredFit,const DeepCollectionEquality().hash(favoriteColors),const DeepCollectionEquality().hash(styles));

@override
String toString() {
  return 'StyleProfile(heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, usualSize: $usualSize, preferredFit: $preferredFit, favoriteColors: $favoriteColors, styles: $styles)';
}


}

/// @nodoc
abstract mixin class $StyleProfileCopyWith<$Res>  {
  factory $StyleProfileCopyWith(StyleProfile value, $Res Function(StyleProfile) _then) = _$StyleProfileCopyWithImpl;
@useResult
$Res call({
 int? heightCm, int? weightKg, int? chestCm, int? waistCm,@JsonKey(unknownEnumValue: Size.unknown) Size? usualSize,@JsonKey(unknownEnumValue: Fit.unknown) Fit? preferredFit,@JsonKey(unknownEnumValue: ColorFamily.unknown) List<ColorFamily> favoriteColors,@JsonKey(unknownEnumValue: StyleTag.unknown) List<StyleTag> styles
});




}
/// @nodoc
class _$StyleProfileCopyWithImpl<$Res>
    implements $StyleProfileCopyWith<$Res> {
  _$StyleProfileCopyWithImpl(this._self, this._then);

  final StyleProfile _self;
  final $Res Function(StyleProfile) _then;

/// Create a copy of StyleProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heightCm = freezed,Object? weightKg = freezed,Object? chestCm = freezed,Object? waistCm = freezed,Object? usualSize = freezed,Object? preferredFit = freezed,Object? favoriteColors = null,Object? styles = null,}) {
  return _then(_self.copyWith(
heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,chestCm: freezed == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as int?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as int?,usualSize: freezed == usualSize ? _self.usualSize : usualSize // ignore: cast_nullable_to_non_nullable
as Size?,preferredFit: freezed == preferredFit ? _self.preferredFit : preferredFit // ignore: cast_nullable_to_non_nullable
as Fit?,favoriteColors: null == favoriteColors ? _self.favoriteColors : favoriteColors // ignore: cast_nullable_to_non_nullable
as List<ColorFamily>,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<StyleTag>,
  ));
}

}


/// Adds pattern-matching-related methods to [StyleProfile].
extension StyleProfilePatterns on StyleProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StyleProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StyleProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StyleProfile value)  $default,){
final _that = this;
switch (_that) {
case _StyleProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StyleProfile value)?  $default,){
final _that = this;
switch (_that) {
case _StyleProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? heightCm,  int? weightKg,  int? chestCm,  int? waistCm, @JsonKey(unknownEnumValue: Size.unknown)  Size? usualSize, @JsonKey(unknownEnumValue: Fit.unknown)  Fit? preferredFit, @JsonKey(unknownEnumValue: ColorFamily.unknown)  List<ColorFamily> favoriteColors, @JsonKey(unknownEnumValue: StyleTag.unknown)  List<StyleTag> styles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StyleProfile() when $default != null:
return $default(_that.heightCm,_that.weightKg,_that.chestCm,_that.waistCm,_that.usualSize,_that.preferredFit,_that.favoriteColors,_that.styles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? heightCm,  int? weightKg,  int? chestCm,  int? waistCm, @JsonKey(unknownEnumValue: Size.unknown)  Size? usualSize, @JsonKey(unknownEnumValue: Fit.unknown)  Fit? preferredFit, @JsonKey(unknownEnumValue: ColorFamily.unknown)  List<ColorFamily> favoriteColors, @JsonKey(unknownEnumValue: StyleTag.unknown)  List<StyleTag> styles)  $default,) {final _that = this;
switch (_that) {
case _StyleProfile():
return $default(_that.heightCm,_that.weightKg,_that.chestCm,_that.waistCm,_that.usualSize,_that.preferredFit,_that.favoriteColors,_that.styles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? heightCm,  int? weightKg,  int? chestCm,  int? waistCm, @JsonKey(unknownEnumValue: Size.unknown)  Size? usualSize, @JsonKey(unknownEnumValue: Fit.unknown)  Fit? preferredFit, @JsonKey(unknownEnumValue: ColorFamily.unknown)  List<ColorFamily> favoriteColors, @JsonKey(unknownEnumValue: StyleTag.unknown)  List<StyleTag> styles)?  $default,) {final _that = this;
switch (_that) {
case _StyleProfile() when $default != null:
return $default(_that.heightCm,_that.weightKg,_that.chestCm,_that.waistCm,_that.usualSize,_that.preferredFit,_that.favoriteColors,_that.styles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StyleProfile extends StyleProfile {
  const _StyleProfile({this.heightCm, this.weightKg, this.chestCm, this.waistCm, @JsonKey(unknownEnumValue: Size.unknown) this.usualSize, @JsonKey(unknownEnumValue: Fit.unknown) this.preferredFit, @JsonKey(unknownEnumValue: ColorFamily.unknown) final  List<ColorFamily> favoriteColors = const <ColorFamily>[], @JsonKey(unknownEnumValue: StyleTag.unknown) final  List<StyleTag> styles = const <StyleTag>[]}): _favoriteColors = favoriteColors,_styles = styles,super._();
  factory _StyleProfile.fromJson(Map<String, dynamic> json) => _$StyleProfileFromJson(json);

@override final  int? heightCm;
@override final  int? weightKg;
@override final  int? chestCm;
@override final  int? waistCm;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? usualSize;
@override@JsonKey(unknownEnumValue: Fit.unknown) final  Fit? preferredFit;
 final  List<ColorFamily> _favoriteColors;
@override@JsonKey(unknownEnumValue: ColorFamily.unknown) List<ColorFamily> get favoriteColors {
  if (_favoriteColors is EqualUnmodifiableListView) return _favoriteColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteColors);
}

 final  List<StyleTag> _styles;
@override@JsonKey(unknownEnumValue: StyleTag.unknown) List<StyleTag> get styles {
  if (_styles is EqualUnmodifiableListView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_styles);
}


/// Create a copy of StyleProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StyleProfileCopyWith<_StyleProfile> get copyWith => __$StyleProfileCopyWithImpl<_StyleProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StyleProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StyleProfile&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.usualSize, usualSize) || other.usualSize == usualSize)&&(identical(other.preferredFit, preferredFit) || other.preferredFit == preferredFit)&&const DeepCollectionEquality().equals(other._favoriteColors, _favoriteColors)&&const DeepCollectionEquality().equals(other._styles, _styles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,heightCm,weightKg,chestCm,waistCm,usualSize,preferredFit,const DeepCollectionEquality().hash(_favoriteColors),const DeepCollectionEquality().hash(_styles));

@override
String toString() {
  return 'StyleProfile(heightCm: $heightCm, weightKg: $weightKg, chestCm: $chestCm, waistCm: $waistCm, usualSize: $usualSize, preferredFit: $preferredFit, favoriteColors: $favoriteColors, styles: $styles)';
}


}

/// @nodoc
abstract mixin class _$StyleProfileCopyWith<$Res> implements $StyleProfileCopyWith<$Res> {
  factory _$StyleProfileCopyWith(_StyleProfile value, $Res Function(_StyleProfile) _then) = __$StyleProfileCopyWithImpl;
@override @useResult
$Res call({
 int? heightCm, int? weightKg, int? chestCm, int? waistCm,@JsonKey(unknownEnumValue: Size.unknown) Size? usualSize,@JsonKey(unknownEnumValue: Fit.unknown) Fit? preferredFit,@JsonKey(unknownEnumValue: ColorFamily.unknown) List<ColorFamily> favoriteColors,@JsonKey(unknownEnumValue: StyleTag.unknown) List<StyleTag> styles
});




}
/// @nodoc
class __$StyleProfileCopyWithImpl<$Res>
    implements _$StyleProfileCopyWith<$Res> {
  __$StyleProfileCopyWithImpl(this._self, this._then);

  final _StyleProfile _self;
  final $Res Function(_StyleProfile) _then;

/// Create a copy of StyleProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heightCm = freezed,Object? weightKg = freezed,Object? chestCm = freezed,Object? waistCm = freezed,Object? usualSize = freezed,Object? preferredFit = freezed,Object? favoriteColors = null,Object? styles = null,}) {
  return _then(_StyleProfile(
heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,chestCm: freezed == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as int?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as int?,usualSize: freezed == usualSize ? _self.usualSize : usualSize // ignore: cast_nullable_to_non_nullable
as Size?,preferredFit: freezed == preferredFit ? _self.preferredFit : preferredFit // ignore: cast_nullable_to_non_nullable
as Fit?,favoriteColors: null == favoriteColors ? _self._favoriteColors : favoriteColors // ignore: cast_nullable_to_non_nullable
as List<ColorFamily>,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<StyleTag>,
  ));
}


}


/// @nodoc
mixin _$NotificationPreference {

@JsonKey(unknownEnumValue: NotificationTopic.unknown) NotificationTopic get topic;@JsonKey(unknownEnumValue: NotificationChannel.unknown) NotificationChannel get channel; bool get enabled; bool get locked;
/// Create a copy of NotificationPreference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferenceCopyWith<NotificationPreference> get copyWith => _$NotificationPreferenceCopyWithImpl<NotificationPreference>(this as NotificationPreference, _$identity);

  /// Serializes this NotificationPreference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreference&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,channel,enabled,locked);

@override
String toString() {
  return 'NotificationPreference(topic: $topic, channel: $channel, enabled: $enabled, locked: $locked)';
}


}

/// @nodoc
abstract mixin class $NotificationPreferenceCopyWith<$Res>  {
  factory $NotificationPreferenceCopyWith(NotificationPreference value, $Res Function(NotificationPreference) _then) = _$NotificationPreferenceCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: NotificationTopic.unknown) NotificationTopic topic,@JsonKey(unknownEnumValue: NotificationChannel.unknown) NotificationChannel channel, bool enabled, bool locked
});




}
/// @nodoc
class _$NotificationPreferenceCopyWithImpl<$Res>
    implements $NotificationPreferenceCopyWith<$Res> {
  _$NotificationPreferenceCopyWithImpl(this._self, this._then);

  final NotificationPreference _self;
  final $Res Function(NotificationPreference) _then;

/// Create a copy of NotificationPreference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? channel = null,Object? enabled = null,Object? locked = null,}) {
  return _then(_self.copyWith(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as NotificationTopic,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as NotificationChannel,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPreference].
extension NotificationPreferencePatterns on NotificationPreference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreference value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreference value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: NotificationTopic.unknown)  NotificationTopic topic, @JsonKey(unknownEnumValue: NotificationChannel.unknown)  NotificationChannel channel,  bool enabled,  bool locked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreference() when $default != null:
return $default(_that.topic,_that.channel,_that.enabled,_that.locked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: NotificationTopic.unknown)  NotificationTopic topic, @JsonKey(unknownEnumValue: NotificationChannel.unknown)  NotificationChannel channel,  bool enabled,  bool locked)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreference():
return $default(_that.topic,_that.channel,_that.enabled,_that.locked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: NotificationTopic.unknown)  NotificationTopic topic, @JsonKey(unknownEnumValue: NotificationChannel.unknown)  NotificationChannel channel,  bool enabled,  bool locked)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreference() when $default != null:
return $default(_that.topic,_that.channel,_that.enabled,_that.locked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPreference extends NotificationPreference {
  const _NotificationPreference({@JsonKey(unknownEnumValue: NotificationTopic.unknown) required this.topic, @JsonKey(unknownEnumValue: NotificationChannel.unknown) required this.channel, required this.enabled, this.locked = false}): super._();
  factory _NotificationPreference.fromJson(Map<String, dynamic> json) => _$NotificationPreferenceFromJson(json);

@override@JsonKey(unknownEnumValue: NotificationTopic.unknown) final  NotificationTopic topic;
@override@JsonKey(unknownEnumValue: NotificationChannel.unknown) final  NotificationChannel channel;
@override final  bool enabled;
@override@JsonKey() final  bool locked;

/// Create a copy of NotificationPreference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferenceCopyWith<_NotificationPreference> get copyWith => __$NotificationPreferenceCopyWithImpl<_NotificationPreference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPreferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreference&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,channel,enabled,locked);

@override
String toString() {
  return 'NotificationPreference(topic: $topic, channel: $channel, enabled: $enabled, locked: $locked)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferenceCopyWith<$Res> implements $NotificationPreferenceCopyWith<$Res> {
  factory _$NotificationPreferenceCopyWith(_NotificationPreference value, $Res Function(_NotificationPreference) _then) = __$NotificationPreferenceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: NotificationTopic.unknown) NotificationTopic topic,@JsonKey(unknownEnumValue: NotificationChannel.unknown) NotificationChannel channel, bool enabled, bool locked
});




}
/// @nodoc
class __$NotificationPreferenceCopyWithImpl<$Res>
    implements _$NotificationPreferenceCopyWith<$Res> {
  __$NotificationPreferenceCopyWithImpl(this._self, this._then);

  final _NotificationPreference _self;
  final $Res Function(_NotificationPreference) _then;

/// Create a copy of NotificationPreference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? channel = null,Object? enabled = null,Object? locked = null,}) {
  return _then(_NotificationPreference(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as NotificationTopic,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as NotificationChannel,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ActiveSession {

 String get id; DateTime get createdAt; DateTime get lastSeenAt; String? get ipAddress; String? get userAgent; bool get isCurrent;
/// Create a copy of ActiveSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveSessionCopyWith<ActiveSession> get copyWith => _$ActiveSessionCopyWithImpl<ActiveSession>(this as ActiveSession, _$identity);

  /// Serializes this ActiveSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveSession&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,lastSeenAt,ipAddress,userAgent,isCurrent);

@override
String toString() {
  return 'ActiveSession(id: $id, createdAt: $createdAt, lastSeenAt: $lastSeenAt, ipAddress: $ipAddress, userAgent: $userAgent, isCurrent: $isCurrent)';
}


}

/// @nodoc
abstract mixin class $ActiveSessionCopyWith<$Res>  {
  factory $ActiveSessionCopyWith(ActiveSession value, $Res Function(ActiveSession) _then) = _$ActiveSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime lastSeenAt, String? ipAddress, String? userAgent, bool isCurrent
});




}
/// @nodoc
class _$ActiveSessionCopyWithImpl<$Res>
    implements $ActiveSessionCopyWith<$Res> {
  _$ActiveSessionCopyWithImpl(this._self, this._then);

  final ActiveSession _self;
  final $Res Function(ActiveSession) _then;

/// Create a copy of ActiveSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? lastSeenAt = null,Object? ipAddress = freezed,Object? userAgent = freezed,Object? isCurrent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveSession].
extension ActiveSessionPatterns on ActiveSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveSession value)  $default,){
final _that = this;
switch (_that) {
case _ActiveSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveSession value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime lastSeenAt,  String? ipAddress,  String? userAgent,  bool isCurrent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveSession() when $default != null:
return $default(_that.id,_that.createdAt,_that.lastSeenAt,_that.ipAddress,_that.userAgent,_that.isCurrent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime lastSeenAt,  String? ipAddress,  String? userAgent,  bool isCurrent)  $default,) {final _that = this;
switch (_that) {
case _ActiveSession():
return $default(_that.id,_that.createdAt,_that.lastSeenAt,_that.ipAddress,_that.userAgent,_that.isCurrent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime lastSeenAt,  String? ipAddress,  String? userAgent,  bool isCurrent)?  $default,) {final _that = this;
switch (_that) {
case _ActiveSession() when $default != null:
return $default(_that.id,_that.createdAt,_that.lastSeenAt,_that.ipAddress,_that.userAgent,_that.isCurrent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveSession implements ActiveSession {
  const _ActiveSession({required this.id, required this.createdAt, required this.lastSeenAt, this.ipAddress, this.userAgent, this.isCurrent = false});
  factory _ActiveSession.fromJson(Map<String, dynamic> json) => _$ActiveSessionFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime lastSeenAt;
@override final  String? ipAddress;
@override final  String? userAgent;
@override@JsonKey() final  bool isCurrent;

/// Create a copy of ActiveSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveSessionCopyWith<_ActiveSession> get copyWith => __$ActiveSessionCopyWithImpl<_ActiveSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveSession&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,lastSeenAt,ipAddress,userAgent,isCurrent);

@override
String toString() {
  return 'ActiveSession(id: $id, createdAt: $createdAt, lastSeenAt: $lastSeenAt, ipAddress: $ipAddress, userAgent: $userAgent, isCurrent: $isCurrent)';
}


}

/// @nodoc
abstract mixin class _$ActiveSessionCopyWith<$Res> implements $ActiveSessionCopyWith<$Res> {
  factory _$ActiveSessionCopyWith(_ActiveSession value, $Res Function(_ActiveSession) _then) = __$ActiveSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime lastSeenAt, String? ipAddress, String? userAgent, bool isCurrent
});




}
/// @nodoc
class __$ActiveSessionCopyWithImpl<$Res>
    implements _$ActiveSessionCopyWith<$Res> {
  __$ActiveSessionCopyWithImpl(this._self, this._then);

  final _ActiveSession _self;
  final $Res Function(_ActiveSession) _then;

/// Create a copy of ActiveSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? lastSeenAt = null,Object? ipAddress = freezed,Object? userAgent = freezed,Object? isCurrent = null,}) {
  return _then(_ActiveSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
