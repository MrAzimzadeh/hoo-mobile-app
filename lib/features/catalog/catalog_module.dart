import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'data/catalog_api.dart';
import 'data/catalog_repositories_impl.dart';
import 'domain/catalog_repositories.dart';
import 'presentation/browse/catalog_browse_cubit.dart';
import 'presentation/pdp/product_cubit.dart';

/// Composition of the `catalog` feature: browse, taxonomy, product detail, reviews, alerts.
void registerCatalogModule(GetIt sl) {
  sl
    ..registerLazySingleton<CatalogApi>(() => CatalogApi(sl<ApiClient>()))
    ..registerLazySingleton<CatalogCache>(() => CatalogCache(sl<AppDatabase>(), sl<SessionStore>()))
    ..registerLazySingleton<ProductBrowseRepository>(() => ProductBrowseRepositoryImpl(sl<CatalogApi>(), sl<CatalogCache>()))
    ..registerLazySingleton<TaxonomyRepository>(() => TaxonomyRepositoryImpl(sl<CatalogApi>(), sl<CatalogCache>()))
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(sl<CatalogApi>(), sl<CatalogCache>()))
    ..registerLazySingleton<ReviewRepository>(() => ReviewRepositoryImpl(sl<CatalogApi>()))
    ..registerLazySingleton<ProductAlertRepository>(() => ProductAlertRepositoryImpl(sl<CatalogApi>()))
    ..registerFactory<CatalogBrowseCubit>(() => CatalogBrowseCubit(sl<ProductBrowseRepository>()))
    ..registerFactory<ProductCubit>(() => ProductCubit(sl<ProductRepository>(), sl<BagService>(), sl<RecentlyViewedService>(), sl<Analytics>()));
}
