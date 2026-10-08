// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

/// The text currently in the field.
 String get query; SearchView get view; List<String> get recent; List<String> get suggestions; List<ProductCard> get bestsellers; SearchStatus get bestsellersStatus; Object? get bestsellersError;/// Bestsellers came from the offline cache.
 bool get bestsellersStale;/// The query the results belong to.
 String get submittedQuery; SearchStatus get resultsStatus; SearchResult? get result;/// Requested `limit` of the current result (the API is not paged: "load more" asks for a bigger limit).
 int get limit; bool get loadingMore;/// Why the last search failed (rendered by the error state).
 Object? get error;/// One-shot failure of a secondary action (clear recent, load more) — shown as a toast. [actionErrorId]
/// changes with every new failure so listeners fire even for equal errors.
 Object? get actionError; int get actionErrorId;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other.recent, recent)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&const DeepCollectionEquality().equals(other.bestsellers, bestsellers)&&(identical(other.bestsellersStatus, bestsellersStatus) || other.bestsellersStatus == bestsellersStatus)&&const DeepCollectionEquality().equals(other.bestsellersError, bestsellersError)&&(identical(other.bestsellersStale, bestsellersStale) || other.bestsellersStale == bestsellersStale)&&(identical(other.submittedQuery, submittedQuery) || other.submittedQuery == submittedQuery)&&(identical(other.resultsStatus, resultsStatus) || other.resultsStatus == resultsStatus)&&(identical(other.result, result) || other.result == result)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.actionError, actionError)&&(identical(other.actionErrorId, actionErrorId) || other.actionErrorId == actionErrorId));
}


@override
int get hashCode => Object.hash(runtimeType,query,view,const DeepCollectionEquality().hash(recent),const DeepCollectionEquality().hash(suggestions),const DeepCollectionEquality().hash(bestsellers),bestsellersStatus,const DeepCollectionEquality().hash(bestsellersError),bestsellersStale,submittedQuery,resultsStatus,result,limit,loadingMore,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(actionError),actionErrorId);

@override
String toString() {
  return 'SearchState(query: $query, view: $view, recent: $recent, suggestions: $suggestions, bestsellers: $bestsellers, bestsellersStatus: $bestsellersStatus, bestsellersError: $bestsellersError, bestsellersStale: $bestsellersStale, submittedQuery: $submittedQuery, resultsStatus: $resultsStatus, result: $result, limit: $limit, loadingMore: $loadingMore, error: $error, actionError: $actionError, actionErrorId: $actionErrorId)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, SearchView view, List<String> recent, List<String> suggestions, List<ProductCard> bestsellers, SearchStatus bestsellersStatus, Object? bestsellersError, bool bestsellersStale, String submittedQuery, SearchStatus resultsStatus, SearchResult? result, int limit, bool loadingMore, Object? error, Object? actionError, int actionErrorId
});


$SearchResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? view = null,Object? recent = null,Object? suggestions = null,Object? bestsellers = null,Object? bestsellersStatus = null,Object? bestsellersError = freezed,Object? bestsellersStale = null,Object? submittedQuery = null,Object? resultsStatus = null,Object? result = freezed,Object? limit = null,Object? loadingMore = null,Object? error = freezed,Object? actionError = freezed,Object? actionErrorId = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as SearchView,recent: null == recent ? _self.recent : recent // ignore: cast_nullable_to_non_nullable
as List<String>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,bestsellers: null == bestsellers ? _self.bestsellers : bestsellers // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,bestsellersStatus: null == bestsellersStatus ? _self.bestsellersStatus : bestsellersStatus // ignore: cast_nullable_to_non_nullable
as SearchStatus,bestsellersError: freezed == bestsellersError ? _self.bestsellersError : bestsellersError ,bestsellersStale: null == bestsellersStale ? _self.bestsellersStale : bestsellersStale // ignore: cast_nullable_to_non_nullable
as bool,submittedQuery: null == submittedQuery ? _self.submittedQuery : submittedQuery // ignore: cast_nullable_to_non_nullable
as String,resultsStatus: null == resultsStatus ? _self.resultsStatus : resultsStatus // ignore: cast_nullable_to_non_nullable
as SearchStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SearchResult?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,actionError: freezed == actionError ? _self.actionError : actionError ,actionErrorId: null == actionErrorId ? _self.actionErrorId : actionErrorId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $SearchResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  SearchView view,  List<String> recent,  List<String> suggestions,  List<ProductCard> bestsellers,  SearchStatus bestsellersStatus,  Object? bestsellersError,  bool bestsellersStale,  String submittedQuery,  SearchStatus resultsStatus,  SearchResult? result,  int limit,  bool loadingMore,  Object? error,  Object? actionError,  int actionErrorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.view,_that.recent,_that.suggestions,_that.bestsellers,_that.bestsellersStatus,_that.bestsellersError,_that.bestsellersStale,_that.submittedQuery,_that.resultsStatus,_that.result,_that.limit,_that.loadingMore,_that.error,_that.actionError,_that.actionErrorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  SearchView view,  List<String> recent,  List<String> suggestions,  List<ProductCard> bestsellers,  SearchStatus bestsellersStatus,  Object? bestsellersError,  bool bestsellersStale,  String submittedQuery,  SearchStatus resultsStatus,  SearchResult? result,  int limit,  bool loadingMore,  Object? error,  Object? actionError,  int actionErrorId)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.view,_that.recent,_that.suggestions,_that.bestsellers,_that.bestsellersStatus,_that.bestsellersError,_that.bestsellersStale,_that.submittedQuery,_that.resultsStatus,_that.result,_that.limit,_that.loadingMore,_that.error,_that.actionError,_that.actionErrorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  SearchView view,  List<String> recent,  List<String> suggestions,  List<ProductCard> bestsellers,  SearchStatus bestsellersStatus,  Object? bestsellersError,  bool bestsellersStale,  String submittedQuery,  SearchStatus resultsStatus,  SearchResult? result,  int limit,  bool loadingMore,  Object? error,  Object? actionError,  int actionErrorId)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.view,_that.recent,_that.suggestions,_that.bestsellers,_that.bestsellersStatus,_that.bestsellersError,_that.bestsellersStale,_that.submittedQuery,_that.resultsStatus,_that.result,_that.limit,_that.loadingMore,_that.error,_that.actionError,_that.actionErrorId);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends SearchState {
  const _SearchState({this.query = '', this.view = SearchView.idle, final  List<String> recent = const <String>[], final  List<String> suggestions = const <String>[], final  List<ProductCard> bestsellers = const <ProductCard>[], this.bestsellersStatus = SearchStatus.initial, this.bestsellersError, this.bestsellersStale = false, this.submittedQuery = '', this.resultsStatus = SearchStatus.initial, this.result, this.limit = SearchBloc.pageSize, this.loadingMore = false, this.error, this.actionError, this.actionErrorId = 0}): _recent = recent,_suggestions = suggestions,_bestsellers = bestsellers,super._();
  

/// The text currently in the field.
@override@JsonKey() final  String query;
@override@JsonKey() final  SearchView view;
 final  List<String> _recent;
@override@JsonKey() List<String> get recent {
  if (_recent is EqualUnmodifiableListView) return _recent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recent);
}

 final  List<String> _suggestions;
@override@JsonKey() List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

 final  List<ProductCard> _bestsellers;
@override@JsonKey() List<ProductCard> get bestsellers {
  if (_bestsellers is EqualUnmodifiableListView) return _bestsellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestsellers);
}

@override@JsonKey() final  SearchStatus bestsellersStatus;
@override final  Object? bestsellersError;
/// Bestsellers came from the offline cache.
@override@JsonKey() final  bool bestsellersStale;
/// The query the results belong to.
@override@JsonKey() final  String submittedQuery;
@override@JsonKey() final  SearchStatus resultsStatus;
@override final  SearchResult? result;
/// Requested `limit` of the current result (the API is not paged: "load more" asks for a bigger limit).
@override@JsonKey() final  int limit;
@override@JsonKey() final  bool loadingMore;
/// Why the last search failed (rendered by the error state).
@override final  Object? error;
/// One-shot failure of a secondary action (clear recent, load more) — shown as a toast. [actionErrorId]
/// changes with every new failure so listeners fire even for equal errors.
@override final  Object? actionError;
@override@JsonKey() final  int actionErrorId;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other._recent, _recent)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&const DeepCollectionEquality().equals(other._bestsellers, _bestsellers)&&(identical(other.bestsellersStatus, bestsellersStatus) || other.bestsellersStatus == bestsellersStatus)&&const DeepCollectionEquality().equals(other.bestsellersError, bestsellersError)&&(identical(other.bestsellersStale, bestsellersStale) || other.bestsellersStale == bestsellersStale)&&(identical(other.submittedQuery, submittedQuery) || other.submittedQuery == submittedQuery)&&(identical(other.resultsStatus, resultsStatus) || other.resultsStatus == resultsStatus)&&(identical(other.result, result) || other.result == result)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other.actionError, actionError)&&(identical(other.actionErrorId, actionErrorId) || other.actionErrorId == actionErrorId));
}


@override
int get hashCode => Object.hash(runtimeType,query,view,const DeepCollectionEquality().hash(_recent),const DeepCollectionEquality().hash(_suggestions),const DeepCollectionEquality().hash(_bestsellers),bestsellersStatus,const DeepCollectionEquality().hash(bestsellersError),bestsellersStale,submittedQuery,resultsStatus,result,limit,loadingMore,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(actionError),actionErrorId);

@override
String toString() {
  return 'SearchState(query: $query, view: $view, recent: $recent, suggestions: $suggestions, bestsellers: $bestsellers, bestsellersStatus: $bestsellersStatus, bestsellersError: $bestsellersError, bestsellersStale: $bestsellersStale, submittedQuery: $submittedQuery, resultsStatus: $resultsStatus, result: $result, limit: $limit, loadingMore: $loadingMore, error: $error, actionError: $actionError, actionErrorId: $actionErrorId)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, SearchView view, List<String> recent, List<String> suggestions, List<ProductCard> bestsellers, SearchStatus bestsellersStatus, Object? bestsellersError, bool bestsellersStale, String submittedQuery, SearchStatus resultsStatus, SearchResult? result, int limit, bool loadingMore, Object? error, Object? actionError, int actionErrorId
});


@override $SearchResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? view = null,Object? recent = null,Object? suggestions = null,Object? bestsellers = null,Object? bestsellersStatus = null,Object? bestsellersError = freezed,Object? bestsellersStale = null,Object? submittedQuery = null,Object? resultsStatus = null,Object? result = freezed,Object? limit = null,Object? loadingMore = null,Object? error = freezed,Object? actionError = freezed,Object? actionErrorId = null,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as SearchView,recent: null == recent ? _self._recent : recent // ignore: cast_nullable_to_non_nullable
as List<String>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,bestsellers: null == bestsellers ? _self._bestsellers : bestsellers // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,bestsellersStatus: null == bestsellersStatus ? _self.bestsellersStatus : bestsellersStatus // ignore: cast_nullable_to_non_nullable
as SearchStatus,bestsellersError: freezed == bestsellersError ? _self.bestsellersError : bestsellersError ,bestsellersStale: null == bestsellersStale ? _self.bestsellersStale : bestsellersStale // ignore: cast_nullable_to_non_nullable
as bool,submittedQuery: null == submittedQuery ? _self.submittedQuery : submittedQuery // ignore: cast_nullable_to_non_nullable
as String,resultsStatus: null == resultsStatus ? _self.resultsStatus : resultsStatus // ignore: cast_nullable_to_non_nullable
as SearchStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SearchResult?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,actionError: freezed == actionError ? _self.actionError : actionError ,actionErrorId: null == actionErrorId ? _self.actionErrorId : actionErrorId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $SearchResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
