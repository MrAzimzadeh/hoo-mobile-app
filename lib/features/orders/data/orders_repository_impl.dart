import '../../../core/session/session_store.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/domain/models.dart';
import '../domain/order_models.dart';
import '../domain/order_view.dart';
import '../domain/orders_repositories.dart';
import 'orders_api.dart';

/// Account orders. Page 1 and order details are written to the offline cache under the signed-in user's id, so
/// "where is my order" still answers without a network (read-only, flagged stale).
class OrdersRepositoryImpl implements OrdersRepository {
  OrdersRepositoryImpl(this._api, this._db, this._session, this._auth);

  final OrdersApi _api;
  final AppDatabase _db;
  final SessionStore _session;
  final AuthGate _auth;

  @override
  Future<Cached<Paged<OrderListItem>>> orders({int page = 1, int pageSize = 20}) {
    Paged<OrderListItem> decode(Object? j) => Paged.fromJson((j as Map).cast<String, dynamic>(), (e) => OrderListItem.fromJson((e as Map).cast<String, dynamic>()));
    final userId = _auth.currentUser?.id;
    if (page != 1 || userId == null) {
      return _api.ordersJson(page: page, pageSize: pageSize).then((j) => Cached(decode(j)));
    }
    return cachedFetch(
      db: _db,
      key: 'orders.list.$userId',
      language: _session.language,
      fetchJson: () => _api.ordersJson(page: page, pageSize: pageSize),
      decode: decode,
    );
  }

  @override
  Future<List<ReturnRecord>> returns() => _api.returns();
}

class OrderDetailRepositoryImpl implements OrderDetailRepository {
  OrderDetailRepositoryImpl(this._api, this._db, this._session, this._auth, {DateTime Function()? clock}) : _clock = clock ?? DateTime.now;

  final OrdersApi _api;
  final AppDatabase _db;
  final SessionStore _session;
  final AuthGate _auth;
  final DateTime Function() _clock;

  /// How long a Track-order lookup may be reused as the detail's first frame.
  static const recentTtl = Duration(seconds: 30);

  ({String number, String phone, TrackingResult result, DateTime at})? _recent;

  @override
  Future<OrderView> load(OrderAccess access) async {
    switch (access) {
      case AccountOrderAccess(:final number):
        final userId = _auth.currentUser?.id;
        if (userId == null) {
          return OrderView(order: OrderDetail.fromJson((await _api.orderJson(number) as Map).cast<String, dynamic>()));
        }
        final cached = await cachedFetch(
          db: _db,
          key: 'orders.detail.$userId.${number.toUpperCase()}',
          language: _session.language,
          fetchJson: () => _api.orderJson(number),
          decode: (j) => OrderDetail.fromJson((j as Map).cast<String, dynamic>()),
        );
        return OrderView(order: cached.data, stale: cached.stale);
      case TrackingOrderAccess(:final number, :final phone):
        final result = await track(number, phone);
        return _toView(result);
    }
  }

  @override
  Future<TrackingResult> track(String number, String phone) async {
    final result = await _api.track(number, phone);
    _recent = (number: _norm(number), phone: phone, result: result, at: _clock());
    return result;
  }

  @override
  OrderView? recentTracking(String number, String phone) {
    final r = _recent;
    if (r == null || r.number != _norm(number) || r.phone != phone) return null;
    if (_clock().difference(r.at) > recentTtl) return null;
    return _toView(r.result);
  }

  static String _norm(String number) => number.trim().toUpperCase();

  static OrderView _toView(TrackingResult r) => OrderView(order: r.order, isRecipientView: r.isRecipientView, whatsAppUrl: r.whatsAppUrl);
}
