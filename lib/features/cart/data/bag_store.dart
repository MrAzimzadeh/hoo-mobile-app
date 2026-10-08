import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../core/analytics/analytics.dart';
import '../../../core/error/api_exception.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/domain/models.dart';
import '../domain/cart_models.dart';
import '../domain/cart_repository.dart';

/// What the app currently knows about the bag.
@immutable
class BagSnapshot {
  const BagSnapshot({this.cart, this.stale = false, this.loading = false, this.error});

  /// Last server bag (null until the first successful fetch).
  final Cart? cart;

  /// Served from the offline cache — render read-only.
  final bool stale;

  /// A fetch is in flight and nothing is known yet.
  final bool loading;

  /// The last fetch failed and there is no bag to show.
  final Object? error;

  int get count => cart?.itemsCount ?? 0;
}

/// Shows the mini-bag sheet; injected so the data layer stays free of widgets.
typedef AddedSheetPresenter = Future<void> Function(BuildContext context, BagStore store, CartItem? added);

/// Single source of truth for the bag, shared by the Bag tab, the nav badge and add-to-bag across features.
/// Implements [BagService]. Operations are serialized so an older response can never overwrite a newer one.
class BagStore implements BagService {
  BagStore(this._repository, this._analytics, {AddedSheetPresenter? presentAddedSheet, Stream<Me?> Function()? userChanges})
    : _presentAddedSheet = presentAddedSheet,
      _userChanges = userChanges;

  final CartRepository _repository;
  final Analytics? _analytics;
  final AddedSheetPresenter? _presentAddedSheet;
  final Stream<Me?> Function()? _userChanges;

  final _snapshots = StreamController<BagSnapshot>.broadcast();
  final _counts = StreamController<int>.broadcast();
  BagSnapshot _snapshot = const BagSnapshot();
  Future<void> _tail = Future<void>.value();
  Future<void>? _pendingRefresh;
  StreamSubscription<Me?>? _authSub;
  AppLifecycleListener? _lifecycle;
  String? _lastAddedKey;
  bool _started = false;
  bool _disposed = false;

  BagSnapshot get snapshot => _snapshot;
  Stream<BagSnapshot> get snapshots => _snapshots.stream;
  Cart? get cart => _snapshot.cart;

  @override
  Stream<int> get count => _counts.stream;

  @override
  int get currentCount => _snapshot.count;

  /// Starts listening to sign-in changes (the server merges the guest bag on login) and app resume, and loads the
  /// bag once. Idempotent.
  void start({bool observeLifecycle = true}) {
    if (_started) return;
    _started = true;
    final changes = _userChanges;
    if (changes != null) {
      String? lastUserId;
      var first = true;
      _authSub = changes().listen((me) {
        final id = me?.id;
        if (!first && id == lastUserId) return;
        final initial = first;
        first = false;
        lastUserId = id;
        // the initial value only mirrors the current state — the bag is loaded below anyway
        if (!initial) unawaited(refresh());
      }, onError: (_) {});
    }
    if (observeLifecycle) _lifecycle = AppLifecycleListener(onResume: () => unawaited(refresh()));
    unawaited(refresh());
  }

  @override
  Future<void> refresh() {
    final pending = _pendingRefresh;
    if (pending != null) return pending;
    if (_snapshot.cart == null) _emit(BagSnapshot(loading: true, error: null, stale: _snapshot.stale));
    final f = _enqueue(() async {
      try {
        final result = await _repository.fetch();
        _emit(BagSnapshot(cart: result.data, stale: result.stale));
      } on ApiException catch (e) {
        // keep showing what we have; only surface the error when there is nothing to show
        _emit(_snapshot.cart == null ? BagSnapshot(error: e) : _snapshot);
      }
    }).whenComplete(() => _pendingRefresh = null);
    _pendingRefresh = f;
    return f;
  }

  @override
  Future<void> addVariant(String variantId, {int quantity = 1}) async {
    final cart = await _mutate(() => _repository.addVariant(variantId, quantity));
    _lastAddedKey = 'v:$variantId';
    final line = cart.items.where((i) => i.variantId == variantId).firstOrNull;
    _analytics?.addToCart(productId: line?.productId);
  }

  @override
  Future<void> addDesign(String designId, {int quantity = 1}) async {
    final cart = await _mutate(() => _repository.addDesign(designId, quantity));
    _lastAddedKey = 'd:$designId';
    final line = cart.items.where((i) => i.designId == designId).firstOrNull;
    _analytics?.addToCart(productId: line?.productId);
  }

  Future<Cart> updateQuantity(String itemId, int quantity) => _mutate(() => _repository.updateQuantity(itemId, quantity));

  Future<Cart> remove(String itemId) => _mutate(() => _repository.remove(itemId));

  /// Puts a removed line back (swipe-to-remove undo).
  Future<Cart> restore(CartItem item) {
    if (item.designId != null) return _mutate(() => _repository.addDesign(item.designId!, item.quantity));
    return _mutate(() => _repository.addVariant(item.variantId!, item.quantity));
  }

  Future<Cart> applyPromo(String code) => _mutate(() => _repository.applyPromo(code));

  Future<Cart> removePromo() => _mutate(() => _repository.removePromo());

  Future<Cart> setGift(bool isGift) => _mutate(() => _repository.setGift(isGift));

  /// The line added last through [addVariant] / [addDesign] (for the mini-bag sheet).
  CartItem? get lastAdded {
    final key = _lastAddedKey;
    final items = _snapshot.cart?.items ?? const <CartItem>[];
    if (key == null) return null;
    return items.where((i) => key == 'v:${i.variantId}' || key == 'd:${i.designId}').firstOrNull;
  }

  @override
  Future<void> showAddedSheet(BuildContext context) async {
    final presenter = _presentAddedSheet;
    if (presenter == null) return;
    await presenter(context, this, lastAdded);
  }

  Future<Cart> _mutate(Future<Cart> Function() call) {
    final completer = Completer<Cart>();
    unawaited(
      _enqueue(() async {
        try {
          final cart = await call();
          _emit(BagSnapshot(cart: cart));
          completer.complete(cart);
        } catch (e, st) {
          // a conflict means our copy is outdated — re-read so the UI shows the truth
          if (e is ApiException && (e.isConflict || e.isNotFound)) {
            try {
              final fresh = await _repository.fetch();
              _emit(BagSnapshot(cart: fresh.data, stale: fresh.stale));
            } catch (_) {}
          }
          completer.completeError(e, st);
        }
      }),
    );
    return completer.future;
  }

  Future<void> _enqueue(Future<void> Function() op) {
    final next = _tail.then((_) => op());
    _tail = next.catchError((Object _) {});
    return next;
  }

  void _emit(BagSnapshot s) {
    if (_disposed) return;
    final before = _snapshot.count;
    _snapshot = s;
    _snapshots.add(s);
    if (s.count != before) _counts.add(s.count);
  }

  Future<void> dispose() async {
    _disposed = true;
    await _authSub?.cancel();
    _lifecycle?.dispose();
    await _snapshots.close();
    await _counts.close();
  }
}
