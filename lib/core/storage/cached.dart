import '../error/api_exception.dart';
import 'app_database.dart';

/// A value with provenance: fresh from the API, or the last cached copy served because the device is offline.
class Cached<T> {
  const Cached(this.data, {this.stale = false, this.updatedAt});

  final T data;

  /// `true` → render read-only with the offline banner.
  final bool stale;
  final DateTime? updatedAt;
}

/// Read-through cache for browse data: fetch → store JSON → return fresh; on a network failure, return the cached
/// copy marked stale. Any other failure (4xx/5xx) is rethrown — stale data must not hide real errors.
Future<Cached<T>> cachedFetch<T>({
  required AppDatabase db,
  required String key,
  required String language,
  required Future<Object?> Function() fetchJson,
  required T Function(Object? json) decode,
}) async {
  try {
    final json = await fetchJson();
    await db.putCache(key, json, language: language);
    return Cached(decode(json), updatedAt: DateTime.now());
  } on ApiException catch (e) {
    if (!e.isNetwork) rethrow;
    final hit = await db.readCache(key, language: language);
    if (hit == null) rethrow;
    return Cached(decode(hit.value), stale: true, updatedAt: hit.updatedAt);
  }
}
