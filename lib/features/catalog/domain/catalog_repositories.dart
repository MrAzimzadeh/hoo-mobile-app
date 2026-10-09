import 'package:dio/dio.dart';

import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'catalog_models.dart';
import 'catalog_query.dart';

/// Browse: product lists with facets. Every call throws `ApiException`; cached reads fall back to the last good
/// copy (flagged `stale`) when the device is offline.
abstract interface class ProductBrowseRepository {
  /// Page 1 is cached for offline browsing; later pages are network-only.
  Future<Cached<ProductListPage>> products(CatalogQuery query, {int page = 1, int pageSize = CatalogQuery.defaultPageSize, CancelToken? cancelToken});
}

/// Categories, collections and the color palette (filter swatches need the hexes the facets don't carry).
abstract interface class TaxonomyRepository {
  Future<Cached<List<Category>>> categories();
  Future<Cached<List<Collection>>> collections();
  Future<Cached<List<ColorInfo>>> colors();
}

/// Product detail and its recommendations.
abstract interface class ProductRepository {
  Future<Cached<ProductDetail>> product(String slug);
  Future<Cached<Recommendations>> recommendations(String slug);
}

/// Published reviews and writing one (signed-in customers who received the product, once).
abstract interface class ReviewRepository {
  Future<Paged<Review>> reviews(String slug, {int page = 1, int pageSize = 10});

  /// Throws `catalog.review_requires_purchase` / `catalog.already_reviewed`.
  Future<void> create(String slug, {required int rating, String? title, required String body});
}

/// "Notify me" (back in stock) and price-drop alerts — `POST /alerts` (requires a session).
abstract interface class ProductAlertRepository {
  Future<void> subscribe({required String productId, required StockAlertType type, Size? size, String? colorId});
}
