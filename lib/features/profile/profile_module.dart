import 'package:get_it/get_it.dart';

import '../../core/localization/app_settings_cubit.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import '../../shared/domain/models.dart';
import 'data/language_sync.dart';
import 'data/profile_api.dart';
import 'data/profile_repositories_impl.dart';
import 'domain/profile_repositories.dart';
import 'presentation/cubit/active_devices_cubit.dart';
import 'presentation/cubit/address_form_cubit.dart';
import 'presentation/cubit/addresses_cubit.dart';
import 'presentation/cubit/change_password_cubit.dart';
import 'presentation/cubit/notification_prefs_cubit.dart';
import 'presentation/cubit/personal_info_cubit.dart';
import 'presentation/cubit/profile_cubit.dart';
import 'presentation/cubit/saved_cards_cubit.dart';
import 'presentation/cubit/style_profile_cubit.dart';

/// Composition of the `profile` feature: data sources, repositories, blocs/cubits and the cross-feature contracts it
/// implements. Called once from `app/di/injector.dart`.
///
/// Other features' contracts (`AuthGate`) are resolved lazily, so registration order doesn't matter.
void registerProfileModule(GetIt sl) {
  final cache = ProfileCacheScope(
    db: () => sl<AppDatabase>(),
    userId: () => sl.isRegistered<AuthGate>() ? sl<AuthGate>().currentUser?.id : null,
    language: () => sl<SessionStore>().language,
  );

  sl
    ..registerLazySingleton<ProfileApi>(() => ProfileApi(sl<ApiClient>()))
    ..registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(sl<ProfileApi>(), cache))
    ..registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl(sl<ProfileApi>(), cache))
    ..registerLazySingleton<SavedCardRepository>(() => SavedCardRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<NotificationPreferencesRepository>(() => NotificationPreferencesRepositoryImpl(sl<ProfileApi>()))
    ..registerLazySingleton<StyleProfileRepository>(() => StyleProfileRepositoryImpl(sl<ProfileApi>()))
    // cubits: one per page instance
    ..registerFactory<ProfileCubit>(() => ProfileCubit(sl<AuthGate>(), sl<AccountRepository>()))
    ..registerFactory<PersonalInfoCubit>(() => PersonalInfoCubit(sl<AccountRepository>(), sl<AuthGate>(), sl<AppSettingsCubit>()))
    ..registerFactory<AddressesCubit>(() => AddressesCubit(sl<AddressRepository>()))
    ..registerFactory<SavedCardsCubit>(() => SavedCardsCubit(sl<SavedCardRepository>()))
    ..registerFactory<ActiveDevicesCubit>(() => ActiveDevicesCubit(sl<SessionRepository>()))
    ..registerFactory<NotificationPrefsCubit>(() => NotificationPrefsCubit(sl<NotificationPreferencesRepository>()))
    ..registerFactoryParam<ChangePasswordCubit, bool, void>((hasPassword, _) => ChangePasswordCubit(sl<AccountRepository>(), hasPassword: hasPassword))
    ..registerFactoryParam<AddressFormCubit, SavedAddress?, void>((initial, _) => AddressFormCubit(sl<AddressRepository>(), initial: initial))
    ..registerFactory<StyleProfileCubit>(() => StyleProfileCubit(sl<StyleProfileRepository>(), sl<AuthGate>()))
    // app language → account language while signed in (see AppSettingsCubit)
    ..registerSingleton<LanguageSync>(
      LanguageSync(sl<AppSettingsCubit>(), sl<AccountRepository>(), () => sl<AuthGate>())..start(),
      dispose: (s) => s.dispose(),
    );
}
