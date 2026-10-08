import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('en'),
    Locale('ru'),
    Locale('tr'),
  ];

  /// No description provided for @appName.
  ///
  /// In az, this message translates to:
  /// **'HOO'**
  String get appName;

  /// No description provided for @navHome.
  ///
  /// In az, this message translates to:
  /// **'Əsas'**
  String get navHome;

  /// No description provided for @navShop.
  ///
  /// In az, this message translates to:
  /// **'Mağaza'**
  String get navShop;

  /// No description provided for @navStudio.
  ///
  /// In az, this message translates to:
  /// **'Studio'**
  String get navStudio;

  /// No description provided for @navBag.
  ///
  /// In az, this message translates to:
  /// **'Səbət'**
  String get navBag;

  /// No description provided for @navProfile.
  ///
  /// In az, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// No description provided for @commonRetry.
  ///
  /// In az, this message translates to:
  /// **'Yenidən cəhd et'**
  String get commonRetry;

  /// No description provided for @commonSeeAll.
  ///
  /// In az, this message translates to:
  /// **'Hamısına bax'**
  String get commonSeeAll;

  /// No description provided for @commonCancel.
  ///
  /// In az, this message translates to:
  /// **'Ləğv et'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In az, this message translates to:
  /// **'Yadda saxla'**
  String get commonSave;

  /// No description provided for @commonSaved.
  ///
  /// In az, this message translates to:
  /// **'Saxlanıldı'**
  String get commonSaved;

  /// No description provided for @commonSaving.
  ///
  /// In az, this message translates to:
  /// **'Saxlanılır…'**
  String get commonSaving;

  /// No description provided for @commonDone.
  ///
  /// In az, this message translates to:
  /// **'Hazırdır'**
  String get commonDone;

  /// No description provided for @commonClose.
  ///
  /// In az, this message translates to:
  /// **'Bağla'**
  String get commonClose;

  /// No description provided for @commonContinue.
  ///
  /// In az, this message translates to:
  /// **'Davam et'**
  String get commonContinue;

  /// No description provided for @commonBack.
  ///
  /// In az, this message translates to:
  /// **'Geri'**
  String get commonBack;

  /// No description provided for @commonNext.
  ///
  /// In az, this message translates to:
  /// **'Növbəti'**
  String get commonNext;

  /// No description provided for @commonApply.
  ///
  /// In az, this message translates to:
  /// **'Tətbiq et'**
  String get commonApply;

  /// No description provided for @commonClear.
  ///
  /// In az, this message translates to:
  /// **'Təmizlə'**
  String get commonClear;

  /// No description provided for @commonClearAll.
  ///
  /// In az, this message translates to:
  /// **'Hamısını təmizlə'**
  String get commonClearAll;

  /// No description provided for @commonRemove.
  ///
  /// In az, this message translates to:
  /// **'Sil'**
  String get commonRemove;

  /// No description provided for @commonEdit.
  ///
  /// In az, this message translates to:
  /// **'Redaktə et'**
  String get commonEdit;

  /// No description provided for @commonDelete.
  ///
  /// In az, this message translates to:
  /// **'Sil'**
  String get commonDelete;

  /// No description provided for @commonShare.
  ///
  /// In az, this message translates to:
  /// **'Paylaş'**
  String get commonShare;

  /// No description provided for @commonConfirm.
  ///
  /// In az, this message translates to:
  /// **'Təsdiqlə'**
  String get commonConfirm;

  /// No description provided for @commonYes.
  ///
  /// In az, this message translates to:
  /// **'Bəli'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In az, this message translates to:
  /// **'Xeyr'**
  String get commonNo;

  /// No description provided for @commonOk.
  ///
  /// In az, this message translates to:
  /// **'Oldu'**
  String get commonOk;

  /// No description provided for @commonOptional.
  ///
  /// In az, this message translates to:
  /// **'istəyə bağlı'**
  String get commonOptional;

  /// No description provided for @commonSearch.
  ///
  /// In az, this message translates to:
  /// **'Axtar'**
  String get commonSearch;

  /// No description provided for @commonFilter.
  ///
  /// In az, this message translates to:
  /// **'Filtr'**
  String get commonFilter;

  /// No description provided for @commonSort.
  ///
  /// In az, this message translates to:
  /// **'Sırala'**
  String get commonSort;

  /// No description provided for @commonShowMore.
  ///
  /// In az, this message translates to:
  /// **'Daha çox'**
  String get commonShowMore;

  /// No description provided for @commonShowLess.
  ///
  /// In az, this message translates to:
  /// **'Daha az'**
  String get commonShowLess;

  /// No description provided for @commonCopy.
  ///
  /// In az, this message translates to:
  /// **'Kopyala'**
  String get commonCopy;

  /// No description provided for @commonCopied.
  ///
  /// In az, this message translates to:
  /// **'Kopyalandı'**
  String get commonCopied;

  /// No description provided for @commonSignIn.
  ///
  /// In az, this message translates to:
  /// **'Daxil ol'**
  String get commonSignIn;

  /// No description provided for @commonSignOut.
  ///
  /// In az, this message translates to:
  /// **'Çıxış'**
  String get commonSignOut;

  /// No description provided for @commonCreateAccount.
  ///
  /// In az, this message translates to:
  /// **'Hesab yarat'**
  String get commonCreateAccount;

  /// No description provided for @commonContinueAsGuest.
  ///
  /// In az, this message translates to:
  /// **'Qonaq kimi davam et'**
  String get commonContinueAsGuest;

  /// No description provided for @commonLearnMore.
  ///
  /// In az, this message translates to:
  /// **'Ətraflı'**
  String get commonLearnMore;

  /// No description provided for @commonTotal.
  ///
  /// In az, this message translates to:
  /// **'Cəmi'**
  String get commonTotal;

  /// No description provided for @commonFree.
  ///
  /// In az, this message translates to:
  /// **'Pulsuz'**
  String get commonFree;

  /// No description provided for @commonDays.
  ///
  /// In az, this message translates to:
  /// **'{min}–{max} gün'**
  String commonDays(int min, int max);

  /// No description provided for @commonPieces.
  ///
  /// In az, this message translates to:
  /// **'{count} ədəd'**
  String commonPieces(int count);

  /// No description provided for @errorGeneric.
  ///
  /// In az, this message translates to:
  /// **'Nəsə alınmadı. Bir az sonra yenidən cəhd edin.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In az, this message translates to:
  /// **'İnternet bağlantısı yoxdur. Şəbəkəni yoxlayın.'**
  String get errorNetwork;

  /// No description provided for @errorNotFound.
  ///
  /// In az, this message translates to:
  /// **'Tapılmadı'**
  String get errorNotFound;

  /// No description provided for @errorTooManyRequests.
  ///
  /// In az, this message translates to:
  /// **'Çox cəhd edildi. {seconds} saniyə sonra yenidən yoxlayın.'**
  String errorTooManyRequests(int seconds);

  /// No description provided for @errorExternal.
  ///
  /// In az, this message translates to:
  /// **'Xidmət müvəqqəti əlçatan deyil. Bir az sonra yoxlayın.'**
  String get errorExternal;

  /// No description provided for @errorConflict.
  ///
  /// In az, this message translates to:
  /// **'Məlumat yeniləndi. Yeni vəziyyəti göstəririk.'**
  String get errorConflict;

  /// No description provided for @errorSessionExpired.
  ///
  /// In az, this message translates to:
  /// **'Sessiyanın vaxtı bitdi. Yenidən daxil olun.'**
  String get errorSessionExpired;

  /// No description provided for @fieldRequired.
  ///
  /// In az, this message translates to:
  /// **'Bu sahə məcburidir'**
  String get fieldRequired;

  /// No description provided for @fieldInvalidEmail.
  ///
  /// In az, this message translates to:
  /// **'E-poçt ünvanı düzgün deyil'**
  String get fieldInvalidEmail;

  /// No description provided for @fieldInvalidPhone.
  ///
  /// In az, this message translates to:
  /// **'Nömrə +994 XX XXX XX XX formatında olmalıdır'**
  String get fieldInvalidPhone;

  /// No description provided for @fieldPasswordRule.
  ///
  /// In az, this message translates to:
  /// **'Ən azı 8 simvol, bir rəqəm və bir xüsusi simvol'**
  String get fieldPasswordRule;

  /// No description provided for @stateEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Burada hələ heç nə yoxdur'**
  String get stateEmptyTitle;

  /// No description provided for @stateOffline.
  ///
  /// In az, this message translates to:
  /// **'Oflayn rejim — son saxlanılan məlumat göstərilir'**
  String get stateOffline;

  /// No description provided for @stateLoading.
  ///
  /// In az, this message translates to:
  /// **'Yüklənir…'**
  String get stateLoading;

  /// No description provided for @badgeNew.
  ///
  /// In az, this message translates to:
  /// **'YENİ'**
  String get badgeNew;

  /// No description provided for @badgeNewDrop.
  ///
  /// In az, this message translates to:
  /// **'YENİ DROP'**
  String get badgeNewDrop;

  /// No description provided for @badgeBestseller.
  ///
  /// In az, this message translates to:
  /// **'BESTSELLER'**
  String get badgeBestseller;

  /// No description provided for @badgeSale.
  ///
  /// In az, this message translates to:
  /// **'ENDİRİM'**
  String get badgeSale;

  /// No description provided for @discountPercent.
  ///
  /// In az, this message translates to:
  /// **'-{percent}%'**
  String discountPercent(int percent);

  /// No description provided for @a11yAddToWishlist.
  ///
  /// In az, this message translates to:
  /// **'Bəyənilənlərə əlavə et'**
  String get a11yAddToWishlist;

  /// No description provided for @a11yRemoveFromWishlist.
  ///
  /// In az, this message translates to:
  /// **'Bəyənilənlərdən çıxar'**
  String get a11yRemoveFromWishlist;

  /// No description provided for @a11yIncrease.
  ///
  /// In az, this message translates to:
  /// **'Artır'**
  String get a11yIncrease;

  /// No description provided for @a11yDecrease.
  ///
  /// In az, this message translates to:
  /// **'Azalt'**
  String get a11yDecrease;

  /// No description provided for @a11yQuantity.
  ///
  /// In az, this message translates to:
  /// **'Say: {count}'**
  String a11yQuantity(int count);

  /// No description provided for @a11yColor.
  ///
  /// In az, this message translates to:
  /// **'Rəng: {name}'**
  String a11yColor(String name);

  /// No description provided for @a11ySelected.
  ///
  /// In az, this message translates to:
  /// **'seçilib'**
  String get a11ySelected;

  /// No description provided for @a11yUnavailable.
  ///
  /// In az, this message translates to:
  /// **'mövcud deyil'**
  String get a11yUnavailable;

  /// No description provided for @a11yRating.
  ///
  /// In az, this message translates to:
  /// **'Reytinq: 5-dən {rating}'**
  String a11yRating(String rating);

  /// No description provided for @a11yClose.
  ///
  /// In az, this message translates to:
  /// **'Bağla'**
  String get a11yClose;

  /// No description provided for @a11yBack.
  ///
  /// In az, this message translates to:
  /// **'Geri'**
  String get a11yBack;

  /// No description provided for @a11yBag.
  ///
  /// In az, this message translates to:
  /// **'Səbət, {count} məhsul'**
  String a11yBag(int count);

  /// No description provided for @a11yShowPassword.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni göstər'**
  String get a11yShowPassword;

  /// No description provided for @a11yHidePassword.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni gizlət'**
  String get a11yHidePassword;

  /// No description provided for @a11yLogo.
  ///
  /// In az, this message translates to:
  /// **'HOO'**
  String get a11yLogo;

  /// No description provided for @stepOf.
  ///
  /// In az, this message translates to:
  /// **'Addım {current} / {total}'**
  String stepOf(int current, int total);

  /// No description provided for @summaryTotal.
  ///
  /// In az, this message translates to:
  /// **'Cəmi'**
  String get summaryTotal;

  /// No description provided for @summarySubtotal.
  ///
  /// In az, this message translates to:
  /// **'Ara cəm'**
  String get summarySubtotal;

  /// No description provided for @summaryDiscount.
  ///
  /// In az, this message translates to:
  /// **'Endirim'**
  String get summaryDiscount;

  /// No description provided for @summaryDelivery.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma'**
  String get summaryDelivery;

  /// No description provided for @summaryGiftPackaging.
  ///
  /// In az, this message translates to:
  /// **'Hədiyyə qablaşdırması'**
  String get summaryGiftPackaging;

  /// No description provided for @summaryGreetingCard.
  ///
  /// In az, this message translates to:
  /// **'Təbrik kartı'**
  String get summaryGreetingCard;

  /// No description provided for @summaryVatIncluded.
  ///
  /// In az, this message translates to:
  /// **'ƏDV daxildir: {amount}'**
  String summaryVatIncluded(String amount);

  /// No description provided for @summaryShowBreakdown.
  ///
  /// In az, this message translates to:
  /// **'Təfərrüatı göstər'**
  String get summaryShowBreakdown;

  /// No description provided for @summaryUpdating.
  ///
  /// In az, this message translates to:
  /// **'Qiymət yenilənir'**
  String get summaryUpdating;

  /// No description provided for @authGateTitle.
  ///
  /// In az, this message translates to:
  /// **'Davam etmək üçün daxil olun'**
  String get authGateTitle;

  /// No description provided for @authGateBody.
  ///
  /// In az, this message translates to:
  /// **'Bəyənilənlər, rəylər, ünvanlar və dizaynlarınız hesabınızda saxlanılır.'**
  String get authGateBody;

  /// No description provided for @orderStatusNew.
  ///
  /// In az, this message translates to:
  /// **'Yeni'**
  String get orderStatusNew;

  /// No description provided for @orderStatusPaid.
  ///
  /// In az, this message translates to:
  /// **'Ödənilib'**
  String get orderStatusPaid;

  /// No description provided for @orderStatusAwaitingApproval.
  ///
  /// In az, this message translates to:
  /// **'Dizayn təsdiqi gözlənilir'**
  String get orderStatusAwaitingApproval;

  /// No description provided for @orderStatusInProduction.
  ///
  /// In az, this message translates to:
  /// **'İstehsalda'**
  String get orderStatusInProduction;

  /// No description provided for @orderStatusPacked.
  ///
  /// In az, this message translates to:
  /// **'Qablaşdırılıb'**
  String get orderStatusPacked;

  /// No description provided for @orderStatusOutForDelivery.
  ///
  /// In az, this message translates to:
  /// **'Yoldadır'**
  String get orderStatusOutForDelivery;

  /// No description provided for @orderStatusReadyForPickup.
  ///
  /// In az, this message translates to:
  /// **'Götürməyə hazırdır'**
  String get orderStatusReadyForPickup;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılıb'**
  String get orderStatusDelivered;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In az, this message translates to:
  /// **'Ləğv edilib'**
  String get orderStatusCancelled;

  /// No description provided for @orderStatusReturnRequested.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma istənilib'**
  String get orderStatusReturnRequested;

  /// No description provided for @orderStatusReturned.
  ///
  /// In az, this message translates to:
  /// **'Qaytarılıb'**
  String get orderStatusReturned;

  /// No description provided for @orderStatusRefunded.
  ///
  /// In az, this message translates to:
  /// **'Pul qaytarılıb'**
  String get orderStatusRefunded;

  /// No description provided for @designStatusDraft.
  ///
  /// In az, this message translates to:
  /// **'Qaralama'**
  String get designStatusDraft;

  /// No description provided for @designStatusSubmitted.
  ///
  /// In az, this message translates to:
  /// **'Göndərilib'**
  String get designStatusSubmitted;

  /// No description provided for @designStatusChangesRequested.
  ///
  /// In az, this message translates to:
  /// **'Dəyişiklik istənilib'**
  String get designStatusChangesRequested;

  /// No description provided for @designStatusApproved.
  ///
  /// In az, this message translates to:
  /// **'Təsdiqlənib'**
  String get designStatusApproved;

  /// No description provided for @designStatusInProduction.
  ///
  /// In az, this message translates to:
  /// **'İstehsalda'**
  String get designStatusInProduction;

  /// No description provided for @designStatusReady.
  ///
  /// In az, this message translates to:
  /// **'Hazırdır'**
  String get designStatusReady;

  /// No description provided for @designStatusCancelled.
  ///
  /// In az, this message translates to:
  /// **'Ləğv edilib'**
  String get designStatusCancelled;

  /// No description provided for @paymentStatusPending.
  ///
  /// In az, this message translates to:
  /// **'Gözləyir'**
  String get paymentStatusPending;

  /// No description provided for @paymentStatusCaptured.
  ///
  /// In az, this message translates to:
  /// **'Ödənilib'**
  String get paymentStatusCaptured;

  /// No description provided for @paymentStatusFailed.
  ///
  /// In az, this message translates to:
  /// **'Uğursuz'**
  String get paymentStatusFailed;

  /// No description provided for @paymentStatusCancelled.
  ///
  /// In az, this message translates to:
  /// **'Ləğv edilib'**
  String get paymentStatusCancelled;

  /// No description provided for @paymentStatusRefunded.
  ///
  /// In az, this message translates to:
  /// **'Qaytarılıb'**
  String get paymentStatusRefunded;

  /// No description provided for @paymentStatusPartiallyRefunded.
  ///
  /// In az, this message translates to:
  /// **'Qismən qaytarılıb'**
  String get paymentStatusPartiallyRefunded;

  /// No description provided for @paymentMethodApplePay.
  ///
  /// In az, this message translates to:
  /// **'Apple Pay'**
  String get paymentMethodApplePay;

  /// No description provided for @paymentMethodGooglePay.
  ///
  /// In az, this message translates to:
  /// **'Google Pay'**
  String get paymentMethodGooglePay;

  /// No description provided for @paymentMethodCard.
  ///
  /// In az, this message translates to:
  /// **'Bank kartı'**
  String get paymentMethodCard;

  /// No description provided for @paymentMethodSavedCard.
  ///
  /// In az, this message translates to:
  /// **'Saxlanılmış kart'**
  String get paymentMethodSavedCard;

  /// No description provided for @paymentMethodCashOnDelivery.
  ///
  /// In az, this message translates to:
  /// **'Qapıda nağd'**
  String get paymentMethodCashOnDelivery;

  /// No description provided for @paymentMethodCardOnDelivery.
  ///
  /// In az, this message translates to:
  /// **'Qapıda kartla'**
  String get paymentMethodCardOnDelivery;

  /// No description provided for @paymentMethodInvoice.
  ///
  /// In az, this message translates to:
  /// **'Hesab-faktura'**
  String get paymentMethodInvoice;

  /// No description provided for @deliveryKindCourier.
  ///
  /// In az, this message translates to:
  /// **'Kuryer'**
  String get deliveryKindCourier;

  /// No description provided for @deliveryKindPost.
  ///
  /// In az, this message translates to:
  /// **'Poçt'**
  String get deliveryKindPost;

  /// No description provided for @deliveryKindPickup.
  ///
  /// In az, this message translates to:
  /// **'Mağazadan götür'**
  String get deliveryKindPickup;

  /// No description provided for @returnStatusRequested.
  ///
  /// In az, this message translates to:
  /// **'Sorğu göndərilib'**
  String get returnStatusRequested;

  /// No description provided for @returnStatusApproved.
  ///
  /// In az, this message translates to:
  /// **'Təsdiqlənib'**
  String get returnStatusApproved;

  /// No description provided for @returnStatusRejected.
  ///
  /// In az, this message translates to:
  /// **'Rədd edilib'**
  String get returnStatusRejected;

  /// No description provided for @returnStatusReceived.
  ///
  /// In az, this message translates to:
  /// **'Qəbul edilib'**
  String get returnStatusReceived;

  /// No description provided for @returnStatusRefunded.
  ///
  /// In az, this message translates to:
  /// **'Pul qaytarılıb'**
  String get returnStatusRefunded;

  /// No description provided for @returnStatusExchanged.
  ///
  /// In az, this message translates to:
  /// **'Dəyişdirilib'**
  String get returnStatusExchanged;

  /// No description provided for @returnKindReturn.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma'**
  String get returnKindReturn;

  /// No description provided for @returnKindExchange.
  ///
  /// In az, this message translates to:
  /// **'Dəyişmə'**
  String get returnKindExchange;

  /// No description provided for @occasionBirthday.
  ///
  /// In az, this message translates to:
  /// **'Ad günü'**
  String get occasionBirthday;

  /// No description provided for @occasionAnniversary.
  ///
  /// In az, this message translates to:
  /// **'İldönümü'**
  String get occasionAnniversary;

  /// No description provided for @occasionNovruz.
  ///
  /// In az, this message translates to:
  /// **'Novruz'**
  String get occasionNovruz;

  /// No description provided for @occasionNewYear.
  ///
  /// In az, this message translates to:
  /// **'Yeni il'**
  String get occasionNewYear;

  /// No description provided for @occasionJustBecause.
  ///
  /// In az, this message translates to:
  /// **'Səbəbsiz'**
  String get occasionJustBecause;

  /// No description provided for @fitOversized.
  ///
  /// In az, this message translates to:
  /// **'Oversized'**
  String get fitOversized;

  /// No description provided for @fitBoxy.
  ///
  /// In az, this message translates to:
  /// **'Boxy'**
  String get fitBoxy;

  /// No description provided for @fitRegular.
  ///
  /// In az, this message translates to:
  /// **'Regular'**
  String get fitRegular;

  /// No description provided for @fitFitted.
  ///
  /// In az, this message translates to:
  /// **'Dar kəsim'**
  String get fitFitted;

  /// No description provided for @fitCropped.
  ///
  /// In az, this message translates to:
  /// **'Qısa'**
  String get fitCropped;

  /// No description provided for @productTypeHoodie.
  ///
  /// In az, this message translates to:
  /// **'Hudi'**
  String get productTypeHoodie;

  /// No description provided for @productTypeZipHoodie.
  ///
  /// In az, this message translates to:
  /// **'Zəncirli hudi'**
  String get productTypeZipHoodie;

  /// No description provided for @productTypeTShirt.
  ///
  /// In az, this message translates to:
  /// **'Futbolka'**
  String get productTypeTShirt;

  /// No description provided for @productTypeSweatshirt.
  ///
  /// In az, this message translates to:
  /// **'Svitşot'**
  String get productTypeSweatshirt;

  /// No description provided for @productTypeSweatpants.
  ///
  /// In az, this message translates to:
  /// **'İdman şalvarı'**
  String get productTypeSweatpants;

  /// No description provided for @productTypeShorts.
  ///
  /// In az, this message translates to:
  /// **'Şort'**
  String get productTypeShorts;

  /// No description provided for @colorFamilyBlack.
  ///
  /// In az, this message translates to:
  /// **'Qara'**
  String get colorFamilyBlack;

  /// No description provided for @colorFamilyForest.
  ///
  /// In az, this message translates to:
  /// **'Meşə yaşılı'**
  String get colorFamilyForest;

  /// No description provided for @colorFamilyCream.
  ///
  /// In az, this message translates to:
  /// **'Krem'**
  String get colorFamilyCream;

  /// No description provided for @colorFamilyWhite.
  ///
  /// In az, this message translates to:
  /// **'Ağ'**
  String get colorFamilyWhite;

  /// No description provided for @colorFamilyGrey.
  ///
  /// In az, this message translates to:
  /// **'Boz'**
  String get colorFamilyGrey;

  /// No description provided for @colorFamilySand.
  ///
  /// In az, this message translates to:
  /// **'Qum'**
  String get colorFamilySand;

  /// No description provided for @colorFamilyOlive.
  ///
  /// In az, this message translates to:
  /// **'Zeytun'**
  String get colorFamilyOlive;

  /// No description provided for @colorFamilyRed.
  ///
  /// In az, this message translates to:
  /// **'Qırmızı'**
  String get colorFamilyRed;

  /// No description provided for @styleTagMinimal.
  ///
  /// In az, this message translates to:
  /// **'Minimal'**
  String get styleTagMinimal;

  /// No description provided for @styleTagStreetwear.
  ///
  /// In az, this message translates to:
  /// **'Streetwear'**
  String get styleTagStreetwear;

  /// No description provided for @styleTagGraphicPrints.
  ///
  /// In az, this message translates to:
  /// **'Qrafik çaplar'**
  String get styleTagGraphicPrints;

  /// No description provided for @styleTagMonochrome.
  ///
  /// In az, this message translates to:
  /// **'Monoxrom'**
  String get styleTagMonochrome;

  /// No description provided for @styleTagSport.
  ///
  /// In az, this message translates to:
  /// **'İdman'**
  String get styleTagSport;

  /// No description provided for @styleTagVintage.
  ///
  /// In az, this message translates to:
  /// **'Vintaj'**
  String get styleTagVintage;

  /// No description provided for @notificationTopicOrders.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlər'**
  String get notificationTopicOrders;

  /// No description provided for @notificationTopicDelivery.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma'**
  String get notificationTopicDelivery;

  /// No description provided for @notificationTopicAlerts.
  ///
  /// In az, this message translates to:
  /// **'Xəbərdarlıqlar'**
  String get notificationTopicAlerts;

  /// No description provided for @notificationTopicMarketing.
  ///
  /// In az, this message translates to:
  /// **'Yeniliklər və təkliflər'**
  String get notificationTopicMarketing;

  /// No description provided for @notificationChannelEmail.
  ///
  /// In az, this message translates to:
  /// **'E-poçt'**
  String get notificationChannelEmail;

  /// No description provided for @notificationChannelSms.
  ///
  /// In az, this message translates to:
  /// **'SMS'**
  String get notificationChannelSms;

  /// No description provided for @notificationChannelWhatsApp.
  ///
  /// In az, this message translates to:
  /// **'WhatsApp'**
  String get notificationChannelWhatsApp;

  /// No description provided for @notificationChannelPush.
  ///
  /// In az, this message translates to:
  /// **'Push'**
  String get notificationChannelPush;

  /// No description provided for @stockStateInStock.
  ///
  /// In az, this message translates to:
  /// **'Anbarda'**
  String get stockStateInStock;

  /// No description provided for @stockStateLowStock.
  ///
  /// In az, this message translates to:
  /// **'Az qalıb'**
  String get stockStateLowStock;

  /// No description provided for @stockStatePreorder.
  ///
  /// In az, this message translates to:
  /// **'Ön sifariş'**
  String get stockStatePreorder;

  /// No description provided for @stockStateOutOfStock.
  ///
  /// In az, this message translates to:
  /// **'Bitib'**
  String get stockStateOutOfStock;

  /// No description provided for @stockStateMadeToOrder.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlə hazırlanır'**
  String get stockStateMadeToOrder;

  /// No description provided for @stockStateUnavailable.
  ///
  /// In az, this message translates to:
  /// **'Mövcud deyil'**
  String get stockStateUnavailable;

  /// No description provided for @dsTitle.
  ///
  /// In az, this message translates to:
  /// **'Dizayn sistemi'**
  String get dsTitle;

  /// No description provided for @dsLightDark.
  ///
  /// In az, this message translates to:
  /// **'İşıqlı / Qaranlıq'**
  String get dsLightDark;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In az, this message translates to:
  /// **'HOO-ya xoş gəlmisiniz'**
  String get authWelcomeTitle;

  /// No description provided for @authWelcomeBody.
  ///
  /// In az, this message translates to:
  /// **'Bakıda hazırlanan premium streetwear. Daxil olun və ya qonaq kimi davam edin.'**
  String get authWelcomeBody;

  /// No description provided for @authWelcomeGuest.
  ///
  /// In az, this message translates to:
  /// **'Qonaq kimi davam et'**
  String get authWelcomeGuest;

  /// No description provided for @authSignInTitle.
  ///
  /// In az, this message translates to:
  /// **'Daxil ol'**
  String get authSignInTitle;

  /// No description provided for @authSignInSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Hesabınıza e-poçt və ya telefon ilə daxil olun.'**
  String get authSignInSubtitle;

  /// No description provided for @authIdentifierLabel.
  ///
  /// In az, this message translates to:
  /// **'E-poçt və ya telefon'**
  String get authIdentifierLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In az, this message translates to:
  /// **'Parol'**
  String get authPasswordLabel;

  /// No description provided for @authPasswordHint.
  ///
  /// In az, this message translates to:
  /// **'Ən azı 8 simvol, rəqəm və xüsusi simvol ilə'**
  String get authPasswordHint;

  /// No description provided for @authForgotLink.
  ///
  /// In az, this message translates to:
  /// **'Parolu unutmusunuz?'**
  String get authForgotLink;

  /// No description provided for @authSignInSubmit.
  ///
  /// In az, this message translates to:
  /// **'Daxil ol'**
  String get authSignInSubmit;

  /// No description provided for @authSignInWithSms.
  ///
  /// In az, this message translates to:
  /// **'SMS kodu ilə daxil ol'**
  String get authSignInWithSms;

  /// No description provided for @authOr.
  ///
  /// In az, this message translates to:
  /// **'və ya'**
  String get authOr;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In az, this message translates to:
  /// **'Google ilə davam et'**
  String get authContinueWithGoogle;

  /// No description provided for @authContinueWithApple.
  ///
  /// In az, this message translates to:
  /// **'Apple ilə davam et'**
  String get authContinueWithApple;

  /// No description provided for @authSocialFailed.
  ///
  /// In az, this message translates to:
  /// **'Daxil olmaq alınmadı. Yenidən cəhd edin.'**
  String get authSocialFailed;

  /// No description provided for @authTermsPromptTitle.
  ///
  /// In az, this message translates to:
  /// **'HOO hesabı yaradın'**
  String get authTermsPromptTitle;

  /// No description provided for @authTermsPromptBody.
  ///
  /// In az, this message translates to:
  /// **'Bu hesab üçün hələ qeydiyyat yoxdur. Davam etməklə İstifadə şərtləri və Məxfilik siyasəti ilə razılaşırsınız.'**
  String get authTermsPromptBody;

  /// No description provided for @authTermsPromptAccept.
  ///
  /// In az, this message translates to:
  /// **'Qəbul et və davam et'**
  String get authTermsPromptAccept;

  /// No description provided for @authNoAccount.
  ///
  /// In az, this message translates to:
  /// **'HOO-da yenisiniz?'**
  String get authNoAccount;

  /// No description provided for @authHaveAccount.
  ///
  /// In az, this message translates to:
  /// **'Artıq hesabınız var?'**
  String get authHaveAccount;

  /// No description provided for @authCreateAccount.
  ///
  /// In az, this message translates to:
  /// **'Hesab yarat'**
  String get authCreateAccount;

  /// No description provided for @authSignUpTitle.
  ///
  /// In az, this message translates to:
  /// **'Hesab yaradın'**
  String get authSignUpTitle;

  /// No description provided for @authSignUpSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlərinizi izləyin, sevimliləri saxlayın, dizaynlarınızı idarə edin.'**
  String get authSignUpSubtitle;

  /// No description provided for @authFullNameLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad və soyad'**
  String get authFullNameLabel;

  /// No description provided for @authEmailLabel.
  ///
  /// In az, this message translates to:
  /// **'E-poçt'**
  String get authEmailLabel;

  /// No description provided for @authPhoneLabel.
  ///
  /// In az, this message translates to:
  /// **'Telefon'**
  String get authPhoneLabel;

  /// No description provided for @authAcceptTerms.
  ///
  /// In az, this message translates to:
  /// **'İstifadə şərtləri və Məxfilik siyasəti ilə razıyam'**
  String get authAcceptTerms;

  /// No description provided for @authMarketingConsent.
  ///
  /// In az, this message translates to:
  /// **'Yenilik və endirimlər barədə xəbər almaq istəyirəm'**
  String get authMarketingConsent;

  /// No description provided for @authErrRequired.
  ///
  /// In az, this message translates to:
  /// **'Bu sahə vacibdir'**
  String get authErrRequired;

  /// No description provided for @authErrInvalidEmail.
  ///
  /// In az, this message translates to:
  /// **'E-poçt ünvanı düzgün deyil'**
  String get authErrInvalidEmail;

  /// No description provided for @authErrInvalidPhone.
  ///
  /// In az, this message translates to:
  /// **'Telefon nömrəsi düzgün deyil'**
  String get authErrInvalidPhone;

  /// No description provided for @authErrInvalidIdentifier.
  ///
  /// In az, this message translates to:
  /// **'Düzgün e-poçt və ya telefon yazın'**
  String get authErrInvalidIdentifier;

  /// No description provided for @authErrWeakPassword.
  ///
  /// In az, this message translates to:
  /// **'Parol ən azı 8 simvol, bir rəqəm və bir xüsusi simvol içərməlidir'**
  String get authErrWeakPassword;

  /// No description provided for @authErrTerms.
  ///
  /// In az, this message translates to:
  /// **'Davam etmək üçün şərtləri qəbul edin'**
  String get authErrTerms;

  /// No description provided for @authErrInvalidCode.
  ///
  /// In az, this message translates to:
  /// **'Kod düzgün deyil'**
  String get authErrInvalidCode;

  /// No description provided for @authOtpPhoneTitle.
  ///
  /// In az, this message translates to:
  /// **'Telefonla daxil olun'**
  String get authOtpPhoneTitle;

  /// No description provided for @authOtpPhoneBody.
  ///
  /// In az, this message translates to:
  /// **'Nömrənizə 6 rəqəmli kod göndərəcəyik.'**
  String get authOtpPhoneBody;

  /// No description provided for @authOtpNewAccount.
  ///
  /// In az, this message translates to:
  /// **'Bu nömrə ilə hesab yoxdur. Ad yazın və şərtləri qəbul edin.'**
  String get authOtpNewAccount;

  /// No description provided for @authOtpSendSms.
  ///
  /// In az, this message translates to:
  /// **'SMS ilə kod göndər'**
  String get authOtpSendSms;

  /// No description provided for @authOtpSendWhatsapp.
  ///
  /// In az, this message translates to:
  /// **'WhatsApp ilə göndər'**
  String get authOtpSendWhatsapp;

  /// No description provided for @authOtpCodeTitle.
  ///
  /// In az, this message translates to:
  /// **'Kodu daxil edin'**
  String get authOtpCodeTitle;

  /// No description provided for @authOtpCodeBody.
  ///
  /// In az, this message translates to:
  /// **'{phone} nömrəsinə göndərildi'**
  String authOtpCodeBody(String phone);

  /// No description provided for @authOtpResendIn.
  ///
  /// In az, this message translates to:
  /// **'{seconds} san sonra yenidən göndər'**
  String authOtpResendIn(int seconds);

  /// No description provided for @authOtpResendSms.
  ///
  /// In az, this message translates to:
  /// **'SMS ilə göndər'**
  String get authOtpResendSms;

  /// No description provided for @authOtpResendWhatsapp.
  ///
  /// In az, this message translates to:
  /// **'WhatsApp ilə göndər'**
  String get authOtpResendWhatsapp;

  /// No description provided for @authOtpResent.
  ///
  /// In az, this message translates to:
  /// **'Kod yenidən göndərildi'**
  String get authOtpResent;

  /// No description provided for @authOtpChangePhone.
  ///
  /// In az, this message translates to:
  /// **'Nömrəni dəyiş'**
  String get authOtpChangePhone;

  /// No description provided for @authForgotTitle.
  ///
  /// In az, this message translates to:
  /// **'Parolu bərpa et'**
  String get authForgotTitle;

  /// No description provided for @authForgotBody.
  ///
  /// In az, this message translates to:
  /// **'E-poçt və ya telefonunuzu yazın, sizə bərpa təlimatı göndərək.'**
  String get authForgotBody;

  /// No description provided for @authForgotSubmit.
  ///
  /// In az, this message translates to:
  /// **'Göndər'**
  String get authForgotSubmit;

  /// No description provided for @authForgotSentEmail.
  ///
  /// In az, this message translates to:
  /// **'Hesab mövcuddursa, e-poçtunuza bərpa linki göndərildi.'**
  String get authForgotSentEmail;

  /// No description provided for @authForgotSentPhone.
  ///
  /// In az, this message translates to:
  /// **'Hesab mövcuddursa, telefonunuza kod göndərildi.'**
  String get authForgotSentPhone;

  /// No description provided for @authResetEnterCode.
  ///
  /// In az, this message translates to:
  /// **'Kodu daxil et'**
  String get authResetEnterCode;

  /// No description provided for @authResetTitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni parol'**
  String get authResetTitle;

  /// No description provided for @authResetCodeLabel.
  ///
  /// In az, this message translates to:
  /// **'Kod'**
  String get authResetCodeLabel;

  /// No description provided for @authResetNewPassword.
  ///
  /// In az, this message translates to:
  /// **'Yeni parol'**
  String get authResetNewPassword;

  /// No description provided for @authResetSubmit.
  ///
  /// In az, this message translates to:
  /// **'Parolu yenilə'**
  String get authResetSubmit;

  /// No description provided for @authResetDone.
  ///
  /// In az, this message translates to:
  /// **'Parol yeniləndi. Yeni parolla daxil olun.'**
  String get authResetDone;

  /// No description provided for @cartTitle.
  ///
  /// In az, this message translates to:
  /// **'Səbət'**
  String get cartTitle;

  /// No description provided for @cartEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Səbətiniz boşdur'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyMessage.
  ///
  /// In az, this message translates to:
  /// **'Bəyəndiyiniz məhsulları əlavə edin və ya Studio-da öz dizaynınızı yaradın.'**
  String get cartEmptyMessage;

  /// No description provided for @cartEmptyCta.
  ///
  /// In az, this message translates to:
  /// **'Alış-verişə başla'**
  String get cartEmptyCta;

  /// No description provided for @cartBestsellersTitle.
  ///
  /// In az, this message translates to:
  /// **'Bestsellerlər'**
  String get cartBestsellersTitle;

  /// No description provided for @cartCompleteTheLookTitle.
  ///
  /// In az, this message translates to:
  /// **'Obrazı tamamla'**
  String get cartCompleteTheLookTitle;

  /// Pulsuz çatdırılmaya qalan məbləğ (serverdən, formatlanmış pul)
  ///
  /// In az, this message translates to:
  /// **'Pulsuz çatdırılma üçün daha {amount} əlavə edin'**
  String cartFreeDeliveryRemaining(String amount);

  /// No description provided for @cartFreeDeliveryQualified.
  ///
  /// In az, this message translates to:
  /// **'Afərin! Çatdırılma pulsuzdur'**
  String get cartFreeDeliveryQualified;

  /// No description provided for @cartPromoTitle.
  ///
  /// In az, this message translates to:
  /// **'Promo kod'**
  String get cartPromoTitle;

  /// No description provided for @cartPromoHint.
  ///
  /// In az, this message translates to:
  /// **'Kodu daxil edin'**
  String get cartPromoHint;

  /// Tətbiq olunmuş promo kod
  ///
  /// In az, this message translates to:
  /// **'{code} kodu tətbiq olundu'**
  String cartPromoApplied(String code);

  /// No description provided for @cartPromoRemoveA11y.
  ///
  /// In az, this message translates to:
  /// **'Promo kodu sil'**
  String get cartPromoRemoveA11y;

  /// No description provided for @cartGiftTitle.
  ///
  /// In az, this message translates to:
  /// **'Bu hədiyyədir'**
  String get cartGiftTitle;

  /// No description provided for @cartGiftSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Qablaşdırma, kart və mesajı sifariş zamanı seçəcəksiniz'**
  String get cartGiftSubtitle;

  /// No description provided for @cartSummaryTitle.
  ///
  /// In az, this message translates to:
  /// **'Xülasə'**
  String get cartSummaryTitle;

  /// No description provided for @cartDeliveryAtCheckout.
  ///
  /// In az, this message translates to:
  /// **'Sifariş zamanı hesablanır'**
  String get cartDeliveryAtCheckout;

  /// No description provided for @cartCheckout.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi rəsmiləşdir'**
  String get cartCheckout;

  /// Silinmiş məhsulun adı
  ///
  /// In az, this message translates to:
  /// **'{name} səbətdən silindi'**
  String cartRemoved(String name);

  /// No description provided for @cartUndo.
  ///
  /// In az, this message translates to:
  /// **'Geri qaytar'**
  String get cartUndo;

  /// Silinəcək məhsulun adı (ekran oxuyucu üçün)
  ///
  /// In az, this message translates to:
  /// **'{name} məhsulunu sil'**
  String cartRemoveA11y(String name);

  /// No description provided for @cartCustomDesign.
  ///
  /// In az, this message translates to:
  /// **'Fərdi dizayn'**
  String get cartCustomDesign;

  /// Studio sifarişinin istehsal müddəti (gün)
  ///
  /// In az, this message translates to:
  /// **'{days} gün ərzində hazırlanır'**
  String cartLeadTime(int days);

  /// Anbarda qalan say
  ///
  /// In az, this message translates to:
  /// **'Cəmi {count} ədəd qalıb'**
  String cartStockLeft(int count);

  /// Ölçü etiketi (XS, M, 3XL…)
  ///
  /// In az, this message translates to:
  /// **'Ölçü {size}'**
  String cartSize(String size);

  /// Say × vahid qiymət (hər ikisi serverdən)
  ///
  /// In az, this message translates to:
  /// **'{quantity} × {price}'**
  String cartUnitPrice(int quantity, String price);

  /// No description provided for @cartFixErrors.
  ///
  /// In az, this message translates to:
  /// **'Bəzi məhsullar diqqət tələb edir — sifarişdən əvvəl onları düzəldin və ya silin.'**
  String get cartFixErrors;

  /// No description provided for @cartAddedTitle.
  ///
  /// In az, this message translates to:
  /// **'Səbətə əlavə olundu'**
  String get cartAddedTitle;

  /// No description provided for @cartViewBag.
  ///
  /// In az, this message translates to:
  /// **'Səbətə bax'**
  String get cartViewBag;

  /// No description provided for @cartContinueShopping.
  ///
  /// In az, this message translates to:
  /// **'Alış-verişə davam et'**
  String get cartContinueShopping;

  /// Səbətdəki ümumi say
  ///
  /// In az, this message translates to:
  /// **'Ara cəm · {count} ədəd'**
  String cartSubtotalWithCount(int count);

  /// No description provided for @catalogSortNewest.
  ///
  /// In az, this message translates to:
  /// **'Ən yenilər'**
  String get catalogSortNewest;

  /// No description provided for @catalogSortPriceAsc.
  ///
  /// In az, this message translates to:
  /// **'Qiymət: aşağıdan yuxarı'**
  String get catalogSortPriceAsc;

  /// No description provided for @catalogSortPriceDesc.
  ///
  /// In az, this message translates to:
  /// **'Qiymət: yuxarıdan aşağı'**
  String get catalogSortPriceDesc;

  /// No description provided for @catalogSortPopular.
  ///
  /// In az, this message translates to:
  /// **'Populyar'**
  String get catalogSortPopular;

  /// No description provided for @catalogFilterTitle.
  ///
  /// In az, this message translates to:
  /// **'Filtr və sıralama'**
  String get catalogFilterTitle;

  /// No description provided for @catalogFilterSort.
  ///
  /// In az, this message translates to:
  /// **'Sıralama'**
  String get catalogFilterSort;

  /// No description provided for @catalogFilterCategory.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriya'**
  String get catalogFilterCategory;

  /// No description provided for @catalogFilterCollection.
  ///
  /// In az, this message translates to:
  /// **'Kolleksiya'**
  String get catalogFilterCollection;

  /// No description provided for @catalogFilterSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü'**
  String get catalogFilterSize;

  /// No description provided for @catalogFilterColor.
  ///
  /// In az, this message translates to:
  /// **'Rəng'**
  String get catalogFilterColor;

  /// No description provided for @catalogFilterFit.
  ///
  /// In az, this message translates to:
  /// **'Kəsim'**
  String get catalogFilterFit;

  /// No description provided for @catalogFilterPrice.
  ///
  /// In az, this message translates to:
  /// **'Qiymət'**
  String get catalogFilterPrice;

  /// No description provided for @catalogFilterAvailability.
  ///
  /// In az, this message translates to:
  /// **'Mövcudluq'**
  String get catalogFilterAvailability;

  /// No description provided for @catalogFilterInStockOnly.
  ///
  /// In az, this message translates to:
  /// **'Yalnız stokda olanlar'**
  String get catalogFilterInStockOnly;

  /// No description provided for @catalogTabAll.
  ///
  /// In az, this message translates to:
  /// **'Hamısı'**
  String get catalogTabAll;

  /// No description provided for @catalogTabNew.
  ///
  /// In az, this message translates to:
  /// **'Yeni'**
  String get catalogTabNew;

  /// No description provided for @catalogTabSale.
  ///
  /// In az, this message translates to:
  /// **'Endirim'**
  String get catalogTabSale;

  /// No description provided for @catalogEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Məhsul tapılmadı'**
  String get catalogEmptyTitle;

  /// No description provided for @catalogEmptyMessage.
  ///
  /// In az, this message translates to:
  /// **'Filtrləri dəyişin və ya təmizləyin.'**
  String get catalogEmptyMessage;

  /// No description provided for @catalogResultCount.
  ///
  /// In az, this message translates to:
  /// **'{count, plural, =1{1 məhsul} other{{count} məhsul}}'**
  String catalogResultCount(int count);

  /// No description provided for @catalogGallery3d.
  ///
  /// In az, this message translates to:
  /// **'3D'**
  String get catalogGallery3d;

  /// No description provided for @catalogGalleryPhotos.
  ///
  /// In az, this message translates to:
  /// **'Şəkillər'**
  String get catalogGalleryPhotos;

  /// No description provided for @catalogColor.
  ///
  /// In az, this message translates to:
  /// **'Rəng'**
  String get catalogColor;

  /// No description provided for @catalogSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü'**
  String get catalogSize;

  /// No description provided for @catalogSizeGuide.
  ///
  /// In az, this message translates to:
  /// **'Ölçü cədvəli'**
  String get catalogSizeGuide;

  /// No description provided for @catalogSizeLabel.
  ///
  /// In az, this message translates to:
  /// **'Ölçü'**
  String get catalogSizeLabel;

  /// No description provided for @catalogChest.
  ///
  /// In az, this message translates to:
  /// **'Sinə'**
  String get catalogChest;

  /// No description provided for @catalogLength.
  ///
  /// In az, this message translates to:
  /// **'Uzunluq'**
  String get catalogLength;

  /// No description provided for @catalogSleeve.
  ///
  /// In az, this message translates to:
  /// **'Qol'**
  String get catalogSleeve;

  /// No description provided for @catalogUnitCm.
  ///
  /// In az, this message translates to:
  /// **'sm'**
  String get catalogUnitCm;

  /// No description provided for @catalogUnitIn.
  ///
  /// In az, this message translates to:
  /// **'düym'**
  String get catalogUnitIn;

  /// No description provided for @catalogSizeUnavailable.
  ///
  /// In az, this message translates to:
  /// **'Bu ölçü hazırda mövcud deyil'**
  String get catalogSizeUnavailable;

  /// No description provided for @catalogOnlyLeft.
  ///
  /// In az, this message translates to:
  /// **'{size} ölçüsündən cəmi {count} ədəd qalıb'**
  String catalogOnlyLeft(int count, String size);

  /// No description provided for @catalogPreorderNote.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlə hazırlanır, çatdırılma bir qədər gec ola bilər.'**
  String get catalogPreorderNote;

  /// No description provided for @catalogRecommendedSize.
  ///
  /// In az, this message translates to:
  /// **'Sizə {size} ölçüsünü tövsiyə edirik'**
  String catalogRecommendedSize(String size);

  /// No description provided for @catalogColorSoldOut.
  ///
  /// In az, this message translates to:
  /// **'Bu rəng hazırda bitib.'**
  String get catalogColorSoldOut;

  /// No description provided for @catalogSizeSoldOutHint.
  ///
  /// In az, this message translates to:
  /// **'Bəzi ölçülər bitib. Stoka düşəndə xəbər verək.'**
  String get catalogSizeSoldOutHint;

  /// No description provided for @catalogNotifyMe.
  ///
  /// In az, this message translates to:
  /// **'Mənə xəbər ver'**
  String get catalogNotifyMe;

  /// No description provided for @catalogPriceDropAlert.
  ///
  /// In az, this message translates to:
  /// **'Qiymət düşəndə xəbər ver'**
  String get catalogPriceDropAlert;

  /// No description provided for @catalogPriceDropAlertSet.
  ///
  /// In az, this message translates to:
  /// **'Qiymət düşəndə sizə xəbər verəcəyik.'**
  String get catalogPriceDropAlertSet;

  /// No description provided for @catalogBackInStockAlertSet.
  ///
  /// In az, this message translates to:
  /// **'Stoka düşəndə sizə xəbər verəcəyik.'**
  String get catalogBackInStockAlertSet;

  /// No description provided for @catalogAlertSignIn.
  ///
  /// In az, this message translates to:
  /// **'Xəbərdarlıq üçün hesabınıza daxil olun.'**
  String get catalogAlertSignIn;

  /// No description provided for @catalogDeliveryPromise.
  ///
  /// In az, this message translates to:
  /// **'{hours} saat {minutes} dəq ərzində sifariş edin — {date} çatdırılsın'**
  String catalogDeliveryPromise(int hours, int minutes, String date);

  /// No description provided for @catalogCustomize.
  ///
  /// In az, this message translates to:
  /// **'Bunu özünüz dizayn edin'**
  String get catalogCustomize;

  /// No description provided for @catalogDescription.
  ///
  /// In az, this message translates to:
  /// **'Təsvir'**
  String get catalogDescription;

  /// No description provided for @catalogSizeAndFit.
  ///
  /// In az, this message translates to:
  /// **'Ölçü və kəsim'**
  String get catalogSizeAndFit;

  /// No description provided for @catalogFabricAndCare.
  ///
  /// In az, this message translates to:
  /// **'Parça və qulluq'**
  String get catalogFabricAndCare;

  /// No description provided for @catalogReviews.
  ///
  /// In az, this message translates to:
  /// **'Rəylər'**
  String get catalogReviews;

  /// No description provided for @catalogReviewsCount.
  ///
  /// In az, this message translates to:
  /// **'{count, plural, =1{1 rəy} other{{count} rəy}}'**
  String catalogReviewsCount(int count);

  /// No description provided for @catalogCompleteTheLook.
  ///
  /// In az, this message translates to:
  /// **'Görünüşü tamamla'**
  String get catalogCompleteTheLook;

  /// No description provided for @catalogYouMayAlsoLike.
  ///
  /// In az, this message translates to:
  /// **'Sizə maraqlı ola bilər'**
  String get catalogYouMayAlsoLike;

  /// No description provided for @catalogAddToBag.
  ///
  /// In az, this message translates to:
  /// **'Səbətə at'**
  String get catalogAddToBag;

  /// No description provided for @catalogSelectSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü seçin'**
  String get catalogSelectSize;

  /// No description provided for @catalogSoldOut.
  ///
  /// In az, this message translates to:
  /// **'Bitib'**
  String get catalogSoldOut;

  /// No description provided for @catalogPreorder.
  ///
  /// In az, this message translates to:
  /// **'Əvvəlcədən sifariş et'**
  String get catalogPreorder;

  /// No description provided for @catalogWriteReview.
  ///
  /// In az, this message translates to:
  /// **'Rəy yaz'**
  String get catalogWriteReview;

  /// No description provided for @catalogReviewSignIn.
  ///
  /// In az, this message translates to:
  /// **'Rəy yazmaq üçün daxil olun.'**
  String get catalogReviewSignIn;

  /// No description provided for @catalogNoReviewsTitle.
  ///
  /// In az, this message translates to:
  /// **'Hələ rəy yoxdur'**
  String get catalogNoReviewsTitle;

  /// No description provided for @catalogNoReviewsMessage.
  ///
  /// In az, this message translates to:
  /// **'Sifarişiniz çatdırıldıqdan sonra ilk rəyi siz yaza bilərsiniz.'**
  String get catalogNoReviewsMessage;

  /// No description provided for @catalogYourRating.
  ///
  /// In az, this message translates to:
  /// **'Qiymətiniz'**
  String get catalogYourRating;

  /// No description provided for @catalogRatingRequired.
  ///
  /// In az, this message translates to:
  /// **'Qiymət seçin'**
  String get catalogRatingRequired;

  /// No description provided for @catalogReviewTitle.
  ///
  /// In az, this message translates to:
  /// **'Başlıq'**
  String get catalogReviewTitle;

  /// No description provided for @catalogReviewBody.
  ///
  /// In az, this message translates to:
  /// **'Rəyiniz'**
  String get catalogReviewBody;

  /// No description provided for @catalogReviewBodyShort.
  ///
  /// In az, this message translates to:
  /// **'Ən azı {min} simvol yazın'**
  String catalogReviewBodyShort(int min);

  /// No description provided for @catalogReviewModeration.
  ///
  /// In az, this message translates to:
  /// **'Rəylər yoxlanıldıqdan sonra dərc olunur.'**
  String get catalogReviewModeration;

  /// No description provided for @catalogReviewSubmit.
  ///
  /// In az, this message translates to:
  /// **'Göndər'**
  String get catalogReviewSubmit;

  /// No description provided for @catalogReviewThanks.
  ///
  /// In az, this message translates to:
  /// **'Təşəkkürlər! Rəyiniz yoxlanışa göndərildi.'**
  String get catalogReviewThanks;

  /// No description provided for @homeHeroTitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni kolleksiya yoldadır'**
  String get homeHeroTitle;

  /// No description provided for @homeHeroCta.
  ///
  /// In az, this message translates to:
  /// **'Yeniliklərə bax'**
  String get homeHeroCta;

  /// No description provided for @homeDesignTitle.
  ///
  /// In az, this message translates to:
  /// **'Özünüz dizayn edin'**
  String get homeDesignTitle;

  /// No description provided for @homeDesignBody.
  ///
  /// In az, this message translates to:
  /// **'Modeli seçin, mətn və şəkil əlavə edin, 3D-də görün.'**
  String get homeDesignBody;

  /// No description provided for @homeNewArrivals.
  ///
  /// In az, this message translates to:
  /// **'Yeni gələnlər'**
  String get homeNewArrivals;

  /// No description provided for @homeCategories.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriyalar'**
  String get homeCategories;

  /// No description provided for @homeCollections.
  ///
  /// In az, this message translates to:
  /// **'Kolleksiyalar'**
  String get homeCollections;

  /// No description provided for @homeShopTheLook.
  ///
  /// In az, this message translates to:
  /// **'Görünüşü al'**
  String get homeShopTheLook;

  /// No description provided for @homeBestsellers.
  ///
  /// In az, this message translates to:
  /// **'Ən çox satılanlar'**
  String get homeBestsellers;

  /// No description provided for @homeRecentlyViewed.
  ///
  /// In az, this message translates to:
  /// **'Son baxdıqlarınız'**
  String get homeRecentlyViewed;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Tezliklə yeni məhsullar'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyMessage.
  ///
  /// In az, this message translates to:
  /// **'Bir az sonra yenidən yoxlayın.'**
  String get homeEmptyMessage;

  /// No description provided for @launchComingSoonEyebrow.
  ///
  /// In az, this message translates to:
  /// **'Tezliklə'**
  String get launchComingSoonEyebrow;

  /// No description provided for @launchComingSoonOpensOn.
  ///
  /// In az, this message translates to:
  /// **'{date} açılır'**
  String launchComingSoonOpensOn(String date);

  /// No description provided for @launchComingSoonFallbackTitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni HOO yoldadır'**
  String get launchComingSoonFallbackTitle;

  /// No description provided for @launchComingSoonFallbackSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Bakıda tikilən premium streetwear. Açılışı ilk siz bilin.'**
  String get launchComingSoonFallbackSubtitle;

  /// No description provided for @launchCountdownDays.
  ///
  /// In az, this message translates to:
  /// **'gün'**
  String get launchCountdownDays;

  /// No description provided for @launchCountdownHours.
  ///
  /// In az, this message translates to:
  /// **'saat'**
  String get launchCountdownHours;

  /// No description provided for @launchCountdownMinutes.
  ///
  /// In az, this message translates to:
  /// **'dəq'**
  String get launchCountdownMinutes;

  /// No description provided for @launchCountdownSeconds.
  ///
  /// In az, this message translates to:
  /// **'san'**
  String get launchCountdownSeconds;

  /// No description provided for @launchCountdownA11y.
  ///
  /// In az, this message translates to:
  /// **'Açılışa {days} gün, {hours} saat, {minutes} dəqiqə qalıb'**
  String launchCountdownA11y(int days, int hours, int minutes);

  /// No description provided for @launchWaitlistTitle.
  ///
  /// In az, this message translates to:
  /// **'Gözləmə siyahısına qoşul'**
  String get launchWaitlistTitle;

  /// No description provided for @launchWaitlistBody.
  ///
  /// In az, this message translates to:
  /// **'Açılış günü ilk siz xəbər tutun və erkən giriş əldə edin.'**
  String get launchWaitlistBody;

  /// No description provided for @launchWaitlistField.
  ///
  /// In az, this message translates to:
  /// **'E-poçt və ya telefon'**
  String get launchWaitlistField;

  /// No description provided for @launchWaitlistJoin.
  ///
  /// In az, this message translates to:
  /// **'Qoşul'**
  String get launchWaitlistJoin;

  /// No description provided for @launchWaitlistJoined.
  ///
  /// In az, this message translates to:
  /// **'Siz {total} nəfər arasında #{position} sıradasınız'**
  String launchWaitlistJoined(int position, int total);

  /// No description provided for @launchWaitlistAlready.
  ///
  /// In az, this message translates to:
  /// **'Siz artıq siyahıdasınız: {total} nəfər arasında #{position}'**
  String launchWaitlistAlready(int position, int total);

  /// No description provided for @launchWaitlistCount.
  ///
  /// In az, this message translates to:
  /// **'{count, plural, =1{1 nəfər artıq gözləyir} other{{count} nəfər artıq gözləyir}}'**
  String launchWaitlistCount(int count);

  /// No description provided for @launchWaitlistToday.
  ///
  /// In az, this message translates to:
  /// **'bu gün +{count}'**
  String launchWaitlistToday(int count);

  /// No description provided for @launchNewsletterTitle.
  ///
  /// In az, this message translates to:
  /// **'Bülleten'**
  String get launchNewsletterTitle;

  /// No description provided for @launchNewsletterBody.
  ///
  /// In az, this message translates to:
  /// **'Yeni droplar, kolleksiyalar və təkliflər — birbaşa e-poçtunuza.'**
  String get launchNewsletterBody;

  /// No description provided for @launchNewsletterField.
  ///
  /// In az, this message translates to:
  /// **'E-poçt'**
  String get launchNewsletterField;

  /// No description provided for @launchNewsletterSubscribe.
  ///
  /// In az, this message translates to:
  /// **'Abunə ol'**
  String get launchNewsletterSubscribe;

  /// No description provided for @launchNewsletterDone.
  ///
  /// In az, this message translates to:
  /// **'Abunə oldunuz. Təşəkkürlər!'**
  String get launchNewsletterDone;

  /// No description provided for @launchNewsletterAlready.
  ///
  /// In az, this message translates to:
  /// **'Bu e-poçt artıq abunədir.'**
  String get launchNewsletterAlready;

  /// No description provided for @launchFollow.
  ///
  /// In az, this message translates to:
  /// **'Bizi izləyin'**
  String get launchFollow;

  /// No description provided for @launchOpenLink.
  ///
  /// In az, this message translates to:
  /// **'{name} açın'**
  String launchOpenLink(String name);

  /// No description provided for @launchCannotOpenLink.
  ///
  /// In az, this message translates to:
  /// **'Linki açmaq mümkün olmadı.'**
  String get launchCannotOpenLink;

  /// No description provided for @launchContactEmail.
  ///
  /// In az, this message translates to:
  /// **'E-poçt'**
  String get launchContactEmail;

  /// No description provided for @launchContactPhone.
  ///
  /// In az, this message translates to:
  /// **'Telefon'**
  String get launchContactPhone;

  /// No description provided for @launchStaffSignIn.
  ///
  /// In az, this message translates to:
  /// **'Əməkdaş girişi'**
  String get launchStaffSignIn;

  /// No description provided for @launchStaffNoAccess.
  ///
  /// In az, this message translates to:
  /// **'Bu hesabın əməkdaş girişi yoxdur.'**
  String get launchStaffNoAccess;

  /// No description provided for @launchStoreOpenTitle.
  ///
  /// In az, this message translates to:
  /// **'Mağaza açıldı'**
  String get launchStoreOpenTitle;

  /// No description provided for @launchEnterStore.
  ///
  /// In az, this message translates to:
  /// **'Mağazaya keç'**
  String get launchEnterStore;

  /// No description provided for @launchRetryIn.
  ///
  /// In az, this message translates to:
  /// **'{time} sonra yenidən cəhd edin'**
  String launchRetryIn(String time);

  /// No description provided for @launchLanguage.
  ///
  /// In az, this message translates to:
  /// **'Dil'**
  String get launchLanguage;

  /// No description provided for @launchOnboardingLanguageTitle.
  ///
  /// In az, this message translates to:
  /// **'Dilinizi seçin'**
  String get launchOnboardingLanguageTitle;

  /// No description provided for @launchOnboardingLanguageBody.
  ///
  /// In az, this message translates to:
  /// **'Dili istənilən vaxt Parametrlərdə dəyişə bilərsiniz.'**
  String get launchOnboardingLanguageBody;

  /// No description provided for @launchOnboardingSkip.
  ///
  /// In az, this message translates to:
  /// **'Keç'**
  String get launchOnboardingSkip;

  /// No description provided for @launchOnboardingStart.
  ///
  /// In az, this message translates to:
  /// **'Başla'**
  String get launchOnboardingStart;

  /// No description provided for @launchOnboardingSlide1Eyebrow.
  ///
  /// In az, this message translates to:
  /// **'Bakıdan'**
  String get launchOnboardingSlide1Eyebrow;

  /// No description provided for @launchOnboardingSlide1Title.
  ///
  /// In az, this message translates to:
  /// **'Sakit. Əmin. HOO.'**
  String get launchOnboardingSlide1Title;

  /// No description provided for @launchOnboardingSlide1Body.
  ///
  /// In az, this message translates to:
  /// **'Hudilər, futbolkalar və sviterlər — premium parçalar, minimal dizayn, Bakıda tikilir.'**
  String get launchOnboardingSlide1Body;

  /// No description provided for @launchOnboardingSlide2Eyebrow.
  ///
  /// In az, this message translates to:
  /// **'Studio'**
  String get launchOnboardingSlide2Eyebrow;

  /// No description provided for @launchOnboardingSlide2Title.
  ///
  /// In az, this message translates to:
  /// **'Öz dizaynını yarat'**
  String get launchOnboardingSlide2Title;

  /// No description provided for @launchOnboardingSlide2Body.
  ///
  /// In az, this message translates to:
  /// **'Geyimi və rəngi seç, mətn və şəkil əlavə et, 3D-də bax — qiymət dərhal hesablanır.'**
  String get launchOnboardingSlide2Body;

  /// No description provided for @launchOnboardingSlide3Eyebrow.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma'**
  String get launchOnboardingSlide3Eyebrow;

  /// No description provided for @launchOnboardingSlide3Title.
  ///
  /// In az, this message translates to:
  /// **'Bakıda sürətli çatdırılma'**
  String get launchOnboardingSlide3Title;

  /// No description provided for @launchOnboardingSlide3Body.
  ///
  /// In az, this message translates to:
  /// **'Kuryer seçdiyiniz vaxt aralığında gəlir. Sifarişinizi addım-addım izləyin.'**
  String get launchOnboardingSlide3Body;

  /// No description provided for @searchHint.
  ///
  /// In az, this message translates to:
  /// **'Axtar: hudi, tişört, dizayn…'**
  String get searchHint;

  /// No description provided for @searchClearA11y.
  ///
  /// In az, this message translates to:
  /// **'Axtarışı təmizlə'**
  String get searchClearA11y;

  /// No description provided for @searchRecentTitle.
  ///
  /// In az, this message translates to:
  /// **'Son axtarışlar'**
  String get searchRecentTitle;

  /// No description provided for @searchBestsellersTitle.
  ///
  /// In az, this message translates to:
  /// **'Ən çox satılanlar'**
  String get searchBestsellersTitle;

  /// No description provided for @searchFor.
  ///
  /// In az, this message translates to:
  /// **'“{query}” üçün axtar'**
  String searchFor(String query);

  /// No description provided for @searchNoResultsTitle.
  ///
  /// In az, this message translates to:
  /// **'“{query}” üçün nəticə yoxdur'**
  String searchNoResultsTitle(String query);

  /// No description provided for @searchNoResultsMessage.
  ///
  /// In az, this message translates to:
  /// **'Yazılışı yoxlayın və ya daha qısa söz yazın.'**
  String get searchNoResultsMessage;

  /// No description provided for @searchMayLikeTitle.
  ///
  /// In az, this message translates to:
  /// **'Bəyənə bilərsiniz'**
  String get searchMayLikeTitle;

  /// No description provided for @searchResultsCount.
  ///
  /// In az, this message translates to:
  /// **'“{query}” üçün {count, plural, =1{1 nəticə} other{{count} nəticə}}'**
  String searchResultsCount(int count, String query);

  /// No description provided for @searchFillA11y.
  ///
  /// In az, this message translates to:
  /// **'“{text}” axtarış sahəsinə yaz'**
  String searchFillA11y(String text);

  /// No description provided for @searchDesignYourOwnTitle.
  ///
  /// In az, this message translates to:
  /// **'Özünüz dizayn edin'**
  String get searchDesignYourOwnTitle;

  /// No description provided for @searchDesignYourOwnBody.
  ///
  /// In az, this message translates to:
  /// **'Studio-da modeli seçin, mətn və şəkil əlavə edin.'**
  String get searchDesignYourOwnBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['az', 'en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
