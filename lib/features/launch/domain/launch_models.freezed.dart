// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComingSoonContent {

 StoreMode get mode; DateTime? get launchAt; String get title; String get subtitle; List<String> get perks; StoreContacts get contacts; int get waitlistCount;
/// Create a copy of ComingSoonContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComingSoonContentCopyWith<ComingSoonContent> get copyWith => _$ComingSoonContentCopyWithImpl<ComingSoonContent>(this as ComingSoonContent, _$identity);

  /// Serializes this ComingSoonContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComingSoonContent&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.launchAt, launchAt) || other.launchAt == launchAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.perks, perks)&&(identical(other.contacts, contacts) || other.contacts == contacts)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,launchAt,title,subtitle,const DeepCollectionEquality().hash(perks),contacts,waitlistCount);

@override
String toString() {
  return 'ComingSoonContent(mode: $mode, launchAt: $launchAt, title: $title, subtitle: $subtitle, perks: $perks, contacts: $contacts, waitlistCount: $waitlistCount)';
}


}

/// @nodoc
abstract mixin class $ComingSoonContentCopyWith<$Res>  {
  factory $ComingSoonContentCopyWith(ComingSoonContent value, $Res Function(ComingSoonContent) _then) = _$ComingSoonContentCopyWithImpl;
@useResult
$Res call({
 StoreMode mode, DateTime? launchAt, String title, String subtitle, List<String> perks, StoreContacts contacts, int waitlistCount
});


$StoreContactsCopyWith<$Res> get contacts;

}
/// @nodoc
class _$ComingSoonContentCopyWithImpl<$Res>
    implements $ComingSoonContentCopyWith<$Res> {
  _$ComingSoonContentCopyWithImpl(this._self, this._then);

  final ComingSoonContent _self;
  final $Res Function(ComingSoonContent) _then;

/// Create a copy of ComingSoonContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? launchAt = freezed,Object? title = null,Object? subtitle = null,Object? perks = null,Object? contacts = null,Object? waitlistCount = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as StoreMode,launchAt: freezed == launchAt ? _self.launchAt : launchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,perks: null == perks ? _self.perks : perks // ignore: cast_nullable_to_non_nullable
as List<String>,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as StoreContacts,waitlistCount: null == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ComingSoonContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreContactsCopyWith<$Res> get contacts {
  
  return $StoreContactsCopyWith<$Res>(_self.contacts, (value) {
    return _then(_self.copyWith(contacts: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComingSoonContent].
extension ComingSoonContentPatterns on ComingSoonContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComingSoonContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComingSoonContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComingSoonContent value)  $default,){
final _that = this;
switch (_that) {
case _ComingSoonContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComingSoonContent value)?  $default,){
final _that = this;
switch (_that) {
case _ComingSoonContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreMode mode,  DateTime? launchAt,  String title,  String subtitle,  List<String> perks,  StoreContacts contacts,  int waitlistCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComingSoonContent() when $default != null:
return $default(_that.mode,_that.launchAt,_that.title,_that.subtitle,_that.perks,_that.contacts,_that.waitlistCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreMode mode,  DateTime? launchAt,  String title,  String subtitle,  List<String> perks,  StoreContacts contacts,  int waitlistCount)  $default,) {final _that = this;
switch (_that) {
case _ComingSoonContent():
return $default(_that.mode,_that.launchAt,_that.title,_that.subtitle,_that.perks,_that.contacts,_that.waitlistCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreMode mode,  DateTime? launchAt,  String title,  String subtitle,  List<String> perks,  StoreContacts contacts,  int waitlistCount)?  $default,) {final _that = this;
switch (_that) {
case _ComingSoonContent() when $default != null:
return $default(_that.mode,_that.launchAt,_that.title,_that.subtitle,_that.perks,_that.contacts,_that.waitlistCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComingSoonContent implements ComingSoonContent {
  const _ComingSoonContent({this.mode = StoreMode.comingSoon, this.launchAt, this.title = '', this.subtitle = '', final  List<String> perks = const <String>[], this.contacts = const StoreContacts(), this.waitlistCount = 0}): _perks = perks;
  factory _ComingSoonContent.fromJson(Map<String, dynamic> json) => _$ComingSoonContentFromJson(json);

@override@JsonKey() final  StoreMode mode;
@override final  DateTime? launchAt;
@override@JsonKey() final  String title;
@override@JsonKey() final  String subtitle;
 final  List<String> _perks;
@override@JsonKey() List<String> get perks {
  if (_perks is EqualUnmodifiableListView) return _perks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perks);
}

@override@JsonKey() final  StoreContacts contacts;
@override@JsonKey() final  int waitlistCount;

/// Create a copy of ComingSoonContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComingSoonContentCopyWith<_ComingSoonContent> get copyWith => __$ComingSoonContentCopyWithImpl<_ComingSoonContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComingSoonContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComingSoonContent&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.launchAt, launchAt) || other.launchAt == launchAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._perks, _perks)&&(identical(other.contacts, contacts) || other.contacts == contacts)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,launchAt,title,subtitle,const DeepCollectionEquality().hash(_perks),contacts,waitlistCount);

@override
String toString() {
  return 'ComingSoonContent(mode: $mode, launchAt: $launchAt, title: $title, subtitle: $subtitle, perks: $perks, contacts: $contacts, waitlistCount: $waitlistCount)';
}


}

/// @nodoc
abstract mixin class _$ComingSoonContentCopyWith<$Res> implements $ComingSoonContentCopyWith<$Res> {
  factory _$ComingSoonContentCopyWith(_ComingSoonContent value, $Res Function(_ComingSoonContent) _then) = __$ComingSoonContentCopyWithImpl;
@override @useResult
$Res call({
 StoreMode mode, DateTime? launchAt, String title, String subtitle, List<String> perks, StoreContacts contacts, int waitlistCount
});


@override $StoreContactsCopyWith<$Res> get contacts;

}
/// @nodoc
class __$ComingSoonContentCopyWithImpl<$Res>
    implements _$ComingSoonContentCopyWith<$Res> {
  __$ComingSoonContentCopyWithImpl(this._self, this._then);

  final _ComingSoonContent _self;
  final $Res Function(_ComingSoonContent) _then;

/// Create a copy of ComingSoonContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? launchAt = freezed,Object? title = null,Object? subtitle = null,Object? perks = null,Object? contacts = null,Object? waitlistCount = null,}) {
  return _then(_ComingSoonContent(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as StoreMode,launchAt: freezed == launchAt ? _self.launchAt : launchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,perks: null == perks ? _self._perks : perks // ignore: cast_nullable_to_non_nullable
as List<String>,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as StoreContacts,waitlistCount: null == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ComingSoonContent
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
mixin _$WaitlistCount {

 int get total; int get today;
/// Create a copy of WaitlistCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaitlistCountCopyWith<WaitlistCount> get copyWith => _$WaitlistCountCopyWithImpl<WaitlistCount>(this as WaitlistCount, _$identity);

  /// Serializes this WaitlistCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaitlistCount&&(identical(other.total, total) || other.total == total)&&(identical(other.today, today) || other.today == today));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,today);

@override
String toString() {
  return 'WaitlistCount(total: $total, today: $today)';
}


}

/// @nodoc
abstract mixin class $WaitlistCountCopyWith<$Res>  {
  factory $WaitlistCountCopyWith(WaitlistCount value, $Res Function(WaitlistCount) _then) = _$WaitlistCountCopyWithImpl;
@useResult
$Res call({
 int total, int today
});




}
/// @nodoc
class _$WaitlistCountCopyWithImpl<$Res>
    implements $WaitlistCountCopyWith<$Res> {
  _$WaitlistCountCopyWithImpl(this._self, this._then);

  final WaitlistCount _self;
  final $Res Function(WaitlistCount) _then;

/// Create a copy of WaitlistCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? today = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaitlistCount].
extension WaitlistCountPatterns on WaitlistCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaitlistCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaitlistCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaitlistCount value)  $default,){
final _that = this;
switch (_that) {
case _WaitlistCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaitlistCount value)?  $default,){
final _that = this;
switch (_that) {
case _WaitlistCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int today)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaitlistCount() when $default != null:
return $default(_that.total,_that.today);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int today)  $default,) {final _that = this;
switch (_that) {
case _WaitlistCount():
return $default(_that.total,_that.today);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int today)?  $default,) {final _that = this;
switch (_that) {
case _WaitlistCount() when $default != null:
return $default(_that.total,_that.today);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaitlistCount implements WaitlistCount {
  const _WaitlistCount({this.total = 0, this.today = 0});
  factory _WaitlistCount.fromJson(Map<String, dynamic> json) => _$WaitlistCountFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int today;

/// Create a copy of WaitlistCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaitlistCountCopyWith<_WaitlistCount> get copyWith => __$WaitlistCountCopyWithImpl<_WaitlistCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaitlistCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaitlistCount&&(identical(other.total, total) || other.total == total)&&(identical(other.today, today) || other.today == today));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,today);

@override
String toString() {
  return 'WaitlistCount(total: $total, today: $today)';
}


}

/// @nodoc
abstract mixin class _$WaitlistCountCopyWith<$Res> implements $WaitlistCountCopyWith<$Res> {
  factory _$WaitlistCountCopyWith(_WaitlistCount value, $Res Function(_WaitlistCount) _then) = __$WaitlistCountCopyWithImpl;
@override @useResult
$Res call({
 int total, int today
});




}
/// @nodoc
class __$WaitlistCountCopyWithImpl<$Res>
    implements _$WaitlistCountCopyWith<$Res> {
  __$WaitlistCountCopyWithImpl(this._self, this._then);

  final _WaitlistCount _self;
  final $Res Function(_WaitlistCount) _then;

/// Create a copy of WaitlistCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? today = null,}) {
  return _then(_WaitlistCount(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WaitlistJoined {

 int get position; int get total; bool get alreadyJoined;
/// Create a copy of WaitlistJoined
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaitlistJoinedCopyWith<WaitlistJoined> get copyWith => _$WaitlistJoinedCopyWithImpl<WaitlistJoined>(this as WaitlistJoined, _$identity);

  /// Serializes this WaitlistJoined to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaitlistJoined&&(identical(other.position, position) || other.position == position)&&(identical(other.total, total) || other.total == total)&&(identical(other.alreadyJoined, alreadyJoined) || other.alreadyJoined == alreadyJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,total,alreadyJoined);

@override
String toString() {
  return 'WaitlistJoined(position: $position, total: $total, alreadyJoined: $alreadyJoined)';
}


}

/// @nodoc
abstract mixin class $WaitlistJoinedCopyWith<$Res>  {
  factory $WaitlistJoinedCopyWith(WaitlistJoined value, $Res Function(WaitlistJoined) _then) = _$WaitlistJoinedCopyWithImpl;
@useResult
$Res call({
 int position, int total, bool alreadyJoined
});




}
/// @nodoc
class _$WaitlistJoinedCopyWithImpl<$Res>
    implements $WaitlistJoinedCopyWith<$Res> {
  _$WaitlistJoinedCopyWithImpl(this._self, this._then);

  final WaitlistJoined _self;
  final $Res Function(WaitlistJoined) _then;

/// Create a copy of WaitlistJoined
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? total = null,Object? alreadyJoined = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,alreadyJoined: null == alreadyJoined ? _self.alreadyJoined : alreadyJoined // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WaitlistJoined].
extension WaitlistJoinedPatterns on WaitlistJoined {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaitlistJoined value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaitlistJoined() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaitlistJoined value)  $default,){
final _that = this;
switch (_that) {
case _WaitlistJoined():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaitlistJoined value)?  $default,){
final _that = this;
switch (_that) {
case _WaitlistJoined() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  int total,  bool alreadyJoined)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaitlistJoined() when $default != null:
return $default(_that.position,_that.total,_that.alreadyJoined);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  int total,  bool alreadyJoined)  $default,) {final _that = this;
switch (_that) {
case _WaitlistJoined():
return $default(_that.position,_that.total,_that.alreadyJoined);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  int total,  bool alreadyJoined)?  $default,) {final _that = this;
switch (_that) {
case _WaitlistJoined() when $default != null:
return $default(_that.position,_that.total,_that.alreadyJoined);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaitlistJoined implements WaitlistJoined {
  const _WaitlistJoined({required this.position, required this.total, this.alreadyJoined = false});
  factory _WaitlistJoined.fromJson(Map<String, dynamic> json) => _$WaitlistJoinedFromJson(json);

@override final  int position;
@override final  int total;
@override@JsonKey() final  bool alreadyJoined;

/// Create a copy of WaitlistJoined
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaitlistJoinedCopyWith<_WaitlistJoined> get copyWith => __$WaitlistJoinedCopyWithImpl<_WaitlistJoined>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaitlistJoinedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaitlistJoined&&(identical(other.position, position) || other.position == position)&&(identical(other.total, total) || other.total == total)&&(identical(other.alreadyJoined, alreadyJoined) || other.alreadyJoined == alreadyJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,total,alreadyJoined);

@override
String toString() {
  return 'WaitlistJoined(position: $position, total: $total, alreadyJoined: $alreadyJoined)';
}


}

/// @nodoc
abstract mixin class _$WaitlistJoinedCopyWith<$Res> implements $WaitlistJoinedCopyWith<$Res> {
  factory _$WaitlistJoinedCopyWith(_WaitlistJoined value, $Res Function(_WaitlistJoined) _then) = __$WaitlistJoinedCopyWithImpl;
@override @useResult
$Res call({
 int position, int total, bool alreadyJoined
});




}
/// @nodoc
class __$WaitlistJoinedCopyWithImpl<$Res>
    implements _$WaitlistJoinedCopyWith<$Res> {
  __$WaitlistJoinedCopyWithImpl(this._self, this._then);

  final _WaitlistJoined _self;
  final $Res Function(_WaitlistJoined) _then;

/// Create a copy of WaitlistJoined
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? total = null,Object? alreadyJoined = null,}) {
  return _then(_WaitlistJoined(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,alreadyJoined: null == alreadyJoined ? _self.alreadyJoined : alreadyJoined // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
