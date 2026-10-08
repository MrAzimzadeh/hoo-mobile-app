import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/error/api_exception.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'launch_api.dart';

/// [StoreInfoProvider] backed by `GET /meta/store`, with the last good response kept in Drift so a cold start
/// without network still knows whether the store is live (and routes to Coming Soon if not).
///
/// Before the first [load] the defaults apply (`Live`) — the server's `503 store.coming_soon` is the safety net and
/// flips the local mode immediately via [SessionEvent.storeComingSoon].
class StoreInfoRepository implements StoreInfoProvider {
  StoreInfoRepository(this._api, this._db, {Stream<SessionEvent>? sessionEvents}) {
    _sessionSub = sessionEvents?.listen(_onSessionEvent);
  }

  final LaunchApi _api;
  final AppDatabase _db;
  final _changes = StreamController<StoreInfo>.broadcast();
  StreamSubscription<SessionEvent>? _sessionSub;
  StoreInfo _info = const StoreInfo();
  Future<StoreInfo>? _inFlight;

  static const cacheKey = 'meta.store';

  @override
  StoreInfo get info => _info;

  @override
  Stream<StoreInfo> get changes => _changes.stream;

  @override
  bool get isLive => _info.mode == StoreMode.live;

  /// Splash entry point. Applies the cached copy first, then asks the server (bounded by [timeout]). Never throws:
  /// on failure the cached copy (or the defaults) stays in effect and the result is flagged `stale`. A request that
  /// outlives [timeout] keeps running and still updates [info] / [changes] when it lands.
  Future<Cached<StoreInfo>> load({Duration? timeout}) async {
    final cached = await _restore();
    try {
      final fresh = timeout == null ? refresh() : refresh().timeout(timeout);
      return Cached(await fresh, updatedAt: DateTime.now());
    } on Object catch (e) {
      if (kDebugMode && e is! ApiException && e is! TimeoutException) debugPrint('[store] load failed: $e');
      return Cached(_info, stale: true, updatedAt: cached?.updatedAt);
    }
  }

  /// `GET /meta/store` → caches and publishes it. Concurrent calls share one request. Throws [ApiException].
  @override
  Future<StoreInfo> refresh() => _inFlight ??= _fetch().whenComplete(() => _inFlight = null);

  Future<StoreInfo> _fetch() async {
    final json = await _api.storeJson();
    final info = StoreInfo.fromJson(json);
    _set(info);
    try {
      await _db.putCache(cacheKey, json);
    } on Object catch (e) {
      if (kDebugMode) debugPrint('[store] cache write failed: $e');
    }
    return info;
  }

  Future<({StoreInfo info, DateTime updatedAt})?> _restore() async {
    try {
      final hit = await _db.readCache(cacheKey);
      if (hit == null || hit.value is! Map) return null;
      final info = StoreInfo.fromJson((hit.value! as Map).cast<String, dynamic>());
      _set(info);
      return (info: info, updatedAt: hit.updatedAt);
    } on Object catch (e) {
      // A corrupt or incompatible cache entry must never block start-up.
      if (kDebugMode) debugPrint('[store] cache read failed: $e');
      return null;
    }
  }

  void _onSessionEvent(SessionEvent event) {
    if (event != SessionEvent.storeComingSoon || !isLive) return;
    _set(_info.copyWith(mode: StoreMode.comingSoon));
    unawaited(refresh().then<void>((_) {}, onError: (Object _) {}));
  }

  void _set(StoreInfo info) {
    if (info == _info) return;
    _info = info;
    if (!_changes.isClosed) _changes.add(info);
  }

  Future<void> dispose() async {
    await _sessionSub?.cancel();
    await _changes.close();
  }
}
