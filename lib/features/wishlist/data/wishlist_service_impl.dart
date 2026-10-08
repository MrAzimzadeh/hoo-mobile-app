import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../../core/error/api_exception.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/design_system/components/hoo_feedback.dart';
import '../../../shared/domain/models.dart';
import '../domain/wishlist_repositories.dart';
import 'wishlist_api.dart';

/// Wishlist ids behind every heart in the app (Home, Shop, Search, PDP, Wishlist).
///
/// * Hearts are optimistic: the set changes at once and rolls back if the request fails.
/// * Follows the signed-in user: loads the list on sign-in / account switch, clears it on sign-out. A response
///   that belongs to a previous user is dropped.
/// * Requests still in flight are overlaid on every server list, so a refresh racing a toggle never flickers.
class WishlistServiceImpl implements WishlistService {
  /// [authGate] is resolved lazily — the auth module may register it after this one.
  WishlistServiceImpl(this._repository, this._authGate);

  final WishlistRepository _repository;
  final AuthGate Function() _authGate;

  final _changes = StreamController<Set<String>>.broadcast();
  Set<String> _ids = const {};

  /// productId → the state a request in flight is setting.
  final _pending = <String, bool>{};

  /// productId → identity of the latest operation (an older failing request must not roll back a newer one).
  final _ops = <String, Object>{};

  StreamSubscription<Me?>? _authSubscription;
  String? _userId;

  /// Bumped on every user change; responses started under another generation are ignored.
  int _generation = 0;
  bool _started = false;
  Future<List<ProductCard>>? _loading;

  @override
  Stream<Set<String>> get ids {
    _ensureStarted();
    return Stream.multi((listener) {
      listener.add(_ids);
      final sub = _changes.stream.listen(listener.add, onError: listener.addError, onDone: listener.close);
      listener.onCancel = sub.cancel;
    });
  }

  @override
  Set<String> get currentIds {
    _ensureStarted();
    return _ids;
  }

  @override
  bool contains(String productId) => currentIds.contains(productId);

  bool isPending(String productId) => _pending.containsKey(productId);

  @override
  Future<bool?> toggle(BuildContext context, String productId) async {
    _ensureStarted();
    final signedIn = await _authGate().requireSignIn(context);
    if (!signedIn) return null;
    // A second tap while the first request is in flight is ignored (no request ping-pong).
    if (isPending(productId)) return contains(productId);
    final next = !contains(productId);
    try {
      await setWishlisted(productId, next);
      return next;
    } on ApiException catch (e) {
      if (context.mounted) HooToast.error(context, e);
      return contains(productId);
    }
  }

  /// Optimistically adds/removes [productId]; rolls back and rethrows the [ApiException] on failure.
  Future<void> setWishlisted(String productId, bool wishlisted) async {
    _ensureStarted();
    final before = _ids.contains(productId);
    if (before == wishlisted && !isPending(productId)) return;
    final generation = _generation;
    final op = Object();
    _ops[productId] = op;
    _pending[productId] = wishlisted;
    _emit(_with(_ids, productId, wishlisted));
    try {
      if (wishlisted) {
        await _repository.add(productId);
      } else {
        await _repository.remove(productId);
      }
    } on ApiException {
      if (generation == _generation && identical(_ops[productId], op)) {
        _ops.remove(productId);
        _pending.remove(productId);
        _emit(_with(_ids, productId, before));
      }
      rethrow;
    }
    if (identical(_ops[productId], op)) {
      _ops.remove(productId);
      _pending.remove(productId);
    }
  }

  @override
  Future<void> refresh() async {
    try {
      await load();
    } on ApiException catch (e) {
      // Hearts keep their last known state; screens that need the list handle errors through [load].
      if (kDebugMode) debugPrint('[wishlist] refresh failed: ${e.code}');
    }
  }

  /// `GET /wishlist`: updates the ids and returns the cards (the Wishlist page renders them). Concurrent calls share
  /// one request. Returns an empty list when signed out.
  Future<List<ProductCard>> load() {
    _ensureStarted();
    if (_authGate().currentUser == null) {
      _emit(const {});
      return Future.value(const []);
    }
    return _loading ??= _fetch().whenComplete(() => _loading = null);
  }

  Future<List<ProductCard>> _fetch() async {
    final generation = _generation;
    final items = await _repository.list();
    if (generation != _generation) return const [];
    var ids = items.map((p) => p.id).toSet();
    for (final e in _pending.entries) {
      ids = _with(ids, e.key, e.value);
    }
    _emit(ids);
    return items;
  }

  void _ensureStarted() {
    if (_started) return;
    _started = true;
    final auth = _authGate();
    _userId = auth.currentUser?.id;
    _authSubscription = auth.userChanges.listen(_onUserChanged);
    if (_userId != null) unawaited(refresh());
  }

  void _onUserChanged(Me? user) {
    final id = user?.id;
    if (id == _userId) return;
    _userId = id;
    _generation++;
    _pending.clear();
    _ops.clear();
    _loading = null;
    _emit(const {});
    if (id != null) unawaited(refresh());
  }

  void _emit(Set<String> ids) {
    if (setEquals(ids, _ids)) return;
    _ids = Set.unmodifiable(ids);
    if (!_changes.isClosed) _changes.add(_ids);
  }

  static Set<String> _with(Set<String> ids, String id, bool present) => present ? {...ids, id} : ({...ids}..remove(id));

  @visibleForTesting
  Future<void> dispose() async {
    await _authSubscription?.cancel();
    await _changes.close();
  }
}

/// Records product views for "Recently viewed" (guests too). Fire-and-forget: never throws, never blocks the PDP.
class RecentlyViewedServiceImpl implements RecentlyViewedService {
  RecentlyViewedServiceImpl(this._api);

  final WishlistApi _api;

  @override
  Future<void> record(String productId) async {
    try {
      await _api.recordView(productId);
    } catch (e) {
      if (kDebugMode) debugPrint('[recently-viewed] dropped: $e');
    }
  }
}
