// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => _SearchResult(
  query: json['query'] as String? ?? '',
  items: (json['items'] as List<dynamic>?)?.map((e) => ProductCard.fromJson(e as Map<String, dynamic>)).toList() ?? const <ProductCard>[],
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  suggestDesignYourOwn: json['suggestDesignYourOwn'] as bool? ?? false,
);

Map<String, dynamic> _$SearchResultToJson(_SearchResult instance) => <String, dynamic>{
  'query': instance.query,
  'items': instance.items,
  'totalCount': instance.totalCount,
  'suggestDesignYourOwn': instance.suggestDesignYourOwn,
};
