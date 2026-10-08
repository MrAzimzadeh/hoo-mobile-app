import '../../../core/network/api_client.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/models/order_models.dart';
import '../domain/models/return_models.dart';
import '../domain/repositories.dart';
import 'orders_api.dart';

/// Cache keys of the orders feature (per language — server texts such as zone names are localized).
abstract final class OrdersCacheKeys {
  static const ordersFirstPage = 'orders:list:1';
  static String order(String number) => 'orders:detail:${number.trim().toUpperCase()}';
  static const returns = 'orders:returns';
}

class OrdersRepositoryImpl implements OrdersRepository {
  OrdersRepositoryImpl(this._api, this._db, this._language, {DateTime Function()? clock}) : _now = clock ?? DateTime.now;

  final OrdersApi _api;
  final AppDatabase _db;
  final String Function() _language;
  final DateTime Function() _now;

  static const pageSize = 20;

  /// How long a result of [track] is reused by [order] (Track form → detail page) instead of a second call.
  static const _trackReuseWindow = Duration(minutes: 1);
  ({OrderAccess access, TrackingResult result, DateTime at})? _lastTrack;

  @override
  Future<Cached<Paged<OrderListItem>>> myOrders({int page = 1}) async {
    Paged<OrderListItem> decode(Object? json) => Paged.fromJson(Decoders.map(json), (e) => OrderListItem.fromJson(Decoders.map(e)));
    if (page != 1) {
      return Cached(
        decode(await _api.myOrdersJson(page: page, pageSize: pageSize)),
        updatedAt: _now(),
      );
    }
    return cachedFetch(
      db: _db,
      key: OrdersCacheKeys.ordersFirstPage,
      language: _language(),
      fetchJson: () => _api.myOrdersJson(page: 1, pageSize: pageSize),
      decode: decode,
    );
  }

  @override
  Future<LoadedOrder> order(OrderAccess access) async {
    final phone = access.phone;
    if (phone == null) {
      final cached = await cachedFetch(
        db: _db,
        key: OrdersCacheKeys.order(access.number),
        language: _language(),
        fetchJson: () => _api.myOrderJson(access.number),
        decode: (j) => OrderDetail.fromJson(Decoders.map(j)),
      );
      return LoadedOrder(order: cached.data, stale: cached.stale);
    }
    final recent = _lastTrack;
    _lastTrack = null;
    final result = recent != null && recent.access == access && _now().difference(recent.at) < _trackReuseWindow
        ? recent.result
        : await _api.track(access.number, phone);
    return LoadedOrder(order: result.order, isRecipientView: result.isRecipientView, whatsAppUrl: result.whatsAppUrl);
  }

  @override
  Future<TrackingResult> track(String number, String phone) async {
    final result = await _api.track(number, phone);
    // The detail page opens with the server's canonical number, so remember it under that one.
    _lastTrack = (access: OrderAccess.guest(result.order.number, phone), result: result, at: _now());
    return result;
  }

  @override
  Future<List<SlotDay>> slots(String number, {required String phone}) => _api.slots(number, phone: phone);

  @override
  Future<OrderDetail> changeSlot(String number, {required String phone, required DateTime date, required String windowId}) async {
    final order = await _api.changeSlot(number, phone: phone, date: date, windowId: windowId);
    // keep the offline copy in sync (only the signed-in customer's orders are cached)
    final key = OrdersCacheKeys.order(number);
    if (await _db.readCache(key, language: _language()) != null) await _db.putCache(key, order.toJson(), language: _language());
    return order;
  }
}

class OrderPaymentRepositoryImpl implements OrderPaymentRepository {
  OrderPaymentRepositoryImpl(this._api);

  final OrdersApi _api;

  @override
  Future<PaymentStatusInfo> retry(String number, PaymentMethod method, {required String idempotencyKey}) =>
      _api.retryPayment(number, method, idempotencyKey: idempotencyKey);

  @override
  Future<PaymentStatusInfo> status(String number) => _api.paymentStatus(number);
}

class ReturnsRepositoryImpl implements ReturnsRepository {
  ReturnsRepositoryImpl(this._api, this._db, this._language);

  final OrdersApi _api;
  final AppDatabase _db;
  final String Function() _language;

  @override
  Future<ReturnInfo> requestReturn(String number, CreateReturnRequest request) =>
      request.phone == null ? _api.createAccountReturn(number, request) : _api.createGuestReturn(number, request);

  @override
  Future<Cached<List<ReturnInfo>>> myReturns() => cachedFetch(
    db: _db,
    key: OrdersCacheKeys.returns,
    language: _language(),
    fetchJson: _api.myReturnsJson,
    decode: (j) => Decoders.list(j, ReturnInfo.fromJson),
  );
}

class GiftReceiptRepositoryImpl implements GiftReceiptRepository {
  GiftReceiptRepositoryImpl(this._api);

  final OrdersApi _api;

  @override
  Future<GiftReceipt> receipt(String code, {required String phone}) => _api.giftReceipt(code, phone: phone);

  @override
  Future<ReturnInfo> exchange(String code, GiftExchangeRequest request) => _api.giftExchange(code, request);
}
