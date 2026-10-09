import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/features/catalog/domain/catalog_query.dart';
import 'package:hoo/shared/domain/enums.dart';

void main() {
  test('toParams uses the backend names and wire enums, lists sorted', () {
    const q = CatalogQuery(category: 'hoodies', sizes: ['L', 'M'], chip: ProductChip.sale, sort: ProductSort.priceAsc, inStockOnly: true);
    final p = q.toParams(page: 2, pageSize: 12);
    expect(p['category'], 'hoodies');
    expect(p['sizes'], ['L', 'M']);
    expect(p['chip'], 'Sale');
    expect(p['sort'], 'PriceAsc');
    expect(p['inStockOnly'], true);
    expect(p['page'], 2);
  });

  test('toggle / without / cleared keep the scope', () {
    var q = const CatalogQuery(collection: 'winter');
    q = q.toggle(CatalogFilterKind.size, 'M').toggle(CatalogFilterKind.color, 'BLK');
    expect(q.activeFilters(includeCollection: false).length, 2);
    q = q.without(const ActiveFilter(CatalogFilterKind.size, 'M'));
    expect(q.sizes, isEmpty);
    expect(q.cleared(scope: const CatalogQuery(collection: 'winter')).collection, 'winter');
  });

  test('equal filters produce equal queries regardless of order', () {
    expect(const CatalogQuery(sizes: ['M', 'L']), const CatalogQuery(sizes: ['L', 'M']));
  });
}
