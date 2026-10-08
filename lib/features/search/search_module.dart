import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import 'data/search_api.dart';
import 'data/search_repository_impl.dart';
import 'domain/search_repository.dart';
import 'presentation/bloc/search_bloc.dart';

/// Composition of the `search` feature: data sources, repositories, blocs/cubits and the cross-feature contracts it
/// implements. Called once from `app/di/injector.dart`.
void registerSearchModule(GetIt sl) {
  sl
    ..registerLazySingleton<SearchApi>(() => SearchApi(sl<ApiClient>()))
    ..registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl<SearchApi>()))
    ..registerLazySingleton<SearchDiscoveryRepository>(
      () => SearchDiscoveryRepositoryImpl(sl<SearchApi>(), sl<AppDatabase>(), () => sl<SessionStore>().language),
    )
    ..registerFactory<SearchBloc>(() => SearchBloc(sl<SearchRepository>(), sl<SearchDiscoveryRepository>()));
}
