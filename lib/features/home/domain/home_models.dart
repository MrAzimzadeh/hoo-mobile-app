import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/models.dart';

part 'home_models.freezed.dart';
part 'home_models.g.dart';

@freezed
abstract class HomeCategory with _$HomeCategory {
  const factory HomeCategory({required String slug, required String name, String? parentId, @Default(0) int productCount}) = _HomeCategory;

  factory HomeCategory.fromJson(Map<String, dynamic> json) => _$HomeCategoryFromJson(json);
}

@freezed
abstract class HomeCollection with _$HomeCollection {
  const factory HomeCollection({required String slug, required String name, String? description, DateTime? releasedAt}) = _HomeCollection;

  factory HomeCollection.fromJson(Map<String, dynamic> json) => _$HomeCollectionFromJson(json);
}

/// Lookbook entry ("Shop the look").
@freezed
abstract class Look with _$Look {
  const factory Look({required String id, @Default('') String title, required String imageUrl, @Default(<ProductCard>[]) List<ProductCard> products}) = _Look;

  factory Look.fromJson(Map<String, dynamic> json) => _$LookFromJson(json);
}

/// Everything the home screen shows. Sections that failed or are empty are simply hidden.
@freezed
abstract class HomeFeed with _$HomeFeed {
  const factory HomeFeed({
    @Default(<ProductCard>[]) List<ProductCard> newArrivals,
    @Default(<ProductCard>[]) List<ProductCard> bestsellers,
    @Default(<HomeCategory>[]) List<HomeCategory> categories,
    @Default(<HomeCollection>[]) List<HomeCollection> collections,
    @Default(<Look>[]) List<Look> looks,
    @Default(<ProductCard>[]) List<ProductCard> recentlyViewed,
  }) = _HomeFeed;

  factory HomeFeed.fromJson(Map<String, dynamic> json) => _$HomeFeedFromJson(json);
}
