import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../core/error/api_exception.dart';
import '../../../l10n/l10n.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/design_system/design_system.dart';
import '../domain/wishlist_repository.dart';

/// Wishlist ids for every heart in the app ([WishlistService]) + recently viewed recording.
/// Toggles are optimistic and rolled back if the server refuses.
class WishlistStore implements WishlistService, RecentlyViewedService {
  WishlistStore(this._repo, this._auth) {
    _auth.userChanges.listen((user) => user == null ? _set(const {}) : refresh());
  }

  final WishlistRepository _repo;
  final AuthGate _auth;
  final _ids = StreamController<Set<String>>.broadcast();
  Set<String> _current = const {};
  final _inFlight = <String>{};

  @override
  Stream<Set<String>> get ids => _ids.stream;

  @override
  Set<String> get currentIds => _current;

  @override
  bool contains(String productId) => _current.contains(productId);

  @override
  Future<void> refresh() async {
    if (!_auth.isSignedIn) return _set(const {});
    try {
      final items = await _repo.wishlist();
      _set({for (final p in items) p.id});
    } catch (_) {
      // keep the last known ids (offline)
    }
  }

  @override
  Future<bool?> toggle(BuildContext context, String productId) async {
    final l = context.l10n;
    if (!await _auth.requireSignIn(context, reason: l.wishlistSignInReason)) return null;
    if (!_inFlight.add(productId)) return contains(productId);
    final adding = !contains(productId);
    _set(adding ? {..._current, productId} : ({..._current}..remove(productId)));
    try {
      adding ? await _repo.add(productId) : await _repo.remove(productId);
      return adding;
    } on ApiException catch (e) {
      _set(adding ? ({..._current}..remove(productId)) : {..._current, productId});
      if (context.mounted) HooToast.error(context, e);
      return !adding;
    } finally {
      _inFlight.remove(productId);
    }
  }

  /// Local removal after a list screen deleted the product itself.
  void forget(String productId) => _set({..._current}..remove(productId));

  @override
  Future<void> record(String productId) => _repo.recordView(productId).catchError((Object _) {});

  void _set(Set<String> ids) {
    _current = ids;
    _ids.add(ids);
  }
}
