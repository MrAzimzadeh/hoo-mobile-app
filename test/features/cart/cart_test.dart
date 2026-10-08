import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/storage/app_database.dart';
import 'package:hoo/features/cart/data/bag_store.dart';
import 'package:hoo/features/cart/data/cart_repository_impl.dart';
import 'package:hoo/features/cart/presentation/cubit/bag_cubit.dart';

import '../../helpers/fake_api.dart';
import '../../helpers/memory_session.dart';

Map<String, Object?> _cart({int qty = 1}) => {
  'id': 'c1',
  'items': [
    {'id': 'i1', 'variantId': 'v1', 'name': 'Hoodie', 'unitPrice': 89.0, 'quantity': qty, 'lineTotal': 89.0 * qty, 'stockLeft': 5},
  ],
  'itemsCount': qty,
  'totals': {'subtotal': 89.0 * qty, 'discount': 0, 'total': 89.0 * qty, 'vatIncluded': 13.57},
  'canCheckout': true,
};

void main() {
  late AppDatabase db;
  setUp(() => db = AppDatabase.memory());
  tearDown(() => db.close());

  Future<BagStore> store(Map<String, FakeHandler> routes, FakeApiAdapter adapter) async {
    final session = await memorySession();
    return BagStore(CartRepositoryImpl(fakeApiClient(routes, adapter: adapter), db, session), null);
  }

  test('addVariant posts the variant and publishes the server-priced count', () async {
    final routes = <String, FakeHandler>{'POST /cart/items': (r) => (200, _cart())};
    final adapter = FakeApiAdapter(routes);
    final bag = await store(routes, adapter);
    final counts = <int>[];
    bag.count.listen(counts.add);
    await bag.addVariant('v1');
    await Future<void>.delayed(Duration.zero);
    expect((adapter.requests.single.body as Map)['variantId'], 'v1');
    expect(bag.currentCount, 1);
    expect(counts, contains(1));
    expect(bag.cart!.totals.total, 89.0);
  });

  test('BagCubit debounces quantity steps into one PATCH and shows the server total', () async {
    var patched = 0;
    final routes = <String, FakeHandler>{
      'GET /cart': (_) => (200, _cart()),
      'PATCH /cart/items/i1': (r) {
        patched++;
        return (200, _cart(qty: (r.body as Map)['quantity'] as int));
      },
    };
    final adapter = FakeApiAdapter(routes);
    final bag = await store(routes, adapter);
    final cubit = BagCubit(bag, quantityDebounce: const Duration(milliseconds: 10));
    await cubit.load();
    final item = bag.cart!.items.single;
    cubit
      ..changeQuantity(item, 2)
      ..changeQuantity(item, 3);
    await cubit.stream.firstWhere((s) => s.cart?.itemsCount == 3);
    expect(patched, 1);
    expect(cubit.state.cart!.totals.total, 267.0);
    await cubit.close();
  });
}
