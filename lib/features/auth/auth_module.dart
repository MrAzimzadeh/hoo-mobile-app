import 'package:get_it/get_it.dart';

import '../../core/config/env.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../shared/application/contracts.dart';
import 'application/auth_session.dart';
import 'application/social_sign_in.dart';
import 'data/auth_repository_impl.dart';
import 'domain/auth_repository.dart';
import 'presentation/cubit/auth_submit_cubit.dart';

/// Composition of the `auth` feature: repository, the app-wide [AuthGate] and form cubits.
void registerAuthModule(GetIt sl) {
  sl
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<ApiClient>(), sl<SessionStore>()))
    ..registerLazySingleton<AuthSession>(() => AuthSession(sl<AuthRepository>(), sl<SessionStore>()))
    ..registerLazySingleton<AuthGate>(() => sl<AuthSession>())
    ..registerLazySingleton<SocialSignIn>(() => SocialSignIn(sl<Env>()))
    ..registerFactory<AuthSubmitCubit>(() => AuthSubmitCubit(sl<AuthSession>()));
}
