import 'package:dio/dio.dart';

import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'catalog_models.dart';
import 'product_query.dart';

/// Browse data: taxonomy and the filtered product grid. Browse reads fall back to the last cached copy offline.
abstract interface class CatalogRepository {
  Future<Cached<List<CatalogCategory>>> categories();
  Future<Cached<List<CatalogCollection>>> collections();

  /// Palette (`code → hex`) for color facets, which only carry code + label.
  Future<Cached<List<ColorInfo>>> colors();

  /// One page of `GET /catalog/products`. Only the first page is cached for offline use.
  Future<Cached<ProductList>> products(ProductQuery query, {int page = 1, int pageSize = 24, CancelToken? cancelToken});
}

/// One product: detail, recommendations, reviews and alerts.
abstract interface class ProductRepository {
  Future<Cached<ProductDetail>> product(String slug);
  Future<Recommendations> recommendations(String slug);
  Future<Paged<Review>> reviews(String slug, {int page = 1, int pageSize = 10});

  /// `POST /catalog/products/{slug}/reviews` → the new review id (published after moderation).
  Future<String> writeReview(String slug, {required int rating, String? title, required String body});

  /// `POST /alerts` (signed in) — back in stock for a size/color, or price drop.
  Future<void> createAlert({required String productId, required StockAlertType type, Size? size, String? colorId});
}
