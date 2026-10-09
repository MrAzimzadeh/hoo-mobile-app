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

  @override
  String get authSignInWithSms => 'Sign in with SMS code';

  @override
  String get authSocialUnavailable =>
      'This sign-in option isn’t available right now';

  @override
  String get authOr => 'or';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authContinueWithApple => 'Continue with Apple';

  @override
  String get authSocialTerms => 'By continuing you accept the Terms of use.';

  @override
  String get authWelcomeTitle => 'Calm. Confident. HOO.';

  @override
  String get authWelcomeSubtitle =>
      'Premium streetwear from Baku — and a 3D Studio for your own design.';

  @override
  String get authSignInTitle => 'Welcome back';

  @override
  String get authSignInSubtitle =>
      'Your orders, designs and wishlist are waiting.';

  @override
  String get authIdentifierLabel => 'Email or phone';

  @override
  String get authIdentifierHint => 'you@example.com or 050 123 45 67';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authNoAccount => 'New to HOO?';

  @override
  String get authHaveAccount => 'Already have an account?';

  @override
  String get authSignUpTitle => 'Create your account';

  @override
  String get authSignUpSubtitle =>
      'Early access to drops, faster checkout and saved designs.';

  @override
  String get authFullNameLabel => 'Full name';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPhoneLabel => 'Phone';

  @override
  String get authMarketingConsent => 'Tell me first about new drops and offers';

  @override
  String get authAcceptTerms => 'I accept the Terms of use and Privacy policy';

  @override
  String get authTermsRequired => 'Please accept the terms to continue';

  @override
  String get authOtpPhoneTitle => 'Sign in with your phone';

  @override
  String get authOtpPhoneSubtitle =>
      'We’ll text you a 6-digit code. New numbers get an account automatically.';

  @override
  String get authOtpNameHint => 'for new customers';

  @override
  String get authSendCode => 'Send code';

  @override
  String get authOtpCodeTitle => 'Enter the code';

  @override
  String authOtpCodeSubtitle(String phone) {
    return 'We sent it to $phone';
  }

  @override
  String authResendIn(String time) {
    return 'Resend in $time';
  }

  @override
  String get authResendSms => 'Resend code';

  @override
  String get authResendWhatsApp => 'No SMS? Send via WhatsApp';

  @override
  String get authForgotTitle => 'Reset your password';

  @override
  String get authForgotSubtitle => 'Enter your email or phone number.';

  @override
  String get authForgotEmailSentTitle => 'Check your inbox';

  @override
  String get authForgotEmailSent =>
      'If an account exists, we’ve sent a link to reset the password.';

  @override
  String get authResetTitle => 'New password';

  @override
  String get authResetSubtitle =>
      'Enter the code we sent and your new password.';

  @override
  String get authResetCodeLabel => 'Code';

  @override
  String get authNewPasswordLabel => 'New password';

  @override
  String get authResetDone =>
      'Your password has been updated. You can sign in now.';

  @override
  String get cartAddedTitle => 'Added to bag';

  @override
  String cartItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get cartCheckout => 'Checkout';

  @override
  String get cartViewBag => 'View bag';

  @override
  String cartOnlyLeft(int count) {
    return 'Only $count left';
  }

  @override
  String cartMadeToOrderDays(int days) {
    return 'Made to order · $days days';
  }

  @override
  String get cartCustomBadge => 'Studio';

  @override
  String get cartFreeDeliveryReached => 'Nice — delivery is free';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return '$amount until free delivery';
  }

  @override
  String cartRemoved(String name) {
    return '$name removed';
  }

  @override
  String get cartUndo => 'Undo';

  @override
  String get cartEmptyTitle => 'Your bag is empty';

  @override
  String get cartEmptyBody =>
      'Discover the new drop or design your own in the Studio.';

  @override
  String get cartEmptyAction => 'Shop now';

  @override
  String get cartBestsellers => 'Bestsellers';

  @override
  String get cartLineErrors =>
      'Some items changed — please review them before checkout.';

  @override
  String get cartIsGift => 'This is a gift';

  @override
  String get cartIsGiftHint =>
      'Packaging, a greeting card and a price-free receipt';

  @override
  String get cartDeliveryAtCheckout => 'Delivery is calculated at checkout.';

  @override
  String get cartCompleteTheLook => 'Complete the look';

  @override
  String get cartPromoHint => 'Promo code';

  @override
  String get catalogFilterTitle => 'Filter & sort';

  @override
  String get catalogSortNewest => 'Newest';

  @override
  String get catalogSortPriceAsc => 'Price: low to high';

  @override
  String get catalogSortPriceDesc => 'Price: high to low';

  @override
  String get catalogSortPopular => 'Bestselling';

  @override
  String get catalogFilterCategory => 'Category';

  @override
  String get catalogFilterSize => 'Size';

  @override
  String get catalogFilterColor => 'Color';

  @override
  String get catalogFilterFit => 'Fit';

  @override
  String get catalogFilterFabric => 'Fabric';

  @override
  String get catalogFilterPrice => 'Price';

  @override
  String get catalogFilterInStock => 'In stock only';

  @override
  String get catalogShowResults => 'Show results';

  @override
  String get catalogChipAll => 'All';

  @override
  String get catalogChipNew => 'New in';

  @override
  String get catalogChipSale => 'Sale';

  @override
  String get catalogChipOversized => 'Oversized';

  @override
  String catalogShowing(int shown, int total) {
    return 'Showing $shown of $total';
  }

  @override
  String get catalogFilterAndSort => 'Filter';

  @override
  String catalogFilterCount(int count) {
    return 'Filter ($count)';
  }

  @override
  String get catalogEmptyTitle => 'Nothing found';

  @override
  String get catalogEmptyBody => 'Try changing or clearing the filters.';

  @override
  String get catalogAlertSignIn =>
      'Alerts are tied to your account — please sign in.';

  @override
  String get catalogNotifyDone => 'We’ll let you know when it’s back';

  @override
  String get catalogPriceAlertDone => 'We’ll let you know if the price drops';

  @override
  String get catalogPhotos => 'Photos';

  @override
  String get catalog3dView => '3D';

  @override
  String get catalogYouMayAlsoLike => 'You may also like';

  @override
  String get catalogToday => 'today';

  @override
  String get catalogTomorrow => 'tomorrow';

  @override
  String catalogDeliveredOn(String when) {
    return 'Delivered $when';
  }

  @override
  String catalogDeliveryPromise(int hours, int minutes, String when) {
    return 'Order within $hours h $minutes min — delivered $when';
  }

  @override
  String get catalogReadReviews => 'Read reviews';

  @override
  String get catalogColor => 'Color';

  @override
  String get catalogSize => 'Size';

  @override
  String get catalogSizeGuide => 'Size guide';

  @override
  String get catalogPreorderShort => 'pre-order';

  @override
  String get catalogChooseSize => 'Please choose a size';

  @override
  String catalogRecommendedSize(String size) {
    return 'We recommend $size';
  }

  @override
  String catalogOnlyLeftIn(int count, String size) {
    return 'Only $count left in $size';
  }

  @override
  String get catalogCustomizeThis => 'Customize this';

  @override
  String get catalogDescription => 'Description';

  @override
  String get catalogSizeAndFit => 'Size & fit';

  @override
  String get catalogFabricAndCare => 'Fabric & care';

  @override
  String catalogReviewsCount(int count) {
    return 'Reviews ($count)';
  }

  @override
  String get catalogWriteReview => 'Write a review';

  @override
  String get catalogPriceDropAlert => 'Price drop alert';

  @override
  String get catalogSelectSize => 'Select a size';

  @override
  String get catalogAddToBag => 'Add to bag';

  @override
  String get catalogSizeCol => 'Size';

  @override
  String get catalogChestCol => 'Chest';

  @override
  String get catalogLengthCol => 'Length';

  @override
  String get catalogSleeveCol => 'Sleeve';

  @override
  String get catalogSizeGuideHint =>
      'Measurements are of the garment, laid flat.';

  @override
  String get catalogReviews => 'Reviews';

  @override
  String get catalogNoReviews => 'No reviews yet';

  @override
  String get catalogNoReviewsBody =>
      'If you bought it, be the first to review it.';

  @override
  String get catalogReviewThanks => 'Thank you!';

  @override
  String get catalogReviewModeration =>
      'Your review will be published after moderation.';

  @override
  String get catalogYourRating => 'Your rating';

  @override
  String get catalogReviewTitle => 'Title';

  @override
  String get catalogReviewBody => 'Your review';

  @override
  String get catalogSubmitReview => 'Submit';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutStepContact => 'Contact';

  @override
  String get checkoutStepGift => 'Gift';

  @override
  String get checkoutStepDelivery => 'Delivery';

  @override
  String get checkoutStepSlot => 'Delivery time';

  @override
  String get checkoutStepPayment => 'Payment';

  @override
  String get checkoutStepReview => 'Review';

  @override
  String get checkoutPhoneHint => 'The courier will call this number.';

  @override
  String get checkoutGiftNotForCustom =>
      'Custom (Studio) orders can’t be sent as gifts.';

  @override
  String get checkoutRecipientName => 'Recipient’s name';

  @override
  String get checkoutRecipientPhone => 'Recipient’s phone';

  @override
  String get checkoutOccasion => 'Occasion';

  @override
  String get checkoutSurprise => 'Surprise';

  @override
  String get checkoutSurpriseHint =>
      'The courier coordinates with you, not the recipient.';

  @override
  String get checkoutPackaging => 'Packaging';

  @override
  String checkoutPackagingFreeFrom(String amount) {
    return 'Free from $amount';
  }

  @override
  String get checkoutCard => 'Greeting card';

  @override
  String get checkoutMessage => 'Message';

  @override
  String get checkoutFromName => 'From';

  @override
  String get checkoutHidePrices => 'Hide prices on the packing slip';

  @override
  String checkoutReadyInHours(int hours) {
    return 'Ready in $hours h';
  }

  @override
  String checkoutFreeFrom(String amount) {
    return 'Free from $amount';
  }

  @override
  String get checkoutAddress => 'Address';

  @override
  String get checkoutNewAddress => 'New address';

  @override
  String get checkoutCity => 'City';

  @override
  String get checkoutDistrict => 'District';

  @override
  String get checkoutStreet => 'Street and building';

  @override
  String get checkoutApartment => 'Apartment';

  @override
  String get checkoutCourierNote => 'Note for the courier';

  @override
  String get checkoutNoSlots => 'No delivery times available';

  @override
  String get checkoutSlotTaken =>
      'That time just filled up — please pick another.';

  @override
  String get checkoutPackagingSaving => 'Packaging saving';

  @override
  String checkoutEstimatedDelivery(String range) {
    return 'Estimated delivery: $range';
  }

  @override
  String get checkoutCustomApprovalNote =>
      'Studio designs are reviewed by our team first, then go into production — the order shows “Awaiting design approval” until then.';

  @override
  String get checkoutSaveCard => 'Save this card for next time';

  @override
  String get checkoutAcceptTerms =>
      'I accept the terms of sale and the return policy';

  @override
  String get checkoutImageRights =>
      'I own the rights to these images and understand custom items can’t be returned';

  @override
  String get checkoutMissingSteps =>
      'Complete the steps above to place the order.';

  @override
  String checkoutPlaceOrder(String total) {
    return 'Place order · $total';
  }

  @override
  String get checkoutPaymentFailedTitle => 'Payment didn’t go through';

  @override
  String get checkoutPaymentFailedBody =>
      'Your order is saved. Try again or choose another way to pay.';

  @override
  String get checkoutRetryPayment => 'Try payment again';

  @override
  String get checkoutSwitchToCod => 'Pay cash on delivery instead';

  @override
  String get checkoutAwaitingPayment => 'Complete your payment';

  @override
  String checkoutAwaitingPaymentBody(String number) {
    return 'Order $number is created. We’ll continue as soon as the payment is confirmed.';
  }

  @override
  String get checkoutCheckPayment => 'Check payment';

  @override
  String get checkoutOpenPaymentAgain => 'Open the payment page again';

  @override
  String get checkoutConfirmedTitle => 'Your order is confirmed';

  @override
  String get checkoutConfirmedBody =>
      'Thank you. We’ve sent you a confirmation by email and SMS.';

  @override
  String get checkoutOrderNumber => 'Order number';

  @override
  String get checkoutGiftReceipt => 'Gift receipt';

  @override
  String get checkoutGiftReceiptHint =>
      'The recipient can exchange the size with this code — without seeing prices.';

  @override
  String get checkoutTrackOrder => 'Track order';

  @override
  String get checkoutContinueShopping => 'Continue shopping';

  @override
  String get homeNewArrivals => 'New arrivals';

  @override
  String get homeCategories => 'Categories';

  @override
  String get homeCollections => 'Collections';

  @override
  String get homeShopTheLook => 'Shop the look';

  @override
  String homeShopLookCount(int count) {
    return '$count pieces';
  }

  @override
  String get homeBestsellers => 'Bestsellers';

  @override
  String get homeRecentlyViewed => 'Recently viewed';

  @override
  String get homeHeroEyebrow => 'New drop';

  @override
  String get homeHeroTitle => 'Quiet strength.';

  @override
  String get homeHeroSubtitle =>
      'Heavyweight cotton, oversized cuts, forest green. The new collection is live.';

  @override
  String get homeHeroCta => 'Shop the drop';

  @override
  String get homeStudioTitle => 'Design your own';

  @override
  String get homeStudioBody =>
      'Pick fabric and color, add text and images — see it in 3D.';

  @override
  String get homeStudioCta => 'Open the Studio';

  @override
  String get launchComingSoonTitle => 'Coming soon.';

  @override
  String get launchComingSoonSubtitle =>
      'HOO is opening. Join the list for early access to the first drop.';

  @override
  String get launchDays => 'days';

  @override
  String get launchHours => 'hours';

  @override
  String get launchMinutes => 'min';

  @override
  String get launchSeconds => 'sec';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return '$days days, $hours hours, $minutes minutes to launch';
  }

  @override
  String get launchWaitlistTitle => 'Join the waitlist';

  @override
  String launchWaitlistCount(int count) {
    return '$count people are already on the list';
  }

  @override
  String get launchJoinWaitlist => 'Join the waitlist';

  @override
  String launchWaitlistPosition(int position, int total) {
    return 'You are #$position of $total';
  }

  @override
  String get launchWaitlistThanks =>
      'You’ll be the first to know on launch day.';

  @override
  String get launchWaitlistAlready =>
      'You’re already on the list — see you soon!';

  @override
  String get launchNewsletterTitle => 'Subscribe to the newsletter';

  @override
  String get launchSubscribe => 'Subscribe';

  @override
  String get launchNewsletterDone => 'You’re subscribed. Thank you!';

  @override
  String get launchStaffSignIn => 'Staff sign in';

  @override
  String get launchSkip => 'Skip';

  @override
  String get launchGetStarted => 'Get started';

  @override
  String get launchChooseLanguage => 'Choose your language';

  @override
  String get launchSlideBrandTitle => 'From Baku. Calm and confident.';

  @override
  String get launchSlideBrandBody =>
      'Heavy cotton, precise cuts, few colors. Premium streetwear for every day.';

  @override
  String get launchSlideStudioTitle => 'Design your own.';

  @override
  String get launchSlideStudioBody =>
      'Pick fabric and color in the 3D Studio, add text and images — see the price instantly.';

  @override
  String get launchSlideDeliveryTitle => 'Fast delivery in Baku.';

  @override
  String get launchSlideDeliveryBody =>
      'Choose a day and time that suit you and track every step.';

  @override
  String get ordersEventPlaced => 'Order placed';

  @override
  String get ordersEventPaymentCaptured => 'Payment received';

  @override
  String get ordersEventPaymentFailed => 'Payment failed';

  @override
  String get ordersEventCourierAssigned => 'Courier assigned';

  @override
  String ordersEventCourierAssignedNamed(String name) {
    return 'Courier: $name';
  }

  @override
  String get ordersEventEtaUpdated => 'Delivery ETA updated';

  @override
  String get ordersEventSlotChanged => 'Delivery time changed';

  @override
  String get ordersEventRefund => 'Refund issued';

  @override
  String get ordersEventGiftMessage => 'Gift message updated';

  @override
  String get ordersEventReturnRequested => 'Return requested';

  @override
  String get ordersEventReturnUpdated => 'Return updated';

  @override
  String get ordersEventDesignApproved => 'Design approved';

  @override
  String get ordersEventDesignChanges => 'Design changes requested';

  @override
  String get ordersTitle => 'My orders';

  @override
  String get ordersEmptyTitle => 'No orders yet';

  @override
  String get ordersEmptyBody => 'Your first order will show up here.';

  @override
  String get ordersReturnsTitle => 'Returns';

  @override
  String get ordersReturnsEmpty => 'No return requests';

  @override
  String get ordersReturnsEmptyBody =>
      'You can request a return or exchange from an order.';

  @override
  String get ordersTrackTitle => 'Track an order';

  @override
  String get ordersTrackBody =>
      'Enter the order number and the phone used for the order.';

  @override
  String get ordersTrackPhone => 'Phone on the order';

  @override
  String get ordersChangeSlot => 'Change delivery time';

  @override
  String get ordersSlotChangeContact =>
      'To change the time, contact us — we’ll rebook the courier for you.';

  @override
  String get ordersSlotChanged => 'Delivery time changed';

  @override
  String get ordersSignInToView => 'Sign in to view this order';

  @override
  String ordersPlacedOn(String date) {
    return 'Placed $date';
  }

  @override
  String get ordersPayAgain => 'Pay again';

  @override
  String get ordersReturnExchange => 'Return / exchange';

  @override
  String get ordersWhatsApp => 'Message us on WhatsApp';

  @override
  String get ordersTimeline => 'Status';

  @override
  String get ordersItems => 'Items';

  @override
  String ordersCourier(String name) {
    return 'Courier: $name';
  }

  @override
  String ordersStopsAway(int count) {
    return '$count stops away';
  }

  @override
  String ordersEta(int minutes) {
    return '~$minutes min';
  }

  @override
  String get ordersNotReturnable => 'Custom item — not returnable';

  @override
  String get ordersReturnReason => 'Reason';

  @override
  String get ordersSendRequest => 'Send request';

  @override
  String get ordersReturnSent => 'Request sent';

  @override
  String get ordersReturnSentBody =>
      'Our team will contact you within 1–2 business days.';

  @override
  String get ordersGiftReceiptBody =>
      'Enter the code from the gift receipt and your phone — you can exchange the size.';

  @override
  String get ordersGiftCode => 'Gift code';

  @override
  String get ordersRecipientPhone => 'Your phone';

  @override
  String ordersGiftFor(String name) {
    return 'A gift for $name';
  }

  @override
  String ordersGiftFrom(String name) {
    return 'from $name';
  }

  @override
  String get ordersExchangeTo => 'Exchange to';

  @override
  String ordersExchangeUntil(String date) {
    return 'Exchange possible until $date';
  }

  @override
  String get ordersRequestExchange => 'Request exchange';

  @override
  String get ordersExchangeSent => 'Exchange requested';

  @override
  String get profileSignOutConfirm => 'Sign out of your account?';

  @override
  String get profileShopping => 'Shopping';

  @override
  String get profileMyDesigns => 'My designs';

  @override
  String get profileAccount => 'Account';

  @override
  String get profileStyleProfile => 'Style profile';

  @override
  String get profileAddresses => 'Addresses';

  @override
  String get profileSavedCards => 'Saved cards';

  @override
  String get profilePersonalInfo => 'Personal info';

  @override
  String get profileChangePassword => 'Change password';

  @override
  String get profileSetPassword => 'Set a password';

  @override
  String get profileDevices => 'Active devices';

  @override
  String get profileNotifications => 'Notifications';

  @override
  String get profileServices => 'Services';

  @override
  String get profileHelp => 'Help';

  @override
  String get profileSettings => 'Settings';

  @override
  String profileHello(String name) {
    return 'Hi, $name';
  }

  @override
  String get profileActiveOrders => 'Active';

  @override
  String get profileGuestTitle => 'Your HOO account';

  @override
  String get profileGuestBody =>
      'Track orders, save designs and keep your wishlist on any device.';

  @override
  String get profilePasswordChanged => 'Password changed';

  @override
  String get profileCurrentPassword => 'Current password';

  @override
  String get profilePasswordOtherDevices =>
      'You’ll be signed out on your other devices.';

  @override
  String get profileAddAddress => 'Add address';

  @override
  String get profileEditAddress => 'Edit address';

  @override
  String get profileNoAddresses => 'No saved addresses';

  @override
  String get profileDefault => 'Default';

  @override
  String get profileDeleteAddress => 'Delete this address?';

  @override
  String get profileAddressLabel => 'Label';

  @override
  String get profileAddressLabelHint => 'Home, Work…';

  @override
  String get profileMakeDefault => 'Make default';

  @override
  String get profileNoCards => 'No saved cards';

  @override
  String get profileNoCardsBody => 'Choose “Save this card” when you pay.';

  @override
  String get profileDeleteCard => 'Remove this card?';

  @override
  String profileDeviceApp(String platform) {
    return 'HOO app · $platform';
  }

  @override
  String get profileDeviceUnknown => 'Unknown device';

  @override
  String get profileThisDevice => 'This device';

  @override
  String profileLastSeen(String time) {
    return 'Last active $time';
  }

  @override
  String get profileRequiredNotification => 'Required for your orders';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileAppearance => 'Appearance';

  @override
  String get profileThemeSystem => 'System';

  @override
  String get profileThemeLight => 'Light';

  @override
  String get profileThemeDark => 'Dark';

  @override
  String get profileContactUs => 'Contact us';

  @override
  String get profileFaq => 'FAQ';

  @override
  String get profileFaqDeliveryQ => 'How long does delivery take?';

  @override
  String get profileFaqDeliveryA =>
      'In Baku a courier usually takes 1–2 days, in the time window you choose. Regions by post take 3–5 days.';

  @override
  String get profileFaqReturnsQ => 'How do I return an item?';

  @override
  String get profileFaqReturnsA =>
      'Open the order and choose “Return / exchange”. Custom Studio pieces can’t be returned.';

  @override
  String get profileFaqStudioQ => 'When is a Studio order ready?';

  @override
  String get profileFaqStudioA =>
      'Our team reviews the design, then it goes into production. The lead time is shown when you order; rush production is available.';

  @override
  String get profileFaqPaymentQ => 'Which payment methods do you accept?';

  @override
  String get profileFaqPaymentA =>
      'Apple Pay, Google Pay, card, and cash on delivery (up to a limit).';

  @override
  String get profileSizeGuideBody =>
      'Every product page has a size chart. Fill in your style profile and we’ll recommend your size.';

  @override
  String get profileAbout => 'About HOO';

  @override
  String get profileAboutBody =>
      'HOO is a premium streetwear brand from Baku. Heavy cotton, precise cuts, few colors — and a 3D Studio to create your own.';

  @override
  String get profileStyleIntro =>
      'Share your measurements and we’ll recommend sizes and sort products to your taste.';

  @override
  String get profileMeasurements => 'Measurements';

  @override
  String get profileHeight => 'Height';

  @override
  String get profileWeight => 'Weight';

  @override
  String get profileWaist => 'Waist';

  @override
  String get profileUsualSize => 'Usual size';

  @override
  String get profilePreferredFit => 'Preferred fit';

  @override
  String get profileFavoriteColors => 'Favourite colours';

  @override
  String get profileUpToThree => 'Up to 3';

  @override
  String get profileStyles => 'Style';

  @override
  String get searchHint => 'Hoodies, tees, colors…';

  @override
  String get searchRecent => 'Recent searches';

  @override
  String get searchSuggestions => 'Suggestions';

  @override
  String searchResults(int count, String query) {
    return '$count results for “$query”';
  }

  @override
  String searchNoResultsTitle(String query) {
    return 'No results for “$query”';
  }

  @override
  String get searchNoResultsBody =>
      'Try another word or browse the bestsellers.';

  @override
  String get searchDesignYourOwnTitle => 'Didn’t find it? Design it yourself';

  @override
  String get searchDesignYourOwnBody =>
      'In the 3D Studio, with the color and print you want.';

  @override
  String get studioModelFallback =>
      'The 3D model didn’t load — showing a simple shape.';

  @override
  String studioTooManyLayers(int max) {
    return 'You can add up to $max layers';
  }

  @override
  String studioUploadTooLarge(int mb) {
    return 'The file is too large (max $mb MB)';
  }

  @override
  String get studioUndo => 'Undo';

  @override
  String get studioRedo => 'Redo';

  @override
  String get studioSavedOffline => 'Saved offline';

  @override
  String get studioSaveFailed => 'Not saved';

  @override
  String get studioFront => 'Front';

  @override
  String get studioBack => 'Back';

  @override
  String get studioLeftSleeve => 'Left sleeve';

  @override
  String get studioRightSleeve => 'Right sleeve';

  @override
  String get studioHood => 'Hood';

  @override
  String get studioFreeSpot => 'Free spot';

  @override
  String get studioStepProduct => 'Product';

  @override
  String get studioStepFabric => 'Fabric & features';

  @override
  String get studioStepFit => 'Size & fit';

  @override
  String get studioStepColor => 'Color';

  @override
  String get studioStepEditor => 'Design';

  @override
  String get studioStepReview => 'Review';

  @override
  String get studioCustomSize => 'Custom';

  @override
  String studioLeadTime(int min, int max) {
    return '$min–$max days to make';
  }

  @override
  String get studioReview => 'Review';

  @override
  String get studioSetupFee => 'Setup';

  @override
  String get studioRushFee => 'Rush production';

  @override
  String studioVolumeDiscount(int percent) {
    return 'Volume discount −$percent%';
  }

  @override
  String get studioIncluded => 'Included';

  @override
  String get studioChooseProduct => 'What are we designing?';

  @override
  String studioFromPrice(String price) {
    return 'from $price';
  }

  @override
  String get studioFabric => 'Fabric';

  @override
  String studioGsm(int gsm) {
    return '$gsm gsm';
  }

  @override
  String get studioFeatures => 'Features';

  @override
  String get studioFit => 'Fit';

  @override
  String get studioCustomMeasurements => 'Custom measurements';

  @override
  String get studioColor => 'Color';

  @override
  String get studioSpotPicked => 'The next layer goes where you tapped';

  @override
  String get studioAddText => 'Text';

  @override
  String get studioAddImage => 'Image';

  @override
  String studioLayers(int count, int max) {
    return 'Layers · $count/$max';
  }

  @override
  String get studioNoLayers =>
      'Add text or an image — or tap the garment to pick a spot.';

  @override
  String studioUploadHint(int mb, int dpi) {
    return 'PNG or JPG up to $mb MB. $dpi DPI for the best print.';
  }

  @override
  String get studioFromGallery => 'From gallery';

  @override
  String get studioFromCamera => 'Take a photo';

  @override
  String get studioImageLayer => 'Image';

  @override
  String get studioShowLayer => 'Show';

  @override
  String get studioHideLayer => 'Hide';

  @override
  String get studioTextLayer => 'Text';

  @override
  String get studioCenter => 'Center';

  @override
  String get studioDuplicate => 'Duplicate';

  @override
  String get studioSize => 'Size';

  @override
  String get studioRotation => 'Rotate';

  @override
  String studioQualityPoor(int dpi) {
    return 'Low print quality ($dpi DPI) — make it smaller or upload a larger file';
  }

  @override
  String studioQualityWarning(int dpi) {
    return 'Fair print quality ($dpi DPI)';
  }

  @override
  String studioQualityOk(int dpi) {
    return 'Good print quality ($dpi DPI)';
  }

  @override
  String get studioEditText => 'Edit text';

  @override
  String get studioFont => 'Font';

  @override
  String studioTextSize(int pt) {
    return 'Size · $pt pt';
  }

  @override
  String get studioLayersShort => 'Layers';

  @override
  String get studioQuantity => 'Quantity';

  @override
  String studioVolumeTier(int min, int percent) {
    return '$min+: −$percent%';
  }

  @override
  String get studioRush => 'Rush production';

  @override
  String studioRushHint(String fee, int days) {
    return '+$fee · $days days faster';
  }

  @override
  String get studioImageRights => 'I own the rights to these images';

  @override
  String get studioAddSomething => 'Add at least one text or image to order.';

  @override
  String get studioSaveDesign => 'Save design';

  @override
  String get studioDesignSaved => 'Design saved';

  @override
  String get studioBackToEditor => 'Back to design';

  @override
  String get studioIntro =>
      'Pick fabric, fit and colour, add text and images — and see the price of every change instantly.';

  @override
  String get studioStart => 'Start designing';

  @override
  String get studioContinueDraft => 'Continue your last design';

  @override
  String get studioHowItWorks => 'How it works';

  @override
  String get studioHowPick => 'Pick the garment, fabric and colour';

  @override
  String get studioHowDesign => 'Place text and images in 3D';

  @override
  String get studioHowOrder => 'Order — we review and make it';

  @override
  String get studioUntitled => 'Untitled design';

  @override
  String get studioNoDesigns => 'No designs yet';

  @override
  String get studioNoDesignsBody =>
      'What you create in the Studio is saved here.';

  @override
  String get studioResubmit => 'Resubmit';

  @override
  String get studioResubmitted => 'Design sent for review again';

  @override
  String get studioDeleteConfirm => 'Delete this design?';

  @override
  String get studioSharedTitle => 'Shared design';

  @override
  String get studioDesignYourOwn => 'Design your own';

  @override
  String get wishlistSignInReason =>
      'Sign in to save favourites and see them on any device.';

  @override
  String get wishlistTitle => 'Wishlist';

  @override
  String get wishlistShareSubject => 'My HOO wishlist';

  @override
  String get wishlistEmptyTitle => 'Nothing saved yet';

  @override
  String get wishlistEmptyBody => 'Tap ♡ on any product to keep it here.';

  @override
  String get wishlistChooseSize => 'Choose size';

  @override
  String get wishlistNotifyMe => 'Notify me';

  @override
  String wishlistSharedTitle(String name) {
    return '$name’s wishlist';
  }

  @override
  String get wishlistAlertsTitle => 'Alerts';

  @override
  String get wishlistAlertsEmptyTitle => 'No active alerts';

  @override
  String get wishlistAlertsEmptyBody =>
      'Use “Notify me” or “Price drop alert” on a product page.';

  @override
  String get wishlistAlertBackInStock => 'Back in stock';

  @override
  String get wishlistAlertPriceDrop => 'Price drop';

  @override
  String wishlistAlertNotified(String date) {
    return 'Notified $date';
  }
}
