import 'package:equatable/equatable.dart';

import 'order_models.dart';

/// How an order was opened: the signed-in customer's own order, or public tracking by number + phone.
sealed class OrderAccess extends Equatable {
  const OrderAccess(this.number);

  final String number;

  /// The phone used for tracking-only endpoints (slot change, guest returns). For the signed-in view this is the
  /// order's contact phone, which the backend authorizes the same way.
  String? phoneFor(OrderDetail order);
}

/// `GET /account/orders/{number}`.
final class AccountOrderAccess extends OrderAccess {
  const AccountOrderAccess(super.number);

  @override
  String? phoneFor(OrderDetail order) => order.contact.phone.isEmpty ? null : order.contact.phone;

  @override
  List<Object?> get props => [number];
}

/// `GET /orders/track?number&phone` — guests and gift recipients.
final class TrackingOrderAccess extends OrderAccess {
  const TrackingOrderAccess(super.number, this.phone);

  final String phone;

  @override
  String? phoneFor(OrderDetail order) => phone;

  @override
  List<Object?> get props => [number, phone];
}

/// What the order detail screen renders, whichever endpoint it came from.
class OrderView extends Equatable {
  const OrderView({required this.order, this.isRecipientView = false, this.whatsAppUrl, this.stale = false});

  final OrderDetail order;

  /// Gift recipient tracking: no prices, no payment, no returns (the server already strips them).
  final bool isRecipientView;
  final String? whatsAppUrl;

  /// Served from the offline cache — render read-only.
  final bool stale;

  /// Prices are shown only when the server sent them and this is not the recipient's view.
  bool get showPrices => !isRecipientView && order.totals != null;

  OrderView copyWith({OrderDetail? order}) =>
      OrderView(order: order ?? this.order, isRecipientView: isRecipientView, whatsAppUrl: whatsAppUrl, stale: stale);

  @override
  List<Object?> get props => [order, isRecipientView, whatsAppUrl, stale];
}
