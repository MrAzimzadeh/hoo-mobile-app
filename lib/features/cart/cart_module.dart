import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'data/bag_store.dart';
import 'data/cart_repository_impl.dart';
import 'domain/cart_repository.dart';
import 'presentation/cubit/bag_cubit.dart';
import 'presentation/widgets/added_sheet.dart';

/// Composition of the `cart` feature. The [BagStore] is the one source of truth for the bag (Bag tab, PDP, Studio,
/// nav badge) and implements the [BagService] contract.
void registerCartModule(GetIt sl) {
  sl
    ..registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl<ApiClient>(), sl<AppDatabase>(), sl<SessionStore>()))
    ..registerLazySingleton<BagStore>(
      () => BagStore(sl<CartRepository>(), sl<Analytics>(), presentAddedSheet: presentAddedSheet, userChanges: () => sl<AuthGate>().userChanges)..start(),
      dispose: (s) => s.dispose(),
    )
    ..registerLazySingleton<BagService>(() => sl<BagStore>())
    ..registerFactory<BagCubit>(() => BagCubit(sl<BagStore>()));
}
