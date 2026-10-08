import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import 'data/checkout_repository_impl.dart';
import 'data/custom_tabs_payment_launcher.dart';
import 'domain/checkout_repository.dart';
import 'domain/payment_launcher.dart';
import 'presentation/bloc/checkout_bloc.dart';
import 'presentation/cubit/gift_message_cubit.dart';

/// Composition of the `checkout` feature.
void registerCheckoutModule(GetIt sl) {
  sl
    ..registerLazySingleton<CheckoutRepository>(() => CheckoutRepositoryImpl(sl<ApiClient>()))
    ..registerLazySingleton<PaymentRedirectLauncher>(() => const CustomTabsPaymentLauncher())
    ..registerFactory<CheckoutBloc>(() => CheckoutBloc(sl<CheckoutRepository>(), sl<PaymentRedirectLauncher>()))
    ..registerFactory<GiftMessageCubit>(() => GiftMessageCubit(sl<CheckoutRepository>()));
}
