import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/config/env.dart';
import '../../core/connectivity/connectivity_cubit.dart';
import '../../core/deeplinks/deep_link_service.dart';
import '../../core/localization/app_settings_cubit.dart';
import '../../core/localization/content_strings.dart';
import '../../core/network/api_client.dart';
import '../../core/network/mock/mock_backend_adapter.dart';
import '../../core/push/push_service.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../core/storage/preferences.dart';
import '../../core/storage/secure_store.dart';
import '../../features/auth/auth_module.dart';
import '../../features/cart/cart_module.dart';
import '../../features/catalog/catalog_module.dart';
import '../../features/checkout/checkout_module.dart';
import '../../features/home/home_module.dart';
import '../../features/launch/launch_module.dart';
import '../../features/orders/orders_module.dart';
import '../../features/profile/profile_module.dart';
import '../../features/search/search_module.dart';
import '../../features/studio/studio_module.dart';
import '../../features/wishlist/wishlist_module.dart';
import '../../shared/application/contracts.dart';
import '../../shared/design_system/components/hoo_image.dart';
import '../router/access_policy.dart';
import '../router/app_router.dart';

/// Service locator. Feature code receives dependencies through constructors (blocs, repositories); only
/// composition points (pages creating their bloc, this file) talk to [sl].
final sl = GetIt.instance;

/// Composition root: core services first, then each feature module, then the router.
Future<void> configureDependencies(Env env) async {
  final prefs = await Preferences.create();
  final secure = SecureStore();
  final session = SessionStore(secure, prefs);
  await session.restore();

  sl
    ..registerSingleton<Env>(env)
    ..registerSingleton<Preferences>(prefs)
    ..registerSingleton<SecureStore>(secure)
    ..registerSingleton<SessionStore>(session)
    ..registerLazySingleton<AppDatabase>(AppDatabase.new, dispose: (db) => db.close());

  final dio = ApiClient.createDio(env: env, session: session, adapter: env.useMockApi ? MockBackendAdapter() : null);
  final api = ApiClient(dio);
  HooMedia.resolve = api.absolute;

  sl
    ..registerSingleton<ApiClient>(api)
    ..registerSingleton<AppSettingsCubit>(AppSettingsCubit(prefs, session))
    ..registerSingleton<ContentStrings>(ContentStrings(api, prefs))
    ..registerLazySingleton<Analytics>(() => Analytics(api, prefs))
    ..registerSingleton<ConnectivityCubit>(ConnectivityCubit(Connectivity()))
    ..registerLazySingleton<PushService>(() => PushService(api))
    ..registerLazySingleton<DeepLinkService>(() => DeepLinkService(env: env, prefs: prefs));

  // Features. Order matters only where a module resolves another's contract eagerly (none do).
  registerLaunchModule(sl);
  registerAuthModule(sl);
  registerHomeModule(sl);
  registerCatalogModule(sl);
  registerSearchModule(sl);
  registerWishlistModule(sl);
  registerCartModule(sl);
  registerCheckoutModule(sl);
  registerOrdersModule(sl);
  registerProfileModule(sl);
  registerStudioModule(sl);

  sl.registerSingleton<AppRouter>(AppRouter(AccessGuard(sl<AuthGate>(), sl<StoreInfoProvider>())));
}
