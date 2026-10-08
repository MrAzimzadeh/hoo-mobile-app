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
  String get authWelcomeTitle => 'Welcome to HOO';

  @override
  String get authWelcomeBody =>
      'Premium streetwear from Baku. Sign in or keep browsing as a guest.';

  @override
  String get authWelcomeGuest => 'Continue as guest';

  @override
  String get authSignInTitle => 'Sign in';

  @override
  String get authSignInSubtitle => 'Use your email or phone number.';

  @override
  String get authIdentifierLabel => 'Email or phone';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordHint =>
      'At least 8 characters with a digit and a symbol';

  @override
  String get authForgotLink => 'Forgot password?';

  @override
  String get authSignInSubmit => 'Sign in';

  @override
  String get authSignInWithSms => 'Sign in with an SMS code';

  @override
  String get authOr => 'or';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authContinueWithApple => 'Continue with Apple';

  @override
  String get authSocialFailed => 'Sign-in did not complete. Please try again.';

  @override
  String get authTermsPromptTitle => 'Create your HOO account';

  @override
  String get authTermsPromptBody =>
      'There is no HOO account for this identity yet. By continuing you accept the Terms and Privacy Policy.';

  @override
  String get authTermsPromptAccept => 'Accept and continue';

  @override
  String get authNoAccount => 'New to HOO?';

  @override
  String get authHaveAccount => 'Already have an account?';

  @override
  String get authCreateAccount => 'Create account';

  @override
  String get authSignUpTitle => 'Create your account';

  @override
  String get authSignUpSubtitle =>
      'Track orders, save favorites and keep your designs.';

  @override
  String get authFullNameLabel => 'Full name';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPhoneLabel => 'Phone';

  @override
  String get authAcceptTerms => 'I accept the Terms and Privacy Policy';

  @override
  String get authMarketingConsent => 'Send me news and offers';

  @override
  String get authErrRequired => 'This field is required';

  @override
  String get authErrInvalidEmail => 'Enter a valid email address';

  @override
  String get authErrInvalidPhone => 'Enter a valid phone number';

  @override
  String get authErrInvalidIdentifier => 'Enter a valid email or phone';

  @override
  String get authErrWeakPassword =>
      'Use 8+ characters with a digit and a symbol';

  @override
  String get authErrTerms => 'Accept the terms to continue';

  @override
  String get authErrInvalidCode => 'The code is not valid';

  @override
  String get authOtpPhoneTitle => 'Sign in with your phone';

  @override
  String get authOtpPhoneBody => 'We will send a 6-digit code to your number.';

  @override
  String get authOtpNewAccount =>
      'No account for this number yet. Add your name and accept the terms.';

  @override
  String get authOtpSendSms => 'Send code by SMS';

  @override
  String get authOtpSendWhatsapp => 'Send via WhatsApp';

  @override
  String get authOtpCodeTitle => 'Enter the code';

  @override
  String authOtpCodeBody(String phone) {
    return 'Sent to $phone';
  }

  @override
  String authOtpResendIn(int seconds) {
    return 'Resend in $seconds s';
  }

  @override
  String get authOtpResendSms => 'Resend by SMS';

  @override
  String get authOtpResendWhatsapp => 'Resend on WhatsApp';

  @override
  String get authOtpResent => 'Code sent again';

  @override
  String get authOtpChangePhone => 'Change number';

  @override
  String get authForgotTitle => 'Reset your password';

  @override
  String get authForgotBody =>
      'Enter your email or phone and we will send reset instructions.';

  @override
  String get authForgotSubmit => 'Send instructions';

  @override
  String get authForgotSentEmail =>
      'If an account exists, we emailed you a reset link.';

  @override
  String get authForgotSentPhone =>
      'If an account exists, we sent a code to your phone.';

  @override
  String get authResetEnterCode => 'Enter the code';

  @override
  String get authResetTitle => 'Set a new password';

  @override
  String get authResetCodeLabel => 'Code';

  @override
  String get authResetNewPassword => 'New password';

  @override
  String get authResetSubmit => 'Update password';

  @override
  String get authResetDone =>
      'Password updated. Sign in with your new password.';

  @override
  String get cartTitle => 'Bag';

  @override
  String get cartEmptyTitle => 'Your bag is empty';

  @override
  String get cartEmptyMessage =>
      'Add pieces you love or create your own design in the Studio.';

  @override
  String get cartEmptyCta => 'Start shopping';

  @override
  String get cartBestsellersTitle => 'Bestsellers';

  @override
  String get cartCompleteTheLookTitle => 'Complete the look';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'Add $amount more for free delivery';
  }

  @override
  String get cartFreeDeliveryQualified => 'Nice! Your delivery is free';

  @override
  String get cartPromoTitle => 'Promo code';

  @override
  String get cartPromoHint => 'Enter code';

  @override
  String cartPromoApplied(String code) {
    return 'Code $code applied';
  }

  @override
  String get cartPromoRemoveA11y => 'Remove promo code';

  @override
  String get cartGiftTitle => 'This is a gift';

  @override
  String get cartGiftSubtitle =>
      'Choose packaging, card and message at checkout';

  @override
  String get cartSummaryTitle => 'Summary';

  @override
  String get cartDeliveryAtCheckout => 'Calculated at checkout';

  @override
  String get cartCheckout => 'Checkout';

  @override
  String cartRemoved(String name) {
    return '$name removed from your bag';
  }

  @override
  String get cartUndo => 'Undo';

  @override
  String cartRemoveA11y(String name) {
    return 'Remove $name';
  }

  @override
  String get cartCustomDesign => 'Custom design';

  @override
  String cartLeadTime(int days) {
    return 'Made in $days days';
  }

  @override
  String cartStockLeft(int count) {
    return 'Only $count left';
  }

  @override
  String cartSize(String size) {
    return 'Size $size';
  }

  @override
  String cartUnitPrice(int quantity, String price) {
    return '$quantity × $price';
  }

  @override
  String get cartFixErrors =>
      'Some items need attention — fix or remove them before checkout.';

  @override
  String get cartAddedTitle => 'Added to bag';

  @override
  String get cartViewBag => 'View bag';

  @override
  String get cartContinueShopping => 'Continue shopping';

  @override
  String cartSubtotalWithCount(int count) {
    return 'Subtotal · $count pcs';
  }

  @override
  String get catalogSortNewest => 'Newest';

  @override
  String get catalogSortPriceAsc => 'Price: low to high';

  @override
  String get catalogSortPriceDesc => 'Price: high to low';

  @override
  String get catalogSortPopular => 'Popular';

  @override
  String get catalogFilterTitle => 'Filter & sort';

  @override
  String get catalogFilterSort => 'Sort by';

  @override
  String get catalogFilterCategory => 'Category';

  @override
  String get catalogFilterCollection => 'Collection';

  @override
  String get catalogFilterSize => 'Size';

  @override
  String get catalogFilterColor => 'Color';

  @override
  String get catalogFilterFit => 'Fit';

  @override
  String get catalogFilterPrice => 'Price';

  @override
  String get catalogFilterAvailability => 'Availability';

  @override
  String get catalogFilterInStockOnly => 'In stock only';

  @override
  String get catalogTabAll => 'All';

  @override
  String get catalogTabNew => 'New';

  @override
  String get catalogTabSale => 'Sale';

  @override
  String get catalogEmptyTitle => 'No products found';

  @override
  String get catalogEmptyMessage => 'Try changing or clearing the filters.';

  @override
  String catalogResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count products',
      one: '1 product',
    );
    return '$_temp0';
  }

  @override
  String get catalogGallery3d => '3D';

  @override
  String get catalogGalleryPhotos => 'Photos';

  @override
  String get catalogColor => 'Color';

  @override
  String get catalogSize => 'Size';

  @override
  String get catalogSizeGuide => 'Size guide';

  @override
  String get catalogSizeLabel => 'Size';

  @override
  String get catalogChest => 'Chest';

  @override
  String get catalogLength => 'Length';

  @override
  String get catalogSleeve => 'Sleeve';

  @override
  String get catalogUnitCm => 'cm';

  @override
  String get catalogUnitIn => 'in';

  @override
  String get catalogSizeUnavailable => 'This size is currently unavailable';

  @override
  String catalogOnlyLeft(int count, String size) {
    return 'Only $count left in $size';
  }

  @override
  String get catalogPreorderNote =>
      'Pre-order: delivery may take a little longer.';

  @override
  String catalogRecommendedSize(String size) {
    return 'We recommend $size';
  }

  @override
  String get catalogColorSoldOut => 'This color is sold out right now.';

  @override
  String get catalogSizeSoldOutHint =>
      'Some sizes are sold out. We can tell you when they are back.';

  @override
  String get catalogNotifyMe => 'Notify me';

  @override
  String get catalogPriceDropAlert => 'Alert me on price drop';

  @override
  String get catalogPriceDropAlertSet =>
      'We will tell you when the price drops.';

  @override
  String get catalogBackInStockAlertSet => 'We will tell you when it is back.';

  @override
  String get catalogAlertSignIn => 'Sign in to set up alerts.';

  @override
  String catalogDeliveryPromise(int hours, int minutes, String date) {
    return 'Order within $hours h $minutes min — delivered $date';
  }

  @override
  String get catalogCustomize => 'Customize this';

  @override
  String get catalogDescription => 'Description';

  @override
  String get catalogSizeAndFit => 'Size & fit';

  @override
  String get catalogFabricAndCare => 'Fabric & care';

  @override
  String get catalogReviews => 'Reviews';

  @override
  String catalogReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String get catalogCompleteTheLook => 'Complete the look';

  @override
  String get catalogYouMayAlsoLike => 'You may also like';

  @override
  String get catalogAddToBag => 'Add to bag';

  @override
  String get catalogSelectSize => 'Select a size';

  @override
  String get catalogSoldOut => 'Sold out';

  @override
  String get catalogPreorder => 'Pre-order';

  @override
  String get catalogWriteReview => 'Write a review';

  @override
  String get catalogReviewSignIn => 'Sign in to write a review.';

  @override
  String get catalogNoReviewsTitle => 'No reviews yet';

  @override
  String get catalogNoReviewsMessage =>
      'Once your order is delivered you can write the first one.';

  @override
  String get catalogYourRating => 'Your rating';

  @override
  String get catalogRatingRequired => 'Choose a rating';

  @override
  String get catalogReviewTitle => 'Title';

  @override
  String get catalogReviewBody => 'Your review';

  @override
  String catalogReviewBodyShort(int min) {
    return 'Write at least $min characters';
  }

  @override
  String get catalogReviewModeration =>
      'Reviews are published after moderation.';

  @override
  String get catalogReviewSubmit => 'Submit review';

  @override
  String get catalogReviewThanks =>
      'Thank you! Your review is waiting for moderation.';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutContactTitle => 'Contact';

  @override
  String get checkoutContactSubtitle =>
      'We will use this to reach you about your order.';

  @override
  String get checkoutFullName => 'Full name';

  @override
  String get checkoutPhone => 'Phone';

  @override
  String get checkoutEmail => 'Email';

  @override
  String get checkoutEmailHelper => 'Your receipt is sent here';

  @override
  String get checkoutGiftTitle => 'Gift';

  @override
  String get checkoutGiftToggle => 'This is a gift';

  @override
  String get checkoutGiftToggleSubtitle =>
      'Wrapping, a greeting card and hidden prices.';

  @override
  String get checkoutNoGift => 'Not a gift';

  @override
  String checkoutGiftFor(String name) {
    return 'Gift for $name';
  }

  @override
  String get checkoutRecipientName => 'Recipient name';

  @override
  String get checkoutRecipientPhone => 'Recipient phone';

  @override
  String get checkoutOccasion => 'Occasion';

  @override
  String get checkoutSurprise => 'Keep it a surprise';

  @override
  String get checkoutSurpriseHint =>
      'Do not tell the recipient about the order.';

  @override
  String get checkoutHidePrices => 'Hide prices';

  @override
  String get checkoutPackaging => 'Packaging';

  @override
  String get checkoutLowStock => 'Few left';

  @override
  String get checkoutGreetingCard => 'Greeting card';

  @override
  String get checkoutCardMessage => 'Card message';

  @override
  String checkoutMessageCounter(int count, int max) {
    return '$count / $max';
  }

  @override
  String get checkoutFromName => 'Signed by';

  @override
  String get checkoutDeliveryTitle => 'Delivery';

  @override
  String get checkoutDeliveryGiftNote =>
      'For a gift, enter the recipient\'s address.';

  @override
  String checkoutEtaDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String checkoutEtaRange(int min, int max) {
    return '$min–$max days';
  }

  @override
  String checkoutReadyIn(int hours) {
    return 'Ready in $hours h';
  }

  @override
  String get checkoutAddressTitle => 'Delivery address';

  @override
  String get checkoutNewAddress => 'New address';

  @override
  String get checkoutCity => 'City';

  @override
  String get checkoutDistrict => 'District';

  @override
  String get checkoutStreet => 'Street and number';

  @override
  String get checkoutApartment => 'Apartment';

  @override
  String get checkoutCourierNote => 'Note for the courier';

  @override
  String get checkoutSlotTitle => 'Delivery time';

  @override
  String get checkoutSlotSubtitle => 'Pick the day and window that suits you.';

  @override
  String checkoutSlotsLeft(int count) {
    return '$count left';
  }

  @override
  String get checkoutSlotFull => 'Full';

  @override
  String get checkoutNoSlots => 'No delivery slots available right now';

  @override
  String get checkoutPaymentTitle => 'Payment';

  @override
  String get checkoutReviewTitle => 'Review';

  @override
  String get checkoutAcceptTerms =>
      'I accept the Terms, Privacy and Returns policy';

  @override
  String get checkoutImageRights =>
      'I confirm I have the rights to the images I uploaded';

  @override
  String get checkoutSaveCard => 'Save this card for next time';

  @override
  String get checkoutPayNow => 'Pay now';

  @override
  String get checkoutPlaceOrder => 'Place order';

  @override
  String get checkoutPlacing => 'Placing your order…';

  @override
  String get checkoutPlacingHint => 'This can take a few seconds.';

  @override
  String get checkoutSessionRefreshed =>
      'Your session was refreshed; your choices are kept.';

  @override
  String get checkoutPaymentWaitingTitle => 'Confirming your payment';

  @override
  String checkoutPaymentWaitingBody(String number) {
    return 'Finish paying for order $number. We check the result automatically.';
  }

  @override
  String get checkoutPaymentStillProcessing =>
      'The payment is not confirmed yet. Check again in a moment.';

  @override
  String get checkoutPaymentCheckNow => 'Check now';

  @override
  String get checkoutPaymentReopen => 'Reopen payment page';

  @override
  String get checkoutPaymentFailedTitle => 'Payment did not go through';

  @override
  String get checkoutPaymentFailedBody =>
      'You were not charged. You can try again.';

  @override
  String get checkoutPaymentTryAgain => 'Try again';

  @override
  String get checkoutPayOnDelivery => 'Pay on delivery';

  @override
  String get checkoutViewOrder => 'View order';

  @override
  String get checkoutConfirmedTitle => 'Thank you!';

  @override
  String checkoutConfirmedNumber(String number) {
    return 'Order $number';
  }

  @override
  String get checkoutConfirmedBody =>
      'Your order is in. Follow every step on the order page.';

  @override
  String get checkoutGiftReceipt => 'Gift receipt code';

  @override
  String get checkoutGiftReceiptHint =>
      'The recipient can use it to exchange the gift.';

  @override
  String get homeHeroTitle => 'The new drop is here';

  @override
  String get homeHeroCta => 'Shop new arrivals';

  @override
  String get homeDesignTitle => 'Design your own';

  @override
  String get homeDesignBody =>
      'Pick a garment, add text and art, see it in 3D.';

  @override
  String get homeNewArrivals => 'New arrivals';

  @override
  String get homeCategories => 'Categories';

  @override
  String get homeCollections => 'Collections';

  @override
  String get homeShopTheLook => 'Shop the look';

  @override
  String get homeBestsellers => 'Bestsellers';

  @override
  String get homeRecentlyViewed => 'Recently viewed';

  @override
  String get homeEmptyTitle => 'New pieces are coming soon';

  @override
  String get homeEmptyMessage => 'Check back in a little while.';

  @override
  String get launchComingSoonEyebrow => 'Coming soon';

  @override
  String launchComingSoonOpensOn(String date) {
    return 'Opening $date';
  }

  @override
  String get launchComingSoonFallbackTitle => 'The new HOO is on its way';

  @override
  String get launchComingSoonFallbackSubtitle =>
      'Premium streetwear made in Baku. Be the first to know when we open.';

  @override
  String get launchCountdownDays => 'days';

  @override
  String get launchCountdownHours => 'hours';

  @override
  String get launchCountdownMinutes => 'min';

  @override
  String get launchCountdownSeconds => 'sec';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return '$days days, $hours hours, $minutes minutes until launch';
  }

  @override
  String get launchWaitlistTitle => 'Join the waitlist';

  @override
  String get launchWaitlistBody =>
      'Hear first on launch day and get early access.';

  @override
  String get launchWaitlistField => 'Email or phone';

  @override
  String get launchWaitlistJoin => 'Join';

  @override
  String launchWaitlistJoined(int position, int total) {
    return 'You are #$position of $total';
  }

  @override
  String launchWaitlistAlready(int position, int total) {
    return 'You’re already on the list: #$position of $total';
  }

  @override
  String launchWaitlistCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString people are already waiting',
      one: '1 person is already waiting',
    );
    return '$_temp0';
  }

  @override
  String launchWaitlistToday(int count) {
    return '+$count today';
  }

  @override
  String get launchNewsletterTitle => 'Newsletter';

  @override
  String get launchNewsletterBody =>
      'New drops, collections and offers — straight to your inbox.';

  @override
  String get launchNewsletterField => 'Email';

  @override
  String get launchNewsletterSubscribe => 'Subscribe';

  @override
  String get launchNewsletterDone => 'You’re subscribed. Thank you!';

  @override
  String get launchNewsletterAlready => 'This email is already subscribed.';

  @override
  String get launchFollow => 'Follow HOO';

  @override
  String launchOpenLink(String name) {
    return 'Open $name';
  }

  @override
  String get launchCannotOpenLink => 'Couldn’t open the link.';

  @override
  String get launchContactEmail => 'Email';

  @override
  String get launchContactPhone => 'Phone';

  @override
  String get launchStaffSignIn => 'Staff sign in';

  @override
  String get launchStaffNoAccess => 'This account doesn’t have staff access.';

  @override
  String get launchStoreOpenTitle => 'The store is open';

  @override
  String get launchEnterStore => 'Enter the store';

  @override
  String launchRetryIn(String time) {
    return 'Try again in $time';
  }

  @override
  String get launchLanguage => 'Language';

  @override
  String get launchOnboardingLanguageTitle => 'Choose your language';

  @override
  String get launchOnboardingLanguageBody =>
      'You can change it anytime in Settings.';

  @override
  String get launchOnboardingSkip => 'Skip';

  @override
  String get launchOnboardingStart => 'Get started';

  @override
  String get launchOnboardingSlide1Eyebrow => 'From Baku';

  @override
  String get launchOnboardingSlide1Title => 'Calm. Confident. HOO.';

  @override
  String get launchOnboardingSlide1Body =>
      'Hoodies, tees and sweats — premium fabrics, minimal design, made in Baku.';

  @override
  String get launchOnboardingSlide2Eyebrow => 'Studio';

  @override
  String get launchOnboardingSlide2Title => 'Design your own';

  @override
  String get launchOnboardingSlide2Body =>
      'Pick a garment and color, add text and images, see it in 3D — priced instantly.';

  @override
  String get launchOnboardingSlide3Eyebrow => 'Delivery';

  @override
  String get launchOnboardingSlide3Title => 'Fast delivery in Baku';

  @override
  String get launchOnboardingSlide3Body =>
      'A courier in the time slot you choose. Follow your order every step of the way.';

  @override
  String get ordersTitle => 'My orders';

  @override
  String get ordersEmptyTitle => 'No orders yet';

  @override
  String get ordersEmptyMessage => 'Your first order will show up here.';

  @override
  String get ordersNoMatch => 'No orders match this filter';

  @override
  String get ordersFilterAll => 'All';

  @override
  String get ordersFilterActive => 'Active';

  @override
  String get ordersFilterDelivered => 'Delivered';

  @override
  String get ordersFilterClosed => 'Closed';

  @override
  String get ordersMyReturns => 'My returns';

  @override
  String get ordersTimeline => 'Order history';

  @override
  String get ordersItems => 'Items';

  @override
  String get ordersCustomDesign => 'Custom design';

  @override
  String get ordersNonReturnable => 'Non-returnable';

  @override
  String get ordersRefresh => 'Refresh';

  @override
  String get ordersRecipientView =>
      'You are viewing this as the gift recipient.';

  @override
  String get ordersPayPrompt => 'This order is not paid yet.';

  @override
  String get ordersPayAgain => 'Pay again';

  @override
  String get ordersPaymentSucceeded => 'Payment completed';

  @override
  String get ordersChangeSlot => 'Change delivery time';

  @override
  String get ordersSlotChanged => 'Delivery time updated';

  @override
  String get ordersSlotCurrent => 'Current';

  @override
  String get ordersSlotUnavailable =>
      'The delivery time can no longer be changed';

  @override
  String ordersCourier(String name) {
    return 'Courier: $name';
  }

  @override
  String ordersCourierEta(int minutes) {
    return 'about $minutes min';
  }

  @override
  String ordersCourierStops(int count) {
    return '$count stops away';
  }

  @override
  String get ordersContactWhatsApp => 'Message us on WhatsApp';

  @override
  String get ordersRequestReturn => 'Return or exchange';

  @override
  String get ordersEventPlaced => 'Order placed';

  @override
  String get ordersEventPaymentCaptured => 'Payment received';

  @override
  String get ordersEventPaymentFailed => 'Payment failed';

  @override
  String get ordersEventCourierAssigned => 'Courier assigned';

  @override
  String get ordersEventCourierEta => 'Delivery estimate updated';

  @override
  String get ordersEventSlotChanged => 'Delivery time changed';

  @override
  String get ordersEventRefund => 'Refund issued';

  @override
  String get ordersEventReturnRequested => 'Return requested';

  @override
  String get ordersEventReturnUpdated => 'Return updated';

  @override
  String get ordersEventDesignApproved => 'Design approved';

  @override
  String get ordersReturnsTitle => 'Returns';

  @override
  String get ordersReturnsEmptyTitle => 'No returns';

  @override
  String get ordersReturnsEmptyMessage =>
      'Your return and exchange requests appear here.';

  @override
  String get ordersReturnKindReturn => 'Return';

  @override
  String get ordersReturnKindExchange => 'Exchange';

  @override
  String get ordersReturnPick => 'Choose items';

  @override
  String get ordersReturnNewSize => 'New size';

  @override
  String get ordersReturnReason => 'Reason';

  @override
  String get ordersReturnSubmit => 'Send request';

  @override
  String get ordersReturnNoItems => 'Choose at least one item';

  @override
  String get ordersReturnSizeMissing => 'Choose a new size for each exchange';

  @override
  String get ordersReturnSameSize =>
      'The new size must differ from the current one';

  @override
  String get ordersReturnReasonLong => 'The reason is too long';

  @override
  String get ordersReturnNotAvailable =>
      'Returns are not available for this order';

  @override
  String get ordersReturnNotAvailableHint =>
      'The return window is over or the items cannot be returned.';

  @override
  String get ordersReturnSent => 'Request sent';

  @override
  String get ordersReturnSentBody => 'Follow its status under Returns.';

  @override
  String get ordersTrackTitle => 'Track an order';

  @override
  String get ordersTrackSubtitle =>
      'Enter the order number and the phone you used when ordering.';

  @override
  String get ordersOrderNumber => 'Order number';

  @override
  String get ordersTrackCta => 'Track';

  @override
  String get ordersGiftSubtitle =>
      'Enter the gift receipt code and your phone number.';

  @override
  String get ordersGiftCode => 'Receipt code';

  @override
  String get ordersGiftOpen => 'Open gift';

  @override
  String ordersGiftFor(String name) {
    return 'A gift for $name';
  }

  @override
  String ordersGiftFrom(String name) {
    return 'From $name';
  }

  @override
  String get ordersGiftExchange => 'Exchange size';

  @override
  String get ordersGiftExchangeClosed =>
      'The exchange period for this gift has ended.';

  @override
  String ordersGiftExchangeUntil(String date) {
    return 'Exchange until $date';
  }

  @override
  String get profileSignedOutTitle => 'Sign in to your account';

  @override
  String get profileSignedOutBody =>
      'Keep orders, favorites and designs in one place.';

  @override
  String profileGreeting(String name) {
    return 'Hi, $name';
  }

  @override
  String get profileTrackOrder => 'Track an order';

  @override
  String get profileOrders => 'Orders';

  @override
  String get profileDesigns => 'Designs';

  @override
  String get profileWishlist => 'Wishlist';

  @override
  String get profileGroupShopping => 'Shopping';

  @override
  String get profileGroupAccount => 'Account';

  @override
  String get profileGroupMore => 'More';

  @override
  String profileActiveOrders(int count) {
    return '$count active';
  }

  @override
  String get profilePersonalInfo => 'Personal info';

  @override
  String get profileAddresses => 'Addresses';

  @override
  String get profileSavedCards => 'Saved cards';

  @override
  String get profileStyleProfile => 'Style profile';

  @override
  String get profileStyleProfileHint => 'Make sizing easier';

  @override
  String get profileNotifications => 'Notifications';

  @override
  String get profileChangePassword => 'Change password';

  @override
  String get profileActiveDevices => 'Active devices';

  @override
  String get profileSettings => 'Settings';

  @override
  String get profileHelp => 'Help';

  @override
  String get profileSignOutTitle => 'Sign out?';

  @override
  String get profileSignOutMessage => 'Your bag stays on this device.';

  @override
  String get profileNameTooLong => 'The name is too long';

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
  String get profileCurrentPassword => 'Current password';

  @override
  String get profileConfirmPassword => 'Repeat new password';

  @override
  String get profilePasswordMismatch => 'Passwords do not match';

  @override
  String get profilePasswordChanged => 'Password changed';

  @override
  String get profileAddressesEmptyTitle => 'No saved addresses';

  @override
  String get profileAddressesEmptyMessage =>
      'Add an address to check out faster.';

  @override
  String get profileAddressAdd => 'Add address';

  @override
  String get profileAddressEdit => 'Edit address';

  @override
  String get profileAddressDeleteTitle => 'Delete this address?';

  @override
  String get profileAddressLabel => 'Label (e.g. Home)';

  @override
  String get profileBuilding => 'Building';

  @override
  String get profileDefault => 'Default';

  @override
  String get profileMakeDefault => 'Make default';

  @override
  String get profileFieldTooLong => 'Too long';

  @override
  String get profileCardsEmptyTitle => 'No saved cards';

  @override
  String get profileCardsEmptyMessage =>
      'Choose “Save this card” when you pay.';

  @override
  String get profileCardDeleteTitle => 'Remove this card?';

  @override
  String profileCardAdded(String date) {
    return 'Added $date';
  }

  @override
  String get profileThisDevice => 'This device';

  @override
  String get profileUnknownDevice => 'Unknown device';

  @override
  String get profileSignOutDevice => 'Sign out';

  @override
  String get profileSignOutOthers => 'Sign out of other devices';

  @override
  String get profileNotificationRequired => 'Required for your orders';

  @override
  String get profileStyleIntro =>
      'Optional. We use it to pre-select your size and tune recommendations.';

  @override
  String get profileStyleHeight => 'Height (cm)';

  @override
  String get profileStyleWeight => 'Weight (kg)';

  @override
  String get profileStyleChest => 'Chest (cm)';

  @override
  String get profileStyleWaist => 'Waist (cm)';

  @override
  String profileStyleRange(int min, int max) {
    return 'Between $min and $max';
  }

  @override
  String get profileStyleUsualSize => 'Your usual size';

  @override
  String get profileStyleFit => 'Preferred fit';

  @override
  String get profileStyleColors => 'Favorite colors';

  @override
  String profileStyleColorLimit(int count) {
    return 'You can pick up to $count colors';
  }

  @override
  String get profileStyleStyles => 'Style';

  @override
  String get profileStyleSkip => 'Skip';

  @override
  String get profileHelpContact => 'Contact us';

  @override
  String get profileHelpCall => 'Call us';

  @override
  String get profileHelpWhatsApp => 'Chat on WhatsApp';

  @override
  String get profileHelpEmail => 'Send an email';

  @override
  String get profileHelpFaq => 'Common questions';

  @override
  String get profileFaqDeliveryQ => 'How long does delivery take?';

  @override
  String get profileFaqDeliveryA =>
      'In Baku we deliver in the time slot you choose, usually the next day. Custom designs take a little longer to make.';

  @override
  String get profileFaqReturnsQ => 'Returns and exchanges';

  @override
  String get profileFaqReturnsA =>
      'Within the return window you can request a return or size exchange from the order page. Custom designs cannot be returned.';

  @override
  String get profileFaqPaymentQ => 'Which payment methods do you accept?';

  @override
  String get profileFaqPaymentA =>
      'Bank cards (3-D Secure), Apple Pay, Google Pay and cash on delivery in Baku.';

  @override
  String get profileFaqCustomQ => 'How do custom designs work?';

  @override
  String get profileFaqCustomA =>
      'Pick a garment in the Studio, add text and art, and see the price instantly. After you order, our team reviews and approves the design.';

  @override
  String get searchHint => 'Search hoodies, tees, designs…';

  @override
  String get searchClearA11y => 'Clear search';

  @override
  String get searchRecentTitle => 'Recent searches';

  @override
  String get searchBestsellersTitle => 'Bestsellers';

  @override
  String searchFor(String query) {
    return 'Search for “$query”';
  }

  @override
  String searchNoResultsTitle(String query) {
    return 'No results for “$query”';
  }

  @override
  String get searchNoResultsMessage =>
      'Check the spelling or try a shorter word.';

  @override
  String get searchMayLikeTitle => 'You may like';

  @override
  String searchResultsCount(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count results',
      one: '1 result',
    );
    return '$_temp0 for “$query”';
  }

  @override
  String searchFillA11y(String text) {
    return 'Fill search with “$text”';
  }

  @override
  String get searchDesignYourOwnTitle => 'Design your own';

  @override
  String get searchDesignYourOwnBody =>
      'Pick a garment in the Studio and add your text and art.';

  @override
  String get wishlistTitle => 'Wishlist';

  @override
  String get wishlistRemoved => 'Removed from wishlist';

  @override
  String get wishlistUndo => 'Undo';

  @override
  String get wishlistMovedToBag => 'Added to your bag';

  @override
  String get wishlistMoveToBag => 'Move to bag';

  @override
  String get wishlistSoldOut => 'Sold out';

  @override
  String get wishlistEmptyTitle => 'Your wishlist is empty';

  @override
  String get wishlistEmptyMessage =>
      'Tap the heart on pieces you love to save them here.';

  @override
  String get wishlistEmptyCta => 'Start shopping';

  @override
  String get wishlistChooseSize => 'Choose a size';

  @override
  String wishlistSharedTitle(String name) {
    return '$name\'s wishlist';
  }

  @override
  String get wishlistSharedEmpty => 'This wishlist is empty';

  @override
  String get wishlistAlertsTitle => 'Alerts';

  @override
  String get wishlistAlertsEmptyTitle => 'No alerts yet';

  @override
  String get wishlistAlertsEmptyMessage =>
      'Choose “Notify me” on a product page.';

  @override
  String get wishlistAlertsPriceDrop => 'When the price drops';

  @override
  String get wishlistAlertsBackInStock => 'When back in stock';

  @override
  String wishlistAlertsNotified(String date) {
    return 'Notified on $date';
  }

  @override
  String get wishlistAlertsWaiting => 'Waiting';
}
