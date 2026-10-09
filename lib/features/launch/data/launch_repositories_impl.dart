import 'dart:async';

import '../../../core/network/api_client.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../core/storage/preferences.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/launch_models.dart';
import '../domain/launch_repository.dart';

class LaunchRepositoryImpl implements LaunchRepository {
  LaunchRepositoryImpl(this._api, this._session, this._prefs);

  final ApiClient _api;
  final SessionStore _session;
  final Preferences _prefs;

  @override
  Future<ComingSoonContent> comingSoon() => _api.get('/content/coming-soon', decode: (j) => ComingSoonContent.fromJson(Decoders.map(j)));

  @override
  Future<WaitlistCount> waitlistCount() => _api.get('/waitlist/count', decode: (j) => WaitlistCount.fromJson(Decoders.map(j)));

  @override
  Future<WaitlistJoined> joinWaitlist({String? email, String? phone}) {
    final utm = _prefs.pendingUtm;
    return _api.post(
      '/waitlist',
      body: {
        'email': email,
        'phone': phone,
        'language': _session.language,
        'source': 'app',
        if (utm != null) 'utm': {'source': utm['source'], 'medium': utm['medium'], 'campaign': utm['campaign']},
      },
      decode: (j) => WaitlistJoined.fromJson(Decoders.map(j)),
    );
  }

  @override
  Future<void> subscribeNewsletter(String email) =>
      _api.post<Object?>('/newsletter', body: {'email': email, 'language': _session.language, 'source': 'app'});
}

class GuestRepositoryImpl implements GuestRepository {
  GuestRepositoryImpl(this._api, this._session);

  final ApiClient _api;
  final SessionStore _session;
  Future<String>? _inFlight;

  @override
  Future<String> ensureGuestId() {
    final existing = _session.guestId;
    if (existing != null) return Future.value(existing);
    return _inFlight ??= _create().whenComplete(() => _inFlight = null);
  }

  Future<String> _create() async {
    final id = await _api.post('/guest', decode: (j) => Decoders.map(j)['guestId'] as String);
    await _session.saveGuestId(id);
    return id;
  }
}

/// [StoreInfoProvider]: `GET /meta/store`, cached so an offline launch still knows the mode and contacts.
/// Defaults to Live when nothing was ever fetched — guests can always browse cached content.
class StoreInfoRepository implements StoreInfoProvider {
  StoreInfoRepository(this._api, this._db);

  final ApiClient _api;
  final AppDatabase _db;
  final _changes = StreamController<StoreInfo>.broadcast();
  StoreInfo _info = const StoreInfo();

  static const _cacheKey = 'meta.store';

  @override
  StoreInfo get info => _info;

  @override
  Stream<StoreInfo> get changes => _changes.stream;

  @override
  bool get isLive => _info.mode == StoreMode.live;

  @override
  Future<StoreInfo> refresh() async {
    try {
      final r = await cachedFetch(
        db: _db,
        key: _cacheKey,
        language: '',
        fetchJson: () => _api.get<Object?>('/meta/store'),
        decode: (j) => StoreInfo.fromJson(Decoders.map(j)),
      );
      _set(r.data);
    } catch (_) {
      // offline and never cached: keep the default (Live) so the app stays usable
    }
    return _info;
  }

  void _set(StoreInfo info) {
    _info = info;
    _changes.add(info);
  }
}
