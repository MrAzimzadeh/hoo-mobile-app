import '../../../core/error/api_exception.dart';
import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../core/storage/preferences.dart';
import '../../../shared/domain/enums.dart';
import '../domain/launch_models.dart';
import '../domain/launch_repository.dart';
import 'launch_api.dart';

class LaunchRepositoryImpl implements LaunchRepository {
  LaunchRepositoryImpl(this._api, this._db, this._prefs);

  final LaunchApi _api;
  final AppDatabase _db;
  final Preferences _prefs;

  /// Attribution source sent with waitlist / newsletter sign-ups.
  static const source = 'app-coming-soon';
  static const _cacheKey = 'content.coming-soon';

  @override
  Future<Cached<ComingSoonContent>> comingSoon(AppLanguage language) => cachedFetch(
    db: _db,
    key: _cacheKey,
    language: language.wire,
    fetchJson: _api.comingSoonJson,
    decode: (json) => ComingSoonContent.fromJson((json as Map).cast<String, dynamic>()),
  );

  @override
  Future<WaitlistCount> waitlistCount() => _api.waitlistCount();

  @override
  Future<WaitlistJoined> joinWaitlist(WaitlistContact contact, {required AppLanguage language}) =>
      _api.joinWaitlist(contact, language: language, source: source, utm: _prefs.pendingUtm);

  @override
  Future<void> subscribeNewsletter(String email, {required AppLanguage language}) async {
    await _api.subscribeNewsletter(email, language: language, source: source);
  }
}

class GuestRepositoryImpl implements GuestRepository {
  GuestRepositoryImpl(this._api, this._session);

  final LaunchApi _api;
  final SessionStore _session;

  @override
  Future<String?> ensureGuestId() async {
    final existing = _session.guestId;
    if (existing != null && existing.isNotEmpty) return existing;
    try {
      final id = await _api.createGuest();
      await _session.saveGuestId(id);
      return id;
    } on ApiException catch (e) {
      // Offline first launch: retried on the next start; browsing works without it until then.
      if (e.isNetwork) return null;
      rethrow;
    }
  }
}
