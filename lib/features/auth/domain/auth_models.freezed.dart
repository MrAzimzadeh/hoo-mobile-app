// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponse {

 String? get sessionToken; DateTime get expiresAt; bool get isNewUser; Me get user;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionToken,expiresAt,isNewUser,user);

@override
String toString() {
  return 'AuthResponse(sessionToken: $sessionToken, expiresAt: $expiresAt, isNewUser: $isNewUser, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
 String? sessionToken, DateTime expiresAt, bool isNewUser, Me user
});


$MeCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionToken = freezed,Object? expiresAt = null,Object? isNewUser = null,Object? user = null,}) {
  return _then(_self.copyWith(
sessionToken: freezed == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Me,
  ));
}
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeCopyWith<$Res> get user {
  
  return $MeCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponse].
extension AuthResponsePatterns on AuthResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sessionToken,  DateTime expiresAt,  bool isNewUser,  Me user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.sessionToken,_that.expiresAt,_that.isNewUser,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sessionToken,  DateTime expiresAt,  bool isNewUser,  Me user)  $default,) {final _that = this;
switch (_that) {
case _AuthResponse():
return $default(_that.sessionToken,_that.expiresAt,_that.isNewUser,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sessionToken,  DateTime expiresAt,  bool isNewUser,  Me user)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.sessionToken,_that.expiresAt,_that.isNewUser,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({this.sessionToken, required this.expiresAt, this.isNewUser = false, required this.user});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override final  String? sessionToken;
@override final  DateTime expiresAt;
@override@JsonKey() final  bool isNewUser;
@override final  Me user;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionToken,expiresAt,isNewUser,user);

@override
String toString() {
  return 'AuthResponse(sessionToken: $sessionToken, expiresAt: $expiresAt, isNewUser: $isNewUser, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
 String? sessionToken, DateTime expiresAt, bool isNewUser, Me user
});


@override $MeCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionToken = freezed,Object? expiresAt = null,Object? isNewUser = null,Object? user = null,}) {
  return _then(_AuthResponse(
sessionToken: freezed == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Me,
  ));
}

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeCopyWith<$Res> get user {
  
  return $MeCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$OtpSent {

 int get resendAfterSeconds; int get expiresInSeconds; String get maskedPhone;
/// Create a copy of OtpSent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpSentCopyWith<OtpSent> get copyWith => _$OtpSentCopyWithImpl<OtpSent>(this as OtpSent, _$identity);

  /// Serializes this OtpSent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpSent&&(identical(other.resendAfterSeconds, resendAfterSeconds) || other.resendAfterSeconds == resendAfterSeconds)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.maskedPhone, maskedPhone) || other.maskedPhone == maskedPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resendAfterSeconds,expiresInSeconds,maskedPhone);

@override
String toString() {
  return 'OtpSent(resendAfterSeconds: $resendAfterSeconds, expiresInSeconds: $expiresInSeconds, maskedPhone: $maskedPhone)';
}


}

/// @nodoc
abstract mixin class $OtpSentCopyWith<$Res>  {
  factory $OtpSentCopyWith(OtpSent value, $Res Function(OtpSent) _then) = _$OtpSentCopyWithImpl;
@useResult
$Res call({
 int resendAfterSeconds, int expiresInSeconds, String maskedPhone
});




}
/// @nodoc
class _$OtpSentCopyWithImpl<$Res>
    implements $OtpSentCopyWith<$Res> {
  _$OtpSentCopyWithImpl(this._self, this._then);

  final OtpSent _self;
  final $Res Function(OtpSent) _then;

/// Create a copy of OtpSent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resendAfterSeconds = null,Object? expiresInSeconds = null,Object? maskedPhone = null,}) {
  return _then(_self.copyWith(
resendAfterSeconds: null == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,maskedPhone: null == maskedPhone ? _self.maskedPhone : maskedPhone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpSent].
extension OtpSentPatterns on OtpSent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpSent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpSent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpSent value)  $default,){
final _that = this;
switch (_that) {
case _OtpSent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpSent value)?  $default,){
final _that = this;
switch (_that) {
case _OtpSent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int resendAfterSeconds,  int expiresInSeconds,  String maskedPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpSent() when $default != null:
return $default(_that.resendAfterSeconds,_that.expiresInSeconds,_that.maskedPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int resendAfterSeconds,  int expiresInSeconds,  String maskedPhone)  $default,) {final _that = this;
switch (_that) {
case _OtpSent():
return $default(_that.resendAfterSeconds,_that.expiresInSeconds,_that.maskedPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int resendAfterSeconds,  int expiresInSeconds,  String maskedPhone)?  $default,) {final _that = this;
switch (_that) {
case _OtpSent() when $default != null:
return $default(_that.resendAfterSeconds,_that.expiresInSeconds,_that.maskedPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpSent implements OtpSent {
  const _OtpSent({this.resendAfterSeconds = 60, this.expiresInSeconds = 300, this.maskedPhone = ''});
  factory _OtpSent.fromJson(Map<String, dynamic> json) => _$OtpSentFromJson(json);

@override@JsonKey() final  int resendAfterSeconds;
@override@JsonKey() final  int expiresInSeconds;
@override@JsonKey() final  String maskedPhone;

/// Create a copy of OtpSent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpSentCopyWith<_OtpSent> get copyWith => __$OtpSentCopyWithImpl<_OtpSent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpSentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpSent&&(identical(other.resendAfterSeconds, resendAfterSeconds) || other.resendAfterSeconds == resendAfterSeconds)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.maskedPhone, maskedPhone) || other.maskedPhone == maskedPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resendAfterSeconds,expiresInSeconds,maskedPhone);

@override
String toString() {
  return 'OtpSent(resendAfterSeconds: $resendAfterSeconds, expiresInSeconds: $expiresInSeconds, maskedPhone: $maskedPhone)';
}


}

/// @nodoc
abstract mixin class _$OtpSentCopyWith<$Res> implements $OtpSentCopyWith<$Res> {
  factory _$OtpSentCopyWith(_OtpSent value, $Res Function(_OtpSent) _then) = __$OtpSentCopyWithImpl;
@override @useResult
$Res call({
 int resendAfterSeconds, int expiresInSeconds, String maskedPhone
});




}
/// @nodoc
class __$OtpSentCopyWithImpl<$Res>
    implements _$OtpSentCopyWith<$Res> {
  __$OtpSentCopyWithImpl(this._self, this._then);

  final _OtpSent _self;
  final $Res Function(_OtpSent) _then;

/// Create a copy of OtpSent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resendAfterSeconds = null,Object? expiresInSeconds = null,Object? maskedPhone = null,}) {
  return _then(_OtpSent(
resendAfterSeconds: null == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,maskedPhone: null == maskedPhone ? _self.maskedPhone : maskedPhone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LoginRequest {

 String get identifier; String get password; bool get rememberMe;
/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<LoginRequest> get copyWith => _$LoginRequestCopyWithImpl<LoginRequest>(this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequest&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.password, password) || other.password == password)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identifier,password,rememberMe);

@override
String toString() {
  return 'LoginRequest(identifier: $identifier, password: $password, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res>  {
  factory $LoginRequestCopyWith(LoginRequest value, $Res Function(LoginRequest) _then) = _$LoginRequestCopyWithImpl;
@useResult
$Res call({
 String identifier, String password, bool rememberMe
});




}
/// @nodoc
class _$LoginRequestCopyWithImpl<$Res>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identifier = null,Object? password = null,Object? rememberMe = null,}) {
  return _then(_self.copyWith(
identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String identifier,  String password,  bool rememberMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.identifier,_that.password,_that.rememberMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String identifier,  String password,  bool rememberMe)  $default,) {final _that = this;
switch (_that) {
case _LoginRequest():
return $default(_that.identifier,_that.password,_that.rememberMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String identifier,  String password,  bool rememberMe)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.identifier,_that.password,_that.rememberMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _LoginRequest implements LoginRequest {
  const _LoginRequest({required this.identifier, required this.password, this.rememberMe = true});
  

@override final  String identifier;
@override final  String password;
@override@JsonKey() final  bool rememberMe;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.password, password) || other.password == password)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identifier,password,rememberMe);

@override
String toString() {
  return 'LoginRequest(identifier: $identifier, password: $password, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String identifier, String password, bool rememberMe
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identifier = null,Object? password = null,Object? rememberMe = null,}) {
  return _then(_LoginRequest(
identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$RegisterRequest {

 String get fullName; String get email; String get password; String? get phone; AppLanguage? get language; bool get marketingConsent; bool get acceptTerms; bool get rememberMe;
/// Create a copy of RegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRequestCopyWith<RegisterRequest> get copyWith => _$RegisterRequestCopyWithImpl<RegisterRequest>(this as RegisterRequest, _$identity);

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.language, language) || other.language == language)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,password,phone,language,marketingConsent,acceptTerms,rememberMe);

@override
String toString() {
  return 'RegisterRequest(fullName: $fullName, email: $email, password: $password, phone: $phone, language: $language, marketingConsent: $marketingConsent, acceptTerms: $acceptTerms, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class $RegisterRequestCopyWith<$Res>  {
  factory $RegisterRequestCopyWith(RegisterRequest value, $Res Function(RegisterRequest) _then) = _$RegisterRequestCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String password, String? phone, AppLanguage? language, bool marketingConsent, bool acceptTerms, bool rememberMe
});




}
/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._self, this._then);

  final RegisterRequest _self;
  final $Res Function(RegisterRequest) _then;

/// Create a copy of RegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? password = null,Object? phone = freezed,Object? language = freezed,Object? marketingConsent = null,Object? acceptTerms = null,Object? rememberMe = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage?,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterRequest].
extension RegisterRequestPatterns on RegisterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _RegisterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String email,  String password,  String? phone,  AppLanguage? language,  bool marketingConsent,  bool acceptTerms,  bool rememberMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterRequest() when $default != null:
return $default(_that.fullName,_that.email,_that.password,_that.phone,_that.language,_that.marketingConsent,_that.acceptTerms,_that.rememberMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String email,  String password,  String? phone,  AppLanguage? language,  bool marketingConsent,  bool acceptTerms,  bool rememberMe)  $default,) {final _that = this;
switch (_that) {
case _RegisterRequest():
return $default(_that.fullName,_that.email,_that.password,_that.phone,_that.language,_that.marketingConsent,_that.acceptTerms,_that.rememberMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String email,  String password,  String? phone,  AppLanguage? language,  bool marketingConsent,  bool acceptTerms,  bool rememberMe)?  $default,) {final _that = this;
switch (_that) {
case _RegisterRequest() when $default != null:
return $default(_that.fullName,_that.email,_that.password,_that.phone,_that.language,_that.marketingConsent,_that.acceptTerms,_that.rememberMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _RegisterRequest implements RegisterRequest {
  const _RegisterRequest({required this.fullName, required this.email, required this.password, this.phone, this.language, this.marketingConsent = false, this.acceptTerms = false, this.rememberMe = true});
  

@override final  String fullName;
@override final  String email;
@override final  String password;
@override final  String? phone;
@override final  AppLanguage? language;
@override@JsonKey() final  bool marketingConsent;
@override@JsonKey() final  bool acceptTerms;
@override@JsonKey() final  bool rememberMe;

/// Create a copy of RegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterRequestCopyWith<_RegisterRequest> get copyWith => __$RegisterRequestCopyWithImpl<_RegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.language, language) || other.language == language)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,password,phone,language,marketingConsent,acceptTerms,rememberMe);

@override
String toString() {
  return 'RegisterRequest(fullName: $fullName, email: $email, password: $password, phone: $phone, language: $language, marketingConsent: $marketingConsent, acceptTerms: $acceptTerms, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class _$RegisterRequestCopyWith<$Res> implements $RegisterRequestCopyWith<$Res> {
  factory _$RegisterRequestCopyWith(_RegisterRequest value, $Res Function(_RegisterRequest) _then) = __$RegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String email, String password, String? phone, AppLanguage? language, bool marketingConsent, bool acceptTerms, bool rememberMe
});




}
/// @nodoc
class __$RegisterRequestCopyWithImpl<$Res>
    implements _$RegisterRequestCopyWith<$Res> {
  __$RegisterRequestCopyWithImpl(this._self, this._then);

  final _RegisterRequest _self;
  final $Res Function(_RegisterRequest) _then;

/// Create a copy of RegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? password = null,Object? phone = freezed,Object? language = freezed,Object? marketingConsent = null,Object? acceptTerms = null,Object? rememberMe = null,}) {
  return _then(_RegisterRequest(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage?,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SendOtpRequest {

 String get phone; OtpPurpose get purpose; OtpChannel get channel;
/// Create a copy of SendOtpRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpRequestCopyWith<SendOtpRequest> get copyWith => _$SendOtpRequestCopyWithImpl<SendOtpRequest>(this as SendOtpRequest, _$identity);

  /// Serializes this SendOtpRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.channel, channel) || other.channel == channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,purpose,channel);

@override
String toString() {
  return 'SendOtpRequest(phone: $phone, purpose: $purpose, channel: $channel)';
}


}

/// @nodoc
abstract mixin class $SendOtpRequestCopyWith<$Res>  {
  factory $SendOtpRequestCopyWith(SendOtpRequest value, $Res Function(SendOtpRequest) _then) = _$SendOtpRequestCopyWithImpl;
@useResult
$Res call({
 String phone, OtpPurpose purpose, OtpChannel channel
});




}
/// @nodoc
class _$SendOtpRequestCopyWithImpl<$Res>
    implements $SendOtpRequestCopyWith<$Res> {
  _$SendOtpRequestCopyWithImpl(this._self, this._then);

  final SendOtpRequest _self;
  final $Res Function(SendOtpRequest) _then;

/// Create a copy of SendOtpRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? purpose = null,Object? channel = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as OtpChannel,
  ));
}

}


/// Adds pattern-matching-related methods to [SendOtpRequest].
extension SendOtpRequestPatterns on SendOtpRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendOtpRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOtpRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendOtpRequest value)  $default,){
final _that = this;
switch (_that) {
case _SendOtpRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendOtpRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SendOtpRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  OtpPurpose purpose,  OtpChannel channel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOtpRequest() when $default != null:
return $default(_that.phone,_that.purpose,_that.channel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  OtpPurpose purpose,  OtpChannel channel)  $default,) {final _that = this;
switch (_that) {
case _SendOtpRequest():
return $default(_that.phone,_that.purpose,_that.channel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  OtpPurpose purpose,  OtpChannel channel)?  $default,) {final _that = this;
switch (_that) {
case _SendOtpRequest() when $default != null:
return $default(_that.phone,_that.purpose,_that.channel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _SendOtpRequest implements SendOtpRequest {
  const _SendOtpRequest({required this.phone, this.purpose = OtpPurpose.login, this.channel = OtpChannel.sms});
  

@override final  String phone;
@override@JsonKey() final  OtpPurpose purpose;
@override@JsonKey() final  OtpChannel channel;

/// Create a copy of SendOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpRequestCopyWith<_SendOtpRequest> get copyWith => __$SendOtpRequestCopyWithImpl<_SendOtpRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOtpRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtpRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.channel, channel) || other.channel == channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,purpose,channel);

@override
String toString() {
  return 'SendOtpRequest(phone: $phone, purpose: $purpose, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$SendOtpRequestCopyWith<$Res> implements $SendOtpRequestCopyWith<$Res> {
  factory _$SendOtpRequestCopyWith(_SendOtpRequest value, $Res Function(_SendOtpRequest) _then) = __$SendOtpRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone, OtpPurpose purpose, OtpChannel channel
});




}
/// @nodoc
class __$SendOtpRequestCopyWithImpl<$Res>
    implements _$SendOtpRequestCopyWith<$Res> {
  __$SendOtpRequestCopyWithImpl(this._self, this._then);

  final _SendOtpRequest _self;
  final $Res Function(_SendOtpRequest) _then;

/// Create a copy of SendOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? purpose = null,Object? channel = null,}) {
  return _then(_SendOtpRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as OtpChannel,
  ));
}


}

/// @nodoc
mixin _$VerifyOtpRequest {

 String get phone; String get code; String? get fullName; bool get acceptTerms; bool get marketingConsent; bool get rememberMe;
/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith => _$VerifyOtpRequestCopyWithImpl<VerifyOtpRequest>(this as VerifyOtpRequest, _$identity);

  /// Serializes this VerifyOtpRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.code, code) || other.code == code)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,code,fullName,acceptTerms,marketingConsent,rememberMe);

@override
String toString() {
  return 'VerifyOtpRequest(phone: $phone, code: $code, fullName: $fullName, acceptTerms: $acceptTerms, marketingConsent: $marketingConsent, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpRequestCopyWith<$Res>  {
  factory $VerifyOtpRequestCopyWith(VerifyOtpRequest value, $Res Function(VerifyOtpRequest) _then) = _$VerifyOtpRequestCopyWithImpl;
@useResult
$Res call({
 String phone, String code, String? fullName, bool acceptTerms, bool marketingConsent, bool rememberMe
});




}
/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final VerifyOtpRequest _self;
  final $Res Function(VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? code = null,Object? fullName = freezed,Object? acceptTerms = null,Object? marketingConsent = null,Object? rememberMe = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpRequest].
extension VerifyOtpRequestPatterns on VerifyOtpRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpRequest value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String code,  String? fullName,  bool acceptTerms,  bool marketingConsent,  bool rememberMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
return $default(_that.phone,_that.code,_that.fullName,_that.acceptTerms,_that.marketingConsent,_that.rememberMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String code,  String? fullName,  bool acceptTerms,  bool marketingConsent,  bool rememberMe)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequest():
return $default(_that.phone,_that.code,_that.fullName,_that.acceptTerms,_that.marketingConsent,_that.rememberMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String code,  String? fullName,  bool acceptTerms,  bool marketingConsent,  bool rememberMe)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
return $default(_that.phone,_that.code,_that.fullName,_that.acceptTerms,_that.marketingConsent,_that.rememberMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _VerifyOtpRequest implements VerifyOtpRequest {
  const _VerifyOtpRequest({required this.phone, required this.code, this.fullName, this.acceptTerms = false, this.marketingConsent = false, this.rememberMe = true});
  

@override final  String phone;
@override final  String code;
@override final  String? fullName;
@override@JsonKey() final  bool acceptTerms;
@override@JsonKey() final  bool marketingConsent;
@override@JsonKey() final  bool rememberMe;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpRequestCopyWith<_VerifyOtpRequest> get copyWith => __$VerifyOtpRequestCopyWithImpl<_VerifyOtpRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.code, code) || other.code == code)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms)&&(identical(other.marketingConsent, marketingConsent) || other.marketingConsent == marketingConsent)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,code,fullName,acceptTerms,marketingConsent,rememberMe);

@override
String toString() {
  return 'VerifyOtpRequest(phone: $phone, code: $code, fullName: $fullName, acceptTerms: $acceptTerms, marketingConsent: $marketingConsent, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpRequestCopyWith<$Res> implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$VerifyOtpRequestCopyWith(_VerifyOtpRequest value, $Res Function(_VerifyOtpRequest) _then) = __$VerifyOtpRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone, String code, String? fullName, bool acceptTerms, bool marketingConsent, bool rememberMe
});




}
/// @nodoc
class __$VerifyOtpRequestCopyWithImpl<$Res>
    implements _$VerifyOtpRequestCopyWith<$Res> {
  __$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final _VerifyOtpRequest _self;
  final $Res Function(_VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? code = null,Object? fullName = freezed,Object? acceptTerms = null,Object? marketingConsent = null,Object? rememberMe = null,}) {
  return _then(_VerifyOtpRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,marketingConsent: null == marketingConsent ? _self.marketingConsent : marketingConsent // ignore: cast_nullable_to_non_nullable
as bool,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$GoogleLoginRequest {

 String get idToken; bool get rememberMe; bool get acceptTerms;
/// Create a copy of GoogleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleLoginRequestCopyWith<GoogleLoginRequest> get copyWith => _$GoogleLoginRequestCopyWithImpl<GoogleLoginRequest>(this as GoogleLoginRequest, _$identity);

  /// Serializes this GoogleLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleLoginRequest&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idToken,rememberMe,acceptTerms);

@override
String toString() {
  return 'GoogleLoginRequest(idToken: $idToken, rememberMe: $rememberMe, acceptTerms: $acceptTerms)';
}


}

/// @nodoc
abstract mixin class $GoogleLoginRequestCopyWith<$Res>  {
  factory $GoogleLoginRequestCopyWith(GoogleLoginRequest value, $Res Function(GoogleLoginRequest) _then) = _$GoogleLoginRequestCopyWithImpl;
@useResult
$Res call({
 String idToken, bool rememberMe, bool acceptTerms
});




}
/// @nodoc
class _$GoogleLoginRequestCopyWithImpl<$Res>
    implements $GoogleLoginRequestCopyWith<$Res> {
  _$GoogleLoginRequestCopyWithImpl(this._self, this._then);

  final GoogleLoginRequest _self;
  final $Res Function(GoogleLoginRequest) _then;

/// Create a copy of GoogleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,Object? rememberMe = null,Object? acceptTerms = null,}) {
  return _then(_self.copyWith(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleLoginRequest].
extension GoogleLoginRequestPatterns on GoogleLoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleLoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleLoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleLoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _GoogleLoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleLoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleLoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String idToken,  bool rememberMe,  bool acceptTerms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleLoginRequest() when $default != null:
return $default(_that.idToken,_that.rememberMe,_that.acceptTerms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String idToken,  bool rememberMe,  bool acceptTerms)  $default,) {final _that = this;
switch (_that) {
case _GoogleLoginRequest():
return $default(_that.idToken,_that.rememberMe,_that.acceptTerms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String idToken,  bool rememberMe,  bool acceptTerms)?  $default,) {final _that = this;
switch (_that) {
case _GoogleLoginRequest() when $default != null:
return $default(_that.idToken,_that.rememberMe,_that.acceptTerms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _GoogleLoginRequest implements GoogleLoginRequest {
  const _GoogleLoginRequest({required this.idToken, this.rememberMe = true, this.acceptTerms = false});
  

@override final  String idToken;
@override@JsonKey() final  bool rememberMe;
@override@JsonKey() final  bool acceptTerms;

/// Create a copy of GoogleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleLoginRequestCopyWith<_GoogleLoginRequest> get copyWith => __$GoogleLoginRequestCopyWithImpl<_GoogleLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleLoginRequest&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idToken,rememberMe,acceptTerms);

@override
String toString() {
  return 'GoogleLoginRequest(idToken: $idToken, rememberMe: $rememberMe, acceptTerms: $acceptTerms)';
}


}

/// @nodoc
abstract mixin class _$GoogleLoginRequestCopyWith<$Res> implements $GoogleLoginRequestCopyWith<$Res> {
  factory _$GoogleLoginRequestCopyWith(_GoogleLoginRequest value, $Res Function(_GoogleLoginRequest) _then) = __$GoogleLoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String idToken, bool rememberMe, bool acceptTerms
});




}
/// @nodoc
class __$GoogleLoginRequestCopyWithImpl<$Res>
    implements _$GoogleLoginRequestCopyWith<$Res> {
  __$GoogleLoginRequestCopyWithImpl(this._self, this._then);

  final _GoogleLoginRequest _self;
  final $Res Function(_GoogleLoginRequest) _then;

/// Create a copy of GoogleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,Object? rememberMe = null,Object? acceptTerms = null,}) {
  return _then(_GoogleLoginRequest(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AppleLoginRequest {

 String get identityToken; String? get fullName; bool get rememberMe; bool get acceptTerms;
/// Create a copy of AppleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppleLoginRequestCopyWith<AppleLoginRequest> get copyWith => _$AppleLoginRequestCopyWithImpl<AppleLoginRequest>(this as AppleLoginRequest, _$identity);

  /// Serializes this AppleLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppleLoginRequest&&(identical(other.identityToken, identityToken) || other.identityToken == identityToken)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identityToken,fullName,rememberMe,acceptTerms);

@override
String toString() {
  return 'AppleLoginRequest(identityToken: $identityToken, fullName: $fullName, rememberMe: $rememberMe, acceptTerms: $acceptTerms)';
}


}

/// @nodoc
abstract mixin class $AppleLoginRequestCopyWith<$Res>  {
  factory $AppleLoginRequestCopyWith(AppleLoginRequest value, $Res Function(AppleLoginRequest) _then) = _$AppleLoginRequestCopyWithImpl;
@useResult
$Res call({
 String identityToken, String? fullName, bool rememberMe, bool acceptTerms
});




}
/// @nodoc
class _$AppleLoginRequestCopyWithImpl<$Res>
    implements $AppleLoginRequestCopyWith<$Res> {
  _$AppleLoginRequestCopyWithImpl(this._self, this._then);

  final AppleLoginRequest _self;
  final $Res Function(AppleLoginRequest) _then;

/// Create a copy of AppleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identityToken = null,Object? fullName = freezed,Object? rememberMe = null,Object? acceptTerms = null,}) {
  return _then(_self.copyWith(
identityToken: null == identityToken ? _self.identityToken : identityToken // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppleLoginRequest].
extension AppleLoginRequestPatterns on AppleLoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppleLoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppleLoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppleLoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _AppleLoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppleLoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AppleLoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String identityToken,  String? fullName,  bool rememberMe,  bool acceptTerms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppleLoginRequest() when $default != null:
return $default(_that.identityToken,_that.fullName,_that.rememberMe,_that.acceptTerms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String identityToken,  String? fullName,  bool rememberMe,  bool acceptTerms)  $default,) {final _that = this;
switch (_that) {
case _AppleLoginRequest():
return $default(_that.identityToken,_that.fullName,_that.rememberMe,_that.acceptTerms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String identityToken,  String? fullName,  bool rememberMe,  bool acceptTerms)?  $default,) {final _that = this;
switch (_that) {
case _AppleLoginRequest() when $default != null:
return $default(_that.identityToken,_that.fullName,_that.rememberMe,_that.acceptTerms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _AppleLoginRequest implements AppleLoginRequest {
  const _AppleLoginRequest({required this.identityToken, this.fullName, this.rememberMe = true, this.acceptTerms = false});
  

@override final  String identityToken;
@override final  String? fullName;
@override@JsonKey() final  bool rememberMe;
@override@JsonKey() final  bool acceptTerms;

/// Create a copy of AppleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppleLoginRequestCopyWith<_AppleLoginRequest> get copyWith => __$AppleLoginRequestCopyWithImpl<_AppleLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppleLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppleLoginRequest&&(identical(other.identityToken, identityToken) || other.identityToken == identityToken)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe)&&(identical(other.acceptTerms, acceptTerms) || other.acceptTerms == acceptTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identityToken,fullName,rememberMe,acceptTerms);

@override
String toString() {
  return 'AppleLoginRequest(identityToken: $identityToken, fullName: $fullName, rememberMe: $rememberMe, acceptTerms: $acceptTerms)';
}


}

/// @nodoc
abstract mixin class _$AppleLoginRequestCopyWith<$Res> implements $AppleLoginRequestCopyWith<$Res> {
  factory _$AppleLoginRequestCopyWith(_AppleLoginRequest value, $Res Function(_AppleLoginRequest) _then) = __$AppleLoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String identityToken, String? fullName, bool rememberMe, bool acceptTerms
});




}
/// @nodoc
class __$AppleLoginRequestCopyWithImpl<$Res>
    implements _$AppleLoginRequestCopyWith<$Res> {
  __$AppleLoginRequestCopyWithImpl(this._self, this._then);

  final _AppleLoginRequest _self;
  final $Res Function(_AppleLoginRequest) _then;

/// Create a copy of AppleLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identityToken = null,Object? fullName = freezed,Object? rememberMe = null,Object? acceptTerms = null,}) {
  return _then(_AppleLoginRequest(
identityToken: null == identityToken ? _self.identityToken : identityToken // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,acceptTerms: null == acceptTerms ? _self.acceptTerms : acceptTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ResetPasswordRequest {

 String get identifier; String get token; String get newPassword;
/// Create a copy of ResetPasswordRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordRequestCopyWith<ResetPasswordRequest> get copyWith => _$ResetPasswordRequestCopyWithImpl<ResetPasswordRequest>(this as ResetPasswordRequest, _$identity);

  /// Serializes this ResetPasswordRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordRequest&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.token, token) || other.token == token)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identifier,token,newPassword);

@override
String toString() {
  return 'ResetPasswordRequest(identifier: $identifier, token: $token, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordRequestCopyWith<$Res>  {
  factory $ResetPasswordRequestCopyWith(ResetPasswordRequest value, $Res Function(ResetPasswordRequest) _then) = _$ResetPasswordRequestCopyWithImpl;
@useResult
$Res call({
 String identifier, String token, String newPassword
});




}
/// @nodoc
class _$ResetPasswordRequestCopyWithImpl<$Res>
    implements $ResetPasswordRequestCopyWith<$Res> {
  _$ResetPasswordRequestCopyWithImpl(this._self, this._then);

  final ResetPasswordRequest _self;
  final $Res Function(ResetPasswordRequest) _then;

/// Create a copy of ResetPasswordRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identifier = null,Object? token = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordRequest].
extension ResetPasswordRequestPatterns on ResetPasswordRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordRequest value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String identifier,  String token,  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordRequest() when $default != null:
return $default(_that.identifier,_that.token,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String identifier,  String token,  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordRequest():
return $default(_that.identifier,_that.token,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String identifier,  String token,  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordRequest() when $default != null:
return $default(_that.identifier,_that.token,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ResetPasswordRequest implements ResetPasswordRequest {
  const _ResetPasswordRequest({required this.identifier, required this.token, required this.newPassword});
  

@override final  String identifier;
@override final  String token;
@override final  String newPassword;

/// Create a copy of ResetPasswordRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordRequestCopyWith<_ResetPasswordRequest> get copyWith => __$ResetPasswordRequestCopyWithImpl<_ResetPasswordRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordRequest&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.token, token) || other.token == token)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identifier,token,newPassword);

@override
String toString() {
  return 'ResetPasswordRequest(identifier: $identifier, token: $token, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordRequestCopyWith<$Res> implements $ResetPasswordRequestCopyWith<$Res> {
  factory _$ResetPasswordRequestCopyWith(_ResetPasswordRequest value, $Res Function(_ResetPasswordRequest) _then) = __$ResetPasswordRequestCopyWithImpl;
@override @useResult
$Res call({
 String identifier, String token, String newPassword
});




}
/// @nodoc
class __$ResetPasswordRequestCopyWithImpl<$Res>
    implements _$ResetPasswordRequestCopyWith<$Res> {
  __$ResetPasswordRequestCopyWithImpl(this._self, this._then);

  final _ResetPasswordRequest _self;
  final $Res Function(_ResetPasswordRequest) _then;

/// Create a copy of ResetPasswordRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identifier = null,Object? token = null,Object? newPassword = null,}) {
  return _then(_ResetPasswordRequest(
identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
