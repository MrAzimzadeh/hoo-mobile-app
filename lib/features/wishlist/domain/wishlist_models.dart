import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'wishlist_models.freezed.dart';
part 'wishlist_models.g.dart';

@freezed
abstract class RecentlyViewed with _$RecentlyViewed {
  const factory RecentlyViewed({required ProductCard product, required DateTime viewedAt}) = _RecentlyViewed;

  factory RecentlyViewed.fromJson(Map<String, dynamic> json) => _$RecentlyViewedFromJson(json);
}

@freezed
abstract class SharedWishlist with _$SharedWishlist {
  const factory SharedWishlist({@Default('') String ownerFirstName, @Default(<ProductCard>[]) List<ProductCard> items}) = _SharedWishlist;

  factory SharedWishlist.fromJson(Map<String, dynamic> json) => _$SharedWishlistFromJson(json);
}

@freezed
abstract class StockAlert with _$StockAlert {
  const factory StockAlert({
    required String id,
    required ProductCard product,
    required StockAlertType type,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    String? colorId,
    required DateTime createdAt,
    DateTime? notifiedAt,
  }) = _StockAlert;

  factory StockAlert.fromJson(Map<String, dynamic> json) => _$StockAlertFromJson(json);
}
