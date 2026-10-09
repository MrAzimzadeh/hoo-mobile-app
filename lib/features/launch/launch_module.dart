import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../core/storage/preferences.dart';
import '../../shared/application/contracts.dart';
import 'data/launch_repositories_impl.dart';
import 'domain/launch_repository.dart';
import 'presentation/cubit/coming_soon_cubit.dart';

/// Composition of the `launch` feature: store meta ([StoreInfoProvider]), guest id, Coming Soon.
void registerLaunchModule(GetIt sl) {
  sl
    ..registerLazySingleton<StoreInfoProvider>(() => StoreInfoRepository(sl<ApiClient>(), sl<AppDatabase>()))
    ..registerLazySingleton<GuestRepository>(() => GuestRepositoryImpl(sl<ApiClient>(), sl<SessionStore>()))
    ..registerLazySingleton<LaunchRepository>(() => LaunchRepositoryImpl(sl<ApiClient>(), sl<SessionStore>(), sl<Preferences>()))
    ..registerFactory<ComingSoonCubit>(() => ComingSoonCubit(sl<LaunchRepository>()));
}
