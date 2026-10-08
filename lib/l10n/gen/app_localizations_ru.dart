// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'HOO';

  @override
  String get navHome => 'Главная';

  @override
  String get navShop => 'Магазин';

  @override
  String get navStudio => 'Студия';

  @override
  String get navBag => 'Корзина';

  @override
  String get navProfile => 'Профиль';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonSeeAll => 'Смотреть все';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonSaved => 'Сохранено';

  @override
  String get commonSaving => 'Сохранение…';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonContinue => 'Продолжить';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonNext => 'Далее';

  @override
  String get commonApply => 'Применить';

  @override
  String get commonClear => 'Очистить';

  @override
  String get commonClearAll => 'Очистить всё';

  @override
  String get commonRemove => 'Удалить';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonShare => 'Поделиться';

  @override
  String get commonConfirm => 'Подтвердить';

  @override
  String get commonYes => 'Да';

  @override
  String get commonNo => 'Нет';

  @override
  String get commonOk => 'ОК';

  @override
  String get commonOptional => 'необязательно';

  @override
  String get commonSearch => 'Поиск';

  @override
  String get commonFilter => 'Фильтр';

  @override
  String get commonSort => 'Сортировка';

  @override
  String get commonShowMore => 'Показать ещё';

  @override
  String get commonShowLess => 'Свернуть';

  @override
  String get commonCopy => 'Копировать';

  @override
  String get commonCopied => 'Скопировано';

  @override
  String get commonSignIn => 'Войти';

  @override
  String get commonSignOut => 'Выйти';

  @override
  String get commonCreateAccount => 'Создать аккаунт';

  @override
  String get commonContinueAsGuest => 'Продолжить как гость';

  @override
  String get commonLearnMore => 'Подробнее';

  @override
  String get commonTotal => 'Итого';

  @override
  String get commonFree => 'Бесплатно';

  @override
  String commonDays(int min, int max) {
    return '$min–$max дн.';
  }

  @override
  String commonPieces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count шт.',
      many: '$count шт.',
      few: '$count шт.',
      one: '$count шт.',
    );
    return '$_temp0';
  }

  @override
  String get errorGeneric =>
      'Что-то пошло не так. Попробуйте ещё раз чуть позже.';

  @override
  String get errorNetwork => 'Нет подключения к интернету. Проверьте сеть.';

  @override
  String get errorNotFound => 'Не найдено';

  @override
  String errorTooManyRequests(int seconds) {
    return 'Слишком много попыток. Повторите через $seconds с.';
  }

  @override
  String get errorExternal =>
      'Сервис временно недоступен. Попробуйте чуть позже.';

  @override
  String get errorConflict => 'Данные изменились. Мы обновили их.';

  @override
  String get errorSessionExpired => 'Сессия истекла. Войдите снова.';

  @override
  String get fieldRequired => 'Обязательное поле';

  @override
  String get fieldInvalidEmail => 'Введите корректный e-mail';

  @override
  String get fieldInvalidPhone => 'Формат: +994 XX XXX XX XX';

  @override
  String get fieldPasswordRule => 'Минимум 8 символов, цифра и спецсимвол';

  @override
  String get stateEmptyTitle => 'Здесь пока пусто';

  @override
  String get stateOffline => 'Нет сети — показаны сохранённые данные';

  @override
  String get stateLoading => 'Загрузка…';

  @override
  String get badgeNew => 'НОВИНКА';

  @override
  String get badgeNewDrop => 'НОВЫЙ ДРОП';

  @override
  String get badgeBestseller => 'ХИТ';

  @override
  String get badgeSale => 'СКИДКА';

  @override
  String discountPercent(int percent) {
    return '-$percent%';
  }

  @override
  String get a11yAddToWishlist => 'Добавить в избранное';

  @override
  String get a11yRemoveFromWishlist => 'Убрать из избранного';

  @override
  String get a11yIncrease => 'Увеличить';

  @override
  String get a11yDecrease => 'Уменьшить';

  @override
  String a11yQuantity(int count) {
    return 'Количество: $count';
  }

  @override
  String a11yColor(String name) {
    return 'Цвет: $name';
  }

  @override
  String get a11ySelected => 'выбрано';

  @override
  String get a11yUnavailable => 'недоступно';

  @override
  String a11yRating(String rating) {
    return 'Рейтинг $rating из 5';
  }

  @override
  String get a11yClose => 'Закрыть';

  @override
  String get a11yBack => 'Назад';

  @override
  String a11yBag(int count) {
    return 'Корзина, $count товаров';
  }

  @override
  String get a11yShowPassword => 'Показать пароль';

  @override
  String get a11yHidePassword => 'Скрыть пароль';

  @override
  String get a11yLogo => 'HOO';

  @override
  String stepOf(int current, int total) {
    return 'Шаг $current из $total';
  }

  @override
  String get summaryTotal => 'Итого';

  @override
  String get summarySubtotal => 'Подытог';

  @override
  String get summaryDiscount => 'Скидка';

  @override
  String get summaryDelivery => 'Доставка';

  @override
  String get summaryGiftPackaging => 'Подарочная упаковка';

  @override
  String get summaryGreetingCard => 'Открытка';

  @override
  String summaryVatIncluded(String amount) {
    return 'Включая НДС: $amount';
  }

  @override
  String get summaryShowBreakdown => 'Показать детали';

  @override
  String get summaryUpdating => 'Обновляем цену';

  @override
  String get authGateTitle => 'Войдите, чтобы продолжить';

  @override
  String get authGateBody =>
      'Избранное, отзывы, адреса и дизайны хранятся в вашем аккаунте.';

  @override
  String get orderStatusNew => 'Новый';

  @override
  String get orderStatusPaid => 'Оплачен';

  @override
  String get orderStatusAwaitingApproval => 'Ожидает одобрения дизайна';

  @override
  String get orderStatusInProduction => 'В производстве';

  @override
  String get orderStatusPacked => 'Упакован';

  @override
  String get orderStatusOutForDelivery => 'В пути';

  @override
  String get orderStatusReadyForPickup => 'Готов к выдаче';

  @override
  String get orderStatusDelivered => 'Доставлен';

  @override
  String get orderStatusCancelled => 'Отменён';

  @override
  String get orderStatusReturnRequested => 'Запрошен возврат';

  @override
  String get orderStatusReturned => 'Возвращён';

  @override
  String get orderStatusRefunded => 'Деньги возвращены';

  @override
  String get designStatusDraft => 'Черновик';

  @override
  String get designStatusSubmitted => 'Отправлен';

  @override
  String get designStatusChangesRequested => 'Нужны изменения';

  @override
  String get designStatusApproved => 'Одобрен';

  @override
  String get designStatusInProduction => 'В производстве';

  @override
  String get designStatusReady => 'Готов';

  @override
  String get designStatusCancelled => 'Отменён';

  @override
  String get paymentStatusPending => 'Ожидает';

  @override
  String get paymentStatusCaptured => 'Оплачено';

  @override
  String get paymentStatusFailed => 'Не прошла';

  @override
  String get paymentStatusCancelled => 'Отменена';

  @override
  String get paymentStatusRefunded => 'Возвращено';

  @override
  String get paymentStatusPartiallyRefunded => 'Частично возвращено';

  @override
  String get paymentMethodApplePay => 'Apple Pay';

  @override
  String get paymentMethodGooglePay => 'Google Pay';

  @override
  String get paymentMethodCard => 'Банковская карта';

  @override
  String get paymentMethodSavedCard => 'Сохранённая карта';

  @override
  String get paymentMethodCashOnDelivery => 'Наличными курьеру';

  @override
  String get paymentMethodCardOnDelivery => 'Картой курьеру';

  @override
  String get paymentMethodInvoice => 'Счёт';

  @override
  String get deliveryKindCourier => 'Курьер';

  @override
  String get deliveryKindPost => 'Почта';

  @override
  String get deliveryKindPickup => 'Самовывоз';

  @override
  String get returnStatusRequested => 'Запрошен';

  @override
  String get returnStatusApproved => 'Одобрен';

  @override
  String get returnStatusRejected => 'Отклонён';

  @override
  String get returnStatusReceived => 'Получен';

  @override
  String get returnStatusRefunded => 'Деньги возвращены';

  @override
  String get returnStatusExchanged => 'Обменян';

  @override
  String get returnKindReturn => 'Возврат';

  @override
  String get returnKindExchange => 'Обмен';

  @override
  String get occasionBirthday => 'День рождения';

  @override
  String get occasionAnniversary => 'Годовщина';

  @override
  String get occasionNovruz => 'Новруз';

  @override
  String get occasionNewYear => 'Новый год';

  @override
  String get occasionJustBecause => 'Просто так';

  @override
  String get fitOversized => 'Оверсайз';

  @override
  String get fitBoxy => 'Бокси';

  @override
  String get fitRegular => 'Регуляр';

  @override
  String get fitFitted => 'Приталенный';

  @override
  String get fitCropped => 'Укороченный';

  @override
  String get productTypeHoodie => 'Худи';

  @override
  String get productTypeZipHoodie => 'Худи на молнии';

  @override
  String get productTypeTShirt => 'Футболка';

  @override
  String get productTypeSweatshirt => 'Свитшот';

  @override
  String get productTypeSweatpants => 'Спортивные брюки';

  @override
  String get productTypeShorts => 'Шорты';

  @override
  String get colorFamilyBlack => 'Чёрный';

  @override
  String get colorFamilyForest => 'Лесной зелёный';

  @override
  String get colorFamilyCream => 'Кремовый';

  @override
  String get colorFamilyWhite => 'Белый';

  @override
  String get colorFamilyGrey => 'Серый';

  @override
  String get colorFamilySand => 'Песочный';

  @override
  String get colorFamilyOlive => 'Оливковый';

  @override
  String get colorFamilyRed => 'Красный';

  @override
  String get styleTagMinimal => 'Минимализм';

  @override
  String get styleTagStreetwear => 'Стритвир';

  @override
  String get styleTagGraphicPrints => 'Графичные принты';

  @override
  String get styleTagMonochrome => 'Монохром';

  @override
  String get styleTagSport => 'Спорт';

  @override
  String get styleTagVintage => 'Винтаж';

  @override
  String get notificationTopicOrders => 'Заказы';

  @override
  String get notificationTopicDelivery => 'Доставка';

  @override
  String get notificationTopicAlerts => 'Уведомления о товарах';

  @override
  String get notificationTopicMarketing => 'Новости и предложения';

  @override
  String get notificationChannelEmail => 'E-mail';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationChannelWhatsApp => 'WhatsApp';

  @override
  String get notificationChannelPush => 'Push';

  @override
  String get stockStateInStock => 'В наличии';

  @override
  String get stockStateLowStock => 'Заканчивается';

  @override
  String get stockStatePreorder => 'Предзаказ';

  @override
  String get stockStateOutOfStock => 'Нет в наличии';

  @override
  String get stockStateMadeToOrder => 'Под заказ';

  @override
  String get stockStateUnavailable => 'Недоступно';

  @override
  String get dsTitle => 'Дизайн-система';

  @override
  String get dsLightDark => 'Светлая / Тёмная';

  @override
  String get authWelcomeTitle => 'Добро пожаловать в HOO';

  @override
  String get authWelcomeBody =>
      'Премиальный стритвир из Баку. Войдите или продолжите как гость.';

  @override
  String get authWelcomeGuest => 'Продолжить как гость';

  @override
  String get authSignInTitle => 'Вход';

  @override
  String get authSignInSubtitle => 'Используйте почту или номер телефона.';

  @override
  String get authIdentifierLabel => 'Почта или телефон';

  @override
  String get authPasswordLabel => 'Пароль';

  @override
  String get authPasswordHint => 'Не менее 8 символов, цифра и спецсимвол';

  @override
  String get authForgotLink => 'Забыли пароль?';

  @override
  String get authSignInSubmit => 'Войти';

  @override
  String get authSignInWithSms => 'Войти по коду из SMS';

  @override
  String get authOr => 'или';

  @override
  String get authContinueWithGoogle => 'Продолжить с Google';

  @override
  String get authContinueWithApple => 'Продолжить с Apple';

  @override
  String get authSocialFailed => 'Не удалось войти. Попробуйте ещё раз.';

  @override
  String get authTermsPromptTitle => 'Создайте аккаунт HOO';

  @override
  String get authTermsPromptBody =>
      'Аккаунта HOO ещё нет. Продолжая, вы принимаете Условия и Политику конфиденциальности.';

  @override
  String get authTermsPromptAccept => 'Принять и продолжить';

  @override
  String get authNoAccount => 'Впервые в HOO?';

  @override
  String get authHaveAccount => 'Уже есть аккаунт?';

  @override
  String get authCreateAccount => 'Создать аккаунт';

  @override
  String get authSignUpTitle => 'Создайте аккаунт';

  @override
  String get authSignUpSubtitle =>
      'Следите за заказами, сохраняйте избранное и дизайны.';

  @override
  String get authFullNameLabel => 'Имя и фамилия';

  @override
  String get authEmailLabel => 'Почта';

  @override
  String get authPhoneLabel => 'Телефон';

  @override
  String get authAcceptTerms =>
      'Принимаю Условия и Политику конфиденциальности';

  @override
  String get authMarketingConsent => 'Присылайте мне новости и предложения';

  @override
  String get authErrRequired => 'Обязательное поле';

  @override
  String get authErrInvalidEmail => 'Введите корректную почту';

  @override
  String get authErrInvalidPhone => 'Введите корректный номер';

  @override
  String get authErrInvalidIdentifier => 'Введите корректную почту или телефон';

  @override
  String get authErrWeakPassword => 'Минимум 8 символов, цифра и спецсимвол';

  @override
  String get authErrTerms => 'Примите условия, чтобы продолжить';

  @override
  String get authErrInvalidCode => 'Неверный код';

  @override
  String get authOtpPhoneTitle => 'Вход по телефону';

  @override
  String get authOtpPhoneBody => 'Мы отправим 6-значный код на ваш номер.';

  @override
  String get authOtpNewAccount =>
      'Для этого номера нет аккаунта. Укажите имя и примите условия.';

  @override
  String get authOtpSendSms => 'Отправить код по SMS';

  @override
  String get authOtpSendWhatsapp => 'Отправить в WhatsApp';

  @override
  String get authOtpCodeTitle => 'Введите код';

  @override
  String authOtpCodeBody(String phone) {
    return 'Отправлено на $phone';
  }

  @override
  String authOtpResendIn(int seconds) {
    return 'Повторно через $seconds с';
  }

  @override
  String get authOtpResendSms => 'Отправить SMS';

  @override
  String get authOtpResendWhatsapp => 'Отправить в WhatsApp';

  @override
  String get authOtpResent => 'Код отправлен снова';

  @override
  String get authOtpChangePhone => 'Изменить номер';

  @override
  String get authForgotTitle => 'Восстановление пароля';

  @override
  String get authForgotBody =>
      'Введите почту или телефон, мы отправим инструкцию.';

  @override
  String get authForgotSubmit => 'Отправить';

  @override
  String get authForgotSentEmail =>
      'Если аккаунт существует, мы отправили ссылку на почту.';

  @override
  String get authForgotSentPhone =>
      'Если аккаунт существует, мы отправили код на телефон.';

  @override
  String get authResetEnterCode => 'Ввести код';

  @override
  String get authResetTitle => 'Новый пароль';

  @override
  String get authResetCodeLabel => 'Код';

  @override
  String get authResetNewPassword => 'Новый пароль';

  @override
  String get authResetSubmit => 'Обновить пароль';

  @override
  String get authResetDone => 'Пароль обновлён. Войдите с новым паролем.';

  @override
  String get cartTitle => 'Корзина';

  @override
  String get cartEmptyTitle => 'Ваша корзина пуста';

  @override
  String get cartEmptyMessage =>
      'Добавьте понравившиеся вещи или создайте свой дизайн в Studio.';

  @override
  String get cartEmptyCta => 'Перейти к покупкам';

  @override
  String get cartBestsellersTitle => 'Бестселлеры';

  @override
  String get cartCompleteTheLookTitle => 'Дополните образ';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'Добавьте ещё $amount для бесплатной доставки';
  }

  @override
  String get cartFreeDeliveryQualified => 'Отлично! Доставка бесплатная';

  @override
  String get cartPromoTitle => 'Промокод';

  @override
  String get cartPromoHint => 'Введите код';

  @override
  String cartPromoApplied(String code) {
    return 'Промокод $code применён';
  }

  @override
  String get cartPromoRemoveA11y => 'Удалить промокод';

  @override
  String get cartGiftTitle => 'Это подарок';

  @override
  String get cartGiftSubtitle =>
      'Упаковку, открытку и послание выберете при оформлении';

  @override
  String get cartSummaryTitle => 'Итого';

  @override
  String get cartDeliveryAtCheckout => 'Рассчитывается при оформлении';

  @override
  String get cartCheckout => 'Оформить заказ';

  @override
  String cartRemoved(String name) {
    return '$name удалён из корзины';
  }

  @override
  String get cartUndo => 'Вернуть';

  @override
  String cartRemoveA11y(String name) {
    return 'Удалить $name';
  }

  @override
  String get cartCustomDesign => 'Свой дизайн';

  @override
  String cartLeadTime(int days) {
    return 'Изготовление — $days дн.';
  }

  @override
  String cartStockLeft(int count) {
    return 'Осталось $count шт.';
  }

  @override
  String cartSize(String size) {
    return 'Размер $size';
  }

  @override
  String cartUnitPrice(int quantity, String price) {
    return '$quantity × $price';
  }

  @override
  String get cartFixErrors =>
      'Некоторые товары требуют внимания — исправьте или удалите их перед оформлением.';

  @override
  String get cartAddedTitle => 'Добавлено в корзину';

  @override
  String get cartViewBag => 'Перейти в корзину';

  @override
  String get cartContinueShopping => 'Продолжить покупки';

  @override
  String cartSubtotalWithCount(int count) {
    return 'Подытог · $count шт.';
  }

  @override
  String get catalogSortNewest => 'Новинки';

  @override
  String get catalogSortPriceAsc => 'Цена: по возрастанию';

  @override
  String get catalogSortPriceDesc => 'Цена: по убыванию';

  @override
  String get catalogSortPopular => 'Популярные';

  @override
  String get catalogFilterTitle => 'Фильтры и сортировка';

  @override
  String get catalogFilterSort => 'Сортировка';

  @override
  String get catalogFilterCategory => 'Категория';

  @override
  String get catalogFilterCollection => 'Коллекция';

  @override
  String get catalogFilterSize => 'Размер';

  @override
  String get catalogFilterColor => 'Цвет';

  @override
  String get catalogFilterFit => 'Крой';

  @override
  String get catalogFilterPrice => 'Цена';

  @override
  String get catalogFilterAvailability => 'Наличие';

  @override
  String get catalogFilterInStockOnly => 'Только в наличии';

  @override
  String get catalogTabAll => 'Все';

  @override
  String get catalogTabNew => 'Новинки';

  @override
  String get catalogTabSale => 'Скидки';

  @override
  String get catalogEmptyTitle => 'Товары не найдены';

  @override
  String get catalogEmptyMessage => 'Измените или сбросьте фильтры.';

  @override
  String catalogResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count товара',
      many: '$count товаров',
      few: '$count товара',
      one: '1 товар',
    );
    return '$_temp0';
  }

  @override
  String get catalogGallery3d => '3D';

  @override
  String get catalogGalleryPhotos => 'Фото';

  @override
  String get catalogColor => 'Цвет';

  @override
  String get catalogSize => 'Размер';

  @override
  String get catalogSizeGuide => 'Таблица размеров';

  @override
  String get catalogSizeLabel => 'Размер';

  @override
  String get catalogChest => 'Грудь';

  @override
  String get catalogLength => 'Длина';

  @override
  String get catalogSleeve => 'Рукав';

  @override
  String get catalogUnitCm => 'см';

  @override
  String get catalogUnitIn => 'дюйм';

  @override
  String get catalogSizeUnavailable => 'Этого размера сейчас нет';

  @override
  String catalogOnlyLeft(int count, String size) {
    return 'Осталось всего $count в размере $size';
  }

  @override
  String get catalogPreorderNote =>
      'Предзаказ: доставка может занять больше времени.';

  @override
  String catalogRecommendedSize(String size) {
    return 'Мы рекомендуем размер $size';
  }

  @override
  String get catalogColorSoldOut => 'Этот цвет закончился.';

  @override
  String get catalogSizeSoldOutHint =>
      'Некоторых размеров нет. Сообщим, когда появятся.';

  @override
  String get catalogNotifyMe => 'Сообщить мне';

  @override
  String get catalogPriceDropAlert => 'Сообщить о снижении цены';

  @override
  String get catalogPriceDropAlertSet => 'Мы сообщим, когда цена снизится.';

  @override
  String get catalogBackInStockAlertSet => 'Мы сообщим, когда товар появится.';

  @override
  String get catalogAlertSignIn => 'Войдите, чтобы настроить уведомления.';

  @override
  String catalogDeliveryPromise(int hours, int minutes, String date) {
    return 'Закажите в течение $hours ч $minutes мин — доставим $date';
  }

  @override
  String get catalogCustomize => 'Создать свой дизайн';

  @override
  String get catalogDescription => 'Описание';

  @override
  String get catalogSizeAndFit => 'Размер и крой';

  @override
  String get catalogFabricAndCare => 'Ткань и уход';

  @override
  String get catalogReviews => 'Отзывы';

  @override
  String catalogReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count отзыва',
      many: '$count отзывов',
      few: '$count отзыва',
      one: '1 отзыв',
    );
    return '$_temp0';
  }

  @override
  String get catalogCompleteTheLook => 'Дополните образ';

  @override
  String get catalogYouMayAlsoLike => 'Вам может понравиться';

  @override
  String get catalogAddToBag => 'В корзину';

  @override
  String get catalogSelectSize => 'Выберите размер';

  @override
  String get catalogSoldOut => 'Нет в наличии';

  @override
  String get catalogPreorder => 'Предзаказ';

  @override
  String get catalogWriteReview => 'Написать отзыв';

  @override
  String get catalogReviewSignIn => 'Войдите, чтобы написать отзыв.';

  @override
  String get catalogNoReviewsTitle => 'Пока нет отзывов';

  @override
  String get catalogNoReviewsMessage =>
      'После доставки заказа вы сможете написать первый отзыв.';

  @override
  String get catalogYourRating => 'Ваша оценка';

  @override
  String get catalogRatingRequired => 'Выберите оценку';

  @override
  String get catalogReviewTitle => 'Заголовок';

  @override
  String get catalogReviewBody => 'Ваш отзыв';

  @override
  String catalogReviewBodyShort(int min) {
    return 'Напишите не менее $min символов';
  }

  @override
  String get catalogReviewModeration => 'Отзывы публикуются после модерации.';

  @override
  String get catalogReviewSubmit => 'Отправить отзыв';

  @override
  String get catalogReviewThanks =>
      'Спасибо! Ваш отзыв отправлен на модерацию.';

  @override
  String get homeHeroTitle => 'Новый дроп уже здесь';

  @override
  String get homeHeroCta => 'Смотреть новинки';

  @override
  String get homeDesignTitle => 'Создайте свой дизайн';

  @override
  String get homeDesignBody =>
      'Выберите модель, добавьте текст и рисунок, посмотрите в 3D.';

  @override
  String get homeNewArrivals => 'Новинки';

  @override
  String get homeCategories => 'Категории';

  @override
  String get homeCollections => 'Коллекции';

  @override
  String get homeShopTheLook => 'Купить образ';

  @override
  String get homeBestsellers => 'Бестселлеры';

  @override
  String get homeRecentlyViewed => 'Вы недавно смотрели';

  @override
  String get homeEmptyTitle => 'Скоро появятся новые товары';

  @override
  String get homeEmptyMessage => 'Загляните чуть позже.';

  @override
  String get launchComingSoonEyebrow => 'Скоро';

  @override
  String launchComingSoonOpensOn(String date) {
    return 'Открытие $date';
  }

  @override
  String get launchComingSoonFallbackTitle => 'Новый HOO уже в пути';

  @override
  String get launchComingSoonFallbackSubtitle =>
      'Премиальный streetwear из Баку. Узнайте первыми об открытии.';

  @override
  String get launchCountdownDays => 'дн';

  @override
  String get launchCountdownHours => 'ч';

  @override
  String get launchCountdownMinutes => 'мин';

  @override
  String get launchCountdownSeconds => 'сек';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return 'До открытия: $days дн, $hours ч, $minutes мин';
  }

  @override
  String get launchWaitlistTitle => 'Встать в лист ожидания';

  @override
  String get launchWaitlistBody =>
      'Узнайте первыми в день запуска и получите ранний доступ.';

  @override
  String get launchWaitlistField => 'Email или телефон';

  @override
  String get launchWaitlistJoin => 'Присоединиться';

  @override
  String launchWaitlistJoined(int position, int total) {
    return 'Вы #$position из $total';
  }

  @override
  String launchWaitlistAlready(int position, int total) {
    return 'Вы уже в списке: #$position из $total';
  }

  @override
  String launchWaitlistCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString человека уже ждут',
      many: '$countString человек уже ждут',
      few: '$countString человека уже ждут',
      one: '$countString человек уже ждёт',
    );
    return '$_temp0';
  }

  @override
  String launchWaitlistToday(int count) {
    return '+$count сегодня';
  }

  @override
  String get launchNewsletterTitle => 'Рассылка';

  @override
  String get launchNewsletterBody =>
      'Новые дропы, коллекции и предложения — прямо на почту.';

  @override
  String get launchNewsletterField => 'Email';

  @override
  String get launchNewsletterSubscribe => 'Подписаться';

  @override
  String get launchNewsletterDone => 'Вы подписаны. Спасибо!';

  @override
  String get launchNewsletterAlready => 'Этот email уже подписан.';

  @override
  String get launchFollow => 'Следите за HOO';

  @override
  String launchOpenLink(String name) {
    return 'Открыть $name';
  }

  @override
  String get launchCannotOpenLink => 'Не удалось открыть ссылку.';

  @override
  String get launchContactEmail => 'Email';

  @override
  String get launchContactPhone => 'Телефон';

  @override
  String get launchStaffSignIn => 'Вход для сотрудников';

  @override
  String get launchStaffNoAccess => 'У этого аккаунта нет доступа сотрудника.';

  @override
  String get launchStoreOpenTitle => 'Магазин открыт';

  @override
  String get launchEnterStore => 'Перейти в магазин';

  @override
  String launchRetryIn(String time) {
    return 'Повторите через $time';
  }

  @override
  String get launchLanguage => 'Язык';

  @override
  String get launchOnboardingLanguageTitle => 'Выберите язык';

  @override
  String get launchOnboardingLanguageBody =>
      'Его можно сменить в любой момент в Настройках.';

  @override
  String get launchOnboardingSkip => 'Пропустить';

  @override
  String get launchOnboardingStart => 'Начать';

  @override
  String get launchOnboardingSlide1Eyebrow => 'Из Баку';

  @override
  String get launchOnboardingSlide1Title => 'Спокойно. Уверенно. HOO.';

  @override
  String get launchOnboardingSlide1Body =>
      'Худи, футболки и свитшоты — премиальные ткани, минимальный дизайн, сшито в Баку.';

  @override
  String get launchOnboardingSlide2Eyebrow => 'Studio';

  @override
  String get launchOnboardingSlide2Title => 'Создайте свой дизайн';

  @override
  String get launchOnboardingSlide2Body =>
      'Выберите вещь и цвет, добавьте текст и изображения, смотрите в 3D — цена сразу.';

  @override
  String get launchOnboardingSlide3Eyebrow => 'Доставка';

  @override
  String get launchOnboardingSlide3Title => 'Быстрая доставка по Баку';

  @override
  String get launchOnboardingSlide3Body =>
      'Курьер в выбранный вами интервал. Следите за заказом на каждом шаге.';

  @override
  String get searchHint => 'Поиск: худи, футболки, дизайны…';

  @override
  String get searchClearA11y => 'Очистить поиск';

  @override
  String get searchRecentTitle => 'Недавние запросы';

  @override
  String get searchBestsellersTitle => 'Бестселлеры';

  @override
  String searchFor(String query) {
    return 'Искать «$query»';
  }

  @override
  String searchNoResultsTitle(String query) {
    return 'Ничего не найдено по «$query»';
  }

  @override
  String get searchNoResultsMessage =>
      'Проверьте написание или попробуйте короче.';

  @override
  String get searchMayLikeTitle => 'Вам может понравиться';

  @override
  String searchResultsCount(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count результата',
      many: '$count результатов',
      few: '$count результата',
      one: '1 результат',
    );
    return '$_temp0 по «$query»';
  }

  @override
  String searchFillA11y(String text) {
    return 'Подставить «$text» в поиск';
  }

  @override
  String get searchDesignYourOwnTitle => 'Создайте свой дизайн';

  @override
  String get searchDesignYourOwnBody =>
      'Выберите модель в Студии и добавьте текст и рисунок.';
}
