import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../shared/application/contracts.dart';
import 'data/wishlist_api.dart';
import 'data/wishlist_repositories_impl.dart';
import 'data/wishlist_service_impl.dart';
import 'domain/wishlist_repositories.dart';
import 'presentation/cubit/wishlist_cubits.dart';

/// Composition of the `wishlist` feature: wishlist ids + recently viewed contracts, lists, alerts.
void registerWishlistModule(GetIt sl) {
  sl
    ..registerLazySingleton<WishlistApi>(() => WishlistApi(sl<ApiClient>()))
    ..registerLazySingleton<WishlistRepository>(() => WishlistRepositoryImpl(sl<WishlistApi>()))
    ..registerLazySingleton<AlertsRepository>(() => AlertsRepositoryImpl(sl<WishlistApi>()))
    ..registerLazySingleton<ProductVariantsRepository>(() => ProductVariantsRepositoryImpl(sl<WishlistApi>()))
    // AuthGate is resolved lazily: the auth module registers it independently.
    ..registerLazySingleton<WishlistServiceImpl>(() => WishlistServiceImpl(sl<WishlistRepository>(), () => sl<AuthGate>()))
    ..registerLazySingleton<WishlistService>(() => sl<WishlistServiceImpl>())
    ..registerLazySingleton<RecentlyViewedService>(() => RecentlyViewedServiceImpl(sl<WishlistApi>()))
    ..registerFactory<WishlistCubit>(
      () => WishlistCubit(sl<WishlistServiceImpl>(), sl<WishlistRepository>(), sl<ProductVariantsRepository>(), sl<BagService>()),
    )
    ..registerFactoryParam<SharedWishlistCubit, String, void>((token, _) => SharedWishlistCubit(sl<WishlistRepository>(), token))
    ..registerFactory<AlertsCubit>(() => AlertsCubit(sl<AlertsRepository>()));
}
