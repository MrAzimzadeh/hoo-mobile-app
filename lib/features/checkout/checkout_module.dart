import 'package:get_it/get_it.dart';

import '../../core/analytics/analytics.dart';
import '../../core/deeplinks/deep_link_service.dart';
import '../../core/network/api_client.dart';
import 'data/checkout_repository.dart';
import 'presentation/bloc/checkout_bloc.dart';

/// Composition of the `checkout` feature.
void registerCheckoutModule(GetIt sl) {
  sl
    ..registerLazySingleton<CheckoutRepository>(() => CheckoutRepository(sl<ApiClient>()))
    ..registerFactory<CheckoutBloc>(() => CheckoutBloc(sl<CheckoutRepository>(), sl<Analytics>(), sl<DeepLinkService>()));
}
