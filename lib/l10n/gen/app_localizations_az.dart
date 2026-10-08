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
  String get authWelcomeTitle => 'HOO-ya xoş gəlmisiniz';

  @override
  String get authWelcomeBody =>
      'Bakıda hazırlanan premium streetwear. Daxil olun və ya qonaq kimi davam edin.';

  @override
  String get authWelcomeGuest => 'Qonaq kimi davam et';

  @override
  String get authSignInTitle => 'Daxil ol';

  @override
  String get authSignInSubtitle =>
      'Hesabınıza e-poçt və ya telefon ilə daxil olun.';

  @override
  String get authIdentifierLabel => 'E-poçt və ya telefon';

  @override
  String get authPasswordLabel => 'Parol';

  @override
  String get authPasswordHint => 'Ən azı 8 simvol, rəqəm və xüsusi simvol ilə';

  @override
  String get authForgotLink => 'Parolu unutmusunuz?';

  @override
  String get authSignInSubmit => 'Daxil ol';

  @override
  String get authSignInWithSms => 'SMS kodu ilə daxil ol';

  @override
  String get authOr => 'və ya';

  @override
  String get authContinueWithGoogle => 'Google ilə davam et';

  @override
  String get authContinueWithApple => 'Apple ilə davam et';

  @override
  String get authSocialFailed => 'Daxil olmaq alınmadı. Yenidən cəhd edin.';

  @override
  String get authTermsPromptTitle => 'HOO hesabı yaradın';

  @override
  String get authTermsPromptBody =>
      'Bu hesab üçün hələ qeydiyyat yoxdur. Davam etməklə İstifadə şərtləri və Məxfilik siyasəti ilə razılaşırsınız.';

  @override
  String get authTermsPromptAccept => 'Qəbul et və davam et';

  @override
  String get authNoAccount => 'HOO-da yenisiniz?';

  @override
  String get authHaveAccount => 'Artıq hesabınız var?';

  @override
  String get authCreateAccount => 'Hesab yarat';

  @override
  String get authSignUpTitle => 'Hesab yaradın';

  @override
  String get authSignUpSubtitle =>
      'Sifarişlərinizi izləyin, sevimliləri saxlayın, dizaynlarınızı idarə edin.';

  @override
  String get authFullNameLabel => 'Ad və soyad';

  @override
  String get authEmailLabel => 'E-poçt';

  @override
  String get authPhoneLabel => 'Telefon';

  @override
  String get authAcceptTerms =>
      'İstifadə şərtləri və Məxfilik siyasəti ilə razıyam';

  @override
  String get authMarketingConsent =>
      'Yenilik və endirimlər barədə xəbər almaq istəyirəm';

  @override
  String get authErrRequired => 'Bu sahə vacibdir';

  @override
  String get authErrInvalidEmail => 'E-poçt ünvanı düzgün deyil';

  @override
  String get authErrInvalidPhone => 'Telefon nömrəsi düzgün deyil';

  @override
  String get authErrInvalidIdentifier => 'Düzgün e-poçt və ya telefon yazın';

  @override
  String get authErrWeakPassword =>
      'Parol ən azı 8 simvol, bir rəqəm və bir xüsusi simvol içərməlidir';

  @override
  String get authErrTerms => 'Davam etmək üçün şərtləri qəbul edin';

  @override
  String get authErrInvalidCode => 'Kod düzgün deyil';

  @override
  String get authOtpPhoneTitle => 'Telefonla daxil olun';

  @override
  String get authOtpPhoneBody => 'Nömrənizə 6 rəqəmli kod göndərəcəyik.';

  @override
  String get authOtpNewAccount =>
      'Bu nömrə ilə hesab yoxdur. Ad yazın və şərtləri qəbul edin.';

  @override
  String get authOtpSendSms => 'SMS ilə kod göndər';

  @override
  String get authOtpSendWhatsapp => 'WhatsApp ilə göndər';

  @override
  String get authOtpCodeTitle => 'Kodu daxil edin';

  @override
  String authOtpCodeBody(String phone) {
    return '$phone nömrəsinə göndərildi';
  }

  @override
  String authOtpResendIn(int seconds) {
    return '$seconds san sonra yenidən göndər';
  }

  @override
  String get authOtpResendSms => 'SMS ilə göndər';

  @override
  String get authOtpResendWhatsapp => 'WhatsApp ilə göndər';

  @override
  String get authOtpResent => 'Kod yenidən göndərildi';

  @override
  String get authOtpChangePhone => 'Nömrəni dəyiş';

  @override
  String get authForgotTitle => 'Parolu bərpa et';

  @override
  String get authForgotBody =>
      'E-poçt və ya telefonunuzu yazın, sizə bərpa təlimatı göndərək.';

  @override
  String get authForgotSubmit => 'Göndər';

  @override
  String get authForgotSentEmail =>
      'Hesab mövcuddursa, e-poçtunuza bərpa linki göndərildi.';

  @override
  String get authForgotSentPhone =>
      'Hesab mövcuddursa, telefonunuza kod göndərildi.';

  @override
  String get authResetEnterCode => 'Kodu daxil et';

  @override
  String get authResetTitle => 'Yeni parol';

  @override
  String get authResetCodeLabel => 'Kod';

  @override
  String get authResetNewPassword => 'Yeni parol';

  @override
  String get authResetSubmit => 'Parolu yenilə';

  @override
  String get authResetDone => 'Parol yeniləndi. Yeni parolla daxil olun.';

  @override
  String get cartTitle => 'Səbət';

  @override
  String get cartEmptyTitle => 'Səbətiniz boşdur';

  @override
  String get cartEmptyMessage =>
      'Bəyəndiyiniz məhsulları əlavə edin və ya Studio-da öz dizaynınızı yaradın.';

  @override
  String get cartEmptyCta => 'Alış-verişə başla';

  @override
  String get cartBestsellersTitle => 'Bestsellerlər';

  @override
  String get cartCompleteTheLookTitle => 'Obrazı tamamla';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'Pulsuz çatdırılma üçün daha $amount əlavə edin';
  }

  @override
  String get cartFreeDeliveryQualified => 'Afərin! Çatdırılma pulsuzdur';

  @override
  String get cartPromoTitle => 'Promo kod';

  @override
  String get cartPromoHint => 'Kodu daxil edin';

  @override
  String cartPromoApplied(String code) {
    return '$code kodu tətbiq olundu';
  }

  @override
  String get cartPromoRemoveA11y => 'Promo kodu sil';

  @override
  String get cartGiftTitle => 'Bu hədiyyədir';

  @override
  String get cartGiftSubtitle =>
      'Qablaşdırma, kart və mesajı sifariş zamanı seçəcəksiniz';

  @override
  String get cartSummaryTitle => 'Xülasə';

  @override
  String get cartDeliveryAtCheckout => 'Sifariş zamanı hesablanır';

  @override
  String get cartCheckout => 'Sifarişi rəsmiləşdir';

  @override
  String cartRemoved(String name) {
    return '$name səbətdən silindi';
  }

  @override
  String get cartUndo => 'Geri qaytar';

  @override
  String cartRemoveA11y(String name) {
    return '$name məhsulunu sil';
  }

  @override
  String get cartCustomDesign => 'Fərdi dizayn';

  @override
  String cartLeadTime(int days) {
    return '$days gün ərzində hazırlanır';
  }

  @override
  String cartStockLeft(int count) {
    return 'Cəmi $count ədəd qalıb';
  }

  @override
  String cartSize(String size) {
    return 'Ölçü $size';
  }

  @override
  String cartUnitPrice(int quantity, String price) {
    return '$quantity × $price';
  }

  @override
  String get cartFixErrors =>
      'Bəzi məhsullar diqqət tələb edir — sifarişdən əvvəl onları düzəldin və ya silin.';

  @override
  String get cartAddedTitle => 'Səbətə əlavə olundu';

  @override
  String get cartViewBag => 'Səbətə bax';

  @override
  String get cartContinueShopping => 'Alış-verişə davam et';

  @override
  String cartSubtotalWithCount(int count) {
    return 'Ara cəm · $count ədəd';
  }

  @override
  String get catalogSortNewest => 'Ən yenilər';

  @override
  String get catalogSortPriceAsc => 'Qiymət: aşağıdan yuxarı';

  @override
  String get catalogSortPriceDesc => 'Qiymət: yuxarıdan aşağı';

  @override
  String get catalogSortPopular => 'Populyar';

  @override
  String get catalogFilterTitle => 'Filtr və sıralama';

  @override
  String get catalogFilterSort => 'Sıralama';

  @override
  String get catalogFilterCategory => 'Kateqoriya';

  @override
  String get catalogFilterCollection => 'Kolleksiya';

  @override
  String get catalogFilterSize => 'Ölçü';

  @override
  String get catalogFilterColor => 'Rəng';

  @override
  String get catalogFilterFit => 'Kəsim';

  @override
  String get catalogFilterPrice => 'Qiymət';

  @override
  String get catalogFilterAvailability => 'Mövcudluq';

  @override
  String get catalogFilterInStockOnly => 'Yalnız stokda olanlar';

  @override
  String get catalogTabAll => 'Hamısı';

  @override
  String get catalogTabNew => 'Yeni';

  @override
  String get catalogTabSale => 'Endirim';

  @override
  String get catalogEmptyTitle => 'Məhsul tapılmadı';

  @override
  String get catalogEmptyMessage => 'Filtrləri dəyişin və ya təmizləyin.';

  @override
  String catalogResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count məhsul',
      one: '1 məhsul',
    );
    return '$_temp0';
  }

  @override
  String get catalogGallery3d => '3D';

  @override
  String get catalogGalleryPhotos => 'Şəkillər';

  @override
  String get catalogColor => 'Rəng';

  @override
  String get catalogSize => 'Ölçü';

  @override
  String get catalogSizeGuide => 'Ölçü cədvəli';

  @override
  String get catalogSizeLabel => 'Ölçü';

  @override
  String get catalogChest => 'Sinə';

  @override
  String get catalogLength => 'Uzunluq';

  @override
  String get catalogSleeve => 'Qol';

  @override
  String get catalogUnitCm => 'sm';

  @override
  String get catalogUnitIn => 'düym';

  @override
  String get catalogSizeUnavailable => 'Bu ölçü hazırda mövcud deyil';

  @override
  String catalogOnlyLeft(int count, String size) {
    return '$size ölçüsündən cəmi $count ədəd qalıb';
  }

  @override
  String get catalogPreorderNote =>
      'Sifarişlə hazırlanır, çatdırılma bir qədər gec ola bilər.';

  @override
  String catalogRecommendedSize(String size) {
    return 'Sizə $size ölçüsünü tövsiyə edirik';
  }

  @override
  String get catalogColorSoldOut => 'Bu rəng hazırda bitib.';

  @override
  String get catalogSizeSoldOutHint =>
      'Bəzi ölçülər bitib. Stoka düşəndə xəbər verək.';

  @override
  String get catalogNotifyMe => 'Mənə xəbər ver';

  @override
  String get catalogPriceDropAlert => 'Qiymət düşəndə xəbər ver';

  @override
  String get catalogPriceDropAlertSet => 'Qiymət düşəndə sizə xəbər verəcəyik.';

  @override
  String get catalogBackInStockAlertSet =>
      'Stoka düşəndə sizə xəbər verəcəyik.';

  @override
  String get catalogAlertSignIn => 'Xəbərdarlıq üçün hesabınıza daxil olun.';

  @override
  String catalogDeliveryPromise(int hours, int minutes, String date) {
    return '$hours saat $minutes dəq ərzində sifariş edin — $date çatdırılsın';
  }

  @override
  String get catalogCustomize => 'Bunu özünüz dizayn edin';

  @override
  String get catalogDescription => 'Təsvir';

  @override
  String get catalogSizeAndFit => 'Ölçü və kəsim';

  @override
  String get catalogFabricAndCare => 'Parça və qulluq';

  @override
  String get catalogReviews => 'Rəylər';

  @override
  String catalogReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rəy',
      one: '1 rəy',
    );
    return '$_temp0';
  }

  @override
  String get catalogCompleteTheLook => 'Görünüşü tamamla';

  @override
  String get catalogYouMayAlsoLike => 'Sizə maraqlı ola bilər';

  @override
  String get catalogAddToBag => 'Səbətə at';

  @override
  String get catalogSelectSize => 'Ölçü seçin';

  @override
  String get catalogSoldOut => 'Bitib';

  @override
  String get catalogPreorder => 'Əvvəlcədən sifariş et';

  @override
  String get catalogWriteReview => 'Rəy yaz';

  @override
  String get catalogReviewSignIn => 'Rəy yazmaq üçün daxil olun.';

  @override
  String get catalogNoReviewsTitle => 'Hələ rəy yoxdur';

  @override
  String get catalogNoReviewsMessage =>
      'Sifarişiniz çatdırıldıqdan sonra ilk rəyi siz yaza bilərsiniz.';

  @override
  String get catalogYourRating => 'Qiymətiniz';

  @override
  String get catalogRatingRequired => 'Qiymət seçin';

  @override
  String get catalogReviewTitle => 'Başlıq';

  @override
  String get catalogReviewBody => 'Rəyiniz';

  @override
  String catalogReviewBodyShort(int min) {
    return 'Ən azı $min simvol yazın';
  }

  @override
  String get catalogReviewModeration =>
      'Rəylər yoxlanıldıqdan sonra dərc olunur.';

  @override
  String get catalogReviewSubmit => 'Göndər';

  @override
  String get catalogReviewThanks =>
      'Təşəkkürlər! Rəyiniz yoxlanışa göndərildi.';

  @override
  String get checkoutTitle => 'Sifarişin rəsmiləşdirilməsi';

  @override
  String get checkoutContactTitle => 'Əlaqə';

  @override
  String get checkoutContactSubtitle =>
      'Sifariş barədə sizə bu nömrədən zəng və ya mesaj edəcəyik.';

  @override
  String get checkoutFullName => 'Ad və soyad';

  @override
  String get checkoutPhone => 'Telefon';

  @override
  String get checkoutEmail => 'E-poçt';

  @override
  String get checkoutEmailHelper => 'Qəbz bu ünvana göndəriləcək';

  @override
  String get checkoutGiftTitle => 'Hədiyyə';

  @override
  String get checkoutGiftToggle => 'Bu bir hədiyyədir';

  @override
  String get checkoutGiftToggleSubtitle =>
      'Qablaşdırma, təbrik kartı və qiymətləri gizlətmə.';

  @override
  String get checkoutNoGift => 'Hədiyyə deyil';

  @override
  String checkoutGiftFor(String name) {
    return '$name üçün hədiyyə';
  }

  @override
  String get checkoutRecipientName => 'Alıcının adı';

  @override
  String get checkoutRecipientPhone => 'Alıcının telefonu';

  @override
  String get checkoutOccasion => 'Səbəb';

  @override
  String get checkoutSurprise => 'Sürpriz';

  @override
  String get checkoutSurpriseHint => 'Alıcıya sifariş barədə məlumat getməsin.';

  @override
  String get checkoutHidePrices => 'Qiymətləri gizlət';

  @override
  String get checkoutPackaging => 'Qablaşdırma';

  @override
  String get checkoutLowStock => 'Az qalıb';

  @override
  String get checkoutGreetingCard => 'Təbrik kartı';

  @override
  String get checkoutCardMessage => 'Kart mətni';

  @override
  String checkoutMessageCounter(int count, int max) {
    return '$count / $max';
  }

  @override
  String get checkoutFromName => 'İmza';

  @override
  String get checkoutDeliveryTitle => 'Çatdırılma';

  @override
  String get checkoutDeliveryGiftNote => 'Hədiyyədə ünvan alıcınındır.';

  @override
  String checkoutEtaDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
      one: '1 gün',
    );
    return '$_temp0';
  }

  @override
  String checkoutEtaRange(int min, int max) {
    return '$min–$max gün';
  }

  @override
  String checkoutReadyIn(int hours) {
    return '$hours saata hazır olur';
  }

  @override
  String get checkoutAddressTitle => 'Çatdırılma ünvanı';

  @override
  String get checkoutNewAddress => 'Yeni ünvan';

  @override
  String get checkoutCity => 'Şəhər';

  @override
  String get checkoutDistrict => 'Rayon';

  @override
  String get checkoutStreet => 'Küçə və ev';

  @override
  String get checkoutApartment => 'Mənzil';

  @override
  String get checkoutCourierNote => 'Kuryer üçün qeyd';

  @override
  String get checkoutSlotTitle => 'Çatdırılma vaxtı';

  @override
  String get checkoutSlotSubtitle => 'Sizə uyğun gün və aralığı seçin.';

  @override
  String checkoutSlotsLeft(int count) {
    return '$count yer qalıb';
  }

  @override
  String get checkoutSlotFull => 'Dolub';

  @override
  String get checkoutNoSlots => 'Hazırda boş vaxt yoxdur';

  @override
  String get checkoutPaymentTitle => 'Ödəniş';

  @override
  String get checkoutReviewTitle => 'Yoxlama';

  @override
  String get checkoutAcceptTerms =>
      'İstifadə şərtləri, Məxfilik və Qaytarma siyasəti ilə razıyam';

  @override
  String get checkoutImageRights =>
      'Yüklədiyim şəkillərin hüquqlarının mənə məxsus olduğunu təsdiq edirəm';

  @override
  String get checkoutSaveCard => 'Kartı növbəti alış üçün yadda saxla';

  @override
  String get checkoutPayNow => 'İndi ödə';

  @override
  String get checkoutPlaceOrder => 'Sifarişi təsdiqlə';

  @override
  String get checkoutPlacing => 'Sifarişiniz hazırlanır…';

  @override
  String get checkoutPlacingHint => 'Bu bir neçə saniyə çəkə bilər.';

  @override
  String get checkoutSessionRefreshed =>
      'Sessiya yeniləndi, seçimləriniz saxlanıldı.';

  @override
  String get checkoutPaymentWaitingTitle => 'Ödəniş yoxlanılır';

  @override
  String checkoutPaymentWaitingBody(String number) {
    return '$number sifarişi üçün ödəniş səhifəsini tamamlayın. Nəticəni avtomatik yoxlayırıq.';
  }

  @override
  String get checkoutPaymentStillProcessing =>
      'Ödəniş hələ təsdiqlənməyib. Bir az sonra yoxlayın.';

  @override
  String get checkoutPaymentCheckNow => 'İndi yoxla';

  @override
  String get checkoutPaymentReopen => 'Ödəniş səhifəsini aç';

  @override
  String get checkoutPaymentFailedTitle => 'Ödəniş alınmadı';

  @override
  String get checkoutPaymentFailedBody =>
      'Kartdan vəsait çıxılmayıb. Yenidən cəhd edə bilərsiniz.';

  @override
  String get checkoutPaymentTryAgain => 'Yenidən cəhd et';

  @override
  String get checkoutPayOnDelivery => 'Qapıda ödə';

  @override
  String get checkoutViewOrder => 'Sifarişə bax';

  @override
  String get checkoutConfirmedTitle => 'Təşəkkür edirik!';

  @override
  String checkoutConfirmedNumber(String number) {
    return 'Sifariş № $number';
  }

  @override
  String get checkoutConfirmedBody =>
      'Sifarişiniz qəbul olundu. Statusu sifariş səhifəsində izləyə bilərsiniz.';

  @override
  String get checkoutGiftReceipt => 'Hədiyyə qəbzi kodu';

  @override
  String get checkoutGiftReceiptHint => 'Alıcı bu kodla dəyişdirmə edə bilər.';

  @override
  String get homeHeroTitle => 'Yeni kolleksiya yoldadır';

  @override
  String get homeHeroCta => 'Yeniliklərə bax';

  @override
  String get homeDesignTitle => 'Özünüz dizayn edin';

  @override
  String get homeDesignBody =>
      'Modeli seçin, mətn və şəkil əlavə edin, 3D-də görün.';

  @override
  String get homeNewArrivals => 'Yeni gələnlər';

  @override
  String get homeCategories => 'Kateqoriyalar';

  @override
  String get homeCollections => 'Kolleksiyalar';

  @override
  String get homeShopTheLook => 'Görünüşü al';

  @override
  String get homeBestsellers => 'Ən çox satılanlar';

  @override
  String get homeRecentlyViewed => 'Son baxdıqlarınız';

  @override
  String get homeEmptyTitle => 'Tezliklə yeni məhsullar';

  @override
  String get homeEmptyMessage => 'Bir az sonra yenidən yoxlayın.';

  @override
  String get launchComingSoonEyebrow => 'Tezliklə';

  @override
  String launchComingSoonOpensOn(String date) {
    return '$date açılır';
  }

  @override
  String get launchComingSoonFallbackTitle => 'Yeni HOO yoldadır';

  @override
  String get launchComingSoonFallbackSubtitle =>
      'Bakıda tikilən premium streetwear. Açılışı ilk siz bilin.';

  @override
  String get launchCountdownDays => 'gün';

  @override
  String get launchCountdownHours => 'saat';

  @override
  String get launchCountdownMinutes => 'dəq';

  @override
  String get launchCountdownSeconds => 'san';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return 'Açılışa $days gün, $hours saat, $minutes dəqiqə qalıb';
  }

  @override
  String get launchWaitlistTitle => 'Gözləmə siyahısına qoşul';

  @override
  String get launchWaitlistBody =>
      'Açılış günü ilk siz xəbər tutun və erkən giriş əldə edin.';

  @override
  String get launchWaitlistField => 'E-poçt və ya telefon';

  @override
  String get launchWaitlistJoin => 'Qoşul';

  @override
  String launchWaitlistJoined(int position, int total) {
    return 'Siz $total nəfər arasında #$position sıradasınız';
  }

  @override
  String launchWaitlistAlready(int position, int total) {
    return 'Siz artıq siyahıdasınız: $total nəfər arasında #$position';
  }

  @override
  String launchWaitlistCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString nəfər artıq gözləyir',
      one: '1 nəfər artıq gözləyir',
    );
    return '$_temp0';
  }

  @override
  String launchWaitlistToday(int count) {
    return 'bu gün +$count';
  }

  @override
  String get launchNewsletterTitle => 'Bülleten';

  @override
  String get launchNewsletterBody =>
      'Yeni droplar, kolleksiyalar və təkliflər — birbaşa e-poçtunuza.';

  @override
  String get launchNewsletterField => 'E-poçt';

  @override
  String get launchNewsletterSubscribe => 'Abunə ol';

  @override
  String get launchNewsletterDone => 'Abunə oldunuz. Təşəkkürlər!';

  @override
  String get launchNewsletterAlready => 'Bu e-poçt artıq abunədir.';

  @override
  String get launchFollow => 'Bizi izləyin';

  @override
  String launchOpenLink(String name) {
    return '$name açın';
  }

  @override
  String get launchCannotOpenLink => 'Linki açmaq mümkün olmadı.';

  @override
  String get launchContactEmail => 'E-poçt';

  @override
  String get launchContactPhone => 'Telefon';

  @override
  String get launchStaffSignIn => 'Əməkdaş girişi';

  @override
  String get launchStaffNoAccess => 'Bu hesabın əməkdaş girişi yoxdur.';

  @override
  String get launchStoreOpenTitle => 'Mağaza açıldı';

  @override
  String get launchEnterStore => 'Mağazaya keç';

  @override
  String launchRetryIn(String time) {
    return '$time sonra yenidən cəhd edin';
  }

  @override
  String get launchLanguage => 'Dil';

  @override
  String get launchOnboardingLanguageTitle => 'Dilinizi seçin';

  @override
  String get launchOnboardingLanguageBody =>
      'Dili istənilən vaxt Parametrlərdə dəyişə bilərsiniz.';

  @override
  String get launchOnboardingSkip => 'Keç';

  @override
  String get launchOnboardingStart => 'Başla';

  @override
  String get launchOnboardingSlide1Eyebrow => 'Bakıdan';

  @override
  String get launchOnboardingSlide1Title => 'Sakit. Əmin. HOO.';

  @override
  String get launchOnboardingSlide1Body =>
      'Hudilər, futbolkalar və sviterlər — premium parçalar, minimal dizayn, Bakıda tikilir.';

  @override
  String get launchOnboardingSlide2Eyebrow => 'Studio';

  @override
  String get launchOnboardingSlide2Title => 'Öz dizaynını yarat';

  @override
  String get launchOnboardingSlide2Body =>
      'Geyimi və rəngi seç, mətn və şəkil əlavə et, 3D-də bax — qiymət dərhal hesablanır.';

  @override
  String get launchOnboardingSlide3Eyebrow => 'Çatdırılma';

  @override
  String get launchOnboardingSlide3Title => 'Bakıda sürətli çatdırılma';

  @override
  String get launchOnboardingSlide3Body =>
      'Kuryer seçdiyiniz vaxt aralığında gəlir. Sifarişinizi addım-addım izləyin.';

  @override
  String get ordersTitle => 'Sifarişlərim';

  @override
  String get ordersEmptyTitle => 'Hələ sifariş yoxdur';

  @override
  String get ordersEmptyMessage => 'İlk sifarişiniz burada görünəcək.';

  @override
  String get ordersNoMatch => 'Bu filtrə uyğun sifariş yoxdur';

  @override
  String get ordersFilterAll => 'Hamısı';

  @override
  String get ordersFilterActive => 'Aktiv';

  @override
  String get ordersFilterDelivered => 'Çatdırılıb';

  @override
  String get ordersFilterClosed => 'Bağlanıb';

  @override
  String get ordersMyReturns => 'Qaytarmalarım';

  @override
  String get ordersTimeline => 'Sifariş tarixçəsi';

  @override
  String get ordersItems => 'Məhsullar';

  @override
  String get ordersCustomDesign => 'Fərdi dizayn';

  @override
  String get ordersNonReturnable => 'Qaytarılmır';

  @override
  String get ordersRefresh => 'Yenilə';

  @override
  String get ordersRecipientView =>
      'Hədiyyə alıcısı kimi baxırsınız. Qiymətlər gizlədilə bilər.';

  @override
  String get ordersPayPrompt => 'Ödəniş tamamlanmayıb.';

  @override
  String get ordersPayAgain => 'Yenidən ödə';

  @override
  String get ordersPaymentSucceeded => 'Ödəniş uğurla tamamlandı';

  @override
  String get ordersChangeSlot => 'Çatdırılma vaxtını dəyiş';

  @override
  String get ordersSlotChanged => 'Çatdırılma vaxtı dəyişdirildi';

  @override
  String get ordersSlotCurrent => 'Hazırkı';

  @override
  String get ordersSlotUnavailable =>
      'Bu sifariş üçün vaxt dəyişmək mümkün deyil';

  @override
  String ordersCourier(String name) {
    return 'Kuryer: $name';
  }

  @override
  String ordersCourierEta(int minutes) {
    return 'təxmini $minutes dəq';
  }

  @override
  String ordersCourierStops(int count) {
    return '$count dayanacaq qalıb';
  }

  @override
  String get ordersContactWhatsApp => 'WhatsApp ilə yaz';

  @override
  String get ordersRequestReturn => 'Qaytarma və ya dəyişdirmə';

  @override
  String get ordersEventPlaced => 'Sifariş qəbul edildi';

  @override
  String get ordersEventPaymentCaptured => 'Ödəniş alındı';

  @override
  String get ordersEventPaymentFailed => 'Ödəniş alınmadı';

  @override
  String get ordersEventCourierAssigned => 'Kuryer təyin olundu';

  @override
  String get ordersEventCourierEta => 'Çatdırılma vaxtı yeniləndi';

  @override
  String get ordersEventSlotChanged => 'Çatdırılma vaxtı dəyişdi';

  @override
  String get ordersEventRefund => 'Geri ödəniş edildi';

  @override
  String get ordersEventReturnRequested => 'Qaytarma sorğusu göndərildi';

  @override
  String get ordersEventReturnUpdated => 'Qaytarma yeniləndi';

  @override
  String get ordersEventDesignApproved => 'Dizayn təsdiqləndi';

  @override
  String get ordersReturnsTitle => 'Qaytarmalar';

  @override
  String get ordersReturnsEmptyTitle => 'Qaytarma yoxdur';

  @override
  String get ordersReturnsEmptyMessage =>
      'Qaytarma və dəyişdirmə sorğularınız burada görünəcək.';

  @override
  String get ordersReturnKindReturn => 'Qaytarma';

  @override
  String get ordersReturnKindExchange => 'Dəyişdirmə';

  @override
  String get ordersReturnPick => 'Məhsulları seçin';

  @override
  String get ordersReturnNewSize => 'Yeni ölçü';

  @override
  String get ordersReturnReason => 'Səbəb';

  @override
  String get ordersReturnSubmit => 'Sorğunu göndər';

  @override
  String get ordersReturnNoItems => 'Ən azı bir məhsul seçin';

  @override
  String get ordersReturnSizeMissing => 'Dəyişdirmə üçün yeni ölçü seçin';

  @override
  String get ordersReturnSameSize => 'Yeni ölçü hazırkından fərqli olmalıdır';

  @override
  String get ordersReturnReasonLong => 'Səbəb çox uzundur';

  @override
  String get ordersReturnNotAvailable =>
      'Bu sifariş üçün qaytarma mümkün deyil';

  @override
  String get ordersReturnNotAvailableHint =>
      'Qaytarma müddəti bitib və ya məhsullar qaytarıla bilməz.';

  @override
  String get ordersReturnSent => 'Sorğu göndərildi';

  @override
  String get ordersReturnSentBody =>
      'Statusu Qaytarmalar bölməsində izləyə bilərsiniz.';

  @override
  String get ordersTrackTitle => 'Sifarişi izlə';

  @override
  String get ordersTrackSubtitle =>
      'Sifariş nömrəsini və sifariş zamanı yazdığınız telefonu daxil edin.';

  @override
  String get ordersOrderNumber => 'Sifariş nömrəsi';

  @override
  String get ordersTrackCta => 'İzlə';

  @override
  String get ordersGiftSubtitle =>
      'Hədiyyə qəbzi kodunu və telefon nömrənizi daxil edin.';

  @override
  String get ordersGiftCode => 'Qəbz kodu';

  @override
  String get ordersGiftOpen => 'Hədiyyəyə bax';

  @override
  String ordersGiftFor(String name) {
    return '$name üçün hədiyyə';
  }

  @override
  String ordersGiftFrom(String name) {
    return '$name tərəfindən';
  }

  @override
  String get ordersGiftExchange => 'Ölçünü dəyiş';

  @override
  String get ordersGiftExchangeClosed =>
      'Bu hədiyyə üçün dəyişdirmə müddəti bitib.';

  @override
  String ordersGiftExchangeUntil(String date) {
    return '$date tarixinədək dəyişə bilərsiniz';
  }

  @override
  String get profileSignedOutTitle => 'Hesabınıza daxil olun';

  @override
  String get profileSignedOutBody =>
      'Sifarişləri, sevimliləri və dizaynları bir yerdə saxlayın.';

  @override
  String profileGreeting(String name) {
    return 'Salam, $name';
  }

  @override
  String get profileTrackOrder => 'Sifarişi izlə';

  @override
  String get profileOrders => 'Sifarişlər';

  @override
  String get profileDesigns => 'Dizaynlar';

  @override
  String get profileWishlist => 'Sevimlilər';

  @override
  String get profileGroupShopping => 'Alış-veriş';

  @override
  String get profileGroupAccount => 'Hesab';

  @override
  String get profileGroupMore => 'Daha çox';

  @override
  String profileActiveOrders(int count) {
    return '$count aktiv sifariş';
  }

  @override
  String get profilePersonalInfo => 'Şəxsi məlumatlar';

  @override
  String get profileAddresses => 'Ünvanlar';

  @override
  String get profileSavedCards => 'Saxlanılmış kartlar';

  @override
  String get profileStyleProfile => 'Stil profili';

  @override
  String get profileStyleProfileHint => 'Ölçü seçimini asanlaşdırın';

  @override
  String get profileNotifications => 'Bildirişlər';

  @override
  String get profileChangePassword => 'Parolu dəyiş';

  @override
  String get profileActiveDevices => 'Aktiv cihazlar';

  @override
  String get profileSettings => 'Tənzimləmələr';

  @override
  String get profileHelp => 'Kömək';

  @override
  String get profileSignOutTitle => 'Hesabdan çıxmaq istəyirsiniz?';

  @override
  String get profileSignOutMessage => 'Səbətiniz bu cihazda qalacaq.';

  @override
  String get profileNameTooLong => 'Ad çox uzundur';

  @override
  String get profileLanguage => 'Dil';

  @override
  String get profileAppearance => 'Görünüş';

  @override
  String get profileThemeSystem => 'Sistem';

  @override
  String get profileThemeLight => 'Açıq';

  @override
  String get profileThemeDark => 'Tünd';

  @override
  String get profileCurrentPassword => 'Cari parol';

  @override
  String get profileConfirmPassword => 'Yeni parolu təkrarlayın';

  @override
  String get profilePasswordMismatch => 'Parollar uyğun gəlmir';

  @override
  String get profilePasswordChanged => 'Parol dəyişdirildi';

  @override
  String get profileAddressesEmptyTitle => 'Ünvan yoxdur';

  @override
  String get profileAddressesEmptyMessage =>
      'Ünvan əlavə edin, ödənişdə vaxta qənaət edin.';

  @override
  String get profileAddressAdd => 'Ünvan əlavə et';

  @override
  String get profileAddressEdit => 'Ünvanı redaktə et';

  @override
  String get profileAddressDeleteTitle => 'Ünvan silinsin?';

  @override
  String get profileAddressLabel => 'Ad (məs. Ev)';

  @override
  String get profileBuilding => 'Bina';

  @override
  String get profileDefault => 'Əsas';

  @override
  String get profileMakeDefault => 'Əsas ünvan et';

  @override
  String get profileFieldTooLong => 'Çox uzundur';

  @override
  String get profileCardsEmptyTitle => 'Saxlanılmış kart yoxdur';

  @override
  String get profileCardsEmptyMessage => 'Ödəniş zamanı “Kartı saxla” seçin.';

  @override
  String get profileCardDeleteTitle => 'Kart silinsin?';

  @override
  String profileCardAdded(String date) {
    return 'Əlavə edilib: $date';
  }

  @override
  String get profileThisDevice => 'Bu cihaz';

  @override
  String get profileUnknownDevice => 'Naməlum cihaz';

  @override
  String get profileSignOutDevice => 'Çıxış';

  @override
  String get profileSignOutOthers => 'Digər cihazlardan çıx';

  @override
  String get profileNotificationRequired => 'Sifariş üçün vacibdir';

  @override
  String get profileStyleIntro =>
      'İstəyə bağlıdır. Ölçü seçimini və tövsiyələri sizə uyğunlaşdırırıq.';

  @override
  String get profileStyleHeight => 'Boy (sm)';

  @override
  String get profileStyleWeight => 'Çəki (kq)';

  @override
  String get profileStyleChest => 'Sinə (sm)';

  @override
  String get profileStyleWaist => 'Bel (sm)';

  @override
  String profileStyleRange(int min, int max) {
    return '$min–$max arası';
  }

  @override
  String get profileStyleUsualSize => 'Adətən geydiyiniz ölçü';

  @override
  String get profileStyleFit => 'Sevdiyiniz kəsim';

  @override
  String get profileStyleColors => 'Sevimli rənglər';

  @override
  String profileStyleColorLimit(int count) {
    return 'Ən çox $count rəng seçə bilərsiniz';
  }

  @override
  String get profileStyleStyles => 'Üslub';

  @override
  String get profileStyleSkip => 'Keç';

  @override
  String get profileHelpContact => 'Bizimlə əlaqə';

  @override
  String get profileHelpCall => 'Zəng et';

  @override
  String get profileHelpWhatsApp => 'WhatsApp-da yaz';

  @override
  String get profileHelpEmail => 'E-poçt göndər';

  @override
  String get profileHelpFaq => 'Tez-tez verilən suallar';

  @override
  String get profileFaqDeliveryQ => 'Çatdırılma nə qədər çəkir?';

  @override
  String get profileFaqDeliveryA =>
      'Bakıda sifariş etdiyiniz vaxtdan asılı olaraq ertəsi gün seçdiyiniz vaxt aralığında çatdırırıq. Fərdi dizaynlar istehsal müddəti qədər gec ola bilər.';

  @override
  String get profileFaqReturnsQ => 'Qaytarma və dəyişdirmə';

  @override
  String get profileFaqReturnsA =>
      'Çatdırılmadan sonra müəyyən müddət ərzində sifariş səhifəsindən qaytarma və ya ölçü dəyişdirmə sorğusu göndərə bilərsiniz. Fərdi dizaynlar qaytarılmır.';

  @override
  String get profileFaqPaymentQ => 'Hansı ödəniş üsulları var?';

  @override
  String get profileFaqPaymentA =>
      'Bank kartı (3-D Secure), Apple Pay, Google Pay və Bakıda qapıda nağd ödəniş.';

  @override
  String get profileFaqCustomQ => 'Fərdi dizayn necə işləyir?';

  @override
  String get profileFaqCustomA =>
      'Studio-da modeli seçin, mətn və şəkil əlavə edin, qiyməti dərhal görün. Sifarişdən sonra komandamız dizaynı yoxlayıb təsdiqləyir.';

  @override
  String get searchHint => 'Axtar: hudi, tişört, dizayn…';

  @override
  String get searchClearA11y => 'Axtarışı təmizlə';

  @override
  String get searchRecentTitle => 'Son axtarışlar';

  @override
  String get searchBestsellersTitle => 'Ən çox satılanlar';

  @override
  String searchFor(String query) {
    return '“$query” üçün axtar';
  }

  @override
  String searchNoResultsTitle(String query) {
    return '“$query” üçün nəticə yoxdur';
  }

  @override
  String get searchNoResultsMessage =>
      'Yazılışı yoxlayın və ya daha qısa söz yazın.';

  @override
  String get searchMayLikeTitle => 'Bəyənə bilərsiniz';

  @override
  String searchResultsCount(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nəticə',
      one: '1 nəticə',
    );
    return '“$query” üçün $_temp0';
  }

  @override
  String searchFillA11y(String text) {
    return '“$text” axtarış sahəsinə yaz';
  }

  @override
  String get searchDesignYourOwnTitle => 'Özünüz dizayn edin';

  @override
  String get searchDesignYourOwnBody =>
      'Studio-da modeli seçin, mətn və şəkil əlavə edin.';

  @override
  String get wishlistTitle => 'Sevimlilər';

  @override
  String get wishlistRemoved => 'Sevimlilərdən silindi';

  @override
  String get wishlistUndo => 'Geri al';

  @override
  String get wishlistMovedToBag => 'Səbətə əlavə olundu';

  @override
  String get wishlistMoveToBag => 'Səbətə at';

  @override
  String get wishlistSoldOut => 'Bitib';

  @override
  String get wishlistEmptyTitle => 'Sevimlilər boşdur';

  @override
  String get wishlistEmptyMessage =>
      'Ürək işarəsinə toxunaraq bəyəndiyiniz məhsulları saxlayın.';

  @override
  String get wishlistEmptyCta => 'Alış-verişə başla';

  @override
  String get wishlistChooseSize => 'Ölçü seçin';

  @override
  String wishlistSharedTitle(String name) {
    return '$name adlı istifadəçinin siyahısı';
  }

  @override
  String get wishlistSharedEmpty => 'Bu siyahı boşdur';

  @override
  String get wishlistAlertsTitle => 'Xəbərdarlıqlar';

  @override
  String get wishlistAlertsEmptyTitle => 'Xəbərdarlıq yoxdur';

  @override
  String get wishlistAlertsEmptyMessage =>
      'Məhsul səhifəsində “Mənə xəbər ver” seçin.';

  @override
  String get wishlistAlertsPriceDrop => 'Qiymət düşəndə';

  @override
  String get wishlistAlertsBackInStock => 'Stoka düşəndə';

  @override
  String wishlistAlertsNotified(String date) {
    return 'Xəbər verildi: $date';
  }

  @override
  String get wishlistAlertsWaiting => 'Gözlənilir';
}
