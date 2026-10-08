import '../../../core/error/api_exception.dart';
import '../../../core/network/api_client.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/models.dart';
import '../domain/home_content.dart';
import '../domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._api, this._db, this._language);

  final ApiClient _api;
  final AppDatabase _db;
  final String Function() _language;

  Future<Cached<T>> _section<T>(String path, T Function(Object? json) decode, {Map<String, dynamic>? query}) => cachedFetch(
    db: _db,
    key: 'home.$path',
    language: _language(),
    fetchJson: () => _api.get<Object?>(path, query: query),
    decode: decode,
  );

  @override
  Future<Cached<HomeContent>> load() async {
    List<ProductCard> cards(Object? j) => Decoders.list(j, ProductCard.fromJson);
    final results = await Future.wait<Cached<Object>?>([
      _safe(_section<Object>('/catalog/new-arrivals', cards, query: {'limit': 10})),
      _safe(_section<Object>('/catalog/bestsellers', cards, query: {'limit': 10})),
      _safe(_section<Object>('/catalog/categories', (j) => Decoders.list(j, HomeCategory.fromJson))),
      _safe(_section<Object>('/catalog/collections', (j) => Decoders.list(j, HomeCollection.fromJson))),
      _safe(_section<Object>('/catalog/looks', (j) => Decoders.list(j, HomeLook.fromJson))),
      _safe(_section<Object>('/recently-viewed', cards)),
    ]);
    if (results.every((r) => r == null)) {
      // surface the real failure (offline, 5xx) instead of an empty page
      await _section<Object>('/catalog/new-arrivals', cards, query: {'limit': 10});
    }
    T pick<T>(int i, T empty) => (results[i]?.data as T?) ?? empty;
    return Cached(
      HomeContent(
        newArrivals: pick(0, const <ProductCard>[]),
        bestsellers: pick(1, const <ProductCard>[]),
        categories: pick<List<HomeCategory>>(2, const []),
        collections: pick<List<HomeCollection>>(3, const []),
        looks: pick<List<HomeLook>>(4, const []),
        recentlyViewed: pick(5, const <ProductCard>[]),
      ),
      stale: results.any((r) => r?.stale ?? false),
    );
  }

  Future<Cached<Object>?> _safe(Future<Cached<Object>> f) async {
    try {
      return await f;
    } on ApiException {
      return null;
    }
  }
}
