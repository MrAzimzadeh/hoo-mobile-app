// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  parentId: json['parentId'] as String?,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'parentId': instance.parentId,
  'productCount': instance.productCount,
};

_Collection _$CollectionFromJson(Map<String, dynamic> json) => _Collection(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  releasedAt: json['releasedAt'] == null
      ? null
      : DateTime.parse(json['releasedAt'] as String),
);

Map<String, dynamic> _$CollectionToJson(_Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'releasedAt': instance.releasedAt?.toIso8601String(),
    };

_FacetValue _$FacetValueFromJson(Map<String, dynamic> json) => _FacetValue(
  value: json['value'] as String,
  label: json['label'] as String,
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FacetValueToJson(_FacetValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'count': instance.count,
    };

_ProductFacets _$ProductFacetsFromJson(Map<String, dynamic> json) =>
    _ProductFacets(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FacetValue>[],
      sizes:
          (json['sizes'] as List<dynamic>?)
              ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FacetValue>[],
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FacetValue>[],
      fits:
          (json['fits'] as List<dynamic>?)
              ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FacetValue>[],
      fabrics:
          (json['fabrics'] as List<dynamic>?)
              ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FacetValue>[],
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductFacetsToJson(_ProductFacets instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'fits': instance.fits,
      'fabrics': instance.fabrics,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };

_ProductListPage _$ProductListPageFromJson(Map<String, dynamic> json) =>
    _ProductListPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductCard>[],
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 12,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? false,
      facets: json['facets'] == null
          ? const ProductFacets()
          : ProductFacets.fromJson(json['facets'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductListPageToJson(_ProductListPage instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
      'facets': instance.facets,
    };

_ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) =>
    _ProductVariant(
      id: json['id'] as String,
      size: $enumDecode(
        _$SizeEnumMap,
        json['size'],
        unknownValue: Size.unknown,
      ),
      sku: json['sku'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'] as bool? ?? false,
      lowStockLeft: (json['lowStockLeft'] as num?)?.toInt(),
      preorder: json['preorder'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductVariantToJson(_ProductVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': _$SizeEnumMap[instance.size]!,
      'sku': instance.sku,
      'price': instance.price,
      'inStock': instance.inStock,
      'lowStockLeft': instance.lowStockLeft,
      'preorder': instance.preorder,
    };

const _$SizeEnumMap = {
  Size.xs: 'XS',
  Size.s: 'S',
  Size.m: 'M',
  Size.l: 'L',
  Size.xl: 'XL',
  Size.xxl: 'XXL',
  Size.xxxl: '3XL',
  Size.unknown: '',
};

_ProductColor _$ProductColorFromJson(Map<String, dynamic> json) =>
    _ProductColor(
      color: ColorInfo.fromJson(json['color'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      variants:
          (json['variants'] as List<dynamic>?)
              ?.map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductVariant>[],
    );

Map<String, dynamic> _$ProductColorToJson(_ProductColor instance) =>
    <String, dynamic>{
      'color': instance.color,
      'images': instance.images,
      'variants': instance.variants,
    };

_SizeChartRow _$SizeChartRowFromJson(Map<String, dynamic> json) =>
    _SizeChartRow(
      size: $enumDecode(
        _$SizeEnumMap,
        json['size'],
        unknownValue: Size.unknown,
      ),
      chestCm: (json['chestCm'] as num).toDouble(),
      lengthCm: (json['lengthCm'] as num).toDouble(),
      sleeveCm: (json['sleeveCm'] as num).toDouble(),
      chestIn: (json['chestIn'] as num).toDouble(),
      lengthIn: (json['lengthIn'] as num).toDouble(),
      sleeveIn: (json['sleeveIn'] as num).toDouble(),
    );

Map<String, dynamic> _$SizeChartRowToJson(_SizeChartRow instance) =>
    <String, dynamic>{
      'size': _$SizeEnumMap[instance.size]!,
      'chestCm': instance.chestCm,
      'lengthCm': instance.lengthCm,
      'sleeveCm': instance.sleeveCm,
      'chestIn': instance.chestIn,
      'lengthIn': instance.lengthIn,
      'sleeveIn': instance.sleeveIn,
    };

_SizeRecommendation _$SizeRecommendationFromJson(Map<String, dynamic> json) =>
    _SizeRecommendation(
      size: $enumDecode(
        _$SizeEnumMap,
        json['size'],
        unknownValue: Size.unknown,
      ),
      basis:
          $enumDecodeNullable(
            _$RecommendationBasisEnumMap,
            json['basis'],
            unknownValue: RecommendationBasis.unknown,
          ) ??
          RecommendationBasis.unknown,
      fit:
          $enumDecodeNullable(
            _$FitEnumMap,
            json['fit'],
            unknownValue: Fit.unknown,
          ) ??
          Fit.unknown,
    );

Map<String, dynamic> _$SizeRecommendationToJson(_SizeRecommendation instance) =>
    <String, dynamic>{
      'size': _$SizeEnumMap[instance.size]!,
      'basis': _$RecommendationBasisEnumMap[instance.basis]!,
      'fit': _$FitEnumMap[instance.fit]!,
    };

const _$RecommendationBasisEnumMap = {
  RecommendationBasis.measurements: 'Measurements',
  RecommendationBasis.heightWeight: 'HeightWeight',
  RecommendationBasis.usualSize: 'UsualSize',
  RecommendationBasis.unknown: '',
};

const _$FitEnumMap = {
  Fit.oversized: 'Oversized',
  Fit.boxy: 'Boxy',
  Fit.regular: 'Regular',
  Fit.fitted: 'Fitted',
  Fit.cropped: 'Cropped',
  Fit.unknown: '',
};

_DeliveryPromise _$DeliveryPromiseFromJson(Map<String, dynamic> json) =>
    _DeliveryPromise(
      orderWithinMinutes: (json['orderWithinMinutes'] as num).toInt(),
      deliveryDate: DateTime.parse(json['deliveryDate'] as String),
      zoneCode: json['zoneCode'] as String? ?? '',
    );

Map<String, dynamic> _$DeliveryPromiseToJson(_DeliveryPromise instance) =>
    <String, dynamic>{
      'orderWithinMinutes': instance.orderWithinMinutes,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
      'zoneCode': instance.zoneCode,
    };

_ProductModel3D _$ProductModel3DFromJson(Map<String, dynamic> json) =>
    _ProductModel3D(
      modelUrl: json['modelUrl'] as String,
      heightCm: (json['heightCm'] as num).toDouble(),
      tintable: json['tintable'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductModel3DToJson(_ProductModel3D instance) =>
    <String, dynamic>{
      'modelUrl': instance.modelUrl,
      'heightCm': instance.heightCm,
      'tintable': instance.tintable,
    };

_ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    _ProductDetail(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      fabricAndCare: json['fabricAndCare'] as String?,
      sizeAndFit: json['sizeAndFit'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      collection: json['collection'] == null
          ? null
          : Collection.fromJson(json['collection'] as Map<String, dynamic>),
      productType:
          $enumDecodeNullable(
            _$ProductTypeEnumMap,
            json['productType'],
            unknownValue: ProductType.unknown,
          ) ??
          ProductType.unknown,
      fit:
          $enumDecodeNullable(
            _$FitEnumMap,
            json['fit'],
            unknownValue: Fit.unknown,
          ) ??
          Fit.unknown,
      fabric: json['fabric'] as String?,
      price: (json['price'] as num).toDouble(),
      compareAtPrice: (json['compareAtPrice'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toInt(),
      badges:
          (json['badges'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => ProductColor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductColor>[],
      sizeChart:
          (json['sizeChart'] as List<dynamic>?)
              ?.map((e) => SizeChartRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SizeChartRow>[],
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      recommendedSize: json['recommendedSize'] == null
          ? null
          : SizeRecommendation.fromJson(
              json['recommendedSize'] as Map<String, dynamic>,
            ),
      deliveryPromise: json['deliveryPromise'] == null
          ? null
          : DeliveryPromise.fromJson(
              json['deliveryPromise'] as Map<String, dynamic>,
            ),
      availableInStudio: json['availableInStudio'] as bool? ?? false,
      isWishlisted: json['isWishlisted'] as bool? ?? false,
      model3D: json['model3D'] == null
          ? null
          : ProductModel3D.fromJson(json['model3D'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailToJson(_ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'fabricAndCare': instance.fabricAndCare,
      'sizeAndFit': instance.sizeAndFit,
      'category': instance.category,
      'collection': instance.collection,
      'productType': _$ProductTypeEnumMap[instance.productType]!,
      'fit': _$FitEnumMap[instance.fit]!,
      'fabric': instance.fabric,
      'price': instance.price,
      'compareAtPrice': instance.compareAtPrice,
      'discountPercent': instance.discountPercent,
      'badges': instance.badges,
      'tags': instance.tags,
      'colors': instance.colors,
      'sizeChart': instance.sizeChart,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'recommendedSize': instance.recommendedSize,
      'deliveryPromise': instance.deliveryPromise,
      'availableInStudio': instance.availableInStudio,
      'isWishlisted': instance.isWishlisted,
      'model3D': instance.model3D,
    };

const _$ProductTypeEnumMap = {
  ProductType.hoodie: 'Hoodie',
  ProductType.zipHoodie: 'ZipHoodie',
  ProductType.tShirt: 'TShirt',
  ProductType.sweatshirt: 'Sweatshirt',
  ProductType.sweatpants: 'Sweatpants',
  ProductType.shorts: 'Shorts',
  ProductType.unknown: '',
};

_Recommendations _$RecommendationsFromJson(Map<String, dynamic> json) =>
    _Recommendations(
      youMayAlsoLike:
          (json['youMayAlsoLike'] as List<dynamic>?)
              ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductCard>[],
      completeTheLook:
          (json['completeTheLook'] as List<dynamic>?)
              ?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductCard>[],
    );

Map<String, dynamic> _$RecommendationsToJson(_Recommendations instance) =>
    <String, dynamic>{
      'youMayAlsoLike': instance.youMayAlsoLike,
      'completeTheLook': instance.completeTheLook,
    };

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  id: json['id'] as String,
  authorName: json['authorName'] as String? ?? '',
  rating: (json['rating'] as num).toInt(),
  title: json['title'] as String?,
  body: json['body'] as String? ?? '',
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'id': instance.id,
  'authorName': instance.authorName,
  'rating': instance.rating,
  'title': instance.title,
  'body': instance.body,
  'createdAt': instance.createdAt.toIso8601String(),
};
