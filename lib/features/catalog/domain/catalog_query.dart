import 'package:equatable/equatable.dart';

import '../../../shared/domain/enums.dart';

/// The kinds of filters that show up as removable chips.
enum CatalogFilterKind { category, collection, size, color, fit, fabric, price, inStock }

/// One active filter (a removable chip). [value] is the wire value; labels are resolved by the UI from facets.
class ActiveFilter extends Equatable {
  const ActiveFilter(this.kind, [this.value = '']);

  final CatalogFilterKind kind;
  final String value;

  @override
  List<Object?> get props => [kind, value];
}

/// Everything `GET /catalog/products` filters by — immutable, value-equal (so identical queries are deduped)
/// and serialisable to the exact query string the backend binds (`ProductListQuery`).
///
/// Lists are kept sorted so the request (and the offline cache key) is deterministic.
class CatalogQuery extends Equatable {
  const CatalogQuery({
    this.category,
    this.collection,
    this.tag,
    this.sizes = const [],
    this.colors = const [],
    this.fits = const [],
    this.fabrics = const [],
    this.minPrice,
    this.maxPrice,
    this.inStockOnly = false,
    this.chip = ProductChip.all,
    this.sort = ProductSort.newest,
  });

  /// Category slug.
  final String? category;

  /// Collection slug.
  final String? collection;
  final String? tag;

  /// Size facet values (`XS`…`XXXL`, as the facet returns them).
  final List<String> sizes;

  /// Color codes (`BLK`, `CRM`…).
  final List<String> colors;

  /// Fit wire values (`Oversized`…).
  final List<String> fits;

  /// Fabric codes.
  final List<String> fabrics;

  /// Whole manats chosen on the price slider (bounds come from the server facets).
  final int? minPrice;
  final int? maxPrice;
  final bool inStockOnly;
  final ProductChip chip;
  final ProductSort sort;

  static const defaultPageSize = 12;

  /// Query parameters for `GET /catalog/products`. Empty values are dropped by `ApiClient`; lists go out as
  /// repeated keys (`sizes=M&sizes=L`).
  Map<String, dynamic> toParams({int page = 1, int pageSize = defaultPageSize}) => {
        'category': category,
        'collection': collection,
        'tag': tag,
        'sizes': _sorted(sizes),
        'colors': _sorted(colors),
        'fits': _sorted(fits),
        'fabrics': _sorted(fabrics),
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'inStockOnly': inStockOnly ? true : null,
        'chip': chip == ProductChip.all ? null : chip.wire,
        'sort': sort.wire,
        'page': page,
        'pageSize': pageSize,
      };

  /// Stable key for the offline cache (first page only).
  String get cacheKey {
    final p = toParams()..removeWhere((k, v) => v == null || (v is List && v.isEmpty) || k == 'page' || k == 'pageSize');
    final keys = p.keys.toList()..sort();
    return 'catalog.products?${keys.map((k) => '$k=${p[k] is List ? (p[k] as List).join(',') : p[k]}').join('&')}';
  }

  /// Active filters in display order (sort and quick chip have their own controls).
  List<ActiveFilter> activeFilters({bool includeCategory = true, bool includeCollection = true}) => [
        if (includeCategory && category != null) ActiveFilter(CatalogFilterKind.category, category!),
        if (includeCollection && collection != null) ActiveFilter(CatalogFilterKind.collection, collection!),
        for (final s in sizes) ActiveFilter(CatalogFilterKind.size, s),
        for (final c in colors) ActiveFilter(CatalogFilterKind.color, c),
        for (final f in fits) ActiveFilter(CatalogFilterKind.fit, f),
        for (final f in fabrics) ActiveFilter(CatalogFilterKind.fabric, f),
        if (minPrice != null || maxPrice != null) const ActiveFilter(CatalogFilterKind.price),
        if (inStockOnly) const ActiveFilter(CatalogFilterKind.inStock),
      ];

  CatalogQuery without(ActiveFilter f) => switch (f.kind) {
        CatalogFilterKind.category => withCategory(null),
        CatalogFilterKind.collection => withCollection(null),
        CatalogFilterKind.size => copyWith(sizes: sizes.where((v) => v != f.value).toList()),
        CatalogFilterKind.color => copyWith(colors: colors.where((v) => v != f.value).toList()),
        CatalogFilterKind.fit => copyWith(fits: fits.where((v) => v != f.value).toList()),
        CatalogFilterKind.fabric => copyWith(fabrics: fabrics.where((v) => v != f.value).toList()),
        CatalogFilterKind.price => withPrice(null, null),
        CatalogFilterKind.inStock => copyWith(inStockOnly: false),
      };

  /// Clears every filter except the locked scope (preset category/collection/chip) and the sort order.
  CatalogQuery cleared({required CatalogQuery scope}) =>
      CatalogQuery(category: scope.category, collection: scope.collection, tag: scope.tag, chip: chip, sort: sort);

  CatalogQuery toggle(CatalogFilterKind kind, String value) {
    List<String> flip(List<String> list) => list.contains(value) ? (list.where((v) => v != value).toList()) : [...list, value];
    return switch (kind) {
      CatalogFilterKind.size => copyWith(sizes: flip(sizes)),
      CatalogFilterKind.color => copyWith(colors: flip(colors)),
      CatalogFilterKind.fit => copyWith(fits: flip(fits)),
      CatalogFilterKind.fabric => copyWith(fabrics: flip(fabrics)),
      CatalogFilterKind.category => withCategory(category == value ? null : value),
      CatalogFilterKind.collection => withCollection(collection == value ? null : value),
      CatalogFilterKind.inStock => copyWith(inStockOnly: !inStockOnly),
      CatalogFilterKind.price => withPrice(null, null),
    };
  }

  CatalogQuery withCategory(String? slug) => _copy(category: () => slug);
  CatalogQuery withCollection(String? slug) => _copy(collection: () => slug);
  CatalogQuery withPrice(int? min, int? max) => _copy(minPrice: () => min, maxPrice: () => max);

  CatalogQuery copyWith({
    List<String>? sizes,
    List<String>? colors,
    List<String>? fits,
    List<String>? fabrics,
    bool? inStockOnly,
    ProductChip? chip,
    ProductSort? sort,
  }) =>
      _copy(sizes: sizes, colors: colors, fits: fits, fabrics: fabrics, inStockOnly: inStockOnly, chip: chip, sort: sort);

  CatalogQuery _copy({
    String? Function()? category,
    String? Function()? collection,
    List<String>? sizes,
    List<String>? colors,
    List<String>? fits,
    List<String>? fabrics,
    int? Function()? minPrice,
    int? Function()? maxPrice,
    bool? inStockOnly,
    ProductChip? chip,
    ProductSort? sort,
  }) =>
      CatalogQuery(
        category: category == null ? this.category : category(),
        collection: collection == null ? this.collection : collection(),
        tag: tag,
        sizes: sizes ?? this.sizes,
        colors: colors ?? this.colors,
        fits: fits ?? this.fits,
        fabrics: fabrics ?? this.fabrics,
        minPrice: minPrice == null ? this.minPrice : minPrice(),
        maxPrice: maxPrice == null ? this.maxPrice : maxPrice(),
        inStockOnly: inStockOnly ?? this.inStockOnly,
        chip: chip ?? this.chip,
        sort: sort ?? this.sort,
      );

  static List<String> _sorted(List<String> v) => [...v]..sort();

  @override
  List<Object?> get props => [category, collection, tag, _sorted(sizes), _sorted(colors), _sorted(fits), _sorted(fabrics), minPrice, maxPrice, inStockOnly, chip, sort];
}
