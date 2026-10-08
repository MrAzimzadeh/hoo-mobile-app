import 'package:equatable/equatable.dart';

import '../../../shared/domain/enums.dart';

/// The user's catalog selection (`GET /catalog/products` query). Scope (category / collection / chip) narrows
/// what the facets are counted over; the rest are filters. Values are the facet `value`s the server returned, so
/// they round-trip without client-side mapping.
class ProductQuery extends Equatable {
  const ProductQuery({
    this.category,
    this.collection,
    this.tag,
    this.chip = ProductChip.all,
    this.sizes = const {},
    this.colors = const {},
    this.fits = const {},
    this.minPrice,
    this.maxPrice,
    this.inStockOnly = false,
    this.sort = ProductSort.newest,
  });

  final String? category;
  final String? collection;
  final String? tag;
  final ProductChip chip;
  final Set<String> sizes;
  final Set<String> colors;
  final Set<String> fits;
  final double? minPrice;
  final double? maxPrice;
  final bool inStockOnly;
  final ProductSort sort;

  bool get hasPriceFilter => minPrice != null || maxPrice != null;

  /// Number of filters set in the filter sheet (sort and scope not counted) — the badge on the Filter button.
  int get filterCount => sizes.length + colors.length + fits.length + (hasPriceFilter ? 1 : 0) + (inStockOnly ? 1 : 0);

  /// Same scope, no filters, default sort.
  ProductQuery cleared() => ProductQuery(category: category, collection: collection, tag: tag, chip: chip);

  ProductQuery copyWith({
    Object? category = _keep,
    Object? collection = _keep,
    Object? tag = _keep,
    ProductChip? chip,
    Set<String>? sizes,
    Set<String>? colors,
    Set<String>? fits,
    Object? minPrice = _keep,
    Object? maxPrice = _keep,
    bool? inStockOnly,
    ProductSort? sort,
  }) => ProductQuery(
    category: identical(category, _keep) ? this.category : category as String?,
    collection: identical(collection, _keep) ? this.collection : collection as String?,
    tag: identical(tag, _keep) ? this.tag : tag as String?,
    chip: chip ?? this.chip,
    sizes: sizes ?? this.sizes,
    colors: colors ?? this.colors,
    fits: fits ?? this.fits,
    minPrice: identical(minPrice, _keep) ? this.minPrice : minPrice as double?,
    maxPrice: identical(maxPrice, _keep) ? this.maxPrice : maxPrice as double?,
    inStockOnly: inStockOnly ?? this.inStockOnly,
    sort: sort ?? this.sort,
  );

  /// Query parameters; lists go out as repeated keys (`sizes=M&sizes=L`), nulls/empties are dropped by ApiClient.
  Map<String, dynamic> toQuery({required int page, required int pageSize}) => {
    'category': category,
    'collection': collection,
    'tag': tag,
    if (chip != ProductChip.all) 'chip': chip.wire,
    'sizes': (sizes.toList()..sort()),
    'colors': (colors.toList()..sort()),
    'fits': (fits.toList()..sort()),
    'minPrice': minPrice,
    'maxPrice': maxPrice,
    if (inStockOnly) 'inStockOnly': true,
    'sort': sort.wire,
    'page': page,
    'pageSize': pageSize,
  };

  /// Stable cache key for the first page (offline fallback).
  String cacheKey(int pageSize) {
    final q = toQuery(page: 1, pageSize: pageSize)..removeWhere((_, v) => v == null || (v is List && v.isEmpty));
    final keys = q.keys.toList()..sort();
    return 'catalog.products?${keys.map((k) => '$k=${q[k]}').join('&')}';
  }

  @override
  List<Object?> get props => [category, collection, tag, chip, sizes, colors, fits, minPrice, maxPrice, inStockOnly, sort];
}

const _keep = Object();
