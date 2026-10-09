import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'data/order_actions_repositories.dart';
import 'data/orders_api.dart';
import 'data/orders_repository_impl.dart';
import 'domain/orders_repositories.dart';
import 'presentation/cubit/orders_list_cubit.dart';
import 'presentation/cubit/returns_cubit.dart';

/// Composition of the `orders` feature: orders, tracking, returns, payment retry, gift receipts.
void registerOrdersModule(GetIt sl) {
  sl
    ..registerLazySingleton<OrdersApi>(() => OrdersApi(sl<ApiClient>()))
    ..registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(sl<OrdersApi>(), sl<AppDatabase>(), sl<SessionStore>(), sl<AuthGate>()))
    ..registerLazySingleton<OrderDetailRepository>(() => OrderDetailRepositoryImpl(sl<OrdersApi>(), sl<AppDatabase>(), sl<SessionStore>(), sl<AuthGate>()))
    ..registerLazySingleton<OrderSlotRepository>(() => OrderSlotRepositoryImpl(sl<OrdersApi>()))
    ..registerLazySingleton<ReturnsRepository>(() => ReturnsRepositoryImpl(sl<OrdersApi>()))
    ..registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl(sl<OrdersApi>()))
    ..registerLazySingleton<GiftReceiptRepository>(() => GiftReceiptRepositoryImpl(sl<OrdersApi>()))
    ..registerFactory<OrdersListCubit>(() => OrdersListCubit(sl<OrdersRepository>()))
    ..registerFactory<ReturnsCubit>(() => ReturnsCubit(sl<OrdersRepository>()));
}
