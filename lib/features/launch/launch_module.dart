import 'dart:ui';

import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/deeplinks/deep_link_service.dart';
import '../../core/localization/app_settings_cubit.dart';
import '../../core/localization/content_strings.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../core/storage/preferences.dart';
import '../../shared/application/contracts.dart';
import 'data/launch_api.dart';
import 'data/launch_repository_impl.dart';
import 'data/store_info_repository.dart';
import 'domain/launch_repository.dart';
import 'presentation/cubit/coming_soon_cubit.dart';
import 'presentation/cubit/launch_forms_cubit.dart';
import 'presentation/cubit/onboarding_cubit.dart';
import 'presentation/cubit/splash_cubit.dart';

/// Composition of the `launch` feature: data sources, repositories, blocs/cubits and the cross-feature contracts it
/// implements. Called once from `app/di/injector.dart`.
void registerLaunchModule(GetIt sl) {
  sl
    ..registerLazySingleton<LaunchApi>(() => LaunchApi(sl<ApiClient>()))
    // One instance behind both types: the splash needs `load()`, everyone else the contract.
    ..registerLazySingleton<StoreInfoRepository>(
      () => StoreInfoRepository(sl<LaunchApi>(), sl<AppDatabase>(), sessionEvents: sl<SessionStore>().events),
      dispose: (r) => r.dispose(),
    )
    ..registerLazySingleton<StoreInfoProvider>(() => sl<StoreInfoRepository>())
    ..registerLazySingleton<LaunchRepository>(() => LaunchRepositoryImpl(sl<LaunchApi>(), sl<AppDatabase>(), sl<Preferences>()))
    ..registerLazySingleton<GuestRepository>(() => GuestRepositoryImpl(sl<LaunchApi>(), sl<SessionStore>()))
    ..registerFactory<SplashCubit>(
      () => SplashCubit(
        store: sl<StoreInfoRepository>(),
        guests: sl<GuestRepository>(),
        session: sl<SessionStore>(),
        auth: sl<AuthGate>(),
        content: sl<ContentStrings>(),
        analytics: sl<Analytics>(),
        prefs: sl<Preferences>(),
        settings: sl<AppSettingsCubit>(),
      ),
    )
    ..registerFactory<ComingSoonCubit>(() => ComingSoonCubit(sl<LaunchRepository>(), sl<StoreInfoProvider>(), sl<AppSettingsCubit>()))
    ..registerFactory<WaitlistCubit>(() => WaitlistCubit(sl<LaunchRepository>(), sl<AppSettingsCubit>()))
    ..registerFactory<NewsletterCubit>(() => NewsletterCubit(sl<LaunchRepository>(), sl<AppSettingsCubit>()))
    ..registerFactory<OnboardingCubit>(
      () => OnboardingCubit(
        sl<AppSettingsCubit>(),
        sl<Preferences>(),
        sl<AuthGate>(),
        sl<DeepLinkService>(),
        deviceLanguageCode: PlatformDispatcher.instance.locale.languageCode,
      ),
    );
}
