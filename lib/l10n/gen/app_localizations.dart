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

  /// No description provided for @authSignInWithSms.
  ///
  /// In az, this message translates to:
  /// **'SMS kodu ilə daxil ol'**
  String get authSignInWithSms;

  /// No description provided for @authSocialUnavailable.
  ///
  /// In az, this message translates to:
  /// **'Bu giriş üsulu hazırda əlçatan deyil'**
  String get authSocialUnavailable;

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

  /// No description provided for @authSocialTerms.
  ///
  /// In az, this message translates to:
  /// **'Davam etməklə İstifadə şərtlərini qəbul edirsiniz.'**
  String get authSocialTerms;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In az, this message translates to:
  /// **'Sakit. Əmin. HOO.'**
  String get authWelcomeTitle;

  /// No description provided for @authWelcomeSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Bakıdan premium streetwear — və öz dizaynın üçün 3D Studio.'**
  String get authWelcomeSubtitle;

  /// No description provided for @authSignInTitle.
  ///
  /// In az, this message translates to:
  /// **'Xoş gəldiniz'**
  String get authSignInTitle;

  /// No description provided for @authSignInSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişləriniz, dizaynlarınız və bəyəndikləriniz sizi gözləyir.'**
  String get authSignInSubtitle;

  /// No description provided for @authIdentifierLabel.
  ///
  /// In az, this message translates to:
  /// **'E-poçt və ya telefon'**
  String get authIdentifierLabel;

  /// No description provided for @authIdentifierHint.
  ///
  /// In az, this message translates to:
  /// **'you@example.com və ya 050 123 45 67'**
  String get authIdentifierHint;

  /// No description provided for @authPasswordLabel.
  ///
  /// In az, this message translates to:
  /// **'Şifrə'**
  String get authPasswordLabel;

  /// No description provided for @authForgotPassword.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni unutmusunuz?'**
  String get authForgotPassword;

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

  /// No description provided for @authSignUpTitle.
  ///
  /// In az, this message translates to:
  /// **'Hesab yaradın'**
  String get authSignUpTitle;

  /// No description provided for @authSignUpSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni drop-lara erkən giriş, sürətli checkout və saxlanılmış dizaynlar.'**
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

  /// No description provided for @authMarketingConsent.
  ///
  /// In az, this message translates to:
  /// **'Yeni drop-lar və təkliflər haqqında ilk mən bilmək istəyirəm'**
  String get authMarketingConsent;

  /// No description provided for @authAcceptTerms.
  ///
  /// In az, this message translates to:
  /// **'İstifadə şərtlərini və Məxfilik siyasətini qəbul edirəm'**
  String get authAcceptTerms;

  /// No description provided for @authTermsRequired.
  ///
  /// In az, this message translates to:
  /// **'Davam etmək üçün şərtləri qəbul edin'**
  String get authTermsRequired;

  /// No description provided for @authOtpPhoneTitle.
  ///
  /// In az, this message translates to:
  /// **'Telefonla daxil olun'**
  String get authOtpPhoneTitle;

  /// No description provided for @authOtpPhoneSubtitle.
  ///
  /// In az, this message translates to:
  /// **'6 rəqəmli kodu SMS ilə göndərəcəyik. Yeni nömrə üçün hesab avtomatik yaradılır.'**
  String get authOtpPhoneSubtitle;

  /// No description provided for @authOtpNameHint.
  ///
  /// In az, this message translates to:
  /// **'yeni müştərilər üçün'**
  String get authOtpNameHint;

  /// No description provided for @authSendCode.
  ///
  /// In az, this message translates to:
  /// **'Kodu göndər'**
  String get authSendCode;

  /// No description provided for @authOtpCodeTitle.
  ///
  /// In az, this message translates to:
  /// **'Kodu daxil edin'**
  String get authOtpCodeTitle;

  /// No description provided for @authOtpCodeSubtitle.
  ///
  /// In az, this message translates to:
  /// **'{phone} nömrəsinə göndərdik'**
  String authOtpCodeSubtitle(String phone);

  /// No description provided for @authResendIn.
  ///
  /// In az, this message translates to:
  /// **'Yenidən göndərmək: {time}'**
  String authResendIn(String time);

  /// No description provided for @authResendSms.
  ///
  /// In az, this message translates to:
  /// **'Kodu yenidən göndər'**
  String get authResendSms;

  /// No description provided for @authResendWhatsApp.
  ///
  /// In az, this message translates to:
  /// **'SMS gəlmədi? WhatsApp ilə göndər'**
  String get authResendWhatsApp;

  /// No description provided for @authForgotTitle.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni bərpa et'**
  String get authForgotTitle;

  /// No description provided for @authForgotSubtitle.
  ///
  /// In az, this message translates to:
  /// **'E-poçt ünvanınızı və ya telefonunuzu yazın.'**
  String get authForgotSubtitle;

  /// No description provided for @authForgotEmailSentTitle.
  ///
  /// In az, this message translates to:
  /// **'Poçtunuzu yoxlayın'**
  String get authForgotEmailSentTitle;

  /// No description provided for @authForgotEmailSent.
  ///
  /// In az, this message translates to:
  /// **'Hesab varsa, şifrəni yeniləmək üçün link göndərdik.'**
  String get authForgotEmailSent;

  /// No description provided for @authResetTitle.
  ///
  /// In az, this message translates to:
  /// **'Yeni şifrə'**
  String get authResetTitle;

  /// No description provided for @authResetSubtitle.
  ///
  /// In az, this message translates to:
  /// **'SMS ilə gələn kodu və yeni şifrəni daxil edin.'**
  String get authResetSubtitle;

  /// No description provided for @authResetCodeLabel.
  ///
  /// In az, this message translates to:
  /// **'Kod'**
  String get authResetCodeLabel;

  /// No description provided for @authNewPasswordLabel.
  ///
  /// In az, this message translates to:
  /// **'Yeni şifrə'**
  String get authNewPasswordLabel;

  /// No description provided for @authResetDone.
  ///
  /// In az, this message translates to:
  /// **'Şifrəniz yeniləndi. İndi daxil ola bilərsiniz.'**
  String get authResetDone;

  /// No description provided for @cartAddedTitle.
  ///
  /// In az, this message translates to:
  /// **'Səbətə əlavə olundu'**
  String get cartAddedTitle;

  /// No description provided for @cartItemsCount.
  ///
  /// In az, this message translates to:
  /// **'{count} məhsul'**
  String cartItemsCount(int count);

  /// No description provided for @cartCheckout.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi rəsmiləşdir'**
  String get cartCheckout;

  /// No description provided for @cartViewBag.
  ///
  /// In az, this message translates to:
  /// **'Səbətə bax'**
  String get cartViewBag;

  /// No description provided for @cartOnlyLeft.
  ///
  /// In az, this message translates to:
  /// **'Cəmi {count} ədəd qalıb'**
  String cartOnlyLeft(int count);

  /// No description provided for @cartMadeToOrderDays.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlə hazırlanır · {days} gün'**
  String cartMadeToOrderDays(int days);

  /// No description provided for @cartCustomBadge.
  ///
  /// In az, this message translates to:
  /// **'Studio'**
  String get cartCustomBadge;

  /// No description provided for @cartFreeDeliveryReached.
  ///
  /// In az, this message translates to:
  /// **'Afərin! Çatdırılma pulsuzdur'**
  String get cartFreeDeliveryReached;

  /// No description provided for @cartFreeDeliveryRemaining.
  ///
  /// In az, this message translates to:
  /// **'Pulsuz çatdırılmaya {amount} qalıb'**
  String cartFreeDeliveryRemaining(String amount);

  /// No description provided for @cartRemoved.
  ///
  /// In az, this message translates to:
  /// **'{name} səbətdən silindi'**
  String cartRemoved(String name);

  /// No description provided for @cartUndo.
  ///
  /// In az, this message translates to:
  /// **'Geri qaytar'**
  String get cartUndo;

  /// No description provided for @cartEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Səbətiniz boşdur'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyBody.
  ///
  /// In az, this message translates to:
  /// **'Yeni drop-a baxın və ya Studio-da öz dizaynınızı yaradın.'**
  String get cartEmptyBody;

  /// No description provided for @cartEmptyAction.
  ///
  /// In az, this message translates to:
  /// **'Mağazaya keç'**
  String get cartEmptyAction;

  /// No description provided for @cartBestsellers.
  ///
  /// In az, this message translates to:
  /// **'Ən çox satılanlar'**
  String get cartBestsellers;

  /// No description provided for @cartLineErrors.
  ///
  /// In az, this message translates to:
  /// **'Bəzi məhsullarda dəyişiklik var — sifarişdən əvvəl yoxlayın.'**
  String get cartLineErrors;

  /// No description provided for @cartIsGift.
  ///
  /// In az, this message translates to:
  /// **'Bu hədiyyədir'**
  String get cartIsGift;

  /// No description provided for @cartIsGiftHint.
  ///
  /// In az, this message translates to:
  /// **'Qablaşdırma, təbrik kartı və qiymətsiz qəbz'**
  String get cartIsGiftHint;

  /// No description provided for @cartDeliveryAtCheckout.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma checkout-da hesablanır.'**
  String get cartDeliveryAtCheckout;

  /// No description provided for @cartCompleteTheLook.
  ///
  /// In az, this message translates to:
  /// **'Obrazı tamamla'**
  String get cartCompleteTheLook;

  /// No description provided for @cartPromoHint.
  ///
  /// In az, this message translates to:
  /// **'Promo kod'**
  String get cartPromoHint;

  /// No description provided for @catalogFilterTitle.
  ///
  /// In az, this message translates to:
  /// **'Filtr və sıralama'**
  String get catalogFilterTitle;

  /// No description provided for @catalogSortNewest.
  ///
  /// In az, this message translates to:
  /// **'Ən yenilər'**
  String get catalogSortNewest;

  /// No description provided for @catalogSortPriceAsc.
  ///
  /// In az, this message translates to:
  /// **'Qiymət: artan'**
  String get catalogSortPriceAsc;

  /// No description provided for @catalogSortPriceDesc.
  ///
  /// In az, this message translates to:
  /// **'Qiymət: azalan'**
  String get catalogSortPriceDesc;

  /// No description provided for @catalogSortPopular.
  ///
  /// In az, this message translates to:
  /// **'Ən çox satılan'**
  String get catalogSortPopular;

  /// No description provided for @catalogFilterCategory.
  ///
  /// In az, this message translates to:
  /// **'Kateqoriya'**
  String get catalogFilterCategory;

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

  /// No description provided for @catalogFilterFabric.
  ///
  /// In az, this message translates to:
  /// **'Parça'**
  String get catalogFilterFabric;

  /// No description provided for @catalogFilterPrice.
  ///
  /// In az, this message translates to:
  /// **'Qiymət'**
  String get catalogFilterPrice;

  /// No description provided for @catalogFilterInStock.
  ///
  /// In az, this message translates to:
  /// **'Yalnız anbarda olanlar'**
  String get catalogFilterInStock;

  /// No description provided for @catalogShowResults.
  ///
  /// In az, this message translates to:
  /// **'Nəticələri göstər'**
  String get catalogShowResults;

  /// No description provided for @catalogChipAll.
  ///
  /// In az, this message translates to:
  /// **'Hamısı'**
  String get catalogChipAll;

  /// No description provided for @catalogChipNew.
  ///
  /// In az, this message translates to:
  /// **'Yeni'**
  String get catalogChipNew;

  /// No description provided for @catalogChipSale.
  ///
  /// In az, this message translates to:
  /// **'Endirim'**
  String get catalogChipSale;

  /// No description provided for @catalogChipOversized.
  ///
  /// In az, this message translates to:
  /// **'Oversized'**
  String get catalogChipOversized;

  /// No description provided for @catalogShowing.
  ///
  /// In az, this message translates to:
  /// **'{shown} / {total} məhsul'**
  String catalogShowing(int shown, int total);

  /// No description provided for @catalogFilterAndSort.
  ///
  /// In az, this message translates to:
  /// **'Filtr'**
  String get catalogFilterAndSort;

  /// No description provided for @catalogFilterCount.
  ///
  /// In az, this message translates to:
  /// **'Filtr ({count})'**
  String catalogFilterCount(int count);

  /// No description provided for @catalogEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Heç nə tapılmadı'**
  String get catalogEmptyTitle;

  /// No description provided for @catalogEmptyBody.
  ///
  /// In az, this message translates to:
  /// **'Filtrləri dəyişin və ya təmizləyin.'**
  String get catalogEmptyBody;

  /// No description provided for @catalogAlertSignIn.
  ///
  /// In az, this message translates to:
  /// **'Xəbərdarlıqlar hesabınıza bağlıdır — daxil olun.'**
  String get catalogAlertSignIn;

  /// No description provided for @catalogNotifyDone.
  ///
  /// In az, this message translates to:
  /// **'Stoka qayıdanda xəbər verəcəyik'**
  String get catalogNotifyDone;

  /// No description provided for @catalogPriceAlertDone.
  ///
  /// In az, this message translates to:
  /// **'Qiymət düşəndə xəbər verəcəyik'**
  String get catalogPriceAlertDone;

  /// No description provided for @catalogPhotos.
  ///
  /// In az, this message translates to:
  /// **'Şəkillər'**
  String get catalogPhotos;

  /// No description provided for @catalog3dView.
  ///
  /// In az, this message translates to:
  /// **'3D'**
  String get catalog3dView;

  /// No description provided for @catalogYouMayAlsoLike.
  ///
  /// In az, this message translates to:
  /// **'Bunlar da xoşunuza gələ bilər'**
  String get catalogYouMayAlsoLike;

  /// No description provided for @catalogToday.
  ///
  /// In az, this message translates to:
  /// **'bu gün'**
  String get catalogToday;

  /// No description provided for @catalogTomorrow.
  ///
  /// In az, this message translates to:
  /// **'sabah'**
  String get catalogTomorrow;

  /// No description provided for @catalogDeliveredOn.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma: {when}'**
  String catalogDeliveredOn(String when);

  /// No description provided for @catalogDeliveryPromise.
  ///
  /// In az, this message translates to:
  /// **'{hours} saat {minutes} dəq ərzində sifariş edin — {when} çatdırılsın'**
  String catalogDeliveryPromise(int hours, int minutes, String when);

  /// No description provided for @catalogReadReviews.
  ///
  /// In az, this message translates to:
  /// **'Rəylərə bax'**
  String get catalogReadReviews;

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

  /// No description provided for @catalogPreorderShort.
  ///
  /// In az, this message translates to:
  /// **'ön sifariş'**
  String get catalogPreorderShort;

  /// No description provided for @catalogChooseSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü seçin'**
  String get catalogChooseSize;

  /// No description provided for @catalogRecommendedSize.
  ///
  /// In az, this message translates to:
  /// **'Sizə {size} ölçüsünü tövsiyə edirik'**
  String catalogRecommendedSize(String size);

  /// No description provided for @catalogOnlyLeftIn.
  ///
  /// In az, this message translates to:
  /// **'{size} ölçüsündən cəmi {count} ədəd qalıb'**
  String catalogOnlyLeftIn(int count, String size);

  /// No description provided for @catalogCustomizeThis.
  ///
  /// In az, this message translates to:
  /// **'Bunu fərdiləşdir'**
  String get catalogCustomizeThis;

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

  /// No description provided for @catalogReviewsCount.
  ///
  /// In az, this message translates to:
  /// **'Rəylər ({count})'**
  String catalogReviewsCount(int count);

  /// No description provided for @catalogWriteReview.
  ///
  /// In az, this message translates to:
  /// **'Rəy yaz'**
  String get catalogWriteReview;

  /// No description provided for @catalogPriceDropAlert.
  ///
  /// In az, this message translates to:
  /// **'Qiymət düşəndə xəbər ver'**
  String get catalogPriceDropAlert;

  /// No description provided for @catalogSelectSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü seçin'**
  String get catalogSelectSize;

  /// No description provided for @catalogAddToBag.
  ///
  /// In az, this message translates to:
  /// **'Səbətə əlavə et'**
  String get catalogAddToBag;

  /// No description provided for @catalogSizeCol.
  ///
  /// In az, this message translates to:
  /// **'Ölçü'**
  String get catalogSizeCol;

  /// No description provided for @catalogChestCol.
  ///
  /// In az, this message translates to:
  /// **'Sinə'**
  String get catalogChestCol;

  /// No description provided for @catalogLengthCol.
  ///
  /// In az, this message translates to:
  /// **'Uzunluq'**
  String get catalogLengthCol;

  /// No description provided for @catalogSleeveCol.
  ///
  /// In az, this message translates to:
  /// **'Qol'**
  String get catalogSleeveCol;

  /// No description provided for @catalogSizeGuideHint.
  ///
  /// In az, this message translates to:
  /// **'Ölçülər məhsulun özünə aiddir, düz səthdə ölçülüb.'**
  String get catalogSizeGuideHint;

  /// No description provided for @catalogReviews.
  ///
  /// In az, this message translates to:
  /// **'Rəylər'**
  String get catalogReviews;

  /// No description provided for @catalogNoReviews.
  ///
  /// In az, this message translates to:
  /// **'Hələ rəy yoxdur'**
  String get catalogNoReviews;

  /// No description provided for @catalogNoReviewsBody.
  ///
  /// In az, this message translates to:
  /// **'Bu məhsulu almısınızsa, ilk rəyi siz yazın.'**
  String get catalogNoReviewsBody;

  /// No description provided for @catalogReviewThanks.
  ///
  /// In az, this message translates to:
  /// **'Təşəkkür edirik!'**
  String get catalogReviewThanks;

  /// No description provided for @catalogReviewModeration.
  ///
  /// In az, this message translates to:
  /// **'Rəyiniz yoxlandıqdan sonra dərc olunacaq.'**
  String get catalogReviewModeration;

  /// No description provided for @catalogYourRating.
  ///
  /// In az, this message translates to:
  /// **'Qiymətiniz'**
  String get catalogYourRating;

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

  /// No description provided for @catalogSubmitReview.
  ///
  /// In az, this message translates to:
  /// **'Göndər'**
  String get catalogSubmitReview;

  /// No description provided for @checkoutTitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişin rəsmiləşdirilməsi'**
  String get checkoutTitle;

  /// No description provided for @checkoutStepContact.
  ///
  /// In az, this message translates to:
  /// **'Əlaqə'**
  String get checkoutStepContact;

  /// No description provided for @checkoutStepGift.
  ///
  /// In az, this message translates to:
  /// **'Hədiyyə'**
  String get checkoutStepGift;

  /// No description provided for @checkoutStepDelivery.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma'**
  String get checkoutStepDelivery;

  /// No description provided for @checkoutStepSlot.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma vaxtı'**
  String get checkoutStepSlot;

  /// No description provided for @checkoutStepPayment.
  ///
  /// In az, this message translates to:
  /// **'Ödəniş'**
  String get checkoutStepPayment;

  /// No description provided for @checkoutStepReview.
  ///
  /// In az, this message translates to:
  /// **'Yoxla və təsdiqlə'**
  String get checkoutStepReview;

  /// No description provided for @checkoutPhoneHint.
  ///
  /// In az, this message translates to:
  /// **'Kuryer bu nömrəyə zəng edəcək.'**
  String get checkoutPhoneHint;

  /// No description provided for @checkoutGiftNotForCustom.
  ///
  /// In az, this message translates to:
  /// **'Fərdi (Studio) sifarişlər hədiyyə kimi göndərilə bilməz.'**
  String get checkoutGiftNotForCustom;

  /// No description provided for @checkoutRecipientName.
  ///
  /// In az, this message translates to:
  /// **'Alıcının adı'**
  String get checkoutRecipientName;

  /// No description provided for @checkoutRecipientPhone.
  ///
  /// In az, this message translates to:
  /// **'Alıcının telefonu'**
  String get checkoutRecipientPhone;

  /// No description provided for @checkoutOccasion.
  ///
  /// In az, this message translates to:
  /// **'Səbəb'**
  String get checkoutOccasion;

  /// No description provided for @checkoutSurprise.
  ///
  /// In az, this message translates to:
  /// **'Sürpriz'**
  String get checkoutSurprise;

  /// No description provided for @checkoutSurpriseHint.
  ///
  /// In az, this message translates to:
  /// **'Kuryer əvvəlcədən sizinlə əlaqə saxlayacaq, alıcı ilə yox.'**
  String get checkoutSurpriseHint;

  /// No description provided for @checkoutPackaging.
  ///
  /// In az, this message translates to:
  /// **'Qablaşdırma'**
  String get checkoutPackaging;

  /// No description provided for @checkoutPackagingFreeFrom.
  ///
  /// In az, this message translates to:
  /// **'{amount}-dan pulsuz'**
  String checkoutPackagingFreeFrom(String amount);

  /// No description provided for @checkoutCard.
  ///
  /// In az, this message translates to:
  /// **'Təbrik kartı'**
  String get checkoutCard;

  /// No description provided for @checkoutMessage.
  ///
  /// In az, this message translates to:
  /// **'Mesaj'**
  String get checkoutMessage;

  /// No description provided for @checkoutFromName.
  ///
  /// In az, this message translates to:
  /// **'Kimdən'**
  String get checkoutFromName;

  /// No description provided for @checkoutHidePrices.
  ///
  /// In az, this message translates to:
  /// **'Qəbzdə qiymətləri gizlət'**
  String get checkoutHidePrices;

  /// No description provided for @checkoutReadyInHours.
  ///
  /// In az, this message translates to:
  /// **'{hours} saata hazır'**
  String checkoutReadyInHours(int hours);

  /// No description provided for @checkoutFreeFrom.
  ///
  /// In az, this message translates to:
  /// **'{amount}-dan pulsuz'**
  String checkoutFreeFrom(String amount);

  /// No description provided for @checkoutAddress.
  ///
  /// In az, this message translates to:
  /// **'Ünvan'**
  String get checkoutAddress;

  /// No description provided for @checkoutNewAddress.
  ///
  /// In az, this message translates to:
  /// **'Yeni ünvan'**
  String get checkoutNewAddress;

  /// No description provided for @checkoutCity.
  ///
  /// In az, this message translates to:
  /// **'Şəhər'**
  String get checkoutCity;

  /// No description provided for @checkoutDistrict.
  ///
  /// In az, this message translates to:
  /// **'Rayon'**
  String get checkoutDistrict;

  /// No description provided for @checkoutStreet.
  ///
  /// In az, this message translates to:
  /// **'Küçə, ev'**
  String get checkoutStreet;

  /// No description provided for @checkoutApartment.
  ///
  /// In az, this message translates to:
  /// **'Mənzil'**
  String get checkoutApartment;

  /// No description provided for @checkoutCourierNote.
  ///
  /// In az, this message translates to:
  /// **'Kuryer üçün qeyd'**
  String get checkoutCourierNote;

  /// No description provided for @checkoutNoSlots.
  ///
  /// In az, this message translates to:
  /// **'Uyğun vaxt yoxdur'**
  String get checkoutNoSlots;

  /// No description provided for @checkoutSlotTaken.
  ///
  /// In az, this message translates to:
  /// **'Bu vaxt artıq doludur — başqa birini seçin.'**
  String get checkoutSlotTaken;

  /// No description provided for @checkoutPackagingSaving.
  ///
  /// In az, this message translates to:
  /// **'Qablaşdırmaya qənaət'**
  String get checkoutPackagingSaving;

  /// No description provided for @checkoutEstimatedDelivery.
  ///
  /// In az, this message translates to:
  /// **'Təxmini çatdırılma: {range}'**
  String checkoutEstimatedDelivery(String range);

  /// No description provided for @checkoutCustomApprovalNote.
  ///
  /// In az, this message translates to:
  /// **'Studio dizaynları əvvəlcə komandamız tərəfindən yoxlanılır. Təsdiqdən sonra istehsala göndərilir — sifariş statusu “Dizayn təsdiqi gözlənilir” olacaq.'**
  String get checkoutCustomApprovalNote;

  /// No description provided for @checkoutSaveCard.
  ///
  /// In az, this message translates to:
  /// **'Kartı növbəti alışlar üçün yadda saxla'**
  String get checkoutSaveCard;

  /// No description provided for @checkoutAcceptTerms.
  ///
  /// In az, this message translates to:
  /// **'Satış şərtlərini və qaytarma siyasətini qəbul edirəm'**
  String get checkoutAcceptTerms;

  /// No description provided for @checkoutImageRights.
  ///
  /// In az, this message translates to:
  /// **'Şəkillərin hüquqları mənə məxsusdur; fərdi məhsulların qaytarılmadığını bilirəm'**
  String get checkoutImageRights;

  /// No description provided for @checkoutMissingSteps.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi təsdiqləmək üçün yuxarıdakı addımları tamamlayın.'**
  String get checkoutMissingSteps;

  /// No description provided for @checkoutPlaceOrder.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi təsdiqlə · {total}'**
  String checkoutPlaceOrder(String total);

  /// No description provided for @checkoutPaymentFailedTitle.
  ///
  /// In az, this message translates to:
  /// **'Ödəniş alınmadı'**
  String get checkoutPaymentFailedTitle;

  /// No description provided for @checkoutPaymentFailedBody.
  ///
  /// In az, this message translates to:
  /// **'Sifarişiniz saxlanılıb. Yenidən ödəyin və ya başqa üsul seçin.'**
  String get checkoutPaymentFailedBody;

  /// No description provided for @checkoutRetryPayment.
  ///
  /// In az, this message translates to:
  /// **'Yenidən ödə'**
  String get checkoutRetryPayment;

  /// No description provided for @checkoutSwitchToCod.
  ///
  /// In az, this message translates to:
  /// **'Qapıda nağd ödəyəcəm'**
  String get checkoutSwitchToCod;

  /// No description provided for @checkoutAwaitingPayment.
  ///
  /// In az, this message translates to:
  /// **'Ödənişi tamamlayın'**
  String get checkoutAwaitingPayment;

  /// No description provided for @checkoutAwaitingPaymentBody.
  ///
  /// In az, this message translates to:
  /// **'Sifariş {number} yaradıldı. Ödəniş təsdiqlənən kimi davam edəcəyik.'**
  String checkoutAwaitingPaymentBody(String number);

  /// No description provided for @checkoutCheckPayment.
  ///
  /// In az, this message translates to:
  /// **'Ödənişi yoxla'**
  String get checkoutCheckPayment;

  /// No description provided for @checkoutOpenPaymentAgain.
  ///
  /// In az, this message translates to:
  /// **'Ödəniş səhifəsini yenidən aç'**
  String get checkoutOpenPaymentAgain;

  /// No description provided for @checkoutConfirmedTitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişiniz qəbul olundu'**
  String get checkoutConfirmedTitle;

  /// No description provided for @checkoutConfirmedBody.
  ///
  /// In az, this message translates to:
  /// **'Təşəkkür edirik. Təsdiq məktubu və SMS göndərdik.'**
  String get checkoutConfirmedBody;

  /// No description provided for @checkoutOrderNumber.
  ///
  /// In az, this message translates to:
  /// **'Sifariş nömrəsi'**
  String get checkoutOrderNumber;

  /// No description provided for @checkoutGiftReceipt.
  ///
  /// In az, this message translates to:
  /// **'Hədiyyə qəbzi'**
  String get checkoutGiftReceipt;

  /// No description provided for @checkoutGiftReceiptHint.
  ///
  /// In az, this message translates to:
  /// **'Alıcı bu kodla ölçünü dəyişə bilər — qiymətləri görmədən.'**
  String get checkoutGiftReceiptHint;

  /// No description provided for @checkoutTrackOrder.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi izlə'**
  String get checkoutTrackOrder;

  /// No description provided for @checkoutContinueShopping.
  ///
  /// In az, this message translates to:
  /// **'Alış-verişə davam et'**
  String get checkoutContinueShopping;

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
  /// **'Obrazı al'**
  String get homeShopTheLook;

  /// No description provided for @homeShopLookCount.
  ///
  /// In az, this message translates to:
  /// **'{count} məhsul'**
  String homeShopLookCount(int count);

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

  /// No description provided for @homeHeroEyebrow.
  ///
  /// In az, this message translates to:
  /// **'Yeni drop'**
  String get homeHeroEyebrow;

  /// No description provided for @homeHeroTitle.
  ///
  /// In az, this message translates to:
  /// **'Sakit güc.'**
  String get homeHeroTitle;

  /// No description provided for @homeHeroSubtitle.
  ///
  /// In az, this message translates to:
  /// **'Ağır pambıq, oversized kəsim, meşə yaşılı. Yeni kolleksiya artıq satışdadır.'**
  String get homeHeroSubtitle;

  /// No description provided for @homeHeroCta.
  ///
  /// In az, this message translates to:
  /// **'Kolleksiyaya bax'**
  String get homeHeroCta;

  /// No description provided for @homeStudioTitle.
  ///
  /// In az, this message translates to:
  /// **'Öz dizaynını yarat'**
  String get homeStudioTitle;

  /// No description provided for @homeStudioBody.
  ///
  /// In az, this message translates to:
  /// **'Parçanı, rəngi seç, mətn və şəkil əlavə et — 3D-də gör.'**
  String get homeStudioBody;

  /// No description provided for @homeStudioCta.
  ///
  /// In az, this message translates to:
  /// **'Studio-nu aç'**
  String get homeStudioCta;

  /// No description provided for @launchComingSoonTitle.
  ///
  /// In az, this message translates to:
  /// **'Tezliklə.'**
  String get launchComingSoonTitle;

  /// No description provided for @launchComingSoonSubtitle.
  ///
  /// In az, this message translates to:
  /// **'HOO açılır. Siyahıya yazılın — ilk drop-a erkən giriş sizin olsun.'**
  String get launchComingSoonSubtitle;

  /// No description provided for @launchDays.
  ///
  /// In az, this message translates to:
  /// **'gün'**
  String get launchDays;

  /// No description provided for @launchHours.
  ///
  /// In az, this message translates to:
  /// **'saat'**
  String get launchHours;

  /// No description provided for @launchMinutes.
  ///
  /// In az, this message translates to:
  /// **'dəq'**
  String get launchMinutes;

  /// No description provided for @launchSeconds.
  ///
  /// In az, this message translates to:
  /// **'san'**
  String get launchSeconds;

  /// No description provided for @launchCountdownA11y.
  ///
  /// In az, this message translates to:
  /// **'Açılışa {days} gün, {hours} saat, {minutes} dəqiqə qalıb'**
  String launchCountdownA11y(int days, int hours, int minutes);

  /// No description provided for @launchWaitlistTitle.
  ///
  /// In az, this message translates to:
  /// **'Gözləmə siyahısı'**
  String get launchWaitlistTitle;

  /// No description provided for @launchWaitlistCount.
  ///
  /// In az, this message translates to:
  /// **'{count} nəfər artıq siyahıdadır'**
  String launchWaitlistCount(int count);

  /// No description provided for @launchJoinWaitlist.
  ///
  /// In az, this message translates to:
  /// **'Siyahıya yazıl'**
  String get launchJoinWaitlist;

  /// No description provided for @launchWaitlistPosition.
  ///
  /// In az, this message translates to:
  /// **'Siz {position}-cisiniz ({total} nəfərdən)'**
  String launchWaitlistPosition(int position, int total);

  /// No description provided for @launchWaitlistThanks.
  ///
  /// In az, this message translates to:
  /// **'Açılış günü ilk xəbər tutan siz olacaqsınız.'**
  String get launchWaitlistThanks;

  /// No description provided for @launchWaitlistAlready.
  ///
  /// In az, this message translates to:
  /// **'Siz artıq siyahıdasınız — gözləyin, tezliklə!'**
  String get launchWaitlistAlready;

  /// No description provided for @launchNewsletterTitle.
  ///
  /// In az, this message translates to:
  /// **'Bülletenə abunə olun'**
  String get launchNewsletterTitle;

  /// No description provided for @launchSubscribe.
  ///
  /// In az, this message translates to:
  /// **'Abunə ol'**
  String get launchSubscribe;

  /// No description provided for @launchNewsletterDone.
  ///
  /// In az, this message translates to:
  /// **'Abunə oldunuz. Təşəkkürlər!'**
  String get launchNewsletterDone;

  /// No description provided for @launchStaffSignIn.
  ///
  /// In az, this message translates to:
  /// **'Əməkdaş girişi'**
  String get launchStaffSignIn;

  /// No description provided for @launchSkip.
  ///
  /// In az, this message translates to:
  /// **'Keç'**
  String get launchSkip;

  /// No description provided for @launchGetStarted.
  ///
  /// In az, this message translates to:
  /// **'Başla'**
  String get launchGetStarted;

  /// No description provided for @launchChooseLanguage.
  ///
  /// In az, this message translates to:
  /// **'Dili seçin'**
  String get launchChooseLanguage;

  /// No description provided for @launchSlideBrandTitle.
  ///
  /// In az, this message translates to:
  /// **'Bakıdan. Sakit və əmin.'**
  String get launchSlideBrandTitle;

  /// No description provided for @launchSlideBrandBody.
  ///
  /// In az, this message translates to:
  /// **'Ağır pambıq, dəqiq kəsim, az rəng. Hər gün geyinmək üçün premium streetwear.'**
  String get launchSlideBrandBody;

  /// No description provided for @launchSlideStudioTitle.
  ///
  /// In az, this message translates to:
  /// **'Öz dizaynını yarat.'**
  String get launchSlideStudioTitle;

  /// No description provided for @launchSlideStudioBody.
  ///
  /// In az, this message translates to:
  /// **'3D Studio-da parçanı, rəngi seç, mətn və şəkil əlavə et — qiyməti dərhal gör.'**
  String get launchSlideStudioBody;

  /// No description provided for @launchSlideDeliveryTitle.
  ///
  /// In az, this message translates to:
  /// **'Bakıda sürətli çatdırılma.'**
  String get launchSlideDeliveryTitle;

  /// No description provided for @launchSlideDeliveryBody.
  ///
  /// In az, this message translates to:
  /// **'Sizə uyğun gün və saatı seçin, sifarişi addım-addım izləyin.'**
  String get launchSlideDeliveryBody;

  /// No description provided for @ordersEventPlaced.
  ///
  /// In az, this message translates to:
  /// **'Sifariş verildi'**
  String get ordersEventPlaced;

  /// No description provided for @ordersEventPaymentCaptured.
  ///
  /// In az, this message translates to:
  /// **'Ödəniş alındı'**
  String get ordersEventPaymentCaptured;

  /// No description provided for @ordersEventPaymentFailed.
  ///
  /// In az, this message translates to:
  /// **'Ödəniş alınmadı'**
  String get ordersEventPaymentFailed;

  /// No description provided for @ordersEventCourierAssigned.
  ///
  /// In az, this message translates to:
  /// **'Kuryer təyin olundu'**
  String get ordersEventCourierAssigned;

  /// No description provided for @ordersEventCourierAssignedNamed.
  ///
  /// In az, this message translates to:
  /// **'Kuryer: {name}'**
  String ordersEventCourierAssignedNamed(String name);

  /// No description provided for @ordersEventEtaUpdated.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma vaxtı yeniləndi'**
  String get ordersEventEtaUpdated;

  /// No description provided for @ordersEventSlotChanged.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma vaxtı dəyişdirildi'**
  String get ordersEventSlotChanged;

  /// No description provided for @ordersEventRefund.
  ///
  /// In az, this message translates to:
  /// **'Pul qaytarıldı'**
  String get ordersEventRefund;

  /// No description provided for @ordersEventGiftMessage.
  ///
  /// In az, this message translates to:
  /// **'Hədiyyə mesajı yeniləndi'**
  String get ordersEventGiftMessage;

  /// No description provided for @ordersEventReturnRequested.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma istənildi'**
  String get ordersEventReturnRequested;

  /// No description provided for @ordersEventReturnUpdated.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma yeniləndi'**
  String get ordersEventReturnUpdated;

  /// No description provided for @ordersEventDesignApproved.
  ///
  /// In az, this message translates to:
  /// **'Dizayn təsdiqləndi'**
  String get ordersEventDesignApproved;

  /// No description provided for @ordersEventDesignChanges.
  ///
  /// In az, this message translates to:
  /// **'Dizaynda dəyişiklik istənildi'**
  String get ordersEventDesignChanges;

  /// No description provided for @ordersTitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişlərim'**
  String get ordersTitle;

  /// No description provided for @ordersEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Hələ sifariş yoxdur'**
  String get ordersEmptyTitle;

  /// No description provided for @ordersEmptyBody.
  ///
  /// In az, this message translates to:
  /// **'İlk sifarişiniz burada görünəcək.'**
  String get ordersEmptyBody;

  /// No description provided for @ordersReturnsTitle.
  ///
  /// In az, this message translates to:
  /// **'Qaytarmalar'**
  String get ordersReturnsTitle;

  /// No description provided for @ordersReturnsEmpty.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma sorğusu yoxdur'**
  String get ordersReturnsEmpty;

  /// No description provided for @ordersReturnsEmptyBody.
  ///
  /// In az, this message translates to:
  /// **'Sifariş səhifəsindən qaytarma və ya dəyişmə istəyə bilərsiniz.'**
  String get ordersReturnsEmptyBody;

  /// No description provided for @ordersTrackTitle.
  ///
  /// In az, this message translates to:
  /// **'Sifarişi izlə'**
  String get ordersTrackTitle;

  /// No description provided for @ordersTrackBody.
  ///
  /// In az, this message translates to:
  /// **'Sifariş nömrəsini və sifarişdəki telefonu daxil edin.'**
  String get ordersTrackBody;

  /// No description provided for @ordersTrackPhone.
  ///
  /// In az, this message translates to:
  /// **'Sifarişdəki telefon'**
  String get ordersTrackPhone;

  /// No description provided for @ordersChangeSlot.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma vaxtını dəyiş'**
  String get ordersChangeSlot;

  /// No description provided for @ordersSlotChangeContact.
  ///
  /// In az, this message translates to:
  /// **'Vaxtı dəyişmək üçün bizimlə əlaqə saxlayın — kuryer sizə uyğun vaxtı təyin edəcək.'**
  String get ordersSlotChangeContact;

  /// No description provided for @ordersSlotChanged.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma vaxtı dəyişdirildi'**
  String get ordersSlotChanged;

  /// No description provided for @ordersSignInToView.
  ///
  /// In az, this message translates to:
  /// **'Bu sifarişə baxmaq üçün daxil olun'**
  String get ordersSignInToView;

  /// No description provided for @ordersPlacedOn.
  ///
  /// In az, this message translates to:
  /// **'{date} tarixində'**
  String ordersPlacedOn(String date);

  /// No description provided for @ordersPayAgain.
  ///
  /// In az, this message translates to:
  /// **'Yenidən ödə'**
  String get ordersPayAgain;

  /// No description provided for @ordersReturnExchange.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma / dəyişmə'**
  String get ordersReturnExchange;

  /// No description provided for @ordersWhatsApp.
  ///
  /// In az, this message translates to:
  /// **'WhatsApp ilə yazın'**
  String get ordersWhatsApp;

  /// No description provided for @ordersTimeline.
  ///
  /// In az, this message translates to:
  /// **'Status'**
  String get ordersTimeline;

  /// No description provided for @ordersItems.
  ///
  /// In az, this message translates to:
  /// **'Məhsullar'**
  String get ordersItems;

  /// No description provided for @ordersCourier.
  ///
  /// In az, this message translates to:
  /// **'Kuryer: {name}'**
  String ordersCourier(String name);

  /// No description provided for @ordersStopsAway.
  ///
  /// In az, this message translates to:
  /// **'{count} dayanacaq qalıb'**
  String ordersStopsAway(int count);

  /// No description provided for @ordersEta.
  ///
  /// In az, this message translates to:
  /// **'~{minutes} dəq'**
  String ordersEta(int minutes);

  /// No description provided for @ordersNotReturnable.
  ///
  /// In az, this message translates to:
  /// **'Fərdi məhsul — qaytarılmır'**
  String get ordersNotReturnable;

  /// No description provided for @ordersReturnReason.
  ///
  /// In az, this message translates to:
  /// **'Səbəb'**
  String get ordersReturnReason;

  /// No description provided for @ordersSendRequest.
  ///
  /// In az, this message translates to:
  /// **'Sorğu göndər'**
  String get ordersSendRequest;

  /// No description provided for @ordersReturnSent.
  ///
  /// In az, this message translates to:
  /// **'Sorğunuz göndərildi'**
  String get ordersReturnSent;

  /// No description provided for @ordersReturnSentBody.
  ///
  /// In az, this message translates to:
  /// **'Komandamız 1–2 iş günü ərzində sizinlə əlaqə saxlayacaq.'**
  String get ordersReturnSentBody;

  /// No description provided for @ordersGiftReceiptBody.
  ///
  /// In az, this message translates to:
  /// **'Hədiyyə qəbzindəki kodu və telefonunuzu daxil edin — ölçünü dəyişə bilərsiniz.'**
  String get ordersGiftReceiptBody;

  /// No description provided for @ordersGiftCode.
  ///
  /// In az, this message translates to:
  /// **'Hədiyyə kodu'**
  String get ordersGiftCode;

  /// No description provided for @ordersRecipientPhone.
  ///
  /// In az, this message translates to:
  /// **'Telefonunuz'**
  String get ordersRecipientPhone;

  /// No description provided for @ordersGiftFor.
  ///
  /// In az, this message translates to:
  /// **'{name} üçün hədiyyə'**
  String ordersGiftFor(String name);

  /// No description provided for @ordersGiftFrom.
  ///
  /// In az, this message translates to:
  /// **'{name}-dan'**
  String ordersGiftFrom(String name);

  /// No description provided for @ordersExchangeTo.
  ///
  /// In az, this message translates to:
  /// **'Dəyişmək istədiyiniz ölçü'**
  String get ordersExchangeTo;

  /// No description provided for @ordersExchangeUntil.
  ///
  /// In az, this message translates to:
  /// **'Dəyişmə {date} tarixinədək mümkündür'**
  String ordersExchangeUntil(String date);

  /// No description provided for @ordersRequestExchange.
  ///
  /// In az, this message translates to:
  /// **'Dəyişmə istə'**
  String get ordersRequestExchange;

  /// No description provided for @ordersExchangeSent.
  ///
  /// In az, this message translates to:
  /// **'Dəyişmə sorğusu göndərildi'**
  String get ordersExchangeSent;

  /// No description provided for @profileSignOutConfirm.
  ///
  /// In az, this message translates to:
  /// **'Hesabdan çıxmaq istəyirsiniz?'**
  String get profileSignOutConfirm;

  /// No description provided for @profileShopping.
  ///
  /// In az, this message translates to:
  /// **'Alış-veriş'**
  String get profileShopping;

  /// No description provided for @profileMyDesigns.
  ///
  /// In az, this message translates to:
  /// **'Dizaynlarım'**
  String get profileMyDesigns;

  /// No description provided for @profileAccount.
  ///
  /// In az, this message translates to:
  /// **'Hesab'**
  String get profileAccount;

  /// No description provided for @profileStyleProfile.
  ///
  /// In az, this message translates to:
  /// **'Stil profili'**
  String get profileStyleProfile;

  /// No description provided for @profileAddresses.
  ///
  /// In az, this message translates to:
  /// **'Ünvanlar'**
  String get profileAddresses;

  /// No description provided for @profileSavedCards.
  ///
  /// In az, this message translates to:
  /// **'Saxlanılmış kartlar'**
  String get profileSavedCards;

  /// No description provided for @profilePersonalInfo.
  ///
  /// In az, this message translates to:
  /// **'Şəxsi məlumat'**
  String get profilePersonalInfo;

  /// No description provided for @profileChangePassword.
  ///
  /// In az, this message translates to:
  /// **'Şifrəni dəyiş'**
  String get profileChangePassword;

  /// No description provided for @profileSetPassword.
  ///
  /// In az, this message translates to:
  /// **'Şifrə təyin et'**
  String get profileSetPassword;

  /// No description provided for @profileDevices.
  ///
  /// In az, this message translates to:
  /// **'Aktiv cihazlar'**
  String get profileDevices;

  /// No description provided for @profileNotifications.
  ///
  /// In az, this message translates to:
  /// **'Bildirişlər'**
  String get profileNotifications;

  /// No description provided for @profileServices.
  ///
  /// In az, this message translates to:
  /// **'Xidmətlər'**
  String get profileServices;

  /// No description provided for @profileHelp.
  ///
  /// In az, this message translates to:
  /// **'Kömək'**
  String get profileHelp;

  /// No description provided for @profileSettings.
  ///
  /// In az, this message translates to:
  /// **'Tənzimləmələr'**
  String get profileSettings;

  /// No description provided for @profileHello.
  ///
  /// In az, this message translates to:
  /// **'Salam, {name}'**
  String profileHello(String name);

  /// No description provided for @profileActiveOrders.
  ///
  /// In az, this message translates to:
  /// **'Aktiv'**
  String get profileActiveOrders;

  /// No description provided for @profileGuestTitle.
  ///
  /// In az, this message translates to:
  /// **'HOO hesabınız'**
  String get profileGuestTitle;

  /// No description provided for @profileGuestBody.
  ///
  /// In az, this message translates to:
  /// **'Sifarişləri izləyin, dizaynları saxlayın və bəyəndiklərinizi istənilən cihazda görün.'**
  String get profileGuestBody;

  /// No description provided for @profilePasswordChanged.
  ///
  /// In az, this message translates to:
  /// **'Şifrə dəyişdirildi'**
  String get profilePasswordChanged;

  /// No description provided for @profileCurrentPassword.
  ///
  /// In az, this message translates to:
  /// **'Cari şifrə'**
  String get profileCurrentPassword;

  /// No description provided for @profilePasswordOtherDevices.
  ///
  /// In az, this message translates to:
  /// **'Digər cihazlarda hesabdan çıxış ediləcək.'**
  String get profilePasswordOtherDevices;

  /// No description provided for @profileAddAddress.
  ///
  /// In az, this message translates to:
  /// **'Ünvan əlavə et'**
  String get profileAddAddress;

  /// No description provided for @profileEditAddress.
  ///
  /// In az, this message translates to:
  /// **'Ünvanı redaktə et'**
  String get profileEditAddress;

  /// No description provided for @profileNoAddresses.
  ///
  /// In az, this message translates to:
  /// **'Saxlanılmış ünvan yoxdur'**
  String get profileNoAddresses;

  /// No description provided for @profileDefault.
  ///
  /// In az, this message translates to:
  /// **'Əsas'**
  String get profileDefault;

  /// No description provided for @profileDeleteAddress.
  ///
  /// In az, this message translates to:
  /// **'Ünvan silinsin?'**
  String get profileDeleteAddress;

  /// No description provided for @profileAddressLabel.
  ///
  /// In az, this message translates to:
  /// **'Ad'**
  String get profileAddressLabel;

  /// No description provided for @profileAddressLabelHint.
  ///
  /// In az, this message translates to:
  /// **'Ev, İş…'**
  String get profileAddressLabelHint;

  /// No description provided for @profileMakeDefault.
  ///
  /// In az, this message translates to:
  /// **'Əsas ünvan et'**
  String get profileMakeDefault;

  /// No description provided for @profileNoCards.
  ///
  /// In az, this message translates to:
  /// **'Saxlanılmış kart yoxdur'**
  String get profileNoCards;

  /// No description provided for @profileNoCardsBody.
  ///
  /// In az, this message translates to:
  /// **'Ödəniş zamanı \"Kartı yadda saxla\" seçin.'**
  String get profileNoCardsBody;

  /// No description provided for @profileDeleteCard.
  ///
  /// In az, this message translates to:
  /// **'Kart silinsin?'**
  String get profileDeleteCard;

  /// No description provided for @profileDeviceApp.
  ///
  /// In az, this message translates to:
  /// **'HOO tətbiqi · {platform}'**
  String profileDeviceApp(String platform);

  /// No description provided for @profileDeviceUnknown.
  ///
  /// In az, this message translates to:
  /// **'Naməlum cihaz'**
  String get profileDeviceUnknown;

  /// No description provided for @profileThisDevice.
  ///
  /// In az, this message translates to:
  /// **'Bu cihaz'**
  String get profileThisDevice;

  /// No description provided for @profileLastSeen.
  ///
  /// In az, this message translates to:
  /// **'Son aktivlik: {time}'**
  String profileLastSeen(String time);

  /// No description provided for @profileRequiredNotification.
  ///
  /// In az, this message translates to:
  /// **'Sifariş üçün vacibdir'**
  String get profileRequiredNotification;

  /// No description provided for @profileLanguage.
  ///
  /// In az, this message translates to:
  /// **'Dil'**
  String get profileLanguage;

  /// No description provided for @profileAppearance.
  ///
  /// In az, this message translates to:
  /// **'Görünüş'**
  String get profileAppearance;

  /// No description provided for @profileThemeSystem.
  ///
  /// In az, this message translates to:
  /// **'Sistem'**
  String get profileThemeSystem;

  /// No description provided for @profileThemeLight.
  ///
  /// In az, this message translates to:
  /// **'İşıqlı'**
  String get profileThemeLight;

  /// No description provided for @profileThemeDark.
  ///
  /// In az, this message translates to:
  /// **'Qaranlıq'**
  String get profileThemeDark;

  /// No description provided for @profileContactUs.
  ///
  /// In az, this message translates to:
  /// **'Bizimlə əlaqə'**
  String get profileContactUs;

  /// No description provided for @profileFaq.
  ///
  /// In az, this message translates to:
  /// **'Tez-tez verilən suallar'**
  String get profileFaq;

  /// No description provided for @profileFaqDeliveryQ.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma nə qədər çəkir?'**
  String get profileFaqDeliveryQ;

  /// No description provided for @profileFaqDeliveryA.
  ///
  /// In az, this message translates to:
  /// **'Bakıda kuryerlə adətən 1–2 gün; seçdiyiniz gün və saat aralığında çatdırırıq. Regionlara poçtla 3–5 gün.'**
  String get profileFaqDeliveryA;

  /// No description provided for @profileFaqReturnsQ.
  ///
  /// In az, this message translates to:
  /// **'Məhsulu necə qaytara bilərəm?'**
  String get profileFaqReturnsQ;

  /// No description provided for @profileFaqReturnsA.
  ///
  /// In az, this message translates to:
  /// **'Sifariş səhifəsində \"Qaytarma / dəyişmə\" seçin. Studio-da fərdi hazırlanan məhsullar qaytarılmır.'**
  String get profileFaqReturnsA;

  /// No description provided for @profileFaqStudioQ.
  ///
  /// In az, this message translates to:
  /// **'Studio sifarişi nə vaxt hazır olur?'**
  String get profileFaqStudioQ;

  /// No description provided for @profileFaqStudioA.
  ///
  /// In az, this message translates to:
  /// **'Dizaynı komandamız yoxlayır, sonra istehsala göndəririk. Müddət sifariş zamanı göstərilir; təcili istehsal da mümkündür.'**
  String get profileFaqStudioA;

  /// No description provided for @profileFaqPaymentQ.
  ///
  /// In az, this message translates to:
  /// **'Hansı ödəniş üsulları var?'**
  String get profileFaqPaymentQ;

  /// No description provided for @profileFaqPaymentA.
  ///
  /// In az, this message translates to:
  /// **'Apple Pay, Google Pay, bank kartı və qapıda nağd ödəniş (limitə qədər).'**
  String get profileFaqPaymentA;

  /// No description provided for @profileSizeGuideBody.
  ///
  /// In az, this message translates to:
  /// **'Hər məhsulun səhifəsində ölçü cədvəli var. Stil profilinizi doldursanız, sizə uyğun ölçünü tövsiyə edəcəyik.'**
  String get profileSizeGuideBody;

  /// No description provided for @profileAbout.
  ///
  /// In az, this message translates to:
  /// **'HOO haqqında'**
  String get profileAbout;

  /// No description provided for @profileAboutBody.
  ///
  /// In az, this message translates to:
  /// **'HOO — Bakıdan premium streetwear brendi. Ağır pambıq, dəqiq kəsim, az rəng və öz dizaynını yaratmaq üçün 3D Studio.'**
  String get profileAboutBody;

  /// No description provided for @profileStyleIntro.
  ///
  /// In az, this message translates to:
  /// **'Ölçülərinizi paylaşın — uyğun ölçünü tövsiyə edək və məhsulları zövqünüzə görə sıralayaq.'**
  String get profileStyleIntro;

  /// No description provided for @profileMeasurements.
  ///
  /// In az, this message translates to:
  /// **'Ölçülər'**
  String get profileMeasurements;

  /// No description provided for @profileHeight.
  ///
  /// In az, this message translates to:
  /// **'Boy'**
  String get profileHeight;

  /// No description provided for @profileWeight.
  ///
  /// In az, this message translates to:
  /// **'Çəki'**
  String get profileWeight;

  /// No description provided for @profileWaist.
  ///
  /// In az, this message translates to:
  /// **'Bel'**
  String get profileWaist;

  /// No description provided for @profileUsualSize.
  ///
  /// In az, this message translates to:
  /// **'Adətən geyindiyim ölçü'**
  String get profileUsualSize;

  /// No description provided for @profilePreferredFit.
  ///
  /// In az, this message translates to:
  /// **'Sevdiyim kəsim'**
  String get profilePreferredFit;

  /// No description provided for @profileFavoriteColors.
  ///
  /// In az, this message translates to:
  /// **'Sevimli rənglər'**
  String get profileFavoriteColors;

  /// No description provided for @profileUpToThree.
  ///
  /// In az, this message translates to:
  /// **'3-ə qədər'**
  String get profileUpToThree;

  /// No description provided for @profileStyles.
  ///
  /// In az, this message translates to:
  /// **'Üslub'**
  String get profileStyles;

  /// No description provided for @searchHint.
  ///
  /// In az, this message translates to:
  /// **'Hudi, futbolka, rəng…'**
  String get searchHint;

  /// No description provided for @searchRecent.
  ///
  /// In az, this message translates to:
  /// **'Son axtarışlar'**
  String get searchRecent;

  /// No description provided for @searchSuggestions.
  ///
  /// In az, this message translates to:
  /// **'Təkliflər'**
  String get searchSuggestions;

  /// No description provided for @searchResults.
  ///
  /// In az, this message translates to:
  /// **'“{query}” üçün {count} nəticə'**
  String searchResults(int count, String query);

  /// No description provided for @searchNoResultsTitle.
  ///
  /// In az, this message translates to:
  /// **'“{query}” tapılmadı'**
  String searchNoResultsTitle(String query);

  /// No description provided for @searchNoResultsBody.
  ///
  /// In az, this message translates to:
  /// **'Başqa söz yoxlayın və ya bestsellerlərə baxın.'**
  String get searchNoResultsBody;

  /// No description provided for @searchDesignYourOwnTitle.
  ///
  /// In az, this message translates to:
  /// **'Tapmadınız? Özünüz dizayn edin'**
  String get searchDesignYourOwnTitle;

  /// No description provided for @searchDesignYourOwnBody.
  ///
  /// In az, this message translates to:
  /// **'3D Studio-da istədiyiniz rəng və çapla.'**
  String get searchDesignYourOwnBody;

  /// No description provided for @studioModelFallback.
  ///
  /// In az, this message translates to:
  /// **'3D model yüklənmədi — sadə forma göstərilir.'**
  String get studioModelFallback;

  /// No description provided for @studioTooManyLayers.
  ///
  /// In az, this message translates to:
  /// **'Ən çox {max} qat əlavə etmək olar'**
  String studioTooManyLayers(int max);

  /// No description provided for @studioUploadTooLarge.
  ///
  /// In az, this message translates to:
  /// **'Fayl çox böyükdür (maks. {mb} MB)'**
  String studioUploadTooLarge(int mb);

  /// No description provided for @studioUndo.
  ///
  /// In az, this message translates to:
  /// **'Geri al'**
  String get studioUndo;

  /// No description provided for @studioRedo.
  ///
  /// In az, this message translates to:
  /// **'Təkrarla'**
  String get studioRedo;

  /// No description provided for @studioSavedOffline.
  ///
  /// In az, this message translates to:
  /// **'Oflayn saxlanıldı'**
  String get studioSavedOffline;

  /// No description provided for @studioSaveFailed.
  ///
  /// In az, this message translates to:
  /// **'Saxlanılmadı'**
  String get studioSaveFailed;

  /// No description provided for @studioFront.
  ///
  /// In az, this message translates to:
  /// **'Ön'**
  String get studioFront;

  /// No description provided for @studioBack.
  ///
  /// In az, this message translates to:
  /// **'Arxa'**
  String get studioBack;

  /// No description provided for @studioLeftSleeve.
  ///
  /// In az, this message translates to:
  /// **'Sol qol'**
  String get studioLeftSleeve;

  /// No description provided for @studioRightSleeve.
  ///
  /// In az, this message translates to:
  /// **'Sağ qol'**
  String get studioRightSleeve;

  /// No description provided for @studioHood.
  ///
  /// In az, this message translates to:
  /// **'Kapüşon'**
  String get studioHood;

  /// No description provided for @studioFreeSpot.
  ///
  /// In az, this message translates to:
  /// **'Sərbəst yer'**
  String get studioFreeSpot;

  /// No description provided for @studioStepProduct.
  ///
  /// In az, this message translates to:
  /// **'Məhsul'**
  String get studioStepProduct;

  /// No description provided for @studioStepFabric.
  ///
  /// In az, this message translates to:
  /// **'Parça və detallar'**
  String get studioStepFabric;

  /// No description provided for @studioStepFit.
  ///
  /// In az, this message translates to:
  /// **'Ölçü və kəsim'**
  String get studioStepFit;

  /// No description provided for @studioStepColor.
  ///
  /// In az, this message translates to:
  /// **'Rəng'**
  String get studioStepColor;

  /// No description provided for @studioStepEditor.
  ///
  /// In az, this message translates to:
  /// **'Dizayn'**
  String get studioStepEditor;

  /// No description provided for @studioStepReview.
  ///
  /// In az, this message translates to:
  /// **'Yoxla'**
  String get studioStepReview;

  /// No description provided for @studioCustomSize.
  ///
  /// In az, this message translates to:
  /// **'Fərdi'**
  String get studioCustomSize;

  /// No description provided for @studioLeadTime.
  ///
  /// In az, this message translates to:
  /// **'{min}–{max} gün istehsal'**
  String studioLeadTime(int min, int max);

  /// No description provided for @studioReview.
  ///
  /// In az, this message translates to:
  /// **'Yoxla'**
  String get studioReview;

  /// No description provided for @studioSetupFee.
  ///
  /// In az, this message translates to:
  /// **'Hazırlıq'**
  String get studioSetupFee;

  /// No description provided for @studioRushFee.
  ///
  /// In az, this message translates to:
  /// **'Təcili istehsal'**
  String get studioRushFee;

  /// No description provided for @studioVolumeDiscount.
  ///
  /// In az, this message translates to:
  /// **'Say endirimi −{percent}%'**
  String studioVolumeDiscount(int percent);

  /// No description provided for @studioIncluded.
  ///
  /// In az, this message translates to:
  /// **'Daxildir'**
  String get studioIncluded;

  /// No description provided for @studioChooseProduct.
  ///
  /// In az, this message translates to:
  /// **'Nə dizayn edirik?'**
  String get studioChooseProduct;

  /// No description provided for @studioFromPrice.
  ///
  /// In az, this message translates to:
  /// **'{price}-dan'**
  String studioFromPrice(String price);

  /// No description provided for @studioFabric.
  ///
  /// In az, this message translates to:
  /// **'Parça'**
  String get studioFabric;

  /// No description provided for @studioGsm.
  ///
  /// In az, this message translates to:
  /// **'{gsm} q/m²'**
  String studioGsm(int gsm);

  /// No description provided for @studioFeatures.
  ///
  /// In az, this message translates to:
  /// **'Detallar'**
  String get studioFeatures;

  /// No description provided for @studioFit.
  ///
  /// In az, this message translates to:
  /// **'Kəsim'**
  String get studioFit;

  /// No description provided for @studioCustomMeasurements.
  ///
  /// In az, this message translates to:
  /// **'Fərdi ölçülər'**
  String get studioCustomMeasurements;

  /// No description provided for @studioColor.
  ///
  /// In az, this message translates to:
  /// **'Rəng'**
  String get studioColor;

  /// No description provided for @studioSpotPicked.
  ///
  /// In az, this message translates to:
  /// **'Növbəti qat seçdiyiniz yerə əlavə olunacaq'**
  String get studioSpotPicked;

  /// No description provided for @studioAddText.
  ///
  /// In az, this message translates to:
  /// **'Mətn'**
  String get studioAddText;

  /// No description provided for @studioAddImage.
  ///
  /// In az, this message translates to:
  /// **'Şəkil'**
  String get studioAddImage;

  /// No description provided for @studioLayers.
  ///
  /// In az, this message translates to:
  /// **'Qatlar · {count}/{max}'**
  String studioLayers(int count, int max);

  /// No description provided for @studioNoLayers.
  ///
  /// In az, this message translates to:
  /// **'Mətn və ya şəkil əlavə edin, ya da modelə toxunaraq yer seçin.'**
  String get studioNoLayers;

  /// No description provided for @studioUploadHint.
  ///
  /// In az, this message translates to:
  /// **'PNG və ya JPG, {mb} MB-a qədər. Ən yaxşı keyfiyyət üçün {dpi} DPI.'**
  String studioUploadHint(int mb, int dpi);

  /// No description provided for @studioFromGallery.
  ///
  /// In az, this message translates to:
  /// **'Qalereyadan'**
  String get studioFromGallery;

  /// No description provided for @studioFromCamera.
  ///
  /// In az, this message translates to:
  /// **'Kamera ilə'**
  String get studioFromCamera;

  /// No description provided for @studioImageLayer.
  ///
  /// In az, this message translates to:
  /// **'Şəkil'**
  String get studioImageLayer;

  /// No description provided for @studioShowLayer.
  ///
  /// In az, this message translates to:
  /// **'Göstər'**
  String get studioShowLayer;

  /// No description provided for @studioHideLayer.
  ///
  /// In az, this message translates to:
  /// **'Gizlət'**
  String get studioHideLayer;

  /// No description provided for @studioTextLayer.
  ///
  /// In az, this message translates to:
  /// **'Mətn'**
  String get studioTextLayer;

  /// No description provided for @studioCenter.
  ///
  /// In az, this message translates to:
  /// **'Mərkəzə gətir'**
  String get studioCenter;

  /// No description provided for @studioDuplicate.
  ///
  /// In az, this message translates to:
  /// **'Dublikat'**
  String get studioDuplicate;

  /// No description provided for @studioSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü'**
  String get studioSize;

  /// No description provided for @studioRotation.
  ///
  /// In az, this message translates to:
  /// **'Bucaq'**
  String get studioRotation;

  /// No description provided for @studioQualityPoor.
  ///
  /// In az, this message translates to:
  /// **'Keyfiyyət aşağıdır ({dpi} DPI) — şəkli kiçildin və ya daha böyük fayl yükləyin'**
  String studioQualityPoor(int dpi);

  /// No description provided for @studioQualityWarning.
  ///
  /// In az, this message translates to:
  /// **'Orta keyfiyyət ({dpi} DPI)'**
  String studioQualityWarning(int dpi);

  /// No description provided for @studioQualityOk.
  ///
  /// In az, this message translates to:
  /// **'Çap keyfiyyəti yaxşıdır ({dpi} DPI)'**
  String studioQualityOk(int dpi);

  /// No description provided for @studioEditText.
  ///
  /// In az, this message translates to:
  /// **'Mətni redaktə et'**
  String get studioEditText;

  /// No description provided for @studioFont.
  ///
  /// In az, this message translates to:
  /// **'Şrift'**
  String get studioFont;

  /// No description provided for @studioTextSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü · {pt} pt'**
  String studioTextSize(int pt);

  /// No description provided for @studioLayersShort.
  ///
  /// In az, this message translates to:
  /// **'Qatlar'**
  String get studioLayersShort;

  /// No description provided for @studioQuantity.
  ///
  /// In az, this message translates to:
  /// **'Say'**
  String get studioQuantity;

  /// No description provided for @studioVolumeTier.
  ///
  /// In az, this message translates to:
  /// **'{min}+: −{percent}%'**
  String studioVolumeTier(int min, int percent);

  /// No description provided for @studioRush.
  ///
  /// In az, this message translates to:
  /// **'Təcili istehsal'**
  String get studioRush;

  /// No description provided for @studioRushHint.
  ///
  /// In az, this message translates to:
  /// **'+{fee} · {days} gün daha tez'**
  String studioRushHint(String fee, int days);

  /// No description provided for @studioImageRights.
  ///
  /// In az, this message translates to:
  /// **'Bu şəkillərin hüquqları mənə məxsusdur'**
  String get studioImageRights;

  /// No description provided for @studioAddSomething.
  ///
  /// In az, this message translates to:
  /// **'Sifariş üçün ən azı bir mətn və ya şəkil əlavə edin.'**
  String get studioAddSomething;

  /// No description provided for @studioSaveDesign.
  ///
  /// In az, this message translates to:
  /// **'Dizaynı yadda saxla'**
  String get studioSaveDesign;

  /// No description provided for @studioDesignSaved.
  ///
  /// In az, this message translates to:
  /// **'Dizayn saxlanıldı'**
  String get studioDesignSaved;

  /// No description provided for @studioBackToEditor.
  ///
  /// In az, this message translates to:
  /// **'Dizayna qayıt'**
  String get studioBackToEditor;

  /// No description provided for @studioIntro.
  ///
  /// In az, this message translates to:
  /// **'Parça, kəsim və rəng seçin, mətn və şəkil əlavə edin — hər dəyişikliyin qiymətini dərhal görün.'**
  String get studioIntro;

  /// No description provided for @studioStart.
  ///
  /// In az, this message translates to:
  /// **'Dizayna başla'**
  String get studioStart;

  /// No description provided for @studioContinueDraft.
  ///
  /// In az, this message translates to:
  /// **'Son dizayna davam et'**
  String get studioContinueDraft;

  /// No description provided for @studioHowItWorks.
  ///
  /// In az, this message translates to:
  /// **'Necə işləyir'**
  String get studioHowItWorks;

  /// No description provided for @studioHowPick.
  ///
  /// In az, this message translates to:
  /// **'Məhsulu, parçanı və rəngi seçin'**
  String get studioHowPick;

  /// No description provided for @studioHowDesign.
  ///
  /// In az, this message translates to:
  /// **'3D-də mətn və şəkil yerləşdirin'**
  String get studioHowDesign;

  /// No description provided for @studioHowOrder.
  ///
  /// In az, this message translates to:
  /// **'Sifariş verin — biz yoxlayıb hazırlayırıq'**
  String get studioHowOrder;

  /// No description provided for @studioUntitled.
  ///
  /// In az, this message translates to:
  /// **'Adsız dizayn'**
  String get studioUntitled;

  /// No description provided for @studioNoDesigns.
  ///
  /// In az, this message translates to:
  /// **'Hələ dizayn yoxdur'**
  String get studioNoDesigns;

  /// No description provided for @studioNoDesignsBody.
  ///
  /// In az, this message translates to:
  /// **'Studio-da yaratdıqlarınız burada saxlanılır.'**
  String get studioNoDesignsBody;

  /// No description provided for @studioResubmit.
  ///
  /// In az, this message translates to:
  /// **'Yenidən göndər'**
  String get studioResubmit;

  /// No description provided for @studioResubmitted.
  ///
  /// In az, this message translates to:
  /// **'Dizayn yenidən yoxlamaya göndərildi'**
  String get studioResubmitted;

  /// No description provided for @studioDeleteConfirm.
  ///
  /// In az, this message translates to:
  /// **'Dizayn silinsin?'**
  String get studioDeleteConfirm;

  /// No description provided for @studioSharedTitle.
  ///
  /// In az, this message translates to:
  /// **'Paylaşılan dizayn'**
  String get studioSharedTitle;

  /// No description provided for @studioDesignYourOwn.
  ///
  /// In az, this message translates to:
  /// **'Öz dizaynını yarat'**
  String get studioDesignYourOwn;

  /// No description provided for @wishlistSignInReason.
  ///
  /// In az, this message translates to:
  /// **'Bəyəndiklərinizi saxlamaq və istənilən cihazda görmək üçün daxil olun.'**
  String get wishlistSignInReason;

  /// No description provided for @wishlistTitle.
  ///
  /// In az, this message translates to:
  /// **'Bəyənilənlər'**
  String get wishlistTitle;

  /// No description provided for @wishlistShareSubject.
  ///
  /// In az, this message translates to:
  /// **'HOO-da bəyəndiklərim'**
  String get wishlistShareSubject;

  /// No description provided for @wishlistEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Hələ heç nə bəyənməmisiniz'**
  String get wishlistEmptyTitle;

  /// No description provided for @wishlistEmptyBody.
  ///
  /// In az, this message translates to:
  /// **'Məhsulda ♡ işarəsinə toxunun — burada saxlanılacaq.'**
  String get wishlistEmptyBody;

  /// No description provided for @wishlistChooseSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü seç'**
  String get wishlistChooseSize;

  /// No description provided for @wishlistNotifyMe.
  ///
  /// In az, this message translates to:
  /// **'Gələndə xəbər ver'**
  String get wishlistNotifyMe;

  /// No description provided for @wishlistSharedTitle.
  ///
  /// In az, this message translates to:
  /// **'{name} bəyənənlər'**
  String wishlistSharedTitle(String name);

  /// No description provided for @wishlistAlertsTitle.
  ///
  /// In az, this message translates to:
  /// **'Xəbərdarlıqlar'**
  String get wishlistAlertsTitle;

  /// No description provided for @wishlistAlertsEmptyTitle.
  ///
  /// In az, this message translates to:
  /// **'Aktiv xəbərdarlıq yoxdur'**
  String get wishlistAlertsEmptyTitle;

  /// No description provided for @wishlistAlertsEmptyBody.
  ///
  /// In az, this message translates to:
  /// **'Məhsul səhifəsində \"Gələndə xəbər ver\" və ya \"Qiymət düşəndə xəbər ver\" seçin.'**
  String get wishlistAlertsEmptyBody;

  /// No description provided for @wishlistAlertBackInStock.
  ///
  /// In az, this message translates to:
  /// **'Stoka qayıdanda'**
  String get wishlistAlertBackInStock;

  /// No description provided for @wishlistAlertPriceDrop.
  ///
  /// In az, this message translates to:
  /// **'Qiymət düşəndə'**
  String get wishlistAlertPriceDrop;

  /// No description provided for @wishlistAlertNotified.
  ///
  /// In az, this message translates to:
  /// **'{date} xəbər verildi'**
  String wishlistAlertNotified(String date);
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
