// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'HOO';

  @override
  String get navHome => 'Home';

  @override
  String get navShop => 'Shop';

  @override
  String get navStudio => 'Studio';

  @override
  String get navBag => 'Bag';

  @override
  String get navProfile => 'Profile';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonSaved => 'Saved';

  @override
  String get commonSaving => 'Saving…';

  @override
  String get commonDone => 'Done';

  @override
  String get commonClose => 'Close';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonBack => 'Back';

  @override
  String get commonNext => 'Next';

  @override
  String get commonApply => 'Apply';

  @override
  String get commonClear => 'Clear';

  @override
  String get commonClearAll => 'Clear all';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonShare => 'Share';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOptional => 'optional';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonFilter => 'Filter';

  @override
  String get commonSort => 'Sort';

  @override
  String get commonShowMore => 'Show more';

  @override
  String get commonShowLess => 'Show less';

  @override
  String get commonCopy => 'Copy';

  @override
  String get commonCopied => 'Copied';

  @override
  String get commonSignIn => 'Sign in';

  @override
  String get commonSignOut => 'Sign out';

  @override
  String get commonCreateAccount => 'Create account';

  @override
  String get commonContinueAsGuest => 'Continue as guest';

  @override
  String get commonLearnMore => 'Learn more';

  @override
  String get commonTotal => 'Total';

  @override
  String get commonFree => 'Free';

  @override
  String commonDays(int min, int max) {
    return '$min–$max days';
  }

  @override
  String commonPieces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pieces',
      one: '1 piece',
    );
    return '$_temp0';
  }

  @override
  String get errorGeneric =>
      'Something went wrong. Please try again in a moment.';

  @override
  String get errorNetwork => 'No internet connection. Check your network.';

  @override
  String get errorNotFound => 'Not found';

  @override
  String errorTooManyRequests(int seconds) {
    return 'Too many attempts. Try again in $seconds s.';
  }

  @override
  String get errorExternal =>
      'The service is temporarily unavailable. Try again shortly.';

  @override
  String get errorConflict => 'This just changed. We refreshed it for you.';

  @override
  String get errorSessionExpired =>
      'Your session has ended. Please sign in again.';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get fieldInvalidEmail => 'Enter a valid email';

  @override
  String get fieldInvalidPhone => 'Use the +994 XX XXX XX XX format';

  @override
  String get fieldPasswordRule =>
      'At least 8 characters, a number and a symbol';

  @override
  String get stateEmptyTitle => 'Nothing here yet';

  @override
  String get stateOffline => 'You’re offline — showing saved data';

  @override
  String get stateLoading => 'Loading…';

  @override
  String get badgeNew => 'NEW';

  @override
  String get badgeNewDrop => 'NEW DROP';

  @override
  String get badgeBestseller => 'BESTSELLER';

  @override
  String get badgeSale => 'SALE';

  @override
  String discountPercent(int percent) {
    return '-$percent%';
  }

  @override
  String get a11yAddToWishlist => 'Add to wishlist';

  @override
  String get a11yRemoveFromWishlist => 'Remove from wishlist';

  @override
  String get a11yIncrease => 'Increase';

  @override
  String get a11yDecrease => 'Decrease';

  @override
  String a11yQuantity(int count) {
    return 'Quantity: $count';
  }

  @override
  String a11yColor(String name) {
    return 'Color: $name';
  }

  @override
  String get a11ySelected => 'selected';

  @override
  String get a11yUnavailable => 'unavailable';

  @override
  String a11yRating(String rating) {
    return 'Rated $rating out of 5';
  }

  @override
  String get a11yClose => 'Close';

  @override
  String get a11yBack => 'Back';

  @override
  String a11yBag(int count) {
    return 'Bag, $count items';
  }

  @override
  String get a11yShowPassword => 'Show password';

  @override
  String get a11yHidePassword => 'Hide password';

  @override
  String get a11yLogo => 'HOO';

  @override
  String stepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get summaryTotal => 'Total';

  @override
  String get summarySubtotal => 'Subtotal';

  @override
  String get summaryDiscount => 'Discount';

  @override
  String get summaryDelivery => 'Delivery';

  @override
  String get summaryGiftPackaging => 'Gift packaging';

  @override
  String get summaryGreetingCard => 'Greeting card';

  @override
  String summaryVatIncluded(String amount) {
    return 'VAT included: $amount';
  }

  @override
  String get summaryShowBreakdown => 'Show breakdown';

  @override
  String get summaryUpdating => 'Updating price';

  @override
  String get authGateTitle => 'Sign in to continue';

  @override
  String get authGateBody =>
      'Your wishlist, reviews, addresses and designs are kept in your account.';

  @override
  String get orderStatusNew => 'New';

  @override
  String get orderStatusPaid => 'Paid';

  @override
  String get orderStatusAwaitingApproval => 'Awaiting design approval';

  @override
  String get orderStatusInProduction => 'In production';

  @override
  String get orderStatusPacked => 'Packed';

  @override
  String get orderStatusOutForDelivery => 'Out for delivery';

  @override
  String get orderStatusReadyForPickup => 'Ready for pickup';

  @override
  String get orderStatusDelivered => 'Delivered';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String get orderStatusReturnRequested => 'Return requested';

  @override
  String get orderStatusReturned => 'Returned';

  @override
  String get orderStatusRefunded => 'Refunded';

  @override
  String get designStatusDraft => 'Draft';

  @override
  String get designStatusSubmitted => 'Submitted';

  @override
  String get designStatusChangesRequested => 'Changes requested';

  @override
  String get designStatusApproved => 'Approved';

  @override
  String get designStatusInProduction => 'In production';

  @override
  String get designStatusReady => 'Ready';

  @override
  String get designStatusCancelled => 'Cancelled';

  @override
  String get paymentStatusPending => 'Pending';

  @override
  String get paymentStatusCaptured => 'Paid';

  @override
  String get paymentStatusFailed => 'Failed';

  @override
  String get paymentStatusCancelled => 'Cancelled';

  @override
  String get paymentStatusRefunded => 'Refunded';

  @override
  String get paymentStatusPartiallyRefunded => 'Partially refunded';

  @override
  String get paymentMethodApplePay => 'Apple Pay';

  @override
  String get paymentMethodGooglePay => 'Google Pay';

  @override
  String get paymentMethodCard => 'Card';

  @override
  String get paymentMethodSavedCard => 'Saved card';

  @override
  String get paymentMethodCashOnDelivery => 'Cash on delivery';

  @override
  String get paymentMethodCardOnDelivery => 'Card on delivery';

  @override
  String get paymentMethodInvoice => 'Invoice';

  @override
  String get deliveryKindCourier => 'Courier';

  @override
  String get deliveryKindPost => 'Post';

  @override
  String get deliveryKindPickup => 'Pickup';

  @override
  String get returnStatusRequested => 'Requested';

  @override
  String get returnStatusApproved => 'Approved';

  @override
  String get returnStatusRejected => 'Rejected';

  @override
  String get returnStatusReceived => 'Received';

  @override
  String get returnStatusRefunded => 'Refunded';

  @override
  String get returnStatusExchanged => 'Exchanged';

  @override
  String get returnKindReturn => 'Return';

  @override
  String get returnKindExchange => 'Exchange';

  @override
  String get occasionBirthday => 'Birthday';

  @override
  String get occasionAnniversary => 'Anniversary';

  @override
  String get occasionNovruz => 'Novruz';

  @override
  String get occasionNewYear => 'New Year';

  @override
  String get occasionJustBecause => 'Just because';

  @override
  String get fitOversized => 'Oversized';

  @override
  String get fitBoxy => 'Boxy';

  @override
  String get fitRegular => 'Regular';

  @override
  String get fitFitted => 'Fitted';

  @override
  String get fitCropped => 'Cropped';

  @override
  String get productTypeHoodie => 'Hoodie';

  @override
  String get productTypeZipHoodie => 'Zip hoodie';

  @override
  String get productTypeTShirt => 'T-shirt';

  @override
  String get productTypeSweatshirt => 'Sweatshirt';

  @override
  String get productTypeSweatpants => 'Sweatpants';

  @override
  String get productTypeShorts => 'Shorts';

  @override
  String get colorFamilyBlack => 'Black';

  @override
  String get colorFamilyForest => 'Forest';

  @override
  String get colorFamilyCream => 'Cream';

  @override
  String get colorFamilyWhite => 'White';

  @override
  String get colorFamilyGrey => 'Grey';

  @override
  String get colorFamilySand => 'Sand';

  @override
  String get colorFamilyOlive => 'Olive';

  @override
  String get colorFamilyRed => 'Red';

  @override
  String get styleTagMinimal => 'Minimal';

  @override
  String get styleTagStreetwear => 'Streetwear';

  @override
  String get styleTagGraphicPrints => 'Graphic prints';

  @override
  String get styleTagMonochrome => 'Monochrome';

  @override
  String get styleTagSport => 'Sport';

  @override
  String get styleTagVintage => 'Vintage';

  @override
  String get notificationTopicOrders => 'Orders';

  @override
  String get notificationTopicDelivery => 'Delivery';

  @override
  String get notificationTopicAlerts => 'Alerts';

  @override
  String get notificationTopicMarketing => 'News & offers';

  @override
  String get notificationChannelEmail => 'Email';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationChannelWhatsApp => 'WhatsApp';

  @override
  String get notificationChannelPush => 'Push';

  @override
  String get stockStateInStock => 'In stock';

  @override
  String get stockStateLowStock => 'Low stock';

  @override
  String get stockStatePreorder => 'Pre-order';

  @override
  String get stockStateOutOfStock => 'Out of stock';

  @override
  String get stockStateMadeToOrder => 'Made to order';

  @override
  String get stockStateUnavailable => 'Unavailable';

  @override
  String get dsTitle => 'Design system';

  @override
  String get dsLightDark => 'Light / Dark';
}
