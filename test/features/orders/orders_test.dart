import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/storage/app_database.dart';
import 'package:hoo/features/orders/data/orders_api.dart';
import 'package:hoo/features/orders/data/orders_repositories.dart';
import 'package:hoo/features/orders/domain/models/order_models.dart';
import 'package:hoo/features/orders/domain/return_form.dart';
import 'package:hoo/features/orders/presentation/cubit/orders_list_cubit.dart';
import 'package:hoo/shared/domain/enums.dart';

import '../../helpers/fake_api.dart';

Map<String, Object?> _order({String status = 'Delivered', bool canReturn = true}) => {
  'id': 'o1',
  'number': 'HOO-1',
  'status': status,
  'createdAt': '2026-10-01T10:00:00Z',
  'contact': {'fullName': 'A B', 'phone': '+994501234567'},
  'delivery': {'zoneCode': 'baku', 'zoneName': 'Baku', 'kind': 'Courier'},
  'lines': [
    {'id': 'l1', 'name': 'Hoodie', 'size': 'M', 'quantity': 2, 'unitPrice': 89.0, 'lineTotal': 178.0, 'kind': 'Stock'},
    {'id': 'l2', 'name': 'Custom tee', 'quantity': 1, 'kind': 'Custom', 'nonReturnable': true},
  ],
  'canReturn': canReturn,
};

void main() {
  late AppDatabase db;
  setUp(() => db = AppDatabase.memory());
  tearDown(() => db.close());

  test('ReturnForm: custom and non-returnable lines are never offered; exchange needs a different size', () {
    final order = OrderDetail.fromJson(_order());
    expect(order.returnableLines.map((l) => l.id), ['l1']);
    var form = ReturnForm.forOrder(order);
    expect(form.issues, contains(ReturnFormIssue.noItems));
    form = form.toggle('l1').withQuantity('l1', 1);
    expect(form.issues, isEmpty);
    form = form.withKind(ReturnKind.exchange);
    expect(form.issues, contains(ReturnFormIssue.exchangeSizeMissing));
    expect(form.withExchangeSize('l1', Size.m).issues, contains(ReturnFormIssue.exchangeSameSize));
    expect(form.withExchangeSize('l1', Size.l).issues, isEmpty);
  });

  test('guest order is loaded through the tracking endpoint with the phone', () async {
    final adapter = FakeApiAdapter({
      'GET /orders/track': (_) => (200, {'order': _order(), 'isRecipientView': false}),
    });
    final repo = OrdersRepositoryImpl(OrdersApi(fakeApiClient({}, adapter: adapter)), db, () => 'az');
    final loaded = await repo.order(const OrderAccess.guest('HOO-1', '+994501234567'));
    expect(loaded.order.number, 'HOO-1');
    expect(adapter.requests.single.query['phone'], '+994501234567');
  });

  test('OrdersListCubit pages and filters by status', () async {
    Map<String, Object?> item(String n, String s) => {'id': n, 'number': n, 'status': s, 'total': 10.0, 'createdAt': '2026-10-01T10:00:00Z'};
    final api = fakeApiClient({
      'GET /account/orders': (_) => (
        200,
        {
          'items': [item('A', 'Delivered'), item('B', 'OutForDelivery'), item('C', 'Cancelled')],
          'page': 1,
          'pageSize': 20,
          'totalCount': 3,
          'hasMore': false,
        },
      ),
    });
    final cubit = OrdersListCubit(OrdersRepositoryImpl(OrdersApi(api), db, () => 'az'));
    await cubit.load();
    expect(cubit.state.visible.length, 3);
    cubit.setFilter(OrderFilter.active);
    expect(cubit.state.visible.map((o) => o.number), ['B']);
    cubit.setFilter(OrderFilter.closed);
    expect(cubit.state.visible.map((o) => o.number), ['C']);
    await cubit.close();
  });
}
