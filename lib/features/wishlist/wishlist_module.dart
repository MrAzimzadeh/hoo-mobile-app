import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'application/wishlist_store.dart';
import 'data/wishlist_repository_impl.dart';
import 'domain/wishlist_repository.dart';

/// Composition of the `wishlist` feature: [WishlistService] / [RecentlyViewedService] and the list screens.
void registerWishlistModule(GetIt sl) {
  sl
    ..registerLazySingleton<WishlistRepository>(() => WishlistRepositoryImpl(sl<ApiClient>(), sl<AppDatabase>(), sl<SessionStore>()))
    ..registerLazySingleton<WishlistStore>(() => WishlistStore(sl<WishlistRepository>(), sl<AuthGate>()))
    ..registerLazySingleton<WishlistService>(() => sl<WishlistStore>())
    ..registerLazySingleton<RecentlyViewedService>(() => sl<WishlistStore>());
}
