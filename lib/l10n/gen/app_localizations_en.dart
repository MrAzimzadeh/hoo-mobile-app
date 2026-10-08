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
}
