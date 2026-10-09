import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import 'data/search_repository.dart';
import 'presentation/cubit/search_cubit.dart';

/// Composition of the `search` feature.
void registerSearchModule(GetIt sl) {
  sl
    ..registerLazySingleton<SearchRepository>(() => SearchRepository(sl<ApiClient>()))
    ..registerFactory<SearchCubit>(() => SearchCubit(sl<SearchRepository>()));
}
