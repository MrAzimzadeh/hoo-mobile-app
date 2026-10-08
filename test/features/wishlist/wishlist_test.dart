import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/features/wishlist/data/wishlist_api.dart';
import 'package:hoo/features/wishlist/data/wishlist_repositories_impl.dart';
import 'package:hoo/features/wishlist/data/wishlist_service_impl.dart';
import 'package:hoo/shared/application/contracts.dart';
import 'package:hoo/shared/domain/models.dart';

import '../../helpers/fake_api.dart';

class _Auth implements AuthGate {
  final _users = const Stream<Me?>.empty();
  @override
  Me? get currentUser => const Me(id: 'u1', fullName: 'A B');
  @override
  bool get isSignedIn => true;
  @override
  Stream<Me?> get userChanges => _users;
  @override
  Future<bool> requireSignIn(BuildContext context, {String? reason}) async => true;
  @override
  Future<void> signOut({bool allDevices = false}) async {}
  @override
  Future<void> refreshUser() async {}
}

const _card = {'id': 'p1', 'slug': 'hoodie', 'name': 'Hoodie', 'price': 89.0};

void main() {
  WishlistServiceImpl service(FakeApiAdapter adapter) =>
      WishlistServiceImpl(WishlistRepositoryImpl(WishlistApi(fakeApiClient({}, adapter: adapter))), () => _Auth());

  test('heart is optimistic and rolls back when the request fails', () async {
    final failing = FakeApiAdapter({
      'GET /wishlist': (_) => (200, []),
      'POST /wishlist/p1': (_) => (500, {'code': 'general.unknown', 'title': 'x', 'status': 500}),
    });
    final s = service(failing);
    addTearDown(s.dispose);
    final seen = <Set<String>>[];
    s.ids.listen(seen.add);
    await s.load();
    await expectLater(s.setWishlisted('p1', true), throwsA(anything));
    expect(s.contains('p1'), isFalse);
    expect(seen.any((ids) => ids.contains('p1')), isTrue);
  });

  test('load syncs ids from the server list', () async {
    final s = service(
      FakeApiAdapter({
        'GET /wishlist': (_) => (200, [_card]),
      }),
    );
    addTearDown(s.dispose);
    final items = await s.load();
    expect(items.single.slug, 'hoodie');
    expect(s.contains('p1'), isTrue);
  });
}
