import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'data/catalog_repository_impl.dart';
import 'domain/catalog_repository.dart';
import 'domain/product_query.dart';
import 'presentation/cubit/product_cubit.dart';
import 'presentation/cubit/product_list_cubit.dart';
import 'presentation/cubit/reviews_cubit.dart';

/// Composition of the `catalog` feature: data sources, repositories, blocs/cubits and the cross-feature contracts it
/// implements. Called once from `app/di/injector.dart`.
void registerCatalogModule(GetIt sl) {
  String language() => sl<SessionStore>().language;

  sl
    ..registerLazySingleton<CatalogRepository>(() => CatalogRepositoryImpl(sl<ApiClient>(), sl<AppDatabase>(), language))
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(sl<ApiClient>(), sl<AppDatabase>(), language))
    ..registerFactoryParam<ProductListCubit, ProductQuery, void>((initial, _) => ProductListCubit(sl<CatalogRepository>(), initial: initial))
    ..registerFactoryParam<ProductCubit, String, String?>(
      (slug, preferredColorId) =>
          ProductCubit(sl<ProductRepository>(), sl<BagService>(), sl<RecentlyViewedService>(), sl<Analytics>(), slug: slug, preferredColorId: preferredColorId),
    )
    ..registerFactoryParam<ReviewsCubit, String, void>((slug, _) => ReviewsCubit(sl<ProductRepository>(), slug))
    ..registerFactoryParam<WriteReviewCubit, String, void>((slug, _) => WriteReviewCubit(sl<ProductRepository>(), slug));
}
