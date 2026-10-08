// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'HOO';

  @override
  String get navHome => 'Ana sayfa';

  @override
  String get navShop => 'Mağaza';

  @override
  String get navStudio => 'Stüdyo';

  @override
  String get navBag => 'Sepet';

  @override
  String get navProfile => 'Profil';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonSeeAll => 'Tümünü gör';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonSaved => 'Kaydedildi';

  @override
  String get commonSaving => 'Kaydediliyor…';

  @override
  String get commonDone => 'Tamam';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonContinue => 'Devam et';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonNext => 'İleri';

  @override
  String get commonApply => 'Uygula';

  @override
  String get commonClear => 'Temizle';

  @override
  String get commonClearAll => 'Tümünü temizle';

  @override
  String get commonRemove => 'Kaldır';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonShare => 'Paylaş';

  @override
  String get commonConfirm => 'Onayla';

  @override
  String get commonYes => 'Evet';

  @override
  String get commonNo => 'Hayır';

  @override
  String get commonOk => 'Tamam';

  @override
  String get commonOptional => 'isteğe bağlı';

  @override
  String get commonSearch => 'Ara';

  @override
  String get commonFilter => 'Filtre';

  @override
  String get commonSort => 'Sırala';

  @override
  String get commonShowMore => 'Daha fazla';

  @override
  String get commonShowLess => 'Daha az';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonCopied => 'Kopyalandı';

  @override
  String get commonSignIn => 'Giriş yap';

  @override
  String get commonSignOut => 'Çıkış yap';

  @override
  String get commonCreateAccount => 'Hesap oluştur';

  @override
  String get commonContinueAsGuest => 'Misafir olarak devam et';

  @override
  String get commonLearnMore => 'Daha fazla bilgi';

  @override
  String get commonTotal => 'Toplam';

  @override
  String get commonFree => 'Ücretsiz';

  @override
  String commonDays(int min, int max) {
    return '$min–$max gün';
  }

  @override
  String commonPieces(int count) {
    return '$count adet';
  }

  @override
  String get errorGeneric =>
      'Bir şeyler ters gitti. Lütfen birazdan tekrar deneyin.';

  @override
  String get errorNetwork => 'İnternet bağlantısı yok. Ağınızı kontrol edin.';

  @override
  String get errorNotFound => 'Bulunamadı';

  @override
  String errorTooManyRequests(int seconds) {
    return 'Çok fazla deneme. $seconds sn sonra tekrar deneyin.';
  }

  @override
  String get errorExternal =>
      'Hizmet geçici olarak kullanılamıyor. Birazdan tekrar deneyin.';

  @override
  String get errorConflict => 'Bilgiler değişti. Sizin için yeniledik.';

  @override
  String get errorSessionExpired =>
      'Oturumunuz sona erdi. Lütfen tekrar giriş yapın.';

  @override
  String get fieldRequired => 'Bu alan zorunludur';

  @override
  String get fieldInvalidEmail => 'Geçerli bir e-posta girin';

  @override
  String get fieldInvalidPhone => '+994 XX XXX XX XX formatını kullanın';

  @override
  String get fieldPasswordRule => 'En az 8 karakter, bir rakam ve bir sembol';

  @override
  String get stateEmptyTitle => 'Burada henüz bir şey yok';

  @override
  String get stateOffline => 'Çevrimdışısınız — kayıtlı veriler gösteriliyor';

  @override
  String get stateLoading => 'Yükleniyor…';

  @override
  String get badgeNew => 'YENİ';

  @override
  String get badgeNewDrop => 'YENİ DROP';

  @override
  String get badgeBestseller => 'ÇOK SATAN';

  @override
  String get badgeSale => 'İNDİRİM';

  @override
  String discountPercent(int percent) {
    return '-%$percent';
  }

  @override
  String get a11yAddToWishlist => 'Favorilere ekle';

  @override
  String get a11yRemoveFromWishlist => 'Favorilerden çıkar';

  @override
  String get a11yIncrease => 'Arttır';

  @override
  String get a11yDecrease => 'Azalt';

  @override
  String a11yQuantity(int count) {
    return 'Adet: $count';
  }

  @override
  String a11yColor(String name) {
    return 'Renk: $name';
  }

  @override
  String get a11ySelected => 'seçili';

  @override
  String get a11yUnavailable => 'mevcut değil';

  @override
  String a11yRating(String rating) {
    return '5 üzerinden $rating puan';
  }

  @override
  String get a11yClose => 'Kapat';

  @override
  String get a11yBack => 'Geri';

  @override
  String a11yBag(int count) {
    return 'Sepet, $count ürün';
  }

  @override
  String get a11yShowPassword => 'Şifreyi göster';

  @override
  String get a11yHidePassword => 'Şifreyi gizle';

  @override
  String get a11yLogo => 'HOO';

  @override
  String stepOf(int current, int total) {
    return 'Adım $current / $total';
  }

  @override
  String get summaryTotal => 'Toplam';

  @override
  String get summarySubtotal => 'Ara toplam';

  @override
  String get summaryDiscount => 'İndirim';

  @override
  String get summaryDelivery => 'Teslimat';

  @override
  String get summaryGiftPackaging => 'Hediye paketi';

  @override
  String get summaryGreetingCard => 'Tebrik kartı';

  @override
  String summaryVatIncluded(String amount) {
    return 'KDV dahil: $amount';
  }

  @override
  String get summaryShowBreakdown => 'Ayrıntıları göster';

  @override
  String get summaryUpdating => 'Fiyat güncelleniyor';

  @override
  String get authGateTitle => 'Devam etmek için giriş yapın';

  @override
  String get authGateBody =>
      'Favorileriniz, yorumlarınız, adresleriniz ve tasarımlarınız hesabınızda saklanır.';

  @override
  String get orderStatusNew => 'Yeni';

  @override
  String get orderStatusPaid => 'Ödendi';

  @override
  String get orderStatusAwaitingApproval => 'Tasarım onayı bekleniyor';

  @override
  String get orderStatusInProduction => 'Üretimde';

  @override
  String get orderStatusPacked => 'Paketlendi';

  @override
  String get orderStatusOutForDelivery => 'Yolda';

  @override
  String get orderStatusReadyForPickup => 'Teslim almaya hazır';

  @override
  String get orderStatusDelivered => 'Teslim edildi';

  @override
  String get orderStatusCancelled => 'İptal edildi';

  @override
  String get orderStatusReturnRequested => 'İade talep edildi';

  @override
  String get orderStatusReturned => 'İade edildi';

  @override
  String get orderStatusRefunded => 'Ücret iade edildi';

  @override
  String get designStatusDraft => 'Taslak';

  @override
  String get designStatusSubmitted => 'Gönderildi';

  @override
  String get designStatusChangesRequested => 'Değişiklik istendi';

  @override
  String get designStatusApproved => 'Onaylandı';

  @override
  String get designStatusInProduction => 'Üretimde';

  @override
  String get designStatusReady => 'Hazır';

  @override
  String get designStatusCancelled => 'İptal edildi';

  @override
  String get paymentStatusPending => 'Bekliyor';

  @override
  String get paymentStatusCaptured => 'Ödendi';

  @override
  String get paymentStatusFailed => 'Başarısız';

  @override
  String get paymentStatusCancelled => 'İptal edildi';

  @override
  String get paymentStatusRefunded => 'İade edildi';

  @override
  String get paymentStatusPartiallyRefunded => 'Kısmen iade edildi';

  @override
  String get paymentMethodApplePay => 'Apple Pay';

  @override
  String get paymentMethodGooglePay => 'Google Pay';

  @override
  String get paymentMethodCard => 'Banka kartı';

  @override
  String get paymentMethodSavedCard => 'Kayıtlı kart';

  @override
  String get paymentMethodCashOnDelivery => 'Kapıda nakit';

  @override
  String get paymentMethodCardOnDelivery => 'Kapıda kartla';

  @override
  String get paymentMethodInvoice => 'Fatura';

  @override
  String get deliveryKindCourier => 'Kurye';

  @override
  String get deliveryKindPost => 'Posta';

  @override
  String get deliveryKindPickup => 'Mağazadan teslim';

  @override
  String get returnStatusRequested => 'Talep edildi';

  @override
  String get returnStatusApproved => 'Onaylandı';

  @override
  String get returnStatusRejected => 'Reddedildi';

  @override
  String get returnStatusReceived => 'Teslim alındı';

  @override
  String get returnStatusRefunded => 'Ücret iade edildi';

  @override
  String get returnStatusExchanged => 'Değiştirildi';

  @override
  String get returnKindReturn => 'İade';

  @override
  String get returnKindExchange => 'Değişim';

  @override
  String get occasionBirthday => 'Doğum günü';

  @override
  String get occasionAnniversary => 'Yıl dönümü';

  @override
  String get occasionNovruz => 'Nevruz';

  @override
  String get occasionNewYear => 'Yılbaşı';

  @override
  String get occasionJustBecause => 'Sebepsiz';

  @override
  String get fitOversized => 'Oversize';

  @override
  String get fitBoxy => 'Boxy';

  @override
  String get fitRegular => 'Regular';

  @override
  String get fitFitted => 'Dar kesim';

  @override
  String get fitCropped => 'Crop';

  @override
  String get productTypeHoodie => 'Kapüşonlu';

  @override
  String get productTypeZipHoodie => 'Fermuarlı kapüşonlu';

  @override
  String get productTypeTShirt => 'Tişört';

  @override
  String get productTypeSweatshirt => 'Sweatshirt';

  @override
  String get productTypeSweatpants => 'Eşofman altı';

  @override
  String get productTypeShorts => 'Şort';

  @override
  String get colorFamilyBlack => 'Siyah';

  @override
  String get colorFamilyForest => 'Orman yeşili';

  @override
  String get colorFamilyCream => 'Krem';

  @override
  String get colorFamilyWhite => 'Beyaz';

  @override
  String get colorFamilyGrey => 'Gri';

  @override
  String get colorFamilySand => 'Kum';

  @override
  String get colorFamilyOlive => 'Zeytin';

  @override
  String get colorFamilyRed => 'Kırmızı';

  @override
  String get styleTagMinimal => 'Minimal';

  @override
  String get styleTagStreetwear => 'Sokak stili';

  @override
  String get styleTagGraphicPrints => 'Grafik baskılar';

  @override
  String get styleTagMonochrome => 'Monokrom';

  @override
  String get styleTagSport => 'Spor';

  @override
  String get styleTagVintage => 'Vintage';

  @override
  String get notificationTopicOrders => 'Siparişler';

  @override
  String get notificationTopicDelivery => 'Teslimat';

  @override
  String get notificationTopicAlerts => 'Uyarılar';

  @override
  String get notificationTopicMarketing => 'Haberler ve teklifler';

  @override
  String get notificationChannelEmail => 'E-posta';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationChannelWhatsApp => 'WhatsApp';

  @override
  String get notificationChannelPush => 'Anlık bildirim';

  @override
  String get stockStateInStock => 'Stokta';

  @override
  String get stockStateLowStock => 'Az kaldı';

  @override
  String get stockStatePreorder => 'Ön sipariş';

  @override
  String get stockStateOutOfStock => 'Tükendi';

  @override
  String get stockStateMadeToOrder => 'Siparişe özel';

  @override
  String get stockStateUnavailable => 'Mevcut değil';

  @override
  String get dsTitle => 'Tasarım sistemi';

  @override
  String get dsLightDark => 'Açık / Koyu';

  @override
  String get authWelcomeTitle => 'HOO\'ya hoş geldin';

  @override
  String get authWelcomeBody =>
      'Bakü\'den premium streetwear. Giriş yap veya misafir olarak devam et.';

  @override
  String get authWelcomeGuest => 'Misafir olarak devam et';

  @override
  String get authSignInTitle => 'Giriş yap';

  @override
  String get authSignInSubtitle => 'E-posta veya telefon numaranla giriş yap.';

  @override
  String get authIdentifierLabel => 'E-posta veya telefon';

  @override
  String get authPasswordLabel => 'Şifre';

  @override
  String get authPasswordHint => 'En az 8 karakter, bir rakam ve bir sembol';

  @override
  String get authForgotLink => 'Şifreni mi unuttun?';

  @override
  String get authSignInSubmit => 'Giriş yap';

  @override
  String get authSignInWithSms => 'SMS kodu ile giriş yap';

  @override
  String get authOr => 'veya';

  @override
  String get authContinueWithGoogle => 'Google ile devam et';

  @override
  String get authContinueWithApple => 'Apple ile devam et';

  @override
  String get authSocialFailed => 'Giriş tamamlanamadı. Tekrar dene.';

  @override
  String get authTermsPromptTitle => 'HOO hesabı oluştur';

  @override
  String get authTermsPromptBody =>
      'Bu kimlik için henüz HOO hesabı yok. Devam ederek Koşullar\'ı ve Gizlilik Politikası\'nı kabul etmiş olursun.';

  @override
  String get authTermsPromptAccept => 'Kabul et ve devam et';

  @override
  String get authNoAccount => 'HOO\'da yeni misin?';

  @override
  String get authHaveAccount => 'Zaten hesabın var mı?';

  @override
  String get authCreateAccount => 'Hesap oluştur';

  @override
  String get authSignUpTitle => 'Hesabını oluştur';

  @override
  String get authSignUpSubtitle =>
      'Siparişlerini takip et, favorilerini ve tasarımlarını sakla.';

  @override
  String get authFullNameLabel => 'Ad soyad';

  @override
  String get authEmailLabel => 'E-posta';

  @override
  String get authPhoneLabel => 'Telefon';

  @override
  String get authAcceptTerms =>
      'Koşulları ve Gizlilik Politikası\'nı kabul ediyorum';

  @override
  String get authMarketingConsent =>
      'Yenilik ve fırsatlardan haberdar olmak istiyorum';

  @override
  String get authErrRequired => 'Bu alan zorunlu';

  @override
  String get authErrInvalidEmail => 'Geçerli bir e-posta gir';

  @override
  String get authErrInvalidPhone => 'Geçerli bir telefon numarası gir';

  @override
  String get authErrInvalidIdentifier => 'Geçerli bir e-posta veya telefon gir';

  @override
  String get authErrWeakPassword =>
      'En az 8 karakter, bir rakam ve bir sembol kullan';

  @override
  String get authErrTerms => 'Devam etmek için koşulları kabul et';

  @override
  String get authErrInvalidCode => 'Kod geçerli değil';

  @override
  String get authOtpPhoneTitle => 'Telefonla giriş yap';

  @override
  String get authOtpPhoneBody => 'Numarana 6 haneli bir kod göndereceğiz.';

  @override
  String get authOtpNewAccount =>
      'Bu numarayla hesap yok. Adını yaz ve koşulları kabul et.';

  @override
  String get authOtpSendSms => 'Kodu SMS ile gönder';

  @override
  String get authOtpSendWhatsapp => 'WhatsApp ile gönder';

  @override
  String get authOtpCodeTitle => 'Kodu gir';

  @override
  String authOtpCodeBody(String phone) {
    return '$phone numarasına gönderildi';
  }

  @override
  String authOtpResendIn(int seconds) {
    return '$seconds sn sonra tekrar gönder';
  }

  @override
  String get authOtpResendSms => 'SMS ile gönder';

  @override
  String get authOtpResendWhatsapp => 'WhatsApp ile gönder';

  @override
  String get authOtpResent => 'Kod tekrar gönderildi';

  @override
  String get authOtpChangePhone => 'Numarayı değiştir';

  @override
  String get authForgotTitle => 'Şifreni sıfırla';

  @override
  String get authForgotBody =>
      'E-posta veya telefonunu yaz, sıfırlama talimatını gönderelim.';

  @override
  String get authForgotSubmit => 'Gönder';

  @override
  String get authForgotSentEmail =>
      'Hesap varsa e-postana sıfırlama bağlantısı gönderdik.';

  @override
  String get authForgotSentPhone => 'Hesap varsa telefonuna bir kod gönderdik.';

  @override
  String get authResetEnterCode => 'Kodu gir';

  @override
  String get authResetTitle => 'Yeni şifre';

  @override
  String get authResetCodeLabel => 'Kod';

  @override
  String get authResetNewPassword => 'Yeni şifre';

  @override
  String get authResetSubmit => 'Şifreyi güncelle';

  @override
  String get authResetDone => 'Şifre güncellendi. Yeni şifrenle giriş yap.';

  @override
  String get cartTitle => 'Sepet';

  @override
  String get cartEmptyTitle => 'Sepetiniz boş';

  @override
  String get cartEmptyMessage =>
      'Beğendiğiniz ürünleri ekleyin ya da Studio\'da kendi tasarımınızı oluşturun.';

  @override
  String get cartEmptyCta => 'Alışverişe başla';

  @override
  String get cartBestsellersTitle => 'Çok satanlar';

  @override
  String get cartCompleteTheLookTitle => 'Kombini tamamla';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'Ücretsiz teslimat için $amount daha ekleyin';
  }

  @override
  String get cartFreeDeliveryQualified => 'Harika! Teslimat ücretsiz';

  @override
  String get cartPromoTitle => 'Promosyon kodu';

  @override
  String get cartPromoHint => 'Kodu girin';

  @override
  String cartPromoApplied(String code) {
    return '$code kodu uygulandı';
  }

  @override
  String get cartPromoRemoveA11y => 'Promosyon kodunu kaldır';

  @override
  String get cartGiftTitle => 'Bu bir hediye';

  @override
  String get cartGiftSubtitle =>
      'Paketleme, kart ve mesajı ödeme sırasında seçeceksiniz';

  @override
  String get cartSummaryTitle => 'Özet';

  @override
  String get cartDeliveryAtCheckout => 'Ödeme sırasında hesaplanır';

  @override
  String get cartCheckout => 'Siparişi tamamla';

  @override
  String cartRemoved(String name) {
    return '$name sepetten çıkarıldı';
  }

  @override
  String get cartUndo => 'Geri al';

  @override
  String cartRemoveA11y(String name) {
    return '$name ürününü kaldır';
  }

  @override
  String get cartCustomDesign => 'Özel tasarım';

  @override
  String cartLeadTime(int days) {
    return '$days günde hazırlanır';
  }

  @override
  String cartStockLeft(int count) {
    return 'Sadece $count adet kaldı';
  }

  @override
  String cartSize(String size) {
    return 'Beden $size';
  }

  @override
  String cartUnitPrice(int quantity, String price) {
    return '$quantity × $price';
  }

  @override
  String get cartFixErrors =>
      'Bazı ürünler ilgi bekliyor — ödemeden önce düzeltin veya kaldırın.';

  @override
  String get cartAddedTitle => 'Sepete eklendi';

  @override
  String get cartViewBag => 'Sepete git';

  @override
  String get cartContinueShopping => 'Alışverişe devam et';

  @override
  String cartSubtotalWithCount(int count) {
    return 'Ara toplam · $count ürün';
  }

  @override
  String get catalogSortNewest => 'En yeni';

  @override
  String get catalogSortPriceAsc => 'Fiyat: artan';

  @override
  String get catalogSortPriceDesc => 'Fiyat: azalan';

  @override
  String get catalogSortPopular => 'Popüler';

  @override
  String get catalogFilterTitle => 'Filtre ve sıralama';

  @override
  String get catalogFilterSort => 'Sıralama';

  @override
  String get catalogFilterCategory => 'Kategori';

  @override
  String get catalogFilterCollection => 'Koleksiyon';

  @override
  String get catalogFilterSize => 'Beden';

  @override
  String get catalogFilterColor => 'Renk';

  @override
  String get catalogFilterFit => 'Kalıp';

  @override
  String get catalogFilterPrice => 'Fiyat';

  @override
  String get catalogFilterAvailability => 'Stok durumu';

  @override
  String get catalogFilterInStockOnly => 'Yalnızca stokta olanlar';

  @override
  String get launchComingSoonEyebrow => 'Çok yakında';

  @override
  String launchComingSoonOpensOn(String date) {
    return '$date tarihinde açılıyor';
  }

  @override
  String get launchComingSoonFallbackTitle => 'Yeni HOO yolda';

  @override
  String get launchComingSoonFallbackSubtitle =>
      'Bakü\'de üretilen premium streetwear. Açılıştan ilk siz haberdar olun.';

  @override
  String get launchCountdownDays => 'gün';

  @override
  String get launchCountdownHours => 'saat';

  @override
  String get launchCountdownMinutes => 'dk';

  @override
  String get launchCountdownSeconds => 'sn';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return 'Açılışa $days gün, $hours saat, $minutes dakika kaldı';
  }

  @override
  String get launchWaitlistTitle => 'Bekleme listesine katıl';

  @override
  String get launchWaitlistBody =>
      'Açılış gününde ilk siz haberdar olun, erken erişim kazanın.';

  @override
  String get launchWaitlistField => 'E-posta veya telefon';

  @override
  String get launchWaitlistJoin => 'Katıl';

  @override
  String launchWaitlistJoined(int position, int total) {
    return '$total kişi arasında #$position sıradasınız';
  }

  @override
  String launchWaitlistAlready(int position, int total) {
    return 'Zaten listedesiniz: $total kişi arasında #$position';
  }

  @override
  String launchWaitlistCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kişi şimdiden bekliyor',
      one: '1 kişi şimdiden bekliyor',
    );
    return '$_temp0';
  }

  @override
  String launchWaitlistToday(int count) {
    return 'bugün +$count';
  }

  @override
  String get launchNewsletterTitle => 'Bülten';

  @override
  String get launchNewsletterBody =>
      'Yeni droplar, koleksiyonlar ve fırsatlar — doğrudan e-postanıza.';

  @override
  String get launchNewsletterField => 'E-posta';

  @override
  String get launchNewsletterSubscribe => 'Abone ol';

  @override
  String get launchNewsletterDone => 'Abone oldunuz. Teşekkürler!';

  @override
  String get launchNewsletterAlready => 'Bu e-posta zaten abone.';

  @override
  String get launchFollow => 'HOO’yu takip edin';

  @override
  String launchOpenLink(String name) {
    return '$name aç';
  }

  @override
  String get launchCannotOpenLink => 'Bağlantı açılamadı.';

  @override
  String get launchContactEmail => 'E-posta';

  @override
  String get launchContactPhone => 'Telefon';

  @override
  String get launchStaffSignIn => 'Personel girişi';

  @override
  String get launchStaffNoAccess => 'Bu hesabın personel erişimi yok.';

  @override
  String get launchStoreOpenTitle => 'Mağaza açıldı';

  @override
  String get launchEnterStore => 'Mağazaya gir';

  @override
  String launchRetryIn(String time) {
    return '$time sonra tekrar deneyin';
  }

  @override
  String get launchLanguage => 'Dil';

  @override
  String get launchOnboardingLanguageTitle => 'Dilinizi seçin';

  @override
  String get launchOnboardingLanguageBody =>
      'Dilediğiniz zaman Ayarlar’dan değiştirebilirsiniz.';

  @override
  String get launchOnboardingSkip => 'Geç';

  @override
  String get launchOnboardingStart => 'Başla';

  @override
  String get launchOnboardingSlide1Eyebrow => 'Bakü’den';

  @override
  String get launchOnboardingSlide1Title => 'Sakin. Kendinden emin. HOO.';

  @override
  String get launchOnboardingSlide1Body =>
      'Hoodie, tişört ve sweatshirtler — premium kumaşlar, minimal tasarım, Bakü’de üretildi.';

  @override
  String get launchOnboardingSlide2Eyebrow => 'Studio';

  @override
  String get launchOnboardingSlide2Title => 'Kendi tasarımını yap';

  @override
  String get launchOnboardingSlide2Body =>
      'Ürünü ve rengi seç, metin ve görsel ekle, 3D gör — fiyat anında hesaplanır.';

  @override
  String get launchOnboardingSlide3Eyebrow => 'Teslimat';

  @override
  String get launchOnboardingSlide3Title => 'Bakü’de hızlı teslimat';

  @override
  String get launchOnboardingSlide3Body =>
      'Kurye seçtiğiniz saat aralığında gelir. Siparişinizi adım adım takip edin.';

  @override
  String get searchHint => 'Ara: hoodie, tişört, tasarım…';

  @override
  String get searchClearA11y => 'Aramayı temizle';

  @override
  String get searchRecentTitle => 'Son aramalar';

  @override
  String get searchBestsellersTitle => 'Çok satanlar';

  @override
  String searchFor(String query) {
    return '“$query” için ara';
  }

  @override
  String searchNoResultsTitle(String query) {
    return '“$query” için sonuç yok';
  }

  @override
  String get searchNoResultsMessage =>
      'Yazımı kontrol edin veya daha kısa bir sözcük deneyin.';

  @override
  String get searchMayLikeTitle => 'Hoşunuza gidebilir';

  @override
  String searchResultsCount(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sonuç',
      one: '1 sonuç',
    );
    return '“$query” için $_temp0';
  }

  @override
  String searchFillA11y(String text) {
    return 'Aramaya “$text” yaz';
  }

  @override
  String get searchDesignYourOwnTitle => 'Kendi tasarımını yap';

  @override
  String get searchDesignYourOwnBody =>
      'Studio\'da modeli seç, yazı ve görsel ekle.';
}
