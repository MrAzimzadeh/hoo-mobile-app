import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'application/bag_cubit.dart';
import 'data/cart_api.dart';
import 'data/cart_repository_impl.dart';
import 'domain/cart_repository.dart';

/// Composition of the `cart` feature: repository and the app-wide bag ([BagService]).
void registerCartModule(GetIt sl) {
  sl
    ..registerLazySingleton<CartRepository>(() {
      final session = sl<SessionStore>();
      return CartRepositoryImpl(
        api: CartApi(sl<ApiClient>()),
        db: sl<AppDatabase>(),
        language: () => session.language,
        cacheScope: () => sl<AuthGate>().currentUser?.id ?? session.guestId ?? 'anon',
      );
    })
    ..registerLazySingleton<BagCubit>(() => BagCubit(sl<CartRepository>(), sl<AuthGate>(), sl<Analytics>()))
    ..registerLazySingleton<BagService>(() => sl<BagCubit>());
}
