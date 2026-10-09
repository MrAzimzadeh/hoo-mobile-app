/// Error codes of the orders/tracking/gift endpoints the UI branches on (Hoo.Domain `DomainErrors`).
abstract final class OrderErrorCodes {
  static const notFound = 'order.not_found';
  static const invalidTransition = 'order.invalid_transition';
  static const returnWindowClosed = 'order.return_window_closed';
  static const itemsNotReturnable = 'order.items_not_returnable';
  static const returnAlreadyOpen = 'order.return_already_open';
  static const exchangeSizeUnavailable = 'order.exchange_size_unavailable';
  static const slotFull = 'delivery.slot_full';
  static const slotNotChangeable = 'delivery.slot_not_changeable';
  static const slotInPast = 'delivery.slot_in_past';
  static const slotTooFar = 'delivery.slot_too_far';
  static const windowNotFound = 'delivery.window_not_found';
  static const orderNotPayable = 'payment.order_not_payable';
  static const alreadyPaid = 'payment.already_paid';
  static const paymentMethodUnavailable = 'checkout.payment_method_unavailable';
  static const receiptNotFound = 'gift.receipt_not_found';

  /// Conflicts / rule changes after which the order on screen is outdated → refresh and explain.
  static const refreshTriggers = {invalidTransition, slotFull, slotNotChangeable, orderNotPayable, alreadyPaid, returnAlreadyOpen, returnWindowClosed};
}
