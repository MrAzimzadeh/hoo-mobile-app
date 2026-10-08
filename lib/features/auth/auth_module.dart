import 'package:get_it/get_it.dart';

import '../../core/config/env.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../shared/application/contracts.dart';
import 'data/auth_api.dart';
import 'data/auth_gate_impl.dart';
import 'data/auth_repository_impl.dart';
import 'data/auth_user_cache.dart';
import 'data/social_identity_provider.dart';
import 'domain/auth_repository.dart';
import 'presentation/bloc/auth_form_bloc.dart';
import 'presentation/bloc/otp_bloc.dart';
import 'presentation/bloc/password_bloc.dart';
import '../../shared/domain/enums.dart';

/// Composition of the `auth` feature: data sources, repositories, blocs/cubits and the cross-feature contracts it
/// implements. Called once from `app/di/injector.dart`.
void registerAuthModule(GetIt sl) {
  sl
    ..registerLazySingleton<AuthApi>(() => AuthApi(sl<ApiClient>()))
    ..registerLazySingleton<AuthUserCache>(SecureAuthUserCache.new)
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<AuthApi>(), sl<SessionStore>(), sl<AuthUserCache>()))
    ..registerLazySingleton<SocialIdentityProvider>(() => PlatformSocialIdentityProvider(sl<Env>()))
    ..registerLazySingleton<AuthGate>(() => AuthGateImpl(sl<AuthRepository>(), sl<SessionStore>()))
    ..registerFactory<AuthFormBloc>(() => AuthFormBloc(sl<AuthRepository>(), sl<SocialIdentityProvider>()))
    ..registerFactoryParam<OtpBloc, OtpPurpose?, void>((purpose, _) => OtpBloc(sl<AuthRepository>(), purpose: purpose ?? OtpPurpose.login))
    ..registerFactory<PasswordBloc>(() => PasswordBloc(sl<AuthRepository>()));
}
