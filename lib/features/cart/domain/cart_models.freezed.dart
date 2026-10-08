// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cart {

 String get id; List<CartItem> get items; int get itemsCount; CartPromo? get promo; bool get isGift; CartTotals get totals; FreeDeliveryProgress? get freeDelivery; bool get canCheckout; List<ProductCard> get completeTheLook; List<ProductCard> get bestsellers;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.promo, promo) || other.promo == promo)&&(identical(other.isGift, isGift) || other.isGift == isGift)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.freeDelivery, freeDelivery) || other.freeDelivery == freeDelivery)&&(identical(other.canCheckout, canCheckout) || other.canCheckout == canCheckout)&&const DeepCollectionEquality().equals(other.completeTheLook, completeTheLook)&&const DeepCollectionEquality().equals(other.bestsellers, bestsellers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),itemsCount,promo,isGift,totals,freeDelivery,canCheckout,const DeepCollectionEquality().hash(completeTheLook),const DeepCollectionEquality().hash(bestsellers));

@override
String toString() {
  return 'Cart(id: $id, items: $items, itemsCount: $itemsCount, promo: $promo, isGift: $isGift, totals: $totals, freeDelivery: $freeDelivery, canCheckout: $canCheckout, completeTheLook: $completeTheLook, bestsellers: $bestsellers)';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 String id, List<CartItem> items, int itemsCount, CartPromo? promo, bool isGift, CartTotals totals, FreeDeliveryProgress? freeDelivery, bool canCheckout, List<ProductCard> completeTheLook, List<ProductCard> bestsellers
});


$CartPromoCopyWith<$Res>? get promo;$CartTotalsCopyWith<$Res> get totals;$FreeDeliveryProgressCopyWith<$Res>? get freeDelivery;

}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? itemsCount = null,Object? promo = freezed,Object? isGift = null,Object? totals = null,Object? freeDelivery = freezed,Object? canCheckout = null,Object? completeTheLook = null,Object? bestsellers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,promo: freezed == promo ? _self.promo : promo // ignore: cast_nullable_to_non_nullable
as CartPromo?,isGift: null == isGift ? _self.isGift : isGift // ignore: cast_nullable_to_non_nullable
as bool,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals,freeDelivery: freezed == freeDelivery ? _self.freeDelivery : freeDelivery // ignore: cast_nullable_to_non_nullable
as FreeDeliveryProgress?,canCheckout: null == canCheckout ? _self.canCheckout : canCheckout // ignore: cast_nullable_to_non_nullable
as bool,completeTheLook: null == completeTheLook ? _self.completeTheLook : completeTheLook // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,bestsellers: null == bestsellers ? _self.bestsellers : bestsellers // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartPromoCopyWith<$Res>? get promo {
    if (_self.promo == null) {
    return null;
  }

  return $CartPromoCopyWith<$Res>(_self.promo!, (value) {
    return _then(_self.copyWith(promo: value));
  });
}/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<$Res> get totals {
  
  return $CartTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FreeDeliveryProgressCopyWith<$Res>? get freeDelivery {
    if (_self.freeDelivery == null) {
    return null;
  }

  return $FreeDeliveryProgressCopyWith<$Res>(_self.freeDelivery!, (value) {
    return _then(_self.copyWith(freeDelivery: value));
  });
}
}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<CartItem> items,  int itemsCount,  CartPromo? promo,  bool isGift,  CartTotals totals,  FreeDeliveryProgress? freeDelivery,  bool canCheckout,  List<ProductCard> completeTheLook,  List<ProductCard> bestsellers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.items,_that.itemsCount,_that.promo,_that.isGift,_that.totals,_that.freeDelivery,_that.canCheckout,_that.completeTheLook,_that.bestsellers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<CartItem> items,  int itemsCount,  CartPromo? promo,  bool isGift,  CartTotals totals,  FreeDeliveryProgress? freeDelivery,  bool canCheckout,  List<ProductCard> completeTheLook,  List<ProductCard> bestsellers)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.id,_that.items,_that.itemsCount,_that.promo,_that.isGift,_that.totals,_that.freeDelivery,_that.canCheckout,_that.completeTheLook,_that.bestsellers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<CartItem> items,  int itemsCount,  CartPromo? promo,  bool isGift,  CartTotals totals,  FreeDeliveryProgress? freeDelivery,  bool canCheckout,  List<ProductCard> completeTheLook,  List<ProductCard> bestsellers)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.items,_that.itemsCount,_that.promo,_that.isGift,_that.totals,_that.freeDelivery,_that.canCheckout,_that.completeTheLook,_that.bestsellers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cart extends Cart {
  const _Cart({required this.id, final  List<CartItem> items = const <CartItem>[], this.itemsCount = 0, this.promo, this.isGift = false, this.totals = const CartTotals(), this.freeDelivery, this.canCheckout = false, final  List<ProductCard> completeTheLook = const <ProductCard>[], final  List<ProductCard> bestsellers = const <ProductCard>[]}): _items = items,_completeTheLook = completeTheLook,_bestsellers = bestsellers,super._();
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

@override final  String id;
 final  List<CartItem> _items;
@override@JsonKey() List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int itemsCount;
@override final  CartPromo? promo;
@override@JsonKey() final  bool isGift;
@override@JsonKey() final  CartTotals totals;
@override final  FreeDeliveryProgress? freeDelivery;
@override@JsonKey() final  bool canCheckout;
 final  List<ProductCard> _completeTheLook;
@override@JsonKey() List<ProductCard> get completeTheLook {
  if (_completeTheLook is EqualUnmodifiableListView) return _completeTheLook;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completeTheLook);
}

 final  List<ProductCard> _bestsellers;
@override@JsonKey() List<ProductCard> get bestsellers {
  if (_bestsellers is EqualUnmodifiableListView) return _bestsellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestsellers);
}


/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.promo, promo) || other.promo == promo)&&(identical(other.isGift, isGift) || other.isGift == isGift)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.freeDelivery, freeDelivery) || other.freeDelivery == freeDelivery)&&(identical(other.canCheckout, canCheckout) || other.canCheckout == canCheckout)&&const DeepCollectionEquality().equals(other._completeTheLook, _completeTheLook)&&const DeepCollectionEquality().equals(other._bestsellers, _bestsellers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),itemsCount,promo,isGift,totals,freeDelivery,canCheckout,const DeepCollectionEquality().hash(_completeTheLook),const DeepCollectionEquality().hash(_bestsellers));

@override
String toString() {
  return 'Cart(id: $id, items: $items, itemsCount: $itemsCount, promo: $promo, isGift: $isGift, totals: $totals, freeDelivery: $freeDelivery, canCheckout: $canCheckout, completeTheLook: $completeTheLook, bestsellers: $bestsellers)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 String id, List<CartItem> items, int itemsCount, CartPromo? promo, bool isGift, CartTotals totals, FreeDeliveryProgress? freeDelivery, bool canCheckout, List<ProductCard> completeTheLook, List<ProductCard> bestsellers
});


@override $CartPromoCopyWith<$Res>? get promo;@override $CartTotalsCopyWith<$Res> get totals;@override $FreeDeliveryProgressCopyWith<$Res>? get freeDelivery;

}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? itemsCount = null,Object? promo = freezed,Object? isGift = null,Object? totals = null,Object? freeDelivery = freezed,Object? canCheckout = null,Object? completeTheLook = null,Object? bestsellers = null,}) {
  return _then(_Cart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,promo: freezed == promo ? _self.promo : promo // ignore: cast_nullable_to_non_nullable
as CartPromo?,isGift: null == isGift ? _self.isGift : isGift // ignore: cast_nullable_to_non_nullable
as bool,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals,freeDelivery: freezed == freeDelivery ? _self.freeDelivery : freeDelivery // ignore: cast_nullable_to_non_nullable
as FreeDeliveryProgress?,canCheckout: null == canCheckout ? _self.canCheckout : canCheckout // ignore: cast_nullable_to_non_nullable
as bool,completeTheLook: null == completeTheLook ? _self._completeTheLook : completeTheLook // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,bestsellers: null == bestsellers ? _self._bestsellers : bestsellers // ignore: cast_nullable_to_non_nullable
as List<ProductCard>,
  ));
}

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartPromoCopyWith<$Res>? get promo {
    if (_self.promo == null) {
    return null;
  }

  return $CartPromoCopyWith<$Res>(_self.promo!, (value) {
    return _then(_self.copyWith(promo: value));
  });
}/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<$Res> get totals {
  
  return $CartTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FreeDeliveryProgressCopyWith<$Res>? get freeDelivery {
    if (_self.freeDelivery == null) {
    return null;
  }

  return $FreeDeliveryProgressCopyWith<$Res>(_self.freeDelivery!, (value) {
    return _then(_self.copyWith(freeDelivery: value));
  });
}
}


/// @nodoc
mixin _$CartItem {

 String get id; String get kind; String? get productId; String? get productSlug; String? get variantId; String? get designId; String get name; String? get color; String? get colorHex;@JsonKey(unknownEnumValue: Size.unknown) Size? get size; String? get sku; String? get imageUrl; double get unitPrice; int get quantity; double get lineTotal; List<LineAdjustment> get adjustments;@JsonKey(unknownEnumValue: StockState.unknown) StockState get stock; int? get stockLeft; int? get leadTimeDays; String? get errorCode; String? get errorMessage;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productSlug, productSlug) || other.productSlug == productSlug)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.designId, designId) || other.designId == designId)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&const DeepCollectionEquality().equals(other.adjustments, adjustments)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.stockLeft, stockLeft) || other.stockLeft == stockLeft)&&(identical(other.leadTimeDays, leadTimeDays) || other.leadTimeDays == leadTimeDays)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,kind,productId,productSlug,variantId,designId,name,color,colorHex,size,sku,imageUrl,unitPrice,quantity,lineTotal,const DeepCollectionEquality().hash(adjustments),stock,stockLeft,leadTimeDays,errorCode,errorMessage]);

@override
String toString() {
  return 'CartItem(id: $id, kind: $kind, productId: $productId, productSlug: $productSlug, variantId: $variantId, designId: $designId, name: $name, color: $color, colorHex: $colorHex, size: $size, sku: $sku, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, adjustments: $adjustments, stock: $stock, stockLeft: $stockLeft, leadTimeDays: $leadTimeDays, errorCode: $errorCode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String? productId, String? productSlug, String? variantId, String? designId, String name, String? color, String? colorHex,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? sku, String? imageUrl, double unitPrice, int quantity, double lineTotal, List<LineAdjustment> adjustments,@JsonKey(unknownEnumValue: StockState.unknown) StockState stock, int? stockLeft, int? leadTimeDays, String? errorCode, String? errorMessage
});




}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? productId = freezed,Object? productSlug = freezed,Object? variantId = freezed,Object? designId = freezed,Object? name = null,Object? color = freezed,Object? colorHex = freezed,Object? size = freezed,Object? sku = freezed,Object? imageUrl = freezed,Object? unitPrice = null,Object? quantity = null,Object? lineTotal = null,Object? adjustments = null,Object? stock = null,Object? stockLeft = freezed,Object? leadTimeDays = freezed,Object? errorCode = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productSlug: freezed == productSlug ? _self.productSlug : productSlug // ignore: cast_nullable_to_non_nullable
as String?,variantId: freezed == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String?,designId: freezed == designId ? _self.designId : designId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,adjustments: null == adjustments ? _self.adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as List<LineAdjustment>,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockState,stockLeft: freezed == stockLeft ? _self.stockLeft : stockLeft // ignore: cast_nullable_to_non_nullable
as int?,leadTimeDays: freezed == leadTimeDays ? _self.leadTimeDays : leadTimeDays // ignore: cast_nullable_to_non_nullable
as int?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String? productId,  String? productSlug,  String? variantId,  String? designId,  String name,  String? color,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? sku,  String? imageUrl,  double unitPrice,  int quantity,  double lineTotal,  List<LineAdjustment> adjustments, @JsonKey(unknownEnumValue: StockState.unknown)  StockState stock,  int? stockLeft,  int? leadTimeDays,  String? errorCode,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.kind,_that.productId,_that.productSlug,_that.variantId,_that.designId,_that.name,_that.color,_that.colorHex,_that.size,_that.sku,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.adjustments,_that.stock,_that.stockLeft,_that.leadTimeDays,_that.errorCode,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String? productId,  String? productSlug,  String? variantId,  String? designId,  String name,  String? color,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? sku,  String? imageUrl,  double unitPrice,  int quantity,  double lineTotal,  List<LineAdjustment> adjustments, @JsonKey(unknownEnumValue: StockState.unknown)  StockState stock,  int? stockLeft,  int? leadTimeDays,  String? errorCode,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.id,_that.kind,_that.productId,_that.productSlug,_that.variantId,_that.designId,_that.name,_that.color,_that.colorHex,_that.size,_that.sku,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.adjustments,_that.stock,_that.stockLeft,_that.leadTimeDays,_that.errorCode,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String? productId,  String? productSlug,  String? variantId,  String? designId,  String name,  String? color,  String? colorHex, @JsonKey(unknownEnumValue: Size.unknown)  Size? size,  String? sku,  String? imageUrl,  double unitPrice,  int quantity,  double lineTotal,  List<LineAdjustment> adjustments, @JsonKey(unknownEnumValue: StockState.unknown)  StockState stock,  int? stockLeft,  int? leadTimeDays,  String? errorCode,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.kind,_that.productId,_that.productSlug,_that.variantId,_that.designId,_that.name,_that.color,_that.colorHex,_that.size,_that.sku,_that.imageUrl,_that.unitPrice,_that.quantity,_that.lineTotal,_that.adjustments,_that.stock,_that.stockLeft,_that.leadTimeDays,_that.errorCode,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem extends CartItem {
  const _CartItem({required this.id, this.kind = 'stock', this.productId, this.productSlug, this.variantId, this.designId, required this.name, this.color, this.colorHex, @JsonKey(unknownEnumValue: Size.unknown) this.size, this.sku, this.imageUrl, required this.unitPrice, required this.quantity, required this.lineTotal, final  List<LineAdjustment> adjustments = const <LineAdjustment>[], @JsonKey(unknownEnumValue: StockState.unknown) this.stock = StockState.inStock, this.stockLeft, this.leadTimeDays, this.errorCode, this.errorMessage}): _adjustments = adjustments,super._();
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override final  String id;
@override@JsonKey() final  String kind;
@override final  String? productId;
@override final  String? productSlug;
@override final  String? variantId;
@override final  String? designId;
@override final  String name;
@override final  String? color;
@override final  String? colorHex;
@override@JsonKey(unknownEnumValue: Size.unknown) final  Size? size;
@override final  String? sku;
@override final  String? imageUrl;
@override final  double unitPrice;
@override final  int quantity;
@override final  double lineTotal;
 final  List<LineAdjustment> _adjustments;
@override@JsonKey() List<LineAdjustment> get adjustments {
  if (_adjustments is EqualUnmodifiableListView) return _adjustments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adjustments);
}

@override@JsonKey(unknownEnumValue: StockState.unknown) final  StockState stock;
@override final  int? stockLeft;
@override final  int? leadTimeDays;
@override final  String? errorCode;
@override final  String? errorMessage;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productSlug, productSlug) || other.productSlug == productSlug)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.designId, designId) || other.designId == designId)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.size, size) || other.size == size)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&const DeepCollectionEquality().equals(other._adjustments, _adjustments)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.stockLeft, stockLeft) || other.stockLeft == stockLeft)&&(identical(other.leadTimeDays, leadTimeDays) || other.leadTimeDays == leadTimeDays)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,kind,productId,productSlug,variantId,designId,name,color,colorHex,size,sku,imageUrl,unitPrice,quantity,lineTotal,const DeepCollectionEquality().hash(_adjustments),stock,stockLeft,leadTimeDays,errorCode,errorMessage]);

@override
String toString() {
  return 'CartItem(id: $id, kind: $kind, productId: $productId, productSlug: $productSlug, variantId: $variantId, designId: $designId, name: $name, color: $color, colorHex: $colorHex, size: $size, sku: $sku, imageUrl: $imageUrl, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, adjustments: $adjustments, stock: $stock, stockLeft: $stockLeft, leadTimeDays: $leadTimeDays, errorCode: $errorCode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String? productId, String? productSlug, String? variantId, String? designId, String name, String? color, String? colorHex,@JsonKey(unknownEnumValue: Size.unknown) Size? size, String? sku, String? imageUrl, double unitPrice, int quantity, double lineTotal, List<LineAdjustment> adjustments,@JsonKey(unknownEnumValue: StockState.unknown) StockState stock, int? stockLeft, int? leadTimeDays, String? errorCode, String? errorMessage
});




}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? productId = freezed,Object? productSlug = freezed,Object? variantId = freezed,Object? designId = freezed,Object? name = null,Object? color = freezed,Object? colorHex = freezed,Object? size = freezed,Object? sku = freezed,Object? imageUrl = freezed,Object? unitPrice = null,Object? quantity = null,Object? lineTotal = null,Object? adjustments = null,Object? stock = null,Object? stockLeft = freezed,Object? leadTimeDays = freezed,Object? errorCode = freezed,Object? errorMessage = freezed,}) {
  return _then(_CartItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productSlug: freezed == productSlug ? _self.productSlug : productSlug // ignore: cast_nullable_to_non_nullable
as String?,variantId: freezed == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String?,designId: freezed == designId ? _self.designId : designId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,adjustments: null == adjustments ? _self._adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as List<LineAdjustment>,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockState,stockLeft: freezed == stockLeft ? _self.stockLeft : stockLeft // ignore: cast_nullable_to_non_nullable
as int?,leadTimeDays: freezed == leadTimeDays ? _self.leadTimeDays : leadTimeDays // ignore: cast_nullable_to_non_nullable
as int?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CartPromo {

 String get code; bool get valid; String? get errorCode; String? get errorMessage;
/// Create a copy of CartPromo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartPromoCopyWith<CartPromo> get copyWith => _$CartPromoCopyWithImpl<CartPromo>(this as CartPromo, _$identity);

  /// Serializes this CartPromo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartPromo&&(identical(other.code, code) || other.code == code)&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,valid,errorCode,errorMessage);

@override
String toString() {
  return 'CartPromo(code: $code, valid: $valid, errorCode: $errorCode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CartPromoCopyWith<$Res>  {
  factory $CartPromoCopyWith(CartPromo value, $Res Function(CartPromo) _then) = _$CartPromoCopyWithImpl;
@useResult
$Res call({
 String code, bool valid, String? errorCode, String? errorMessage
});




}
/// @nodoc
class _$CartPromoCopyWithImpl<$Res>
    implements $CartPromoCopyWith<$Res> {
  _$CartPromoCopyWithImpl(this._self, this._then);

  final CartPromo _self;
  final $Res Function(CartPromo) _then;

/// Create a copy of CartPromo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? valid = null,Object? errorCode = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartPromo].
extension CartPromoPatterns on CartPromo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartPromo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartPromo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartPromo value)  $default,){
final _that = this;
switch (_that) {
case _CartPromo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartPromo value)?  $default,){
final _that = this;
switch (_that) {
case _CartPromo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  bool valid,  String? errorCode,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartPromo() when $default != null:
return $default(_that.code,_that.valid,_that.errorCode,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  bool valid,  String? errorCode,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CartPromo():
return $default(_that.code,_that.valid,_that.errorCode,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  bool valid,  String? errorCode,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CartPromo() when $default != null:
return $default(_that.code,_that.valid,_that.errorCode,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartPromo implements CartPromo {
  const _CartPromo({required this.code, this.valid = true, this.errorCode, this.errorMessage});
  factory _CartPromo.fromJson(Map<String, dynamic> json) => _$CartPromoFromJson(json);

@override final  String code;
@override@JsonKey() final  bool valid;
@override final  String? errorCode;
@override final  String? errorMessage;

/// Create a copy of CartPromo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartPromoCopyWith<_CartPromo> get copyWith => __$CartPromoCopyWithImpl<_CartPromo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartPromoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartPromo&&(identical(other.code, code) || other.code == code)&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,valid,errorCode,errorMessage);

@override
String toString() {
  return 'CartPromo(code: $code, valid: $valid, errorCode: $errorCode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CartPromoCopyWith<$Res> implements $CartPromoCopyWith<$Res> {
  factory _$CartPromoCopyWith(_CartPromo value, $Res Function(_CartPromo) _then) = __$CartPromoCopyWithImpl;
@override @useResult
$Res call({
 String code, bool valid, String? errorCode, String? errorMessage
});




}
/// @nodoc
class __$CartPromoCopyWithImpl<$Res>
    implements _$CartPromoCopyWith<$Res> {
  __$CartPromoCopyWithImpl(this._self, this._then);

  final _CartPromo _self;
  final $Res Function(_CartPromo) _then;

/// Create a copy of CartPromo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? valid = null,Object? errorCode = freezed,Object? errorMessage = freezed,}) {
  return _then(_CartPromo(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CartTotals {

 double get subtotal; double get discount; double get total; double get vatIncluded;
/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<CartTotals> get copyWith => _$CartTotalsCopyWithImpl<CartTotals>(this as CartTotals, _$identity);

  /// Serializes this CartTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total)&&(identical(other.vatIncluded, vatIncluded) || other.vatIncluded == vatIncluded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,total,vatIncluded);

@override
String toString() {
  return 'CartTotals(subtotal: $subtotal, discount: $discount, total: $total, vatIncluded: $vatIncluded)';
}


}

/// @nodoc
abstract mixin class $CartTotalsCopyWith<$Res>  {
  factory $CartTotalsCopyWith(CartTotals value, $Res Function(CartTotals) _then) = _$CartTotalsCopyWithImpl;
@useResult
$Res call({
 double subtotal, double discount, double total, double vatIncluded
});




}
/// @nodoc
class _$CartTotalsCopyWithImpl<$Res>
    implements $CartTotalsCopyWith<$Res> {
  _$CartTotalsCopyWithImpl(this._self, this._then);

  final CartTotals _self;
  final $Res Function(CartTotals) _then;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? discount = null,Object? total = null,Object? vatIncluded = null,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,vatIncluded: null == vatIncluded ? _self.vatIncluded : vatIncluded // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CartTotals].
extension CartTotalsPatterns on CartTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartTotals value)  $default,){
final _that = this;
switch (_that) {
case _CartTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartTotals value)?  $default,){
final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double total,  double vatIncluded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.total,_that.vatIncluded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double total,  double vatIncluded)  $default,) {final _that = this;
switch (_that) {
case _CartTotals():
return $default(_that.subtotal,_that.discount,_that.total,_that.vatIncluded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double subtotal,  double discount,  double total,  double vatIncluded)?  $default,) {final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.total,_that.vatIncluded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartTotals implements CartTotals {
  const _CartTotals({this.subtotal = 0, this.discount = 0, this.total = 0, this.vatIncluded = 0});
  factory _CartTotals.fromJson(Map<String, dynamic> json) => _$CartTotalsFromJson(json);

@override@JsonKey() final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double total;
@override@JsonKey() final  double vatIncluded;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartTotalsCopyWith<_CartTotals> get copyWith => __$CartTotalsCopyWithImpl<_CartTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total)&&(identical(other.vatIncluded, vatIncluded) || other.vatIncluded == vatIncluded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,total,vatIncluded);

@override
String toString() {
  return 'CartTotals(subtotal: $subtotal, discount: $discount, total: $total, vatIncluded: $vatIncluded)';
}


}

/// @nodoc
abstract mixin class _$CartTotalsCopyWith<$Res> implements $CartTotalsCopyWith<$Res> {
  factory _$CartTotalsCopyWith(_CartTotals value, $Res Function(_CartTotals) _then) = __$CartTotalsCopyWithImpl;
@override @useResult
$Res call({
 double subtotal, double discount, double total, double vatIncluded
});




}
/// @nodoc
class __$CartTotalsCopyWithImpl<$Res>
    implements _$CartTotalsCopyWith<$Res> {
  __$CartTotalsCopyWithImpl(this._self, this._then);

  final _CartTotals _self;
  final $Res Function(_CartTotals) _then;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? discount = null,Object? total = null,Object? vatIncluded = null,}) {
  return _then(_CartTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,vatIncluded: null == vatIncluded ? _self.vatIncluded : vatIncluded // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$FreeDeliveryProgress {

 String get zoneCode; double get threshold; double get remaining; bool get qualifies;
/// Create a copy of FreeDeliveryProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreeDeliveryProgressCopyWith<FreeDeliveryProgress> get copyWith => _$FreeDeliveryProgressCopyWithImpl<FreeDeliveryProgress>(this as FreeDeliveryProgress, _$identity);

  /// Serializes this FreeDeliveryProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreeDeliveryProgress&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.qualifies, qualifies) || other.qualifies == qualifies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneCode,threshold,remaining,qualifies);

@override
String toString() {
  return 'FreeDeliveryProgress(zoneCode: $zoneCode, threshold: $threshold, remaining: $remaining, qualifies: $qualifies)';
}


}

/// @nodoc
abstract mixin class $FreeDeliveryProgressCopyWith<$Res>  {
  factory $FreeDeliveryProgressCopyWith(FreeDeliveryProgress value, $Res Function(FreeDeliveryProgress) _then) = _$FreeDeliveryProgressCopyWithImpl;
@useResult
$Res call({
 String zoneCode, double threshold, double remaining, bool qualifies
});




}
/// @nodoc
class _$FreeDeliveryProgressCopyWithImpl<$Res>
    implements $FreeDeliveryProgressCopyWith<$Res> {
  _$FreeDeliveryProgressCopyWithImpl(this._self, this._then);

  final FreeDeliveryProgress _self;
  final $Res Function(FreeDeliveryProgress) _then;

/// Create a copy of FreeDeliveryProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? zoneCode = null,Object? threshold = null,Object? remaining = null,Object? qualifies = null,}) {
  return _then(_self.copyWith(
zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,qualifies: null == qualifies ? _self.qualifies : qualifies // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FreeDeliveryProgress].
extension FreeDeliveryProgressPatterns on FreeDeliveryProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreeDeliveryProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreeDeliveryProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreeDeliveryProgress value)  $default,){
final _that = this;
switch (_that) {
case _FreeDeliveryProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreeDeliveryProgress value)?  $default,){
final _that = this;
switch (_that) {
case _FreeDeliveryProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String zoneCode,  double threshold,  double remaining,  bool qualifies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreeDeliveryProgress() when $default != null:
return $default(_that.zoneCode,_that.threshold,_that.remaining,_that.qualifies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String zoneCode,  double threshold,  double remaining,  bool qualifies)  $default,) {final _that = this;
switch (_that) {
case _FreeDeliveryProgress():
return $default(_that.zoneCode,_that.threshold,_that.remaining,_that.qualifies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String zoneCode,  double threshold,  double remaining,  bool qualifies)?  $default,) {final _that = this;
switch (_that) {
case _FreeDeliveryProgress() when $default != null:
return $default(_that.zoneCode,_that.threshold,_that.remaining,_that.qualifies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreeDeliveryProgress extends FreeDeliveryProgress {
  const _FreeDeliveryProgress({required this.zoneCode, required this.threshold, required this.remaining, this.qualifies = false}): super._();
  factory _FreeDeliveryProgress.fromJson(Map<String, dynamic> json) => _$FreeDeliveryProgressFromJson(json);

@override final  String zoneCode;
@override final  double threshold;
@override final  double remaining;
@override@JsonKey() final  bool qualifies;

/// Create a copy of FreeDeliveryProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreeDeliveryProgressCopyWith<_FreeDeliveryProgress> get copyWith => __$FreeDeliveryProgressCopyWithImpl<_FreeDeliveryProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreeDeliveryProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreeDeliveryProgress&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.qualifies, qualifies) || other.qualifies == qualifies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneCode,threshold,remaining,qualifies);

@override
String toString() {
  return 'FreeDeliveryProgress(zoneCode: $zoneCode, threshold: $threshold, remaining: $remaining, qualifies: $qualifies)';
}


}

/// @nodoc
abstract mixin class _$FreeDeliveryProgressCopyWith<$Res> implements $FreeDeliveryProgressCopyWith<$Res> {
  factory _$FreeDeliveryProgressCopyWith(_FreeDeliveryProgress value, $Res Function(_FreeDeliveryProgress) _then) = __$FreeDeliveryProgressCopyWithImpl;
@override @useResult
$Res call({
 String zoneCode, double threshold, double remaining, bool qualifies
});




}
/// @nodoc
class __$FreeDeliveryProgressCopyWithImpl<$Res>
    implements _$FreeDeliveryProgressCopyWith<$Res> {
  __$FreeDeliveryProgressCopyWithImpl(this._self, this._then);

  final _FreeDeliveryProgress _self;
  final $Res Function(_FreeDeliveryProgress) _then;

/// Create a copy of FreeDeliveryProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? zoneCode = null,Object? threshold = null,Object? remaining = null,Object? qualifies = null,}) {
  return _then(_FreeDeliveryProgress(
zoneCode: null == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,qualifies: null == qualifies ? _self.qualifies : qualifies // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
