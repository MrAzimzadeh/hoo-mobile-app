/// Server error codes the orders feature branches on (`Hoo.Domain.Common.DomainErrors`). Shared ones such as
/// `delivery.slot_full` live in core `ErrorCodes`.
abstract final class OrdersErrorCodes {
  static const orderNotFound = 'order.not_found';
  static const returnWindowClosed = 'order.return_window_closed';
  static const itemsNotReturnable = 'order.items_not_returnable';
  static const returnAlreadyOpen = 'order.return_already_open';
  static const exchangeSizeUnavailable = 'order.exchange_size_unavailable';
  static const slotNotChangeable = 'delivery.slot_not_changeable';
  static const slotsNotSupported = 'delivery.slots_not_supported';
  static const orderNotPayable = 'payment.order_not_payable';
  static const alreadyPaid = 'payment.already_paid';
  static const receiptNotFound = 'gift.receipt_not_found';
}
