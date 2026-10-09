import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'data/home_repository.dart';
import 'presentation/cubit/home_cubit.dart';

/// Composition of the `home` feature.
void registerHomeModule(GetIt sl) {
  sl
    ..registerLazySingleton<HomeRepository>(() => HomeRepository(sl<ApiClient>(), sl<AppDatabase>(), sl<SessionStore>()))
    ..registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>(), sl<AuthGate>()));
}
