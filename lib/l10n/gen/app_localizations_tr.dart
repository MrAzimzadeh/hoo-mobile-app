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
  String get authSignInWithSms => 'SMS koduyla giriş yap';

  @override
  String get authSocialUnavailable => 'Bu giriş yöntemi şu anda kullanılamıyor';

  @override
  String get authOr => 'veya';

  @override
  String get authContinueWithGoogle => 'Google ile devam et';

  @override
  String get authContinueWithApple => 'Apple ile devam et';

  @override
  String get authSocialTerms =>
      'Devam ederek Kullanım koşullarını kabul edersiniz.';

  @override
  String get authWelcomeTitle => 'Sakin. Kendinden emin. HOO.';

  @override
  String get authWelcomeSubtitle =>
      'Bakü’den premium streetwear — ve kendi tasarımın için 3D Stüdyo.';

  @override
  String get authSignInTitle => 'Tekrar hoş geldiniz';

  @override
  String get authSignInSubtitle =>
      'Siparişleriniz, tasarımlarınız ve favorileriniz sizi bekliyor.';

  @override
  String get authIdentifierLabel => 'E-posta veya telefon';

  @override
  String get authIdentifierHint => 'you@example.com veya 050 123 45 67';

  @override
  String get authPasswordLabel => 'Şifre';

  @override
  String get authForgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get authNoAccount => 'HOO’da yeni misiniz?';

  @override
  String get authHaveAccount => 'Zaten hesabınız var mı?';

  @override
  String get authSignUpTitle => 'Hesabınızı oluşturun';

  @override
  String get authSignUpSubtitle =>
      'Yeni drop’lara erken erişim, hızlı ödeme ve kayıtlı tasarımlar.';

  @override
  String get authFullNameLabel => 'Ad soyad';

  @override
  String get authEmailLabel => 'E-posta';

  @override
  String get authPhoneLabel => 'Telefon';

  @override
  String get authMarketingConsent =>
      'Yeni drop’ları ve teklifleri ilk ben öğreneyim';

  @override
  String get authAcceptTerms =>
      'Kullanım koşullarını ve Gizlilik politikasını kabul ediyorum';

  @override
  String get authTermsRequired => 'Devam etmek için koşulları kabul edin';

  @override
  String get authOtpPhoneTitle => 'Telefonla giriş yapın';

  @override
  String get authOtpPhoneSubtitle =>
      '6 haneli kodu SMS ile göndereceğiz. Yeni numaralar için hesap otomatik oluşturulur.';

  @override
  String get authOtpNameHint => 'yeni müşteriler için';

  @override
  String get authSendCode => 'Kodu gönder';

  @override
  String get authOtpCodeTitle => 'Kodu girin';

  @override
  String authOtpCodeSubtitle(String phone) {
    return '$phone numarasına gönderdik';
  }

  @override
  String authResendIn(String time) {
    return 'Tekrar gönder: $time';
  }

  @override
  String get authResendSms => 'Kodu tekrar gönder';

  @override
  String get authResendWhatsApp => 'SMS gelmedi mi? WhatsApp ile gönder';

  @override
  String get authForgotTitle => 'Şifrenizi sıfırlayın';

  @override
  String get authForgotSubtitle =>
      'E-posta adresinizi veya telefonunuzu yazın.';

  @override
  String get authForgotEmailSentTitle => 'Gelen kutunuzu kontrol edin';

  @override
  String get authForgotEmailSent =>
      'Hesap varsa, şifreyi sıfırlamak için bir bağlantı gönderdik.';

  @override
  String get authResetTitle => 'Yeni şifre';

  @override
  String get authResetSubtitle => 'Gönderdiğimiz kodu ve yeni şifrenizi girin.';

  @override
  String get authResetCodeLabel => 'Kod';

  @override
  String get authNewPasswordLabel => 'Yeni şifre';

  @override
  String get authResetDone =>
      'Şifreniz güncellendi. Şimdi giriş yapabilirsiniz.';

  @override
  String get cartAddedTitle => 'Sepete eklendi';

  @override
  String cartItemsCount(int count) {
    return '$count ürün';
  }

  @override
  String get cartCheckout => 'Ödemeye geç';

  @override
  String get cartViewBag => 'Sepete git';

  @override
  String cartOnlyLeft(int count) {
    return 'Sadece $count adet kaldı';
  }

  @override
  String cartMadeToOrderDays(int days) {
    return 'Siparişe özel · $days gün';
  }

  @override
  String get cartCustomBadge => 'Stüdyo';

  @override
  String get cartFreeDeliveryReached => 'Harika — teslimat ücretsiz';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'Ücretsiz teslimata $amount kaldı';
  }

  @override
  String cartRemoved(String name) {
    return '$name sepetten çıkarıldı';
  }

  @override
  String get cartUndo => 'Geri al';

  @override
  String get cartEmptyTitle => 'Sepetiniz boş';

  @override
  String get cartEmptyBody =>
      'Yeni drop’a göz atın ya da Stüdyo’da kendi tasarımınızı yapın.';

  @override
  String get cartEmptyAction => 'Alışverişe başla';

  @override
  String get cartBestsellers => 'Çok satanlar';

  @override
  String get cartLineErrors =>
      'Bazı ürünler değişti — ödemeden önce kontrol edin.';

  @override
  String get cartIsGift => 'Bu bir hediye';

  @override
  String get cartIsGiftHint => 'Paket, tebrik kartı ve fiyatsız fiş';

  @override
  String get cartDeliveryAtCheckout => 'Teslimat ödeme adımında hesaplanır.';

  @override
  String get cartCompleteTheLook => 'Kombini tamamla';

  @override
  String get cartPromoHint => 'Promosyon kodu';

  @override
  String get catalogFilterTitle => 'Filtrele ve sırala';

  @override
  String get catalogSortNewest => 'En yeniler';

  @override
  String get catalogSortPriceAsc => 'Fiyat: artan';

  @override
  String get catalogSortPriceDesc => 'Fiyat: azalan';

  @override
  String get catalogSortPopular => 'Çok satanlar';

  @override
  String get catalogFilterCategory => 'Kategori';

  @override
  String get catalogFilterSize => 'Beden';

  @override
  String get catalogFilterColor => 'Renk';

  @override
  String get catalogFilterFit => 'Kalıp';

  @override
  String get catalogFilterFabric => 'Kumaş';

  @override
  String get catalogFilterPrice => 'Fiyat';

  @override
  String get catalogFilterInStock => 'Sadece stoktakiler';

  @override
  String get catalogShowResults => 'Sonuçları göster';

  @override
  String get catalogChipAll => 'Tümü';

  @override
  String get catalogChipNew => 'Yeni';

  @override
  String get catalogChipSale => 'İndirim';

  @override
  String get catalogChipOversized => 'Oversize';

  @override
  String catalogShowing(int shown, int total) {
    return '$total üründen $shown gösteriliyor';
  }

  @override
  String get catalogFilterAndSort => 'Filtre';

  @override
  String catalogFilterCount(int count) {
    return 'Filtre ($count)';
  }

  @override
  String get catalogEmptyTitle => 'Sonuç bulunamadı';

  @override
  String get catalogEmptyBody =>
      'Filtreleri değiştirmeyi veya temizlemeyi deneyin.';

  @override
  String get catalogAlertSignIn =>
      'Uyarılar hesabınıza bağlıdır — lütfen giriş yapın.';

  @override
  String get catalogNotifyDone => 'Stoka girince haber vereceğiz';

  @override
  String get catalogPriceAlertDone => 'Fiyat düşerse haber vereceğiz';

  @override
  String get catalogPhotos => 'Fotoğraflar';

  @override
  String get catalog3dView => '3D';

  @override
  String get catalogYouMayAlsoLike => 'Bunları da beğenebilirsiniz';

  @override
  String get catalogToday => 'bugün';

  @override
  String get catalogTomorrow => 'yarın';

  @override
  String catalogDeliveredOn(String when) {
    return 'Teslimat: $when';
  }

  @override
  String catalogDeliveryPromise(int hours, int minutes, String when) {
    return '$hours sa $minutes dk içinde sipariş verin — $when teslim';
  }

  @override
  String get catalogReadReviews => 'Yorumları oku';

  @override
  String get catalogColor => 'Renk';

  @override
  String get catalogSize => 'Beden';

  @override
  String get catalogSizeGuide => 'Beden tablosu';

  @override
  String get catalogPreorderShort => 'ön sipariş';

  @override
  String get catalogChooseSize => 'Lütfen beden seçin';

  @override
  String catalogRecommendedSize(String size) {
    return 'Size $size beden öneriyoruz';
  }

  @override
  String catalogOnlyLeftIn(int count, String size) {
    return '$size bedeninde sadece $count adet kaldı';
  }

  @override
  String get catalogCustomizeThis => 'Bunu kişiselleştir';

  @override
  String get catalogDescription => 'Açıklama';

  @override
  String get catalogSizeAndFit => 'Beden ve kalıp';

  @override
  String get catalogFabricAndCare => 'Kumaş ve bakım';

  @override
  String catalogReviewsCount(int count) {
    return 'Yorumlar ($count)';
  }

  @override
  String get catalogWriteReview => 'Yorum yaz';

  @override
  String get catalogPriceDropAlert => 'Fiyat düşünce haber ver';

  @override
  String get catalogSelectSize => 'Beden seçin';

  @override
  String get catalogAddToBag => 'Sepete ekle';

  @override
  String get catalogSizeCol => 'Beden';

  @override
  String get catalogChestCol => 'Göğüs';

  @override
  String get catalogLengthCol => 'Boy';

  @override
  String get catalogSleeveCol => 'Kol';

  @override
  String get catalogSizeGuideHint =>
      'Ölçüler ürünün düz zeminde alınmış ölçüleridir.';

  @override
  String get catalogReviews => 'Yorumlar';

  @override
  String get catalogNoReviews => 'Henüz yorum yok';

  @override
  String get catalogNoReviewsBody =>
      'Bu ürünü aldıysanız, ilk yorumu siz yazın.';

  @override
  String get catalogReviewThanks => 'Teşekkürler!';

  @override
  String get catalogReviewModeration =>
      'Yorumunuz incelendikten sonra yayınlanacak.';

  @override
  String get catalogYourRating => 'Puanınız';

  @override
  String get catalogReviewTitle => 'Başlık';

  @override
  String get catalogReviewBody => 'Yorumunuz';

  @override
  String get catalogSubmitReview => 'Gönder';

  @override
  String get checkoutTitle => 'Ödeme';

  @override
  String get checkoutStepContact => 'İletişim';

  @override
  String get checkoutStepGift => 'Hediye';

  @override
  String get checkoutStepDelivery => 'Teslimat';

  @override
  String get checkoutStepSlot => 'Teslimat zamanı';

  @override
  String get checkoutStepPayment => 'Ödeme yöntemi';

  @override
  String get checkoutStepReview => 'Kontrol et';

  @override
  String get checkoutPhoneHint => 'Kurye bu numarayı arayacak.';

  @override
  String get checkoutGiftNotForCustom =>
      'Stüdyo siparişleri hediye olarak gönderilemez.';

  @override
  String get checkoutRecipientName => 'Alıcının adı';

  @override
  String get checkoutRecipientPhone => 'Alıcının telefonu';

  @override
  String get checkoutOccasion => 'Vesile';

  @override
  String get checkoutSurprise => 'Sürpriz';

  @override
  String get checkoutSurpriseHint =>
      'Kurye alıcıyla değil, sizinle iletişime geçer.';

  @override
  String get checkoutPackaging => 'Paketleme';

  @override
  String checkoutPackagingFreeFrom(String amount) {
    return '$amount üzeri ücretsiz';
  }

  @override
  String get checkoutCard => 'Tebrik kartı';

  @override
  String get checkoutMessage => 'Mesaj';

  @override
  String get checkoutFromName => 'Kimden';

  @override
  String get checkoutHidePrices => 'Fişte fiyatları gizle';

  @override
  String checkoutReadyInHours(int hours) {
    return '$hours saatte hazır';
  }

  @override
  String checkoutFreeFrom(String amount) {
    return '$amount üzeri ücretsiz';
  }

  @override
  String get checkoutAddress => 'Adres';

  @override
  String get checkoutNewAddress => 'Yeni adres';

  @override
  String get checkoutCity => 'Şehir';

  @override
  String get checkoutDistrict => 'Semt';

  @override
  String get checkoutStreet => 'Sokak, bina';

  @override
  String get checkoutApartment => 'Daire';

  @override
  String get checkoutCourierNote => 'Kurye için not';

  @override
  String get checkoutNoSlots => 'Uygun zaman yok';

  @override
  String get checkoutSlotTaken =>
      'Bu saat doldu — lütfen başka bir saat seçin.';

  @override
  String get checkoutPackagingSaving => 'Paket tasarrufu';

  @override
  String checkoutEstimatedDelivery(String range) {
    return 'Tahmini teslimat: $range';
  }

  @override
  String get checkoutCustomApprovalNote =>
      'Stüdyo tasarımları önce ekibimizce incelenir, ardından üretime geçer — o zamana kadar sipariş “Tasarım onayı bekleniyor” durumundadır.';

  @override
  String get checkoutSaveCard => 'Kartı sonraki alışverişler için kaydet';

  @override
  String get checkoutAcceptTerms =>
      'Satış koşullarını ve iade politikasını kabul ediyorum';

  @override
  String get checkoutImageRights =>
      'Görsellerin hakları bana ait; kişiye özel ürünlerin iade edilmediğini biliyorum';

  @override
  String get checkoutMissingSteps =>
      'Siparişi vermek için yukarıdaki adımları tamamlayın.';

  @override
  String checkoutPlaceOrder(String total) {
    return 'Siparişi ver · $total';
  }

  @override
  String get checkoutPaymentFailedTitle => 'Ödeme gerçekleşmedi';

  @override
  String get checkoutPaymentFailedBody =>
      'Siparişiniz kaydedildi. Tekrar deneyin veya başka bir yöntem seçin.';

  @override
  String get checkoutRetryPayment => 'Tekrar öde';

  @override
  String get checkoutSwitchToCod => 'Kapıda nakit öderim';

  @override
  String get checkoutAwaitingPayment => 'Ödemenizi tamamlayın';

  @override
  String checkoutAwaitingPaymentBody(String number) {
    return '$number numaralı sipariş oluşturuldu. Ödeme onaylanır onaylanmaz devam edeceğiz.';
  }

  @override
  String get checkoutCheckPayment => 'Ödemeyi kontrol et';

  @override
  String get checkoutOpenPaymentAgain => 'Ödeme sayfasını tekrar aç';

  @override
  String get checkoutConfirmedTitle => 'Siparişiniz alındı';

  @override
  String get checkoutConfirmedBody =>
      'Teşekkürler. Onayı e-posta ve SMS ile gönderdik.';

  @override
  String get checkoutOrderNumber => 'Sipariş numarası';

  @override
  String get checkoutGiftReceipt => 'Hediye fişi';

  @override
  String get checkoutGiftReceiptHint =>
      'Alıcı bu kodla bedeni değiştirebilir — fiyatları görmeden.';

  @override
  String get checkoutTrackOrder => 'Siparişi takip et';

  @override
  String get checkoutContinueShopping => 'Alışverişe devam et';

  @override
  String get homeNewArrivals => 'Yeni gelenler';

  @override
  String get homeCategories => 'Kategoriler';

  @override
  String get homeCollections => 'Koleksiyonlar';

  @override
  String get homeShopTheLook => 'Kombini al';

  @override
  String homeShopLookCount(int count) {
    return '$count parça';
  }

  @override
  String get homeBestsellers => 'Çok satanlar';

  @override
  String get homeRecentlyViewed => 'Son baktıklarınız';

  @override
  String get homeHeroEyebrow => 'Yeni drop';

  @override
  String get homeHeroTitle => 'Sessiz güç.';

  @override
  String get homeHeroSubtitle =>
      'Ağır pamuk, oversize kesim, orman yeşili. Yeni koleksiyon satışta.';

  @override
  String get homeHeroCta => 'Koleksiyonu keşfet';

  @override
  String get homeStudioTitle => 'Kendi tasarımını yap';

  @override
  String get homeStudioBody =>
      'Kumaşı ve rengi seç, metin ve görsel ekle — 3D’de gör.';

  @override
  String get homeStudioCta => 'Stüdyo’yu aç';

  @override
  String get launchComingSoonTitle => 'Çok yakında.';

  @override
  String get launchComingSoonSubtitle =>
      'HOO açılıyor. İlk drop’a erken erişim için listeye katılın.';

  @override
  String get launchDays => 'gün';

  @override
  String get launchHours => 'saat';

  @override
  String get launchMinutes => 'dk';

  @override
  String get launchSeconds => 'sn';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return 'Açılışa $days gün, $hours saat, $minutes dakika kaldı';
  }

  @override
  String get launchWaitlistTitle => 'Bekleme listesi';

  @override
  String launchWaitlistCount(int count) {
    return 'Listede şimdiden $count kişi var';
  }

  @override
  String get launchJoinWaitlist => 'Listeye katıl';

  @override
  String launchWaitlistPosition(int position, int total) {
    return '$total kişi içinde $position. sıradasınız';
  }

  @override
  String get launchWaitlistThanks =>
      'Açılış gününde ilk siz haberdar olacaksınız.';

  @override
  String get launchWaitlistAlready => 'Zaten listedesiniz — yakında görüşürüz!';

  @override
  String get launchNewsletterTitle => 'Bültene abone olun';

  @override
  String get launchSubscribe => 'Abone ol';

  @override
  String get launchNewsletterDone => 'Abone oldunuz. Teşekkürler!';

  @override
  String get launchStaffSignIn => 'Personel girişi';

  @override
  String get launchSkip => 'Geç';

  @override
  String get launchGetStarted => 'Başla';

  @override
  String get launchChooseLanguage => 'Dilinizi seçin';

  @override
  String get launchSlideBrandTitle => 'Bakü’den. Sakin ve kendinden emin.';

  @override
  String get launchSlideBrandBody =>
      'Ağır pamuk, net kesimler, az renk. Her gün için premium streetwear.';

  @override
  String get launchSlideStudioTitle => 'Kendi tasarımını yap.';

  @override
  String get launchSlideStudioBody =>
      '3D Stüdyo’da kumaşı ve rengi seç, metin ve görsel ekle — fiyatı anında gör.';

  @override
  String get launchSlideDeliveryTitle => 'Bakü’de hızlı teslimat.';

  @override
  String get launchSlideDeliveryBody =>
      'Size uygun günü ve saati seçin, her adımı takip edin.';

  @override
  String get ordersEventPlaced => 'Sipariş verildi';

  @override
  String get ordersEventPaymentCaptured => 'Ödeme alındı';

  @override
  String get ordersEventPaymentFailed => 'Ödeme başarısız';

  @override
  String get ordersEventCourierAssigned => 'Kurye atandı';

  @override
  String ordersEventCourierAssignedNamed(String name) {
    return 'Kurye: $name';
  }

  @override
  String get ordersEventEtaUpdated => 'Teslimat süresi güncellendi';

  @override
  String get ordersEventSlotChanged => 'Teslimat zamanı değişti';

  @override
  String get ordersEventRefund => 'İade yapıldı';

  @override
  String get ordersEventGiftMessage => 'Hediye mesajı güncellendi';

  @override
  String get ordersEventReturnRequested => 'İade talep edildi';

  @override
  String get ordersEventReturnUpdated => 'İade güncellendi';

  @override
  String get ordersEventDesignApproved => 'Tasarım onaylandı';

  @override
  String get ordersEventDesignChanges => 'Tasarımda değişiklik istendi';

  @override
  String get ordersTitle => 'Siparişlerim';

  @override
  String get ordersEmptyTitle => 'Henüz sipariş yok';

  @override
  String get ordersEmptyBody => 'İlk siparişiniz burada görünecek.';

  @override
  String get ordersReturnsTitle => 'İadeler';

  @override
  String get ordersReturnsEmpty => 'İade talebi yok';

  @override
  String get ordersReturnsEmptyBody =>
      'Sipariş sayfasından iade veya değişim isteyebilirsiniz.';

  @override
  String get ordersTrackTitle => 'Siparişi takip et';

  @override
  String get ordersTrackBody =>
      'Sipariş numarasını ve siparişteki telefonu girin.';

  @override
  String get ordersTrackPhone => 'Siparişteki telefon';

  @override
  String get ordersChangeSlot => 'Teslimat zamanını değiştir';

  @override
  String get ordersSlotChangeContact =>
      'Saati değiştirmek için bize ulaşın — kuryeyi sizin için yeniden planlarız.';

  @override
  String get ordersSlotChanged => 'Teslimat zamanı değiştirildi';

  @override
  String get ordersSignInToView => 'Bu siparişi görmek için giriş yapın';

  @override
  String ordersPlacedOn(String date) {
    return '$date tarihinde verildi';
  }

  @override
  String get ordersPayAgain => 'Tekrar öde';

  @override
  String get ordersReturnExchange => 'İade / değişim';

  @override
  String get ordersWhatsApp => 'WhatsApp’tan yazın';

  @override
  String get ordersTimeline => 'Durum';

  @override
  String get ordersItems => 'Ürünler';

  @override
  String ordersCourier(String name) {
    return 'Kurye: $name';
  }

  @override
  String ordersStopsAway(int count) {
    return '$count durak kaldı';
  }

  @override
  String ordersEta(int minutes) {
    return '~$minutes dk';
  }

  @override
  String get ordersNotReturnable => 'Kişiye özel ürün — iade edilmez';

  @override
  String get ordersReturnReason => 'Neden';

  @override
  String get ordersSendRequest => 'Talep gönder';

  @override
  String get ordersReturnSent => 'Talebiniz gönderildi';

  @override
  String get ordersReturnSentBody =>
      'Ekibimiz 1–2 iş günü içinde sizinle iletişime geçecek.';

  @override
  String get ordersGiftReceiptBody =>
      'Hediye fişindeki kodu ve telefonunuzu girin — bedeni değiştirebilirsiniz.';

  @override
  String get ordersGiftCode => 'Hediye kodu';

  @override
  String get ordersRecipientPhone => 'Telefonunuz';

  @override
  String ordersGiftFor(String name) {
    return '$name için hediye';
  }

  @override
  String ordersGiftFrom(String name) {
    return '$name tarafından';
  }

  @override
  String get ordersExchangeTo => 'Değiştirilecek beden';

  @override
  String ordersExchangeUntil(String date) {
    return '$date tarihine kadar değişim yapılabilir';
  }

  @override
  String get ordersRequestExchange => 'Değişim iste';

  @override
  String get ordersExchangeSent => 'Değişim talep edildi';

  @override
  String get profileSignOutConfirm => 'Hesaptan çıkmak istiyor musunuz?';

  @override
  String get profileShopping => 'Alışveriş';

  @override
  String get profileMyDesigns => 'Tasarımlarım';

  @override
  String get profileAccount => 'Hesap';

  @override
  String get profileStyleProfile => 'Stil profili';

  @override
  String get profileAddresses => 'Adresler';

  @override
  String get profileSavedCards => 'Kayıtlı kartlar';

  @override
  String get profilePersonalInfo => 'Kişisel bilgiler';

  @override
  String get profileChangePassword => 'Şifreyi değiştir';

  @override
  String get profileSetPassword => 'Şifre belirle';

  @override
  String get profileDevices => 'Aktif cihazlar';

  @override
  String get profileNotifications => 'Bildirimler';

  @override
  String get profileServices => 'Hizmetler';

  @override
  String get profileHelp => 'Yardım';

  @override
  String get profileSettings => 'Ayarlar';

  @override
  String profileHello(String name) {
    return 'Merhaba, $name';
  }

  @override
  String get profileActiveOrders => 'Aktif';

  @override
  String get profileGuestTitle => 'HOO hesabınız';

  @override
  String get profileGuestBody =>
      'Siparişleri takip edin, tasarımları kaydedin ve favorilerinizi her cihazda görün.';

  @override
  String get profilePasswordChanged => 'Şifre değiştirildi';

  @override
  String get profileCurrentPassword => 'Mevcut şifre';

  @override
  String get profilePasswordOtherDevices =>
      'Diğer cihazlarda oturum kapatılacak.';

  @override
  String get profileAddAddress => 'Adres ekle';

  @override
  String get profileEditAddress => 'Adresi düzenle';

  @override
  String get profileNoAddresses => 'Kayıtlı adres yok';

  @override
  String get profileDefault => 'Varsayılan';

  @override
  String get profileDeleteAddress => 'Bu adres silinsin mi?';

  @override
  String get profileAddressLabel => 'Etiket';

  @override
  String get profileAddressLabelHint => 'Ev, İş…';

  @override
  String get profileMakeDefault => 'Varsayılan yap';

  @override
  String get profileNoCards => 'Kayıtlı kart yok';

  @override
  String get profileNoCardsBody => 'Ödeme sırasında “Kartı kaydet” seçin.';

  @override
  String get profileDeleteCard => 'Bu kart silinsin mi?';

  @override
  String profileDeviceApp(String platform) {
    return 'HOO uygulaması · $platform';
  }

  @override
  String get profileDeviceUnknown => 'Bilinmeyen cihaz';

  @override
  String get profileThisDevice => 'Bu cihaz';

  @override
  String profileLastSeen(String time) {
    return 'Son etkinlik: $time';
  }

  @override
  String get profileRequiredNotification => 'Siparişleriniz için gerekli';

  @override
  String get profileLanguage => 'Dil';

  @override
  String get profileAppearance => 'Görünüm';

  @override
  String get profileThemeSystem => 'Sistem';

  @override
  String get profileThemeLight => 'Açık';

  @override
  String get profileThemeDark => 'Koyu';

  @override
  String get profileContactUs => 'Bize ulaşın';

  @override
  String get profileFaq => 'Sık sorulan sorular';

  @override
  String get profileFaqDeliveryQ => 'Teslimat ne kadar sürer?';

  @override
  String get profileFaqDeliveryA =>
      'Bakü’de kuryeyle genelde 1–2 gün, seçtiğiniz saat aralığında. Bölgelere postayla 3–5 gün.';

  @override
  String get profileFaqReturnsQ => 'Bir ürünü nasıl iade ederim?';

  @override
  String get profileFaqReturnsA =>
      'Siparişi açıp “İade / değişim” seçin. Stüdyo’da kişiye özel üretilen ürünler iade edilmez.';

  @override
  String get profileFaqStudioQ => 'Stüdyo siparişi ne zaman hazır olur?';

  @override
  String get profileFaqStudioA =>
      'Ekibimiz tasarımı inceler, ardından üretime geçer. Süre sipariş sırasında gösterilir; acil üretim de mümkündür.';

  @override
  String get profileFaqPaymentQ => 'Hangi ödeme yöntemleri var?';

  @override
  String get profileFaqPaymentA =>
      'Apple Pay, Google Pay, kart ve kapıda nakit (limite kadar).';

  @override
  String get profileSizeGuideBody =>
      'Her ürün sayfasında beden tablosu var. Stil profilinizi doldurursanız bedeninizi öneririz.';

  @override
  String get profileAbout => 'HOO hakkında';

  @override
  String get profileAboutBody =>
      'HOO, Bakü’den premium bir streetwear markası. Ağır pamuk, net kesimler, az renk ve kendi tasarımını yapman için 3D Stüdyo.';

  @override
  String get profileStyleIntro =>
      'Ölçülerinizi paylaşın, size uygun bedeni önerelim ve ürünleri zevkinize göre sıralayalım.';

  @override
  String get profileMeasurements => 'Ölçüler';

  @override
  String get profileHeight => 'Boy';

  @override
  String get profileWeight => 'Kilo';

  @override
  String get profileWaist => 'Bel';

  @override
  String get profileUsualSize => 'Genelde giydiğim beden';

  @override
  String get profilePreferredFit => 'Tercih ettiğim kalıp';

  @override
  String get profileFavoriteColors => 'Favori renkler';

  @override
  String get profileUpToThree => 'En fazla 3';

  @override
  String get profileStyles => 'Tarz';

  @override
  String get searchHint => 'Kapüşonlu, tişört, renk…';

  @override
  String get searchRecent => 'Son aramalar';

  @override
  String get searchSuggestions => 'Öneriler';

  @override
  String searchResults(int count, String query) {
    return '“$query” için $count sonuç';
  }

  @override
  String searchNoResultsTitle(String query) {
    return '“$query” bulunamadı';
  }

  @override
  String get searchNoResultsBody =>
      'Başka bir kelime deneyin veya çok satanlara göz atın.';

  @override
  String get searchDesignYourOwnTitle => 'Bulamadınız mı? Kendiniz tasarlayın';

  @override
  String get searchDesignYourOwnBody =>
      '3D Stüdyo’da istediğiniz renk ve baskıyla.';

  @override
  String get studioModelFallback =>
      '3D model yüklenemedi — basit biçim gösteriliyor.';

  @override
  String studioTooManyLayers(int max) {
    return 'En fazla $max katman eklenebilir';
  }

  @override
  String studioUploadTooLarge(int mb) {
    return 'Dosya çok büyük (en fazla $mb MB)';
  }

  @override
  String get studioUndo => 'Geri al';

  @override
  String get studioRedo => 'Yinele';

  @override
  String get studioSavedOffline => 'Çevrimdışı kaydedildi';

  @override
  String get studioSaveFailed => 'Kaydedilemedi';

  @override
  String get studioFront => 'Ön';

  @override
  String get studioBack => 'Arka';

  @override
  String get studioLeftSleeve => 'Sol kol';

  @override
  String get studioRightSleeve => 'Sağ kol';

  @override
  String get studioHood => 'Kapüşon';

  @override
  String get studioFreeSpot => 'Serbest alan';

  @override
  String get studioStepProduct => 'Ürün';

  @override
  String get studioStepFabric => 'Kumaş ve detaylar';

  @override
  String get studioStepFit => 'Beden ve kalıp';

  @override
  String get studioStepColor => 'Renk';

  @override
  String get studioStepEditor => 'Tasarım';

  @override
  String get studioStepReview => 'Gözden geçir';

  @override
  String get studioCustomSize => 'Özel';

  @override
  String studioLeadTime(int min, int max) {
    return '$min–$max gün üretim';
  }

  @override
  String get studioReview => 'Gözden geçir';

  @override
  String get studioSetupFee => 'Hazırlık';

  @override
  String get studioRushFee => 'Acil üretim';

  @override
  String studioVolumeDiscount(int percent) {
    return 'Adet indirimi −%$percent';
  }

  @override
  String get studioIncluded => 'Dahil';

  @override
  String get studioChooseProduct => 'Ne tasarlıyoruz?';

  @override
  String studioFromPrice(String price) {
    return '$price’den';
  }

  @override
  String get studioFabric => 'Kumaş';

  @override
  String studioGsm(int gsm) {
    return '$gsm g/m²';
  }

  @override
  String get studioFeatures => 'Detaylar';

  @override
  String get studioFit => 'Kalıp';

  @override
  String get studioCustomMeasurements => 'Özel ölçüler';

  @override
  String get studioColor => 'Renk';

  @override
  String get studioSpotPicked => 'Sonraki katman dokunduğunuz yere eklenecek';

  @override
  String get studioAddText => 'Metin';

  @override
  String get studioAddImage => 'Görsel';

  @override
  String studioLayers(int count, int max) {
    return 'Katmanlar · $count/$max';
  }

  @override
  String get studioNoLayers =>
      'Metin veya görsel ekleyin — ya da yer seçmek için modele dokunun.';

  @override
  String studioUploadHint(int mb, int dpi) {
    return '$mb MB’a kadar PNG veya JPG. En iyi baskı için $dpi DPI.';
  }

  @override
  String get studioFromGallery => 'Galeriden';

  @override
  String get studioFromCamera => 'Fotoğraf çek';

  @override
  String get studioImageLayer => 'Görsel';

  @override
  String get studioShowLayer => 'Göster';

  @override
  String get studioHideLayer => 'Gizle';

  @override
  String get studioTextLayer => 'Metin';

  @override
  String get studioCenter => 'Ortala';

  @override
  String get studioDuplicate => 'Çoğalt';

  @override
  String get studioSize => 'Boyut';

  @override
  String get studioRotation => 'Döndür';

  @override
  String studioQualityPoor(int dpi) {
    return 'Baskı kalitesi düşük ($dpi DPI) — küçültün ya da daha büyük bir dosya yükleyin';
  }

  @override
  String studioQualityWarning(int dpi) {
    return 'Orta kalite ($dpi DPI)';
  }

  @override
  String studioQualityOk(int dpi) {
    return 'Baskı kalitesi iyi ($dpi DPI)';
  }

  @override
  String get studioEditText => 'Metni düzenle';

  @override
  String get studioFont => 'Yazı tipi';

  @override
  String studioTextSize(int pt) {
    return 'Boyut · $pt pt';
  }

  @override
  String get studioLayersShort => 'Katmanlar';

  @override
  String get studioQuantity => 'Adet';

  @override
  String studioVolumeTier(int min, int percent) {
    return '$min+: −%$percent';
  }

  @override
  String get studioRush => 'Acil üretim';

  @override
  String studioRushHint(String fee, int days) {
    return '+$fee · $days gün daha hızlı';
  }

  @override
  String get studioImageRights => 'Bu görsellerin hakları bana ait';

  @override
  String get studioAddSomething =>
      'Sipariş için en az bir metin veya görsel ekleyin.';

  @override
  String get studioSaveDesign => 'Tasarımı kaydet';

  @override
  String get studioDesignSaved => 'Tasarım kaydedildi';

  @override
  String get studioBackToEditor => 'Tasarıma dön';

  @override
  String get studioIntro =>
      'Kumaş, kalıp ve renk seç, metin ve görsel ekle — her değişikliğin fiyatını anında gör.';

  @override
  String get studioStart => 'Tasarlamaya başla';

  @override
  String get studioContinueDraft => 'Son tasarıma devam et';

  @override
  String get studioHowItWorks => 'Nasıl çalışır';

  @override
  String get studioHowPick => 'Ürünü, kumaşı ve rengi seçin';

  @override
  String get studioHowDesign => 'Metin ve görselleri 3D’de yerleştirin';

  @override
  String get studioHowOrder => 'Sipariş verin — inceleyip üretelim';

  @override
  String get studioUntitled => 'Adsız tasarım';

  @override
  String get studioNoDesigns => 'Henüz tasarım yok';

  @override
  String get studioNoDesignsBody =>
      'Stüdyo’da oluşturduklarınız burada saklanır.';

  @override
  String get studioResubmit => 'Yeniden gönder';

  @override
  String get studioResubmitted => 'Tasarım yeniden incelemeye gönderildi';

  @override
  String get studioDeleteConfirm => 'Tasarım silinsin mi?';

  @override
  String get studioSharedTitle => 'Paylaşılan tasarım';

  @override
  String get studioDesignYourOwn => 'Kendi tasarımını yap';

  @override
  String get wishlistSignInReason =>
      'Favorilerinizi kaydetmek ve her cihazda görmek için giriş yapın.';

  @override
  String get wishlistTitle => 'Favoriler';

  @override
  String get wishlistShareSubject => 'HOO favorilerim';

  @override
  String get wishlistEmptyTitle => 'Henüz bir şey kaydetmediniz';

  @override
  String get wishlistEmptyBody =>
      'Herhangi bir üründe ♡ simgesine dokunun, burada saklansın.';

  @override
  String get wishlistChooseSize => 'Beden seç';

  @override
  String get wishlistNotifyMe => 'Gelince haber ver';

  @override
  String wishlistSharedTitle(String name) {
    return '$name adlı kişinin favorileri';
  }

  @override
  String get wishlistAlertsTitle => 'Uyarılar';

  @override
  String get wishlistAlertsEmptyTitle => 'Aktif uyarı yok';

  @override
  String get wishlistAlertsEmptyBody =>
      'Ürün sayfasında “Gelince haber ver” ya da “Fiyat düşünce haber ver” seçin.';

  @override
  String get wishlistAlertBackInStock => 'Stoka girince';

  @override
  String get wishlistAlertPriceDrop => 'Fiyat düşünce';

  @override
  String wishlistAlertNotified(String date) {
    return '$date bildirildi';
  }
}
