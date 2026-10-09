// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) =>
    _HomeCategory(
      slug: json['slug'] as String,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
      productCount: (json['productCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeCategoryToJson(_HomeCategory instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'parentId': instance.parentId,
      'productCount': instance.productCount,
    };

_HomeCollection _$HomeCollectionFromJson(Map<String, dynamic> json) =>
    _HomeCollection(
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      releasedAt: json['releasedAt'] == null
          ? null
          : DateTime.parse(json['releasedAt'] as String),
    );

Map<String, dynamic> _$HomeCollectionToJson(_HomeCollection instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'releasedAt': instance.releasedAt?.toIso8601String(),
    };

_Look _$LookFromJson(Map<String, dynamic> json) => _Look(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  imageUrl: json['imageUrl'] as String,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductCard>[],
);

Map<String, dynamic> _$LookToJson(_Look instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'imageUrl': instance.imageUrl,
  'products': instance.products,
};

_HomeFeed _$HomeFeedFromJson(Map<String, dynamic> json) => _HomeFeed(
  newArrivals:
      (json['newArrivals'] as List<dynamic>?)
          ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductCard>[],
  bestsellers:
      (json['bestsellers'] as List<dynamic>?)
          ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductCard>[],
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => HomeCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HomeCategory>[],
  collections:
      (json['collections'] as List<dynamic>?)
          ?.map((e) => HomeCollection.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HomeCollection>[],
  looks:
      (json['looks'] as List<dynamic>?)
          ?.map((e) => Look.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Look>[],
  recentlyViewed:
      (json['recentlyViewed'] as List<dynamic>?)
          ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductCard>[],
);

Map<String, dynamic> _$HomeFeedToJson(_HomeFeed instance) => <String, dynamic>{
  'newArrivals': instance.newArrivals,
  'bestsellers': instance.bestsellers,
  'categories': instance.categories,
  'collections': instance.collections,
  'looks': instance.looks,
  'recentlyViewed': instance.recentlyViewed,
};
