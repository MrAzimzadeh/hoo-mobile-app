import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import 'data/home_repository_impl.dart';
import 'domain/home_repository.dart';
import 'presentation/cubit/home_cubit.dart';

/// Composition of the `home` feature. Called once from `app/di/injector.dart`.
void registerHomeModule(GetIt sl) {
  sl
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl<ApiClient>(), sl<AppDatabase>(), () => sl<SessionStore>().language))
    ..registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>()));
}
