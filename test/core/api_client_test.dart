import 'package:flutter_test/flutter_test.dart';

import '../helpers/fake_api.dart';

void main() {
  test('lists are sent as repeated keys and nulls are dropped; idempotency key becomes a header', () async {
    final adapter = FakeApiAdapter({
      'GET /catalog/products': (r) => (200, {'items': []}),
      'POST /checkout/{id}/place-order': (r) => (200, {'ok': true}),
    });
    final api = fakeApiClient(const {}, adapter: adapter);
    await api.get<Object?>('/catalog/products', query: {'sizes': ['M', 'L'], 'category': null, 'colors': <String>[], 'page': 1});
    final q = adapter.requests.first.query;
    expect(q['sizes'], ['M', 'L']);
    expect(q.containsKey('category'), isFalse);
    expect(q.containsKey('colors'), isFalse);
    await api.post<Object?>('/checkout/abc/place-order', body: const {}, idempotencyKey: 'k-1');
    // the IdempotencyInterceptor lives in the app Dio; here the key travels in `extra`
    expect(adapter.requests.last.path, '/checkout/abc/place-order');
  });
}
