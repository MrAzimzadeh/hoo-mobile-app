import '../../l10n/l10n.dart';
import '../domain/enums.dart';

/// Localized labels for domain enums (shared by orders, studio, checkout, profile).
extension OrderStatusLabel on OrderStatus {
  String label(AppLocalizations l) => switch (this) {
        OrderStatus.newOrder => l.orderStatusNew,
        OrderStatus.paid => l.orderStatusPaid,
        OrderStatus.awaitingApproval => l.orderStatusAwaitingApproval,
        OrderStatus.inProduction => l.orderStatusInProduction,
        OrderStatus.packed => l.orderStatusPacked,
        OrderStatus.outForDelivery => l.orderStatusOutForDelivery,
        OrderStatus.readyForPickup => l.orderStatusReadyForPickup,
        OrderStatus.delivered => l.orderStatusDelivered,
        OrderStatus.cancelled => l.orderStatusCancelled,
        OrderStatus.returnRequested => l.orderStatusReturnRequested,
        OrderStatus.returned => l.orderStatusReturned,
        OrderStatus.refunded => l.orderStatusRefunded,
        OrderStatus.unknown => '—',
      };
}

extension DesignStatusLabel on DesignStatus {
  String label(AppLocalizations l) => switch (this) {
        DesignStatus.draft => l.designStatusDraft,
        DesignStatus.submitted => l.designStatusSubmitted,
        DesignStatus.changesRequested => l.designStatusChangesRequested,
        DesignStatus.approved => l.designStatusApproved,
        DesignStatus.inProduction => l.designStatusInProduction,
        DesignStatus.ready => l.designStatusReady,
        DesignStatus.cancelled => l.designStatusCancelled,
        DesignStatus.unknown => '—',
      };
}

extension PaymentStatusLabel on PaymentStatus {
  String label(AppLocalizations l) => switch (this) {
        PaymentStatus.pending => l.paymentStatusPending,
        PaymentStatus.captured => l.paymentStatusCaptured,
        PaymentStatus.failed => l.paymentStatusFailed,
        PaymentStatus.cancelled => l.paymentStatusCancelled,
        PaymentStatus.refunded => l.paymentStatusRefunded,
        PaymentStatus.partiallyRefunded => l.paymentStatusPartiallyRefunded,
        PaymentStatus.unknown => '—',
      };
}

extension PaymentMethodLabel on PaymentMethod {
  String label(AppLocalizations l) => switch (this) {
        PaymentMethod.applePay => l.paymentMethodApplePay,
        PaymentMethod.googlePay => l.paymentMethodGooglePay,
        PaymentMethod.card => l.paymentMethodCard,
        PaymentMethod.savedCard => l.paymentMethodSavedCard,
        PaymentMethod.cashOnDelivery => l.paymentMethodCashOnDelivery,
        PaymentMethod.cardOnDelivery => l.paymentMethodCardOnDelivery,
        PaymentMethod.invoice => l.paymentMethodInvoice,
        PaymentMethod.unknown => '—',
      };
}

extension DeliveryKindLabel on DeliveryKind {
  String label(AppLocalizations l) => switch (this) {
        DeliveryKind.courier => l.deliveryKindCourier,
        DeliveryKind.post => l.deliveryKindPost,
        DeliveryKind.pickup => l.deliveryKindPickup,
        DeliveryKind.unknown => '—',
      };
}

extension ReturnStatusLabel on ReturnStatus {
  String label(AppLocalizations l) => switch (this) {
        ReturnStatus.requested => l.returnStatusRequested,
        ReturnStatus.approved => l.returnStatusApproved,
        ReturnStatus.rejected => l.returnStatusRejected,
        ReturnStatus.received => l.returnStatusReceived,
        ReturnStatus.refunded => l.returnStatusRefunded,
        ReturnStatus.exchanged => l.returnStatusExchanged,
        ReturnStatus.unknown => '—',
      };
}

extension ReturnKindLabel on ReturnKind {
  String label(AppLocalizations l) => switch (this) {
        ReturnKind.returnItem => l.returnKindReturn,
        ReturnKind.exchange => l.returnKindExchange,
      };
}

extension OccasionLabel on Occasion {
  String label(AppLocalizations l) => switch (this) {
        Occasion.birthday => l.occasionBirthday,
        Occasion.anniversary => l.occasionAnniversary,
        Occasion.novruz => l.occasionNovruz,
        Occasion.newYear => l.occasionNewYear,
        Occasion.justBecause => l.occasionJustBecause,
        Occasion.unknown => '—',
      };
}

extension FitLabel on Fit {
  String label(AppLocalizations l) => switch (this) {
        Fit.oversized => l.fitOversized,
        Fit.boxy => l.fitBoxy,
        Fit.regular => l.fitRegular,
        Fit.fitted => l.fitFitted,
        Fit.cropped => l.fitCropped,
        Fit.unknown => '—',
      };
}

extension ProductTypeLabel on ProductType {
  String label(AppLocalizations l) => switch (this) {
        ProductType.hoodie => l.productTypeHoodie,
        ProductType.zipHoodie => l.productTypeZipHoodie,
        ProductType.tShirt => l.productTypeTShirt,
        ProductType.sweatshirt => l.productTypeSweatshirt,
        ProductType.sweatpants => l.productTypeSweatpants,
        ProductType.shorts => l.productTypeShorts,
        ProductType.unknown => '—',
      };
}

extension ColorFamilyLabel on ColorFamily {
  String label(AppLocalizations l) => switch (this) {
        ColorFamily.black => l.colorFamilyBlack,
        ColorFamily.forest => l.colorFamilyForest,
        ColorFamily.cream => l.colorFamilyCream,
        ColorFamily.white => l.colorFamilyWhite,
        ColorFamily.grey => l.colorFamilyGrey,
        ColorFamily.sand => l.colorFamilySand,
        ColorFamily.olive => l.colorFamilyOlive,
        ColorFamily.red => l.colorFamilyRed,
        ColorFamily.unknown => '—',
      };

  /// Representative swatch color for the family chips in the style profile / filters.
  int get swatch => switch (this) {
        ColorFamily.black => 0xFF121212,
        ColorFamily.forest => 0xFF1C3829,
        ColorFamily.cream => 0xFFEDE6D6,
        ColorFamily.white => 0xFFFFFFFF,
        ColorFamily.grey => 0xFF9A9A9A,
        ColorFamily.sand => 0xFFD6C7AD,
        ColorFamily.olive => 0xFF6B6B3A,
        ColorFamily.red => 0xFFB83636,
        ColorFamily.unknown => 0xFFE8E8E5,
      };
}

extension StyleTagLabel on StyleTag {
  String label(AppLocalizations l) => switch (this) {
        StyleTag.minimal => l.styleTagMinimal,
        StyleTag.streetwear => l.styleTagStreetwear,
        StyleTag.graphicPrints => l.styleTagGraphicPrints,
        StyleTag.monochrome => l.styleTagMonochrome,
        StyleTag.sport => l.styleTagSport,
        StyleTag.vintage => l.styleTagVintage,
        StyleTag.unknown => '—',
      };
}

extension NotificationTopicLabel on NotificationTopic {
  String label(AppLocalizations l) => switch (this) {
        NotificationTopic.orders => l.notificationTopicOrders,
        NotificationTopic.delivery => l.notificationTopicDelivery,
        NotificationTopic.alerts => l.notificationTopicAlerts,
        NotificationTopic.marketing => l.notificationTopicMarketing,
        NotificationTopic.unknown => '—',
      };
}

extension NotificationChannelLabel on NotificationChannel {
  String label(AppLocalizations l) => switch (this) {
        NotificationChannel.email => l.notificationChannelEmail,
        NotificationChannel.sms => l.notificationChannelSms,
        NotificationChannel.whatsApp => l.notificationChannelWhatsApp,
        NotificationChannel.push => l.notificationChannelPush,
        NotificationChannel.unknown => '—',
      };
}

extension StockStateLabel on StockState {
  String label(AppLocalizations l) => switch (this) {
        StockState.inStock => l.stockStateInStock,
        StockState.lowStock => l.stockStateLowStock,
        StockState.preorder => l.stockStatePreorder,
        StockState.outOfStock => l.stockStateOutOfStock,
        StockState.madeToOrder => l.stockStateMadeToOrder,
        StockState.unavailable => l.stockStateUnavailable,
        StockState.unknown => '—',
      };
}

extension ProductBadgeLabel on ProductBadge {
  String label(AppLocalizations l) => switch (this) {
        ProductBadge.newIn => l.badgeNew,
        ProductBadge.newDrop => l.badgeNewDrop,
        ProductBadge.bestseller => l.badgeBestseller,
        ProductBadge.sale => l.badgeSale,
        ProductBadge.unknown => '',
      };
}
