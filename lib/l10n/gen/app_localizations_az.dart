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
}
