import 'package:get_it/get_it.dart';

import '../../core/localization/app_settings_cubit.dart';
import '../../core/network/api_client.dart';
import '../../shared/application/contracts.dart';
import 'application/language_sync.dart';
import 'data/profile_api.dart';
import 'data/profile_repositories_impl.dart';
import 'domain/profile_repositories.dart';

/// Composition of the `profile` feature. Also starts the language → account sync.
void registerProfileModule(GetIt sl) {
  sl
    ..registerLazySingleton<ProfileApi>(() => ProfileApi(sl<ApiClient>()))
    ..registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<StyleProfileRepository>(() => StyleProfileRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<SavedCardsRepository>(() => SavedCardsRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<SessionsRepository>(() => SessionsRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<NotificationPreferencesRepository>(() => NotificationPreferencesRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<PasswordRepository>(() => PasswordRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<LanguageSync>(() => LanguageSync(sl<AppSettingsCubit>(), sl<AuthGate>(), sl<AccountRepository>())..start());
  // started once the composition root has finished registering everything
  Future.microtask(() => sl<LanguageSync>());
}
