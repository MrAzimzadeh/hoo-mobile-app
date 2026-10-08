import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/analytics/analytics.dart';
import 'package:hoo/core/error/api_exception.dart';
import 'package:hoo/core/storage/app_database.dart';
import 'package:hoo/core/storage/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hoo/features/catalog/data/catalog_repository_impl.dart';
import 'package:hoo/features/catalog/domain/product_query.dart';
import 'package:hoo/features/catalog/presentation/cubit/product_cubit.dart';
import 'package:hoo/features/catalog/presentation/cubit/product_list_cubit.dart';
import 'package:hoo/shared/application/contracts.dart';
import 'package:hoo/shared/domain/enums.dart';

import '../../helpers/fake_api.dart';

const _card = {'id': 'p1', 'slug': 'hoodie', 'name': 'Hoodie', 'price': 89.0};

Map<String, Object?> _productJson({bool mSoldOut = false}) => {
  'id': 'p1',
  'slug': 'hoodie',
  'name': 'Hoodie',
  'price': 89.0,
  'category': {'id': 'c1', 'slug': 'hoodies', 'name': 'Hoodies'},
  'colors': [
    {
      'color': {'id': 'k1', 'code': 'black', 'name': 'Black', 'hex': '#121212'},
      'images': ['a.jpg'],
      'variants': [
        {'id': 'v-s', 'size': 'S', 'price': 89.0, 'inStock': true},
        {'id': 'v-m', 'size': 'M', 'price': 89.0, 'inStock': !mSoldOut},
      ],
    },
  ],
  'recommendedSize': {'size': 'M', 'basis': 'UsualSize', 'fit': 'Regular'},
};

class _Bag implements BagService {
  String? added;
  @override
  Stream<int> get count => const Stream.empty();
  @override
  int get currentCount => 0;
  @override
  Future<void> addVariant(String variantId, {int quantity = 1}) async => added = variantId;
  @override
  Future<void> addDesign(String designId, {int quantity = 1}) async {}
  @override
  Future<void> refresh() async {}
  @override
  Future<void> showAddedSheet(context) async {}
}

class _Recent implements RecentlyViewedService {
  @override
  Future<void> record(String productId) async {}
}

Future<Analytics> _analytics() async {
  SharedPreferences.setMockInitialValues({});
  return Analytics(fakeApiClient({}), Preferences(await SharedPreferences.getInstance()));
}

void main() {
  late AppDatabase db;
  setUp(() => db = AppDatabase.memory());
  tearDown(() => db.close());

  test('products query sends repeated filter keys and decodes facets', () async {
    final adapter = FakeApiAdapter({
      'GET /catalog/products': (_) => (
        200,
        {
          'items': [_card],
          'page': 1,
          'pageSize': 24,
          'totalCount': 1,
          'hasMore': false,
          'facets': {
            'sizes': [
              {'value': 'M', 'label': 'M', 'count': 3},
            ],
          },
        },
      ),
    });
    final repo = CatalogRepositoryImpl(fakeApiClient({}, adapter: adapter), db, () => 'az');
    final r = await repo.products(const ProductQuery(sizes: {'M', 'L'}, sort: ProductSort.priceAsc));
    expect(r.data.items.single.slug, 'hoodie');
    expect(r.data.facets.sizes.single.count, 3);
    expect(adapter.requests.single.query['sizes'], ['L', 'M']);
    expect(adapter.requests.single.query['sort'], 'PriceAsc');
  });

  test('ProductListCubit appends pages without duplicates and stops at hasMore=false', () async {
    var call = 0;
    final api = fakeApiClient({
      'GET /catalog/products': (r) {
        call++;
        final page = r.query['page'] as int;
        return (
          200,
          {
            'items': page == 1
                ? [_card]
                : [
                    {..._card, 'id': 'p2', 'slug': 'tee'},
                    _card,
                  ],
            'page': page,
            'pageSize': 24,
            'totalCount': 3,
            'hasMore': page == 1,
          },
        );
      },
      'GET /catalog/categories': (_) => (200, []),
      'GET /catalog/collections': (_) => (200, []),
      'GET /catalog/colors': (_) => (200, []),
    });
    final cubit = ProductListCubit(CatalogRepositoryImpl(api, db, () => 'az'));
    await cubit.load();
    expect(cubit.state.items.length, 1);
    await cubit.loadMore();
    expect(cubit.state.items.map((e) => e.id), ['p1', 'p2']);
    expect(cubit.state.hasMore, isFalse);
    expect(call, 2);
    await cubit.close();
  });

  test('ProductCubit pre-selects the recommended size and adds the chosen variant to the bag', () async {
    final api = fakeApiClient({'GET /catalog/products/hoodie': (_) => (200, _productJson()), 'GET /catalog/products/hoodie/recommendations': (_) => (200, {})});
    final bag = _Bag();
    final cubit = ProductCubit(ProductRepositoryImpl(api, db, () => 'az'), bag, _Recent(), await _analytics(), slug: 'hoodie');
    await cubit.load();
    expect(cubit.state.size, Size.m);
    expect(await cubit.addToBag(), isNull);
    expect(bag.added, 'v-m');
    expect(cubit.selectSize(Size.s), isTrue);
    await cubit.close();
  });

  test('ProductCubit refuses a sold-out recommended size', () async {
    final api = fakeApiClient({
      'GET /catalog/products/hoodie': (_) => (200, _productJson(mSoldOut: true)),
      'GET /catalog/products/hoodie/recommendations': (_) => (200, {}),
    });
    final cubit = ProductCubit(ProductRepositoryImpl(api, db, () => 'az'), _Bag(), _Recent(), await _analytics(), slug: 'hoodie');
    await cubit.load();
    expect(cubit.state.size, isNull);
    expect(cubit.selectSize(Size.m), isFalse);
    expect(cubit.state.canAddToBag, isFalse);
    await cubit.close();
  });

  test('a 404 product surfaces as failure with the API code', () async {
    final cubit = ProductCubit(ProductRepositoryImpl(fakeApiClient({}), db, () => 'az'), _Bag(), _Recent(), await _analytics(), slug: 'nope');
    await cubit.load();
    expect(cubit.state.status, ProductStatus.failure);
    expect((cubit.state.error as ApiException).isNotFound, isTrue);
    await cubit.close();
  });
}
