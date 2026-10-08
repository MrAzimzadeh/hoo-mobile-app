import 'package:get_it/get_it.dart';

import '../../core/deeplinks/deep_link_service.dart';
import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import 'data/custom_tabs_payment_browser.dart';
import 'data/orders_api.dart';
import 'data/orders_repositories.dart';
import 'domain/repositories.dart';
import 'presentation/cubit/order_detail_cubit.dart';
import 'presentation/cubit/orders_list_cubit.dart';
import 'presentation/cubit/return_request_cubit.dart';
import 'presentation/cubit/slot_picker_cubit.dart';
import 'presentation/cubit/track_and_gift_cubits.dart';
import 'presentation/widgets/slot_sheet.dart';

/// Composition of the `orders` feature: order list/detail (account + guest tracking), payment retry, slot change,
/// returns, gift receipts.
void registerOrdersModule(GetIt sl) {
  String language() => sl<SessionStore>().language;
  sl
    ..registerLazySingleton<OrdersApi>(() => OrdersApi(sl<ApiClient>()))
    ..registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(sl<OrdersApi>(), sl<AppDatabase>(), language))
    ..registerLazySingleton<OrderPaymentRepository>(() => OrderPaymentRepositoryImpl(sl<OrdersApi>()))
    ..registerLazySingleton<ReturnsRepository>(() => ReturnsRepositoryImpl(sl<OrdersApi>(), sl<AppDatabase>(), language))
    ..registerLazySingleton<GiftReceiptRepository>(() => GiftReceiptRepositoryImpl(sl<OrdersApi>()))
    ..registerLazySingleton<PaymentBrowser>(CustomTabsPaymentBrowser.new)
    ..registerFactory<OrdersListCubit>(() => OrdersListCubit(sl<OrdersRepository>()))
    ..registerFactory<ReturnsListCubit>(() => ReturnsListCubit(sl<ReturnsRepository>()))
    ..registerFactory<OrderDetailCubit>(
      () => OrderDetailCubit(sl<OrdersRepository>(), sl<OrderPaymentRepository>(), sl<PaymentBrowser>(), sl<DeepLinkService>().paymentReturns),
    )
    ..registerFactory<ReturnRequestCubit>(() => ReturnRequestCubit(sl<OrdersRepository>(), sl<ReturnsRepository>()))
    ..registerFactoryParam<SlotPickerCubit, SlotPickerArgs, void>(
      (a, _) => SlotPickerCubit(sl<OrdersRepository>(), number: a.number, phone: a.phone, currentDate: a.currentDate, currentStart: a.currentStart),
    )
    ..registerFactory<TrackOrderCubit>(() => TrackOrderCubit(sl<OrdersRepository>()))
    ..registerFactoryParam<GiftReceiptCubit, String?, void>((code, _) => GiftReceiptCubit(sl<GiftReceiptRepository>(), code: code));
}
