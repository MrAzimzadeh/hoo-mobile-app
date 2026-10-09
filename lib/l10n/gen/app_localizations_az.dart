// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appName => 'HOO';

  @override
  String get navHome => 'Əsas';

  @override
  String get navShop => 'Mağaza';

  @override
  String get navStudio => 'Studio';

  @override
  String get navBag => 'Səbət';

  @override
  String get navProfile => 'Profil';

  @override
  String get commonRetry => 'Yenidən cəhd et';

  @override
  String get commonSeeAll => 'Hamısına bax';

  @override
  String get commonCancel => 'Ləğv et';

  @override
  String get commonSave => 'Yadda saxla';

  @override
  String get commonSaved => 'Saxlanıldı';

  @override
  String get commonSaving => 'Saxlanılır…';

  @override
  String get commonDone => 'Hazırdır';

  @override
  String get commonClose => 'Bağla';

  @override
  String get commonContinue => 'Davam et';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonNext => 'Növbəti';

  @override
  String get commonApply => 'Tətbiq et';

  @override
  String get commonClear => 'Təmizlə';

  @override
  String get commonClearAll => 'Hamısını təmizlə';

  @override
  String get commonRemove => 'Sil';

  @override
  String get commonEdit => 'Redaktə et';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonShare => 'Paylaş';

  @override
  String get commonConfirm => 'Təsdiqlə';

  @override
  String get commonYes => 'Bəli';

  @override
  String get commonNo => 'Xeyr';

  @override
  String get commonOk => 'Oldu';

  @override
  String get commonOptional => 'istəyə bağlı';

  @override
  String get commonSearch => 'Axtar';

  @override
  String get commonFilter => 'Filtr';

  @override
  String get commonSort => 'Sırala';

  @override
  String get commonShowMore => 'Daha çox';

  @override
  String get commonShowLess => 'Daha az';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonCopied => 'Kopyalandı';

  @override
  String get commonSignIn => 'Daxil ol';

  @override
  String get commonSignOut => 'Çıxış';

  @override
  String get commonCreateAccount => 'Hesab yarat';

  @override
  String get commonContinueAsGuest => 'Qonaq kimi davam et';

  @override
  String get commonLearnMore => 'Ətraflı';

  @override
  String get commonTotal => 'Cəmi';

  @override
  String get commonFree => 'Pulsuz';

  @override
  String commonDays(int min, int max) {
    return '$min–$max gün';
  }

  @override
  String commonPieces(int count) {
    return '$count ədəd';
  }

  @override
  String get errorGeneric => 'Nəsə alınmadı. Bir az sonra yenidən cəhd edin.';

  @override
  String get errorNetwork => 'İnternet bağlantısı yoxdur. Şəbəkəni yoxlayın.';

  @override
  String get errorNotFound => 'Tapılmadı';

  @override
  String errorTooManyRequests(int seconds) {
    return 'Çox cəhd edildi. $seconds saniyə sonra yenidən yoxlayın.';
  }

  @override
  String get errorExternal =>
      'Xidmət müvəqqəti əlçatan deyil. Bir az sonra yoxlayın.';

  @override
  String get errorConflict => 'Məlumat yeniləndi. Yeni vəziyyəti göstəririk.';

  @override
  String get errorSessionExpired =>
      'Sessiyanın vaxtı bitdi. Yenidən daxil olun.';

  @override
  String get fieldRequired => 'Bu sahə məcburidir';

  @override
  String get fieldInvalidEmail => 'E-poçt ünvanı düzgün deyil';

  @override
  String get fieldInvalidPhone =>
      'Nömrə +994 XX XXX XX XX formatında olmalıdır';

  @override
  String get fieldPasswordRule =>
      'Ən azı 8 simvol, bir rəqəm və bir xüsusi simvol';

  @override
  String get stateEmptyTitle => 'Burada hələ heç nə yoxdur';

  @override
  String get stateOffline => 'Oflayn rejim — son saxlanılan məlumat göstərilir';

  @override
  String get stateLoading => 'Yüklənir…';

  @override
  String get badgeNew => 'YENİ';

  @override
  String get badgeNewDrop => 'YENİ DROP';

  @override
  String get badgeBestseller => 'BESTSELLER';

  @override
  String get badgeSale => 'ENDİRİM';

  @override
  String discountPercent(int percent) {
    return '-$percent%';
  }

  @override
  String get a11yAddToWishlist => 'Bəyənilənlərə əlavə et';

  @override
  String get a11yRemoveFromWishlist => 'Bəyənilənlərdən çıxar';

  @override
  String get a11yIncrease => 'Artır';

  @override
  String get a11yDecrease => 'Azalt';

  @override
  String a11yQuantity(int count) {
    return 'Say: $count';
  }

  @override
  String a11yColor(String name) {
    return 'Rəng: $name';
  }

  @override
  String get a11ySelected => 'seçilib';

  @override
  String get a11yUnavailable => 'mövcud deyil';

  @override
  String a11yRating(String rating) {
    return 'Reytinq: 5-dən $rating';
  }

  @override
  String get a11yClose => 'Bağla';

  @override
  String get a11yBack => 'Geri';

  @override
  String a11yBag(int count) {
    return 'Səbət, $count məhsul';
  }

  @override
  String get a11yShowPassword => 'Şifrəni göstər';

  @override
  String get a11yHidePassword => 'Şifrəni gizlət';

  @override
  String get a11yLogo => 'HOO';

  @override
  String stepOf(int current, int total) {
    return 'Addım $current / $total';
  }

  @override
  String get summaryTotal => 'Cəmi';

  @override
  String get summarySubtotal => 'Ara cəm';

  @override
  String get summaryDiscount => 'Endirim';

  @override
  String get summaryDelivery => 'Çatdırılma';

  @override
  String get summaryGiftPackaging => 'Hədiyyə qablaşdırması';

  @override
  String get summaryGreetingCard => 'Təbrik kartı';

  @override
  String summaryVatIncluded(String amount) {
    return 'ƏDV daxildir: $amount';
  }

  @override
  String get summaryShowBreakdown => 'Təfərrüatı göstər';

  @override
  String get summaryUpdating => 'Qiymət yenilənir';

  @override
  String get authGateTitle => 'Davam etmək üçün daxil olun';

  @override
  String get authGateBody =>
      'Bəyənilənlər, rəylər, ünvanlar və dizaynlarınız hesabınızda saxlanılır.';

  @override
  String get orderStatusNew => 'Yeni';

  @override
  String get orderStatusPaid => 'Ödənilib';

  @override
  String get orderStatusAwaitingApproval => 'Dizayn təsdiqi gözlənilir';

  @override
  String get orderStatusInProduction => 'İstehsalda';

  @override
  String get orderStatusPacked => 'Qablaşdırılıb';

  @override
  String get orderStatusOutForDelivery => 'Yoldadır';

  @override
  String get orderStatusReadyForPickup => 'Götürməyə hazırdır';

  @override
  String get orderStatusDelivered => 'Çatdırılıb';

  @override
  String get orderStatusCancelled => 'Ləğv edilib';

  @override
  String get orderStatusReturnRequested => 'Qaytarma istənilib';

  @override
  String get orderStatusReturned => 'Qaytarılıb';

  @override
  String get orderStatusRefunded => 'Pul qaytarılıb';

  @override
  String get designStatusDraft => 'Qaralama';

  @override
  String get designStatusSubmitted => 'Göndərilib';

  @override
  String get designStatusChangesRequested => 'Dəyişiklik istənilib';

  @override
  String get designStatusApproved => 'Təsdiqlənib';

  @override
  String get designStatusInProduction => 'İstehsalda';

  @override
  String get designStatusReady => 'Hazırdır';

  @override
  String get designStatusCancelled => 'Ləğv edilib';

  @override
  String get paymentStatusPending => 'Gözləyir';

  @override
  String get paymentStatusCaptured => 'Ödənilib';

  @override
  String get paymentStatusFailed => 'Uğursuz';

  @override
  String get paymentStatusCancelled => 'Ləğv edilib';

  @override
  String get paymentStatusRefunded => 'Qaytarılıb';

  @override
  String get paymentStatusPartiallyRefunded => 'Qismən qaytarılıb';

  @override
  String get paymentMethodApplePay => 'Apple Pay';

  @override
  String get paymentMethodGooglePay => 'Google Pay';

  @override
  String get paymentMethodCard => 'Bank kartı';

  @override
  String get paymentMethodSavedCard => 'Saxlanılmış kart';

  @override
  String get paymentMethodCashOnDelivery => 'Qapıda nağd';

  @override
  String get paymentMethodCardOnDelivery => 'Qapıda kartla';

  @override
  String get paymentMethodInvoice => 'Hesab-faktura';

  @override
  String get deliveryKindCourier => 'Kuryer';

  @override
  String get deliveryKindPost => 'Poçt';

  @override
  String get deliveryKindPickup => 'Mağazadan götür';

  @override
  String get returnStatusRequested => 'Sorğu göndərilib';

  @override
  String get returnStatusApproved => 'Təsdiqlənib';

  @override
  String get returnStatusRejected => 'Rədd edilib';

  @override
  String get returnStatusReceived => 'Qəbul edilib';

  @override
  String get returnStatusRefunded => 'Pul qaytarılıb';

  @override
  String get returnStatusExchanged => 'Dəyişdirilib';

  @override
  String get returnKindReturn => 'Qaytarma';

  @override
  String get returnKindExchange => 'Dəyişmə';

  @override
  String get occasionBirthday => 'Ad günü';

  @override
  String get occasionAnniversary => 'İldönümü';

  @override
  String get occasionNovruz => 'Novruz';

  @override
  String get occasionNewYear => 'Yeni il';

  @override
  String get occasionJustBecause => 'Səbəbsiz';

  @override
  String get fitOversized => 'Oversized';

  @override
  String get fitBoxy => 'Boxy';

  @override
  String get fitRegular => 'Regular';

  @override
  String get fitFitted => 'Dar kəsim';

  @override
  String get fitCropped => 'Qısa';

  @override
  String get productTypeHoodie => 'Hudi';

  @override
  String get productTypeZipHoodie => 'Zəncirli hudi';

  @override
  String get productTypeTShirt => 'Futbolka';

  @override
  String get productTypeSweatshirt => 'Svitşot';

  @override
  String get productTypeSweatpants => 'İdman şalvarı';

  @override
  String get productTypeShorts => 'Şort';

  @override
  String get colorFamilyBlack => 'Qara';

  @override
  String get colorFamilyForest => 'Meşə yaşılı';

  @override
  String get colorFamilyCream => 'Krem';

  @override
  String get colorFamilyWhite => 'Ağ';

  @override
  String get colorFamilyGrey => 'Boz';

  @override
  String get colorFamilySand => 'Qum';

  @override
  String get colorFamilyOlive => 'Zeytun';

  @override
  String get colorFamilyRed => 'Qırmızı';

  @override
  String get styleTagMinimal => 'Minimal';

  @override
  String get styleTagStreetwear => 'Streetwear';

  @override
  String get styleTagGraphicPrints => 'Qrafik çaplar';

  @override
  String get styleTagMonochrome => 'Monoxrom';

  @override
  String get styleTagSport => 'İdman';

  @override
  String get styleTagVintage => 'Vintaj';

  @override
  String get notificationTopicOrders => 'Sifarişlər';

  @override
  String get notificationTopicDelivery => 'Çatdırılma';

  @override
  String get notificationTopicAlerts => 'Xəbərdarlıqlar';

  @override
  String get notificationTopicMarketing => 'Yeniliklər və təkliflər';

  @override
  String get notificationChannelEmail => 'E-poçt';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationChannelWhatsApp => 'WhatsApp';

  @override
  String get notificationChannelPush => 'Push';

  @override
  String get stockStateInStock => 'Anbarda';

  @override
  String get stockStateLowStock => 'Az qalıb';

  @override
  String get stockStatePreorder => 'Ön sifariş';

  @override
  String get stockStateOutOfStock => 'Bitib';

  @override
  String get stockStateMadeToOrder => 'Sifarişlə hazırlanır';

  @override
  String get stockStateUnavailable => 'Mövcud deyil';

  @override
  String get dsTitle => 'Dizayn sistemi';

  @override
  String get dsLightDark => 'İşıqlı / Qaranlıq';

  @override
  String get authSignInWithSms => 'SMS kodu ilə daxil ol';

  @override
  String get authSocialUnavailable => 'Bu giriş üsulu hazırda əlçatan deyil';

  @override
  String get authOr => 'və ya';

  @override
  String get authContinueWithGoogle => 'Google ilə davam et';

  @override
  String get authContinueWithApple => 'Apple ilə davam et';

  @override
  String get authSocialTerms =>
      'Davam etməklə İstifadə şərtlərini qəbul edirsiniz.';

  @override
  String get authWelcomeTitle => 'Sakit. Əmin. HOO.';

  @override
  String get authWelcomeSubtitle =>
      'Bakıdan premium streetwear — və öz dizaynın üçün 3D Studio.';

  @override
  String get authSignInTitle => 'Xoş gəldiniz';

  @override
  String get authSignInSubtitle =>
      'Sifarişləriniz, dizaynlarınız və bəyəndikləriniz sizi gözləyir.';

  @override
  String get authIdentifierLabel => 'E-poçt və ya telefon';

  @override
  String get authIdentifierHint => 'you@example.com və ya 050 123 45 67';

  @override
  String get authPasswordLabel => 'Şifrə';

  @override
  String get authForgotPassword => 'Şifrəni unutmusunuz?';

  @override
  String get authNoAccount => 'HOO-da yenisiniz?';

  @override
  String get authHaveAccount => 'Artıq hesabınız var?';

  @override
  String get authSignUpTitle => 'Hesab yaradın';

  @override
  String get authSignUpSubtitle =>
      'Yeni drop-lara erkən giriş, sürətli checkout və saxlanılmış dizaynlar.';

  @override
  String get authFullNameLabel => 'Ad və soyad';

  @override
  String get authEmailLabel => 'E-poçt';

  @override
  String get authPhoneLabel => 'Telefon';

  @override
  String get authMarketingConsent =>
      'Yeni drop-lar və təkliflər haqqında ilk mən bilmək istəyirəm';

  @override
  String get authAcceptTerms =>
      'İstifadə şərtlərini və Məxfilik siyasətini qəbul edirəm';

  @override
  String get authTermsRequired => 'Davam etmək üçün şərtləri qəbul edin';

  @override
  String get authOtpPhoneTitle => 'Telefonla daxil olun';

  @override
  String get authOtpPhoneSubtitle =>
      '6 rəqəmli kodu SMS ilə göndərəcəyik. Yeni nömrə üçün hesab avtomatik yaradılır.';

  @override
  String get authOtpNameHint => 'yeni müştərilər üçün';

  @override
  String get authSendCode => 'Kodu göndər';

  @override
  String get authOtpCodeTitle => 'Kodu daxil edin';

  @override
  String authOtpCodeSubtitle(String phone) {
    return '$phone nömrəsinə göndərdik';
  }

  @override
  String authResendIn(String time) {
    return 'Yenidən göndərmək: $time';
  }

  @override
  String get authResendSms => 'Kodu yenidən göndər';

  @override
  String get authResendWhatsApp => 'SMS gəlmədi? WhatsApp ilə göndər';

  @override
  String get authForgotTitle => 'Şifrəni bərpa et';

  @override
  String get authForgotSubtitle =>
      'E-poçt ünvanınızı və ya telefonunuzu yazın.';

  @override
  String get authForgotEmailSentTitle => 'Poçtunuzu yoxlayın';

  @override
  String get authForgotEmailSent =>
      'Hesab varsa, şifrəni yeniləmək üçün link göndərdik.';

  @override
  String get authResetTitle => 'Yeni şifrə';

  @override
  String get authResetSubtitle =>
      'SMS ilə gələn kodu və yeni şifrəni daxil edin.';

  @override
  String get authResetCodeLabel => 'Kod';

  @override
  String get authNewPasswordLabel => 'Yeni şifrə';

  @override
  String get authResetDone => 'Şifrəniz yeniləndi. İndi daxil ola bilərsiniz.';

  @override
  String get cartAddedTitle => 'Səbətə əlavə olundu';

  @override
  String cartItemsCount(int count) {
    return '$count məhsul';
  }

  @override
  String get cartCheckout => 'Sifarişi rəsmiləşdir';

  @override
  String get cartViewBag => 'Səbətə bax';

  @override
  String cartOnlyLeft(int count) {
    return 'Cəmi $count ədəd qalıb';
  }

  @override
  String cartMadeToOrderDays(int days) {
    return 'Sifarişlə hazırlanır · $days gün';
  }

  @override
  String get cartCustomBadge => 'Studio';

  @override
  String get cartFreeDeliveryReached => 'Afərin! Çatdırılma pulsuzdur';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'Pulsuz çatdırılmaya $amount qalıb';
  }

  @override
  String cartRemoved(String name) {
    return '$name səbətdən silindi';
  }

  @override
  String get cartUndo => 'Geri qaytar';

  @override
  String get cartEmptyTitle => 'Səbətiniz boşdur';

  @override
  String get cartEmptyBody =>
      'Yeni drop-a baxın və ya Studio-da öz dizaynınızı yaradın.';

  @override
  String get cartEmptyAction => 'Mağazaya keç';

  @override
  String get cartBestsellers => 'Ən çox satılanlar';

  @override
  String get cartLineErrors =>
      'Bəzi məhsullarda dəyişiklik var — sifarişdən əvvəl yoxlayın.';

  @override
  String get cartIsGift => 'Bu hədiyyədir';

  @override
  String get cartIsGiftHint => 'Qablaşdırma, təbrik kartı və qiymətsiz qəbz';

  @override
  String get cartDeliveryAtCheckout => 'Çatdırılma checkout-da hesablanır.';

  @override
  String get cartCompleteTheLook => 'Obrazı tamamla';

  @override
  String get cartPromoHint => 'Promo kod';

  @override
  String get catalogFilterTitle => 'Filtr və sıralama';

  @override
  String get catalogSortNewest => 'Ən yenilər';

  @override
  String get catalogSortPriceAsc => 'Qiymət: artan';

  @override
  String get catalogSortPriceDesc => 'Qiymət: azalan';

  @override
  String get catalogSortPopular => 'Ən çox satılan';

  @override
  String get catalogFilterCategory => 'Kateqoriya';

  @override
  String get catalogFilterSize => 'Ölçü';

  @override
  String get catalogFilterColor => 'Rəng';

  @override
  String get catalogFilterFit => 'Kəsim';

  @override
  String get catalogFilterFabric => 'Parça';

  @override
  String get catalogFilterPrice => 'Qiymət';

  @override
  String get catalogFilterInStock => 'Yalnız anbarda olanlar';

  @override
  String get catalogShowResults => 'Nəticələri göstər';

  @override
  String get catalogChipAll => 'Hamısı';

  @override
  String get catalogChipNew => 'Yeni';

  @override
  String get catalogChipSale => 'Endirim';

  @override
  String get catalogChipOversized => 'Oversized';

  @override
  String catalogShowing(int shown, int total) {
    return '$shown / $total məhsul';
  }

  @override
  String get catalogFilterAndSort => 'Filtr';

  @override
  String catalogFilterCount(int count) {
    return 'Filtr ($count)';
  }

  @override
  String get catalogEmptyTitle => 'Heç nə tapılmadı';

  @override
  String get catalogEmptyBody => 'Filtrləri dəyişin və ya təmizləyin.';

  @override
  String get catalogAlertSignIn =>
      'Xəbərdarlıqlar hesabınıza bağlıdır — daxil olun.';

  @override
  String get catalogNotifyDone => 'Stoka qayıdanda xəbər verəcəyik';

  @override
  String get catalogPriceAlertDone => 'Qiymət düşəndə xəbər verəcəyik';

  @override
  String get catalogPhotos => 'Şəkillər';

  @override
  String get catalog3dView => '3D';

  @override
  String get catalogYouMayAlsoLike => 'Bunlar da xoşunuza gələ bilər';

  @override
  String get catalogToday => 'bu gün';

  @override
  String get catalogTomorrow => 'sabah';

  @override
  String catalogDeliveredOn(String when) {
    return 'Çatdırılma: $when';
  }

  @override
  String catalogDeliveryPromise(int hours, int minutes, String when) {
    return '$hours saat $minutes dəq ərzində sifariş edin — $when çatdırılsın';
  }

  @override
  String get catalogReadReviews => 'Rəylərə bax';

  @override
  String get catalogColor => 'Rəng';

  @override
  String get catalogSize => 'Ölçü';

  @override
  String get catalogSizeGuide => 'Ölçü cədvəli';

  @override
  String get catalogPreorderShort => 'ön sifariş';

  @override
  String get catalogChooseSize => 'Ölçü seçin';

  @override
  String catalogRecommendedSize(String size) {
    return 'Sizə $size ölçüsünü tövsiyə edirik';
  }

  @override
  String catalogOnlyLeftIn(int count, String size) {
    return '$size ölçüsündən cəmi $count ədəd qalıb';
  }

  @override
  String get catalogCustomizeThis => 'Bunu fərdiləşdir';

  @override
  String get catalogDescription => 'Təsvir';

  @override
  String get catalogSizeAndFit => 'Ölçü və kəsim';

  @override
  String get catalogFabricAndCare => 'Parça və qulluq';

  @override
  String catalogReviewsCount(int count) {
    return 'Rəylər ($count)';
  }

  @override
  String get catalogWriteReview => 'Rəy yaz';

  @override
  String get catalogPriceDropAlert => 'Qiymət düşəndə xəbər ver';

  @override
  String get catalogSelectSize => 'Ölçü seçin';

  @override
  String get catalogAddToBag => 'Səbətə əlavə et';

  @override
  String get catalogSizeCol => 'Ölçü';

  @override
  String get catalogChestCol => 'Sinə';

  @override
  String get catalogLengthCol => 'Uzunluq';

  @override
  String get catalogSleeveCol => 'Qol';

  @override
  String get catalogSizeGuideHint =>
      'Ölçülər məhsulun özünə aiddir, düz səthdə ölçülüb.';

  @override
  String get catalogReviews => 'Rəylər';

  @override
  String get catalogNoReviews => 'Hələ rəy yoxdur';

  @override
  String get catalogNoReviewsBody =>
      'Bu məhsulu almısınızsa, ilk rəyi siz yazın.';

  @override
  String get catalogReviewThanks => 'Təşəkkür edirik!';

  @override
  String get catalogReviewModeration =>
      'Rəyiniz yoxlandıqdan sonra dərc olunacaq.';

  @override
  String get catalogYourRating => 'Qiymətiniz';

  @override
  String get catalogReviewTitle => 'Başlıq';

  @override
  String get catalogReviewBody => 'Rəyiniz';

  @override
  String get catalogSubmitReview => 'Göndər';

  @override
  String get checkoutTitle => 'Sifarişin rəsmiləşdirilməsi';

  @override
  String get checkoutStepContact => 'Əlaqə';

  @override
  String get checkoutStepGift => 'Hədiyyə';

  @override
  String get checkoutStepDelivery => 'Çatdırılma';

  @override
  String get checkoutStepSlot => 'Çatdırılma vaxtı';

  @override
  String get checkoutStepPayment => 'Ödəniş';

  @override
  String get checkoutStepReview => 'Yoxla və təsdiqlə';

  @override
  String get checkoutPhoneHint => 'Kuryer bu nömrəyə zəng edəcək.';

  @override
  String get checkoutGiftNotForCustom =>
      'Fərdi (Studio) sifarişlər hədiyyə kimi göndərilə bilməz.';

  @override
  String get checkoutRecipientName => 'Alıcının adı';

  @override
  String get checkoutRecipientPhone => 'Alıcının telefonu';

  @override
  String get checkoutOccasion => 'Səbəb';

  @override
  String get checkoutSurprise => 'Sürpriz';

  @override
  String get checkoutSurpriseHint =>
      'Kuryer əvvəlcədən sizinlə əlaqə saxlayacaq, alıcı ilə yox.';

  @override
  String get checkoutPackaging => 'Qablaşdırma';

  @override
  String checkoutPackagingFreeFrom(String amount) {
    return '$amount-dan pulsuz';
  }

  @override
  String get checkoutCard => 'Təbrik kartı';

  @override
  String get checkoutMessage => 'Mesaj';

  @override
  String get checkoutFromName => 'Kimdən';

  @override
  String get checkoutHidePrices => 'Qəbzdə qiymətləri gizlət';

  @override
  String checkoutReadyInHours(int hours) {
    return '$hours saata hazır';
  }

  @override
  String checkoutFreeFrom(String amount) {
    return '$amount-dan pulsuz';
  }

  @override
  String get checkoutAddress => 'Ünvan';

  @override
  String get checkoutNewAddress => 'Yeni ünvan';

  @override
  String get checkoutCity => 'Şəhər';

  @override
  String get checkoutDistrict => 'Rayon';

  @override
  String get checkoutStreet => 'Küçə, ev';

  @override
  String get checkoutApartment => 'Mənzil';

  @override
  String get checkoutCourierNote => 'Kuryer üçün qeyd';

  @override
  String get checkoutNoSlots => 'Uyğun vaxt yoxdur';

  @override
  String get checkoutSlotTaken => 'Bu vaxt artıq doludur — başqa birini seçin.';

  @override
  String get checkoutPackagingSaving => 'Qablaşdırmaya qənaət';

  @override
  String checkoutEstimatedDelivery(String range) {
    return 'Təxmini çatdırılma: $range';
  }

  @override
  String get checkoutCustomApprovalNote =>
      'Studio dizaynları əvvəlcə komandamız tərəfindən yoxlanılır. Təsdiqdən sonra istehsala göndərilir — sifariş statusu “Dizayn təsdiqi gözlənilir” olacaq.';

  @override
  String get checkoutSaveCard => 'Kartı növbəti alışlar üçün yadda saxla';

  @override
  String get checkoutAcceptTerms =>
      'Satış şərtlərini və qaytarma siyasətini qəbul edirəm';

  @override
  String get checkoutImageRights =>
      'Şəkillərin hüquqları mənə məxsusdur; fərdi məhsulların qaytarılmadığını bilirəm';

  @override
  String get checkoutMissingSteps =>
      'Sifarişi təsdiqləmək üçün yuxarıdakı addımları tamamlayın.';

  @override
  String checkoutPlaceOrder(String total) {
    return 'Sifarişi təsdiqlə · $total';
  }

  @override
  String get checkoutPaymentFailedTitle => 'Ödəniş alınmadı';

  @override
  String get checkoutPaymentFailedBody =>
      'Sifarişiniz saxlanılıb. Yenidən ödəyin və ya başqa üsul seçin.';

  @override
  String get checkoutRetryPayment => 'Yenidən ödə';

  @override
  String get checkoutSwitchToCod => 'Qapıda nağd ödəyəcəm';

  @override
  String get checkoutAwaitingPayment => 'Ödənişi tamamlayın';

  @override
  String checkoutAwaitingPaymentBody(String number) {
    return 'Sifariş $number yaradıldı. Ödəniş təsdiqlənən kimi davam edəcəyik.';
  }

  @override
  String get checkoutCheckPayment => 'Ödənişi yoxla';

  @override
  String get checkoutOpenPaymentAgain => 'Ödəniş səhifəsini yenidən aç';

  @override
  String get checkoutConfirmedTitle => 'Sifarişiniz qəbul olundu';

  @override
  String get checkoutConfirmedBody =>
      'Təşəkkür edirik. Təsdiq məktubu və SMS göndərdik.';

  @override
  String get checkoutOrderNumber => 'Sifariş nömrəsi';

  @override
  String get checkoutGiftReceipt => 'Hədiyyə qəbzi';

  @override
  String get checkoutGiftReceiptHint =>
      'Alıcı bu kodla ölçünü dəyişə bilər — qiymətləri görmədən.';

  @override
  String get checkoutTrackOrder => 'Sifarişi izlə';

  @override
  String get checkoutContinueShopping => 'Alış-verişə davam et';

  @override
  String get homeNewArrivals => 'Yeni gələnlər';

  @override
  String get homeCategories => 'Kateqoriyalar';

  @override
  String get homeCollections => 'Kolleksiyalar';

  @override
  String get homeShopTheLook => 'Obrazı al';

  @override
  String homeShopLookCount(int count) {
    return '$count məhsul';
  }

  @override
  String get homeBestsellers => 'Ən çox satılanlar';

  @override
  String get homeRecentlyViewed => 'Son baxdıqlarınız';

  @override
  String get homeHeroEyebrow => 'Yeni drop';

  @override
  String get homeHeroTitle => 'Sakit güc.';

  @override
  String get homeHeroSubtitle =>
      'Ağır pambıq, oversized kəsim, meşə yaşılı. Yeni kolleksiya artıq satışdadır.';

  @override
  String get homeHeroCta => 'Kolleksiyaya bax';

  @override
  String get homeStudioTitle => 'Öz dizaynını yarat';

  @override
  String get homeStudioBody =>
      'Parçanı, rəngi seç, mətn və şəkil əlavə et — 3D-də gör.';

  @override
  String get homeStudioCta => 'Studio-nu aç';

  @override
  String get launchComingSoonTitle => 'Tezliklə.';

  @override
  String get launchComingSoonSubtitle =>
      'HOO açılır. Siyahıya yazılın — ilk drop-a erkən giriş sizin olsun.';

  @override
  String get launchDays => 'gün';

  @override
  String get launchHours => 'saat';

  @override
  String get launchMinutes => 'dəq';

  @override
  String get launchSeconds => 'san';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return 'Açılışa $days gün, $hours saat, $minutes dəqiqə qalıb';
  }

  @override
  String get launchWaitlistTitle => 'Gözləmə siyahısı';

  @override
  String launchWaitlistCount(int count) {
    return '$count nəfər artıq siyahıdadır';
  }

  @override
  String get launchJoinWaitlist => 'Siyahıya yazıl';

  @override
  String launchWaitlistPosition(int position, int total) {
    return 'Siz $position-cisiniz ($total nəfərdən)';
  }

  @override
  String get launchWaitlistThanks =>
      'Açılış günü ilk xəbər tutan siz olacaqsınız.';

  @override
  String get launchWaitlistAlready =>
      'Siz artıq siyahıdasınız — gözləyin, tezliklə!';

  @override
  String get launchNewsletterTitle => 'Bülletenə abunə olun';

  @override
  String get launchSubscribe => 'Abunə ol';

  @override
  String get launchNewsletterDone => 'Abunə oldunuz. Təşəkkürlər!';

  @override
  String get launchStaffSignIn => 'Əməkdaş girişi';

  @override
  String get launchSkip => 'Keç';

  @override
  String get launchGetStarted => 'Başla';

  @override
  String get launchChooseLanguage => 'Dili seçin';

  @override
  String get launchSlideBrandTitle => 'Bakıdan. Sakit və əmin.';

  @override
  String get launchSlideBrandBody =>
      'Ağır pambıq, dəqiq kəsim, az rəng. Hər gün geyinmək üçün premium streetwear.';

  @override
  String get launchSlideStudioTitle => 'Öz dizaynını yarat.';

  @override
  String get launchSlideStudioBody =>
      '3D Studio-da parçanı, rəngi seç, mətn və şəkil əlavə et — qiyməti dərhal gör.';

  @override
  String get launchSlideDeliveryTitle => 'Bakıda sürətli çatdırılma.';

  @override
  String get launchSlideDeliveryBody =>
      'Sizə uyğun gün və saatı seçin, sifarişi addım-addım izləyin.';

  @override
  String get ordersEventPlaced => 'Sifariş verildi';

  @override
  String get ordersEventPaymentCaptured => 'Ödəniş alındı';

  @override
  String get ordersEventPaymentFailed => 'Ödəniş alınmadı';

  @override
  String get ordersEventCourierAssigned => 'Kuryer təyin olundu';

  @override
  String ordersEventCourierAssignedNamed(String name) {
    return 'Kuryer: $name';
  }

  @override
  String get ordersEventEtaUpdated => 'Çatdırılma vaxtı yeniləndi';

  @override
  String get ordersEventSlotChanged => 'Çatdırılma vaxtı dəyişdirildi';

  @override
  String get ordersEventRefund => 'Pul qaytarıldı';

  @override
  String get ordersEventGiftMessage => 'Hədiyyə mesajı yeniləndi';

  @override
  String get ordersEventReturnRequested => 'Qaytarma istənildi';

  @override
  String get ordersEventReturnUpdated => 'Qaytarma yeniləndi';

  @override
  String get ordersEventDesignApproved => 'Dizayn təsdiqləndi';

  @override
  String get ordersEventDesignChanges => 'Dizaynda dəyişiklik istənildi';

  @override
  String get ordersTitle => 'Sifarişlərim';

  @override
  String get ordersEmptyTitle => 'Hələ sifariş yoxdur';

  @override
  String get ordersEmptyBody => 'İlk sifarişiniz burada görünəcək.';

  @override
  String get ordersReturnsTitle => 'Qaytarmalar';

  @override
  String get ordersReturnsEmpty => 'Qaytarma sorğusu yoxdur';

  @override
  String get ordersReturnsEmptyBody =>
      'Sifariş səhifəsindən qaytarma və ya dəyişmə istəyə bilərsiniz.';

  @override
  String get ordersTrackTitle => 'Sifarişi izlə';

  @override
  String get ordersTrackBody =>
      'Sifariş nömrəsini və sifarişdəki telefonu daxil edin.';

  @override
  String get ordersTrackPhone => 'Sifarişdəki telefon';

  @override
  String get ordersChangeSlot => 'Çatdırılma vaxtını dəyiş';

  @override
  String get ordersSlotChangeContact =>
      'Vaxtı dəyişmək üçün bizimlə əlaqə saxlayın — kuryer sizə uyğun vaxtı təyin edəcək.';

  @override
  String get ordersSlotChanged => 'Çatdırılma vaxtı dəyişdirildi';

  @override
  String get ordersSignInToView => 'Bu sifarişə baxmaq üçün daxil olun';

  @override
  String ordersPlacedOn(String date) {
    return '$date tarixində';
  }

  @override
  String get ordersPayAgain => 'Yenidən ödə';

  @override
  String get ordersReturnExchange => 'Qaytarma / dəyişmə';

  @override
  String get ordersWhatsApp => 'WhatsApp ilə yazın';

  @override
  String get ordersTimeline => 'Status';

  @override
  String get ordersItems => 'Məhsullar';

  @override
  String ordersCourier(String name) {
    return 'Kuryer: $name';
  }

  @override
  String ordersStopsAway(int count) {
    return '$count dayanacaq qalıb';
  }

  @override
  String ordersEta(int minutes) {
    return '~$minutes dəq';
  }

  @override
  String get ordersNotReturnable => 'Fərdi məhsul — qaytarılmır';

  @override
  String get ordersReturnReason => 'Səbəb';

  @override
  String get ordersSendRequest => 'Sorğu göndər';

  @override
  String get ordersReturnSent => 'Sorğunuz göndərildi';

  @override
  String get ordersReturnSentBody =>
      'Komandamız 1–2 iş günü ərzində sizinlə əlaqə saxlayacaq.';

  @override
  String get ordersGiftReceiptBody =>
      'Hədiyyə qəbzindəki kodu və telefonunuzu daxil edin — ölçünü dəyişə bilərsiniz.';

  @override
  String get ordersGiftCode => 'Hədiyyə kodu';

  @override
  String get ordersRecipientPhone => 'Telefonunuz';

  @override
  String ordersGiftFor(String name) {
    return '$name üçün hədiyyə';
  }

  @override
  String ordersGiftFrom(String name) {
    return '$name-dan';
  }

  @override
  String get ordersExchangeTo => 'Dəyişmək istədiyiniz ölçü';

  @override
  String ordersExchangeUntil(String date) {
    return 'Dəyişmə $date tarixinədək mümkündür';
  }

  @override
  String get ordersRequestExchange => 'Dəyişmə istə';

  @override
  String get ordersExchangeSent => 'Dəyişmə sorğusu göndərildi';

  @override
  String get profileSignOutConfirm => 'Hesabdan çıxmaq istəyirsiniz?';

  @override
  String get profileShopping => 'Alış-veriş';

  @override
  String get profileMyDesigns => 'Dizaynlarım';

  @override
  String get profileAccount => 'Hesab';

  @override
  String get profileStyleProfile => 'Stil profili';

  @override
  String get profileAddresses => 'Ünvanlar';

  @override
  String get profileSavedCards => 'Saxlanılmış kartlar';

  @override
  String get profilePersonalInfo => 'Şəxsi məlumat';

  @override
  String get profileChangePassword => 'Şifrəni dəyiş';

  @override
  String get profileSetPassword => 'Şifrə təyin et';

  @override
  String get profileDevices => 'Aktiv cihazlar';

  @override
  String get profileNotifications => 'Bildirişlər';

  @override
  String get profileServices => 'Xidmətlər';

  @override
  String get profileHelp => 'Kömək';

  @override
  String get profileSettings => 'Tənzimləmələr';

  @override
  String profileHello(String name) {
    return 'Salam, $name';
  }

  @override
  String get profileActiveOrders => 'Aktiv';

  @override
  String get profileGuestTitle => 'HOO hesabınız';

  @override
  String get profileGuestBody =>
      'Sifarişləri izləyin, dizaynları saxlayın və bəyəndiklərinizi istənilən cihazda görün.';

  @override
  String get profilePasswordChanged => 'Şifrə dəyişdirildi';

  @override
  String get profileCurrentPassword => 'Cari şifrə';

  @override
  String get profilePasswordOtherDevices =>
      'Digər cihazlarda hesabdan çıxış ediləcək.';

  @override
  String get profileAddAddress => 'Ünvan əlavə et';

  @override
  String get profileEditAddress => 'Ünvanı redaktə et';

  @override
  String get profileNoAddresses => 'Saxlanılmış ünvan yoxdur';

  @override
  String get profileDefault => 'Əsas';

  @override
  String get profileDeleteAddress => 'Ünvan silinsin?';

  @override
  String get profileAddressLabel => 'Ad';

  @override
  String get profileAddressLabelHint => 'Ev, İş…';

  @override
  String get profileMakeDefault => 'Əsas ünvan et';

  @override
  String get profileNoCards => 'Saxlanılmış kart yoxdur';

  @override
  String get profileNoCardsBody => 'Ödəniş zamanı \"Kartı yadda saxla\" seçin.';

  @override
  String get profileDeleteCard => 'Kart silinsin?';

  @override
  String profileDeviceApp(String platform) {
    return 'HOO tətbiqi · $platform';
  }

  @override
  String get profileDeviceUnknown => 'Naməlum cihaz';

  @override
  String get profileThisDevice => 'Bu cihaz';

  @override
  String profileLastSeen(String time) {
    return 'Son aktivlik: $time';
  }

  @override
  String get profileRequiredNotification => 'Sifariş üçün vacibdir';

  @override
  String get profileLanguage => 'Dil';

  @override
  String get profileAppearance => 'Görünüş';

  @override
  String get profileThemeSystem => 'Sistem';

  @override
  String get profileThemeLight => 'İşıqlı';

  @override
  String get profileThemeDark => 'Qaranlıq';

  @override
  String get profileContactUs => 'Bizimlə əlaqə';

  @override
  String get profileFaq => 'Tez-tez verilən suallar';

  @override
  String get profileFaqDeliveryQ => 'Çatdırılma nə qədər çəkir?';

  @override
  String get profileFaqDeliveryA =>
      'Bakıda kuryerlə adətən 1–2 gün; seçdiyiniz gün və saat aralığında çatdırırıq. Regionlara poçtla 3–5 gün.';

  @override
  String get profileFaqReturnsQ => 'Məhsulu necə qaytara bilərəm?';

  @override
  String get profileFaqReturnsA =>
      'Sifariş səhifəsində \"Qaytarma / dəyişmə\" seçin. Studio-da fərdi hazırlanan məhsullar qaytarılmır.';

  @override
  String get profileFaqStudioQ => 'Studio sifarişi nə vaxt hazır olur?';

  @override
  String get profileFaqStudioA =>
      'Dizaynı komandamız yoxlayır, sonra istehsala göndəririk. Müddət sifariş zamanı göstərilir; təcili istehsal da mümkündür.';

  @override
  String get profileFaqPaymentQ => 'Hansı ödəniş üsulları var?';

  @override
  String get profileFaqPaymentA =>
      'Apple Pay, Google Pay, bank kartı və qapıda nağd ödəniş (limitə qədər).';

  @override
  String get profileSizeGuideBody =>
      'Hər məhsulun səhifəsində ölçü cədvəli var. Stil profilinizi doldursanız, sizə uyğun ölçünü tövsiyə edəcəyik.';

  @override
  String get profileAbout => 'HOO haqqında';

  @override
  String get profileAboutBody =>
      'HOO — Bakıdan premium streetwear brendi. Ağır pambıq, dəqiq kəsim, az rəng və öz dizaynını yaratmaq üçün 3D Studio.';

  @override
  String get profileStyleIntro =>
      'Ölçülərinizi paylaşın — uyğun ölçünü tövsiyə edək və məhsulları zövqünüzə görə sıralayaq.';

  @override
  String get profileMeasurements => 'Ölçülər';

  @override
  String get profileHeight => 'Boy';

  @override
  String get profileWeight => 'Çəki';

  @override
  String get profileWaist => 'Bel';

  @override
  String get profileUsualSize => 'Adətən geyindiyim ölçü';

  @override
  String get profilePreferredFit => 'Sevdiyim kəsim';

  @override
  String get profileFavoriteColors => 'Sevimli rənglər';

  @override
  String get profileUpToThree => '3-ə qədər';

  @override
  String get profileStyles => 'Üslub';

  @override
  String get searchHint => 'Hudi, futbolka, rəng…';

  @override
  String get searchRecent => 'Son axtarışlar';

  @override
  String get searchSuggestions => 'Təkliflər';

  @override
  String searchResults(int count, String query) {
    return '“$query” üçün $count nəticə';
  }

  @override
  String searchNoResultsTitle(String query) {
    return '“$query” tapılmadı';
  }

  @override
  String get searchNoResultsBody =>
      'Başqa söz yoxlayın və ya bestsellerlərə baxın.';

  @override
  String get searchDesignYourOwnTitle => 'Tapmadınız? Özünüz dizayn edin';

  @override
  String get searchDesignYourOwnBody =>
      '3D Studio-da istədiyiniz rəng və çapla.';

  @override
  String get studioModelFallback =>
      '3D model yüklənmədi — sadə forma göstərilir.';

  @override
  String studioTooManyLayers(int max) {
    return 'Ən çox $max qat əlavə etmək olar';
  }

  @override
  String studioUploadTooLarge(int mb) {
    return 'Fayl çox böyükdür (maks. $mb MB)';
  }

  @override
  String get studioUndo => 'Geri al';

  @override
  String get studioRedo => 'Təkrarla';

  @override
  String get studioSavedOffline => 'Oflayn saxlanıldı';

  @override
  String get studioSaveFailed => 'Saxlanılmadı';

  @override
  String get studioFront => 'Ön';

  @override
  String get studioBack => 'Arxa';

  @override
  String get studioLeftSleeve => 'Sol qol';

  @override
  String get studioRightSleeve => 'Sağ qol';

  @override
  String get studioHood => 'Kapüşon';

  @override
  String get studioFreeSpot => 'Sərbəst yer';

  @override
  String get studioStepProduct => 'Məhsul';

  @override
  String get studioStepFabric => 'Parça və detallar';

  @override
  String get studioStepFit => 'Ölçü və kəsim';

  @override
  String get studioStepColor => 'Rəng';

  @override
  String get studioStepEditor => 'Dizayn';

  @override
  String get studioStepReview => 'Yoxla';

  @override
  String get studioCustomSize => 'Fərdi';

  @override
  String studioLeadTime(int min, int max) {
    return '$min–$max gün istehsal';
  }

  @override
  String get studioReview => 'Yoxla';

  @override
  String get studioSetupFee => 'Hazırlıq';

  @override
  String get studioRushFee => 'Təcili istehsal';

  @override
  String studioVolumeDiscount(int percent) {
    return 'Say endirimi −$percent%';
  }

  @override
  String get studioIncluded => 'Daxildir';

  @override
  String get studioChooseProduct => 'Nə dizayn edirik?';

  @override
  String studioFromPrice(String price) {
    return '$price-dan';
  }

  @override
  String get studioFabric => 'Parça';

  @override
  String studioGsm(int gsm) {
    return '$gsm q/m²';
  }

  @override
  String get studioFeatures => 'Detallar';

  @override
  String get studioFit => 'Kəsim';

  @override
  String get studioCustomMeasurements => 'Fərdi ölçülər';

  @override
  String get studioColor => 'Rəng';

  @override
  String get studioSpotPicked => 'Növbəti qat seçdiyiniz yerə əlavə olunacaq';

  @override
  String get studioAddText => 'Mətn';

  @override
  String get studioAddImage => 'Şəkil';

  @override
  String studioLayers(int count, int max) {
    return 'Qatlar · $count/$max';
  }

  @override
  String get studioNoLayers =>
      'Mətn və ya şəkil əlavə edin, ya da modelə toxunaraq yer seçin.';

  @override
  String studioUploadHint(int mb, int dpi) {
    return 'PNG və ya JPG, $mb MB-a qədər. Ən yaxşı keyfiyyət üçün $dpi DPI.';
  }

  @override
  String get studioFromGallery => 'Qalereyadan';

  @override
  String get studioFromCamera => 'Kamera ilə';

  @override
  String get studioImageLayer => 'Şəkil';

  @override
  String get studioShowLayer => 'Göstər';

  @override
  String get studioHideLayer => 'Gizlət';

  @override
  String get studioTextLayer => 'Mətn';

  @override
  String get studioCenter => 'Mərkəzə gətir';

  @override
  String get studioDuplicate => 'Dublikat';

  @override
  String get studioSize => 'Ölçü';

  @override
  String get studioRotation => 'Bucaq';

  @override
  String studioQualityPoor(int dpi) {
    return 'Keyfiyyət aşağıdır ($dpi DPI) — şəkli kiçildin və ya daha böyük fayl yükləyin';
  }

  @override
  String studioQualityWarning(int dpi) {
    return 'Orta keyfiyyət ($dpi DPI)';
  }

  @override
  String studioQualityOk(int dpi) {
    return 'Çap keyfiyyəti yaxşıdır ($dpi DPI)';
  }

  @override
  String get studioEditText => 'Mətni redaktə et';

  @override
  String get studioFont => 'Şrift';

  @override
  String studioTextSize(int pt) {
    return 'Ölçü · $pt pt';
  }

  @override
  String get studioLayersShort => 'Qatlar';

  @override
  String get studioQuantity => 'Say';

  @override
  String studioVolumeTier(int min, int percent) {
    return '$min+: −$percent%';
  }

  @override
  String get studioRush => 'Təcili istehsal';

  @override
  String studioRushHint(String fee, int days) {
    return '+$fee · $days gün daha tez';
  }

  @override
  String get studioImageRights => 'Bu şəkillərin hüquqları mənə məxsusdur';

  @override
  String get studioAddSomething =>
      'Sifariş üçün ən azı bir mətn və ya şəkil əlavə edin.';

  @override
  String get studioSaveDesign => 'Dizaynı yadda saxla';

  @override
  String get studioDesignSaved => 'Dizayn saxlanıldı';

  @override
  String get studioBackToEditor => 'Dizayna qayıt';

  @override
  String get studioIntro =>
      'Parça, kəsim və rəng seçin, mətn və şəkil əlavə edin — hər dəyişikliyin qiymətini dərhal görün.';

  @override
  String get studioStart => 'Dizayna başla';

  @override
  String get studioContinueDraft => 'Son dizayna davam et';

  @override
  String get studioHowItWorks => 'Necə işləyir';

  @override
  String get studioHowPick => 'Məhsulu, parçanı və rəngi seçin';

  @override
  String get studioHowDesign => '3D-də mətn və şəkil yerləşdirin';

  @override
  String get studioHowOrder => 'Sifariş verin — biz yoxlayıb hazırlayırıq';

  @override
  String get studioUntitled => 'Adsız dizayn';

  @override
  String get studioNoDesigns => 'Hələ dizayn yoxdur';

  @override
  String get studioNoDesignsBody =>
      'Studio-da yaratdıqlarınız burada saxlanılır.';

  @override
  String get studioResubmit => 'Yenidən göndər';

  @override
  String get studioResubmitted => 'Dizayn yenidən yoxlamaya göndərildi';

  @override
  String get studioDeleteConfirm => 'Dizayn silinsin?';

  @override
  String get studioSharedTitle => 'Paylaşılan dizayn';

  @override
  String get studioDesignYourOwn => 'Öz dizaynını yarat';

  @override
  String get wishlistSignInReason =>
      'Bəyəndiklərinizi saxlamaq və istənilən cihazda görmək üçün daxil olun.';

  @override
  String get wishlistTitle => 'Bəyənilənlər';

  @override
  String get wishlistShareSubject => 'HOO-da bəyəndiklərim';

  @override
  String get wishlistEmptyTitle => 'Hələ heç nə bəyənməmisiniz';

  @override
  String get wishlistEmptyBody =>
      'Məhsulda ♡ işarəsinə toxunun — burada saxlanılacaq.';

  @override
  String get wishlistChooseSize => 'Ölçü seç';

  @override
  String get wishlistNotifyMe => 'Gələndə xəbər ver';

  @override
  String wishlistSharedTitle(String name) {
    return '$name bəyənənlər';
  }

  @override
  String get wishlistAlertsTitle => 'Xəbərdarlıqlar';

  @override
  String get wishlistAlertsEmptyTitle => 'Aktiv xəbərdarlıq yoxdur';

  @override
  String get wishlistAlertsEmptyBody =>
      'Məhsul səhifəsində \"Gələndə xəbər ver\" və ya \"Qiymət düşəndə xəbər ver\" seçin.';

  @override
  String get wishlistAlertBackInStock => 'Stoka qayıdanda';

  @override
  String get wishlistAlertPriceDrop => 'Qiymət düşəndə';

  @override
  String wishlistAlertNotified(String date) {
    return '$date xəbər verildi';
  }
}
