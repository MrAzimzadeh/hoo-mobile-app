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
  String get authSignInWithSms => 'Войти по SMS-коду';

  @override
  String get authSocialUnavailable => 'Этот способ входа сейчас недоступен';

  @override
  String get authOr => 'или';

  @override
  String get authContinueWithGoogle => 'Продолжить с Google';

  @override
  String get authContinueWithApple => 'Продолжить с Apple';

  @override
  String get authSocialTerms =>
      'Продолжая, вы принимаете Условия использования.';

  @override
  String get authWelcomeTitle => 'Спокойно. Уверенно. HOO.';

  @override
  String get authWelcomeSubtitle =>
      'Премиальный streetwear из Баку и 3D-студия для собственного дизайна.';

  @override
  String get authSignInTitle => 'С возвращением';

  @override
  String get authSignInSubtitle => 'Ваши заказы, дизайны и избранное ждут вас.';

  @override
  String get authIdentifierLabel => 'E-mail или телефон';

  @override
  String get authIdentifierHint => 'you@example.com или 050 123 45 67';

  @override
  String get authPasswordLabel => 'Пароль';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String get authNoAccount => 'Впервые в HOO?';

  @override
  String get authHaveAccount => 'Уже есть аккаунт?';

  @override
  String get authSignUpTitle => 'Создайте аккаунт';

  @override
  String get authSignUpSubtitle =>
      'Ранний доступ к дропам, быстрый checkout и сохранённые дизайны.';

  @override
  String get authFullNameLabel => 'Имя и фамилия';

  @override
  String get authEmailLabel => 'E-mail';

  @override
  String get authPhoneLabel => 'Телефон';

  @override
  String get authMarketingConsent =>
      'Первым(-ой) узнавать о новых дропах и предложениях';

  @override
  String get authAcceptTerms =>
      'Я принимаю Условия использования и Политику конфиденциальности';

  @override
  String get authTermsRequired => 'Чтобы продолжить, примите условия';

  @override
  String get authOtpPhoneTitle => 'Вход по телефону';

  @override
  String get authOtpPhoneSubtitle =>
      'Мы отправим 6-значный код по SMS. Для нового номера аккаунт создаётся автоматически.';

  @override
  String get authOtpNameHint => 'для новых клиентов';

  @override
  String get authSendCode => 'Отправить код';

  @override
  String get authOtpCodeTitle => 'Введите код';

  @override
  String authOtpCodeSubtitle(String phone) {
    return 'Мы отправили его на $phone';
  }

  @override
  String authResendIn(String time) {
    return 'Отправить снова через $time';
  }

  @override
  String get authResendSms => 'Отправить код снова';

  @override
  String get authResendWhatsApp => 'Нет SMS? Отправить в WhatsApp';

  @override
  String get authForgotTitle => 'Восстановление пароля';

  @override
  String get authForgotSubtitle => 'Укажите e-mail или номер телефона.';

  @override
  String get authForgotEmailSentTitle => 'Проверьте почту';

  @override
  String get authForgotEmailSent =>
      'Если аккаунт существует, мы отправили ссылку для сброса пароля.';

  @override
  String get authResetTitle => 'Новый пароль';

  @override
  String get authResetSubtitle => 'Введите код из SMS и новый пароль.';

  @override
  String get authResetCodeLabel => 'Код';

  @override
  String get authNewPasswordLabel => 'Новый пароль';

  @override
  String get authResetDone => 'Пароль обновлён. Теперь можно войти.';

  @override
  String get cartAddedTitle => 'Добавлено в корзину';

  @override
  String cartItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count товара',
      many: '$count товаров',
      few: '$count товара',
      one: '$count товар',
    );
    return '$_temp0';
  }

  @override
  String get cartCheckout => 'Оформить заказ';

  @override
  String get cartViewBag => 'Открыть корзину';

  @override
  String cartOnlyLeft(int count) {
    return 'Осталось $count шт.';
  }

  @override
  String cartMadeToOrderDays(int days) {
    return 'Под заказ · $days дн.';
  }

  @override
  String get cartCustomBadge => 'Studio';

  @override
  String get cartFreeDeliveryReached => 'Отлично — доставка бесплатная';

  @override
  String cartFreeDeliveryRemaining(String amount) {
    return 'До бесплатной доставки $amount';
  }

  @override
  String cartRemoved(String name) {
    return '$name удалён из корзины';
  }

  @override
  String get cartUndo => 'Отменить';

  @override
  String get cartEmptyTitle => 'Ваша корзина пуста';

  @override
  String get cartEmptyBody =>
      'Посмотрите новый дроп или создайте свой дизайн в студии.';

  @override
  String get cartEmptyAction => 'В магазин';

  @override
  String get cartBestsellers => 'Хиты продаж';

  @override
  String get cartLineErrors =>
      'Некоторые товары изменились — проверьте их перед оформлением.';

  @override
  String get cartIsGift => 'Это подарок';

  @override
  String get cartIsGiftHint => 'Упаковка, открытка и чек без цен';

  @override
  String get cartDeliveryAtCheckout =>
      'Доставка рассчитывается при оформлении.';

  @override
  String get cartCompleteTheLook => 'Дополните образ';

  @override
  String get cartPromoHint => 'Промокод';

  @override
  String get catalogFilterTitle => 'Фильтры и сортировка';

  @override
  String get catalogSortNewest => 'Новинки';

  @override
  String get catalogSortPriceAsc => 'Цена: по возрастанию';

  @override
  String get catalogSortPriceDesc => 'Цена: по убыванию';

  @override
  String get catalogSortPopular => 'Популярные';

  @override
  String get catalogFilterCategory => 'Категория';

  @override
  String get catalogFilterSize => 'Размер';

  @override
  String get catalogFilterColor => 'Цвет';

  @override
  String get catalogFilterFit => 'Крой';

  @override
  String get catalogFilterFabric => 'Ткань';

  @override
  String get catalogFilterPrice => 'Цена';

  @override
  String get catalogFilterInStock => 'Только в наличии';

  @override
  String get catalogShowResults => 'Показать';

  @override
  String get catalogChipAll => 'Все';

  @override
  String get catalogChipNew => 'Новинки';

  @override
  String get catalogChipSale => 'Скидки';

  @override
  String get catalogChipOversized => 'Оверсайз';

  @override
  String catalogShowing(int shown, int total) {
    return 'Показано $shown из $total';
  }

  @override
  String get catalogFilterAndSort => 'Фильтр';

  @override
  String catalogFilterCount(int count) {
    return 'Фильтр ($count)';
  }

  @override
  String get catalogEmptyTitle => 'Ничего не найдено';

  @override
  String get catalogEmptyBody => 'Попробуйте изменить или сбросить фильтры.';

  @override
  String get catalogAlertSignIn =>
      'Уведомления привязаны к аккаунту — войдите.';

  @override
  String get catalogNotifyDone => 'Сообщим, когда товар появится';

  @override
  String get catalogPriceAlertDone => 'Сообщим, если цена снизится';

  @override
  String get catalogPhotos => 'Фото';

  @override
  String get catalog3dView => '3D';

  @override
  String get catalogYouMayAlsoLike => 'Вам может понравиться';

  @override
  String get catalogToday => 'сегодня';

  @override
  String get catalogTomorrow => 'завтра';

  @override
  String catalogDeliveredOn(String when) {
    return 'Доставка: $when';
  }

  @override
  String catalogDeliveryPromise(int hours, int minutes, String when) {
    return 'Закажите в течение $hours ч $minutes мин — доставим $when';
  }

  @override
  String get catalogReadReviews => 'Читать отзывы';

  @override
  String get catalogColor => 'Цвет';

  @override
  String get catalogSize => 'Размер';

  @override
  String get catalogSizeGuide => 'Таблица размеров';

  @override
  String get catalogPreorderShort => 'предзаказ';

  @override
  String get catalogChooseSize => 'Выберите размер';

  @override
  String catalogRecommendedSize(String size) {
    return 'Рекомендуем размер $size';
  }

  @override
  String catalogOnlyLeftIn(int count, String size) {
    return 'В размере $size осталось $count шт.';
  }

  @override
  String get catalogCustomizeThis => 'Кастомизировать';

  @override
  String get catalogDescription => 'Описание';

  @override
  String get catalogSizeAndFit => 'Размер и крой';

  @override
  String get catalogFabricAndCare => 'Ткань и уход';

  @override
  String catalogReviewsCount(int count) {
    return 'Отзывы ($count)';
  }

  @override
  String get catalogWriteReview => 'Написать отзыв';

  @override
  String get catalogPriceDropAlert => 'Сообщить о снижении цены';

  @override
  String get catalogSelectSize => 'Выберите размер';

  @override
  String get catalogAddToBag => 'В корзину';

  @override
  String get catalogSizeCol => 'Размер';

  @override
  String get catalogChestCol => 'Грудь';

  @override
  String get catalogLengthCol => 'Длина';

  @override
  String get catalogSleeveCol => 'Рукав';

  @override
  String get catalogSizeGuideHint => 'Замеры изделия в разложенном виде.';

  @override
  String get catalogReviews => 'Отзывы';

  @override
  String get catalogNoReviews => 'Отзывов пока нет';

  @override
  String get catalogNoReviewsBody =>
      'Если вы купили этот товар, оставьте первый отзыв.';

  @override
  String get catalogReviewThanks => 'Спасибо!';

  @override
  String get catalogReviewModeration =>
      'Отзыв будет опубликован после модерации.';

  @override
  String get catalogYourRating => 'Ваша оценка';

  @override
  String get catalogReviewTitle => 'Заголовок';

  @override
  String get catalogReviewBody => 'Ваш отзыв';

  @override
  String get catalogSubmitReview => 'Отправить';

  @override
  String get checkoutTitle => 'Оформление заказа';

  @override
  String get checkoutStepContact => 'Контакты';

  @override
  String get checkoutStepGift => 'Подарок';

  @override
  String get checkoutStepDelivery => 'Доставка';

  @override
  String get checkoutStepSlot => 'Время доставки';

  @override
  String get checkoutStepPayment => 'Оплата';

  @override
  String get checkoutStepReview => 'Проверка';

  @override
  String get checkoutPhoneHint => 'Курьер позвонит на этот номер.';

  @override
  String get checkoutGiftNotForCustom =>
      'Заказы из студии нельзя отправить как подарок.';

  @override
  String get checkoutRecipientName => 'Имя получателя';

  @override
  String get checkoutRecipientPhone => 'Телефон получателя';

  @override
  String get checkoutOccasion => 'Повод';

  @override
  String get checkoutSurprise => 'Сюрприз';

  @override
  String get checkoutSurpriseHint =>
      'Курьер согласует доставку с вами, а не с получателем.';

  @override
  String get checkoutPackaging => 'Упаковка';

  @override
  String checkoutPackagingFreeFrom(String amount) {
    return 'Бесплатно от $amount';
  }

  @override
  String get checkoutCard => 'Открытка';

  @override
  String get checkoutMessage => 'Сообщение';

  @override
  String get checkoutFromName => 'От кого';

  @override
  String get checkoutHidePrices => 'Скрыть цены в чеке';

  @override
  String checkoutReadyInHours(int hours) {
    return 'Готово через $hours ч';
  }

  @override
  String checkoutFreeFrom(String amount) {
    return 'Бесплатно от $amount';
  }

  @override
  String get checkoutAddress => 'Адрес';

  @override
  String get checkoutNewAddress => 'Новый адрес';

  @override
  String get checkoutCity => 'Город';

  @override
  String get checkoutDistrict => 'Район';

  @override
  String get checkoutStreet => 'Улица, дом';

  @override
  String get checkoutApartment => 'Квартира';

  @override
  String get checkoutCourierNote => 'Комментарий курьеру';

  @override
  String get checkoutNoSlots => 'Нет доступного времени';

  @override
  String get checkoutSlotTaken => 'Это время уже занято — выберите другое.';

  @override
  String get checkoutPackagingSaving => 'Экономия на упаковке';

  @override
  String checkoutEstimatedDelivery(String range) {
    return 'Ориентировочная доставка: $range';
  }

  @override
  String get checkoutCustomApprovalNote =>
      'Дизайны из студии сначала проверяет команда, затем они уходят в производство — до этого заказ в статусе «Ожидает одобрения дизайна».';

  @override
  String get checkoutSaveCard => 'Сохранить карту для следующих покупок';

  @override
  String get checkoutAcceptTerms =>
      'Я принимаю условия продажи и политику возврата';

  @override
  String get checkoutImageRights =>
      'Права на изображения принадлежат мне; понимаю, что изделия на заказ не возвращаются';

  @override
  String get checkoutMissingSteps =>
      'Заполните шаги выше, чтобы оформить заказ.';

  @override
  String checkoutPlaceOrder(String total) {
    return 'Оформить · $total';
  }

  @override
  String get checkoutPaymentFailedTitle => 'Оплата не прошла';

  @override
  String get checkoutPaymentFailedBody =>
      'Заказ сохранён. Попробуйте снова или выберите другой способ.';

  @override
  String get checkoutRetryPayment => 'Оплатить снова';

  @override
  String get checkoutSwitchToCod => 'Оплачу наличными курьеру';

  @override
  String get checkoutAwaitingPayment => 'Завершите оплату';

  @override
  String checkoutAwaitingPaymentBody(String number) {
    return 'Заказ $number создан. Продолжим, как только оплата подтвердится.';
  }

  @override
  String get checkoutCheckPayment => 'Проверить оплату';

  @override
  String get checkoutOpenPaymentAgain => 'Открыть страницу оплаты снова';

  @override
  String get checkoutConfirmedTitle => 'Заказ оформлен';

  @override
  String get checkoutConfirmedBody =>
      'Спасибо. Мы отправили подтверждение по e-mail и SMS.';

  @override
  String get checkoutOrderNumber => 'Номер заказа';

  @override
  String get checkoutGiftReceipt => 'Подарочный чек';

  @override
  String get checkoutGiftReceiptHint =>
      'Получатель сможет обменять размер по этому коду — не видя цен.';

  @override
  String get checkoutTrackOrder => 'Отследить заказ';

  @override
  String get checkoutContinueShopping => 'Продолжить покупки';

  @override
  String get homeNewArrivals => 'Новые поступления';

  @override
  String get homeCategories => 'Категории';

  @override
  String get homeCollections => 'Коллекции';

  @override
  String get homeShopTheLook => 'Купить образ';

  @override
  String homeShopLookCount(int count) {
    return '$count вещей';
  }

  @override
  String get homeBestsellers => 'Хиты продаж';

  @override
  String get homeRecentlyViewed => 'Вы недавно смотрели';

  @override
  String get homeHeroEyebrow => 'Новый дроп';

  @override
  String get homeHeroTitle => 'Тихая сила.';

  @override
  String get homeHeroSubtitle =>
      'Плотный хлопок, оверсайз, лесной зелёный. Новая коллекция уже в продаже.';

  @override
  String get homeHeroCta => 'Смотреть коллекцию';

  @override
  String get homeStudioTitle => 'Создай свой дизайн';

  @override
  String get homeStudioBody =>
      'Выберите ткань и цвет, добавьте текст и изображения — в 3D.';

  @override
  String get homeStudioCta => 'Открыть студию';

  @override
  String get launchComingSoonTitle => 'Скоро.';

  @override
  String get launchComingSoonSubtitle =>
      'HOO открывается. Запишитесь, чтобы получить ранний доступ к первому дропу.';

  @override
  String get launchDays => 'дн.';

  @override
  String get launchHours => 'ч';

  @override
  String get launchMinutes => 'мин';

  @override
  String get launchSeconds => 'сек';

  @override
  String launchCountdownA11y(int days, int hours, int minutes) {
    return 'До запуска $days дн., $hours ч, $minutes мин';
  }

  @override
  String get launchWaitlistTitle => 'Лист ожидания';

  @override
  String launchWaitlistCount(int count) {
    return 'В списке уже $count человек';
  }

  @override
  String get launchJoinWaitlist => 'Записаться';

  @override
  String launchWaitlistPosition(int position, int total) {
    return 'Вы №$position из $total';
  }

  @override
  String get launchWaitlistThanks => 'В день запуска вы узнаете первым(-ой).';

  @override
  String get launchWaitlistAlready => 'Вы уже в списке — до скорого!';

  @override
  String get launchNewsletterTitle => 'Подписаться на рассылку';

  @override
  String get launchSubscribe => 'Подписаться';

  @override
  String get launchNewsletterDone => 'Вы подписаны. Спасибо!';

  @override
  String get launchStaffSignIn => 'Вход для сотрудников';

  @override
  String get launchSkip => 'Пропустить';

  @override
  String get launchGetStarted => 'Начать';

  @override
  String get launchChooseLanguage => 'Выберите язык';

  @override
  String get launchSlideBrandTitle => 'Из Баку. Спокойно и уверенно.';

  @override
  String get launchSlideBrandBody =>
      'Плотный хлопок, точный крой, мало цвета. Премиальный streetwear на каждый день.';

  @override
  String get launchSlideStudioTitle => 'Создай свой дизайн.';

  @override
  String get launchSlideStudioBody =>
      'Выберите ткань и цвет в 3D-студии, добавьте текст и изображения — цена сразу.';

  @override
  String get launchSlideDeliveryTitle => 'Быстрая доставка по Баку.';

  @override
  String get launchSlideDeliveryBody =>
      'Выберите удобный день и время и отслеживайте каждый шаг.';

  @override
  String get ordersEventPlaced => 'Заказ оформлен';

  @override
  String get ordersEventPaymentCaptured => 'Оплата получена';

  @override
  String get ordersEventPaymentFailed => 'Оплата не прошла';

  @override
  String get ordersEventCourierAssigned => 'Назначен курьер';

  @override
  String ordersEventCourierAssignedNamed(String name) {
    return 'Курьер: $name';
  }

  @override
  String get ordersEventEtaUpdated => 'Время доставки обновлено';

  @override
  String get ordersEventSlotChanged => 'Время доставки изменено';

  @override
  String get ordersEventRefund => 'Деньги возвращены';

  @override
  String get ordersEventGiftMessage => 'Сообщение к подарку обновлено';

  @override
  String get ordersEventReturnRequested => 'Запрошен возврат';

  @override
  String get ordersEventReturnUpdated => 'Возврат обновлён';

  @override
  String get ordersEventDesignApproved => 'Дизайн одобрен';

  @override
  String get ordersEventDesignChanges => 'Нужны правки в дизайне';

  @override
  String get ordersTitle => 'Мои заказы';

  @override
  String get ordersEmptyTitle => 'Заказов пока нет';

  @override
  String get ordersEmptyBody => 'Здесь появится ваш первый заказ.';

  @override
  String get ordersReturnsTitle => 'Возвраты';

  @override
  String get ordersReturnsEmpty => 'Нет запросов на возврат';

  @override
  String get ordersReturnsEmptyBody =>
      'Возврат или обмен можно запросить на странице заказа.';

  @override
  String get ordersTrackTitle => 'Отследить заказ';

  @override
  String get ordersTrackBody =>
      'Введите номер заказа и телефон, указанный в заказе.';

  @override
  String get ordersTrackPhone => 'Телефон в заказе';

  @override
  String get ordersChangeSlot => 'Изменить время доставки';

  @override
  String get ordersSlotChangeContact =>
      'Чтобы изменить время, свяжитесь с нами — мы перезапишем курьера.';

  @override
  String get ordersSlotChanged => 'Время доставки изменено';

  @override
  String get ordersSignInToView => 'Войдите, чтобы увидеть заказ';

  @override
  String ordersPlacedOn(String date) {
    return 'Оформлен $date';
  }

  @override
  String get ordersPayAgain => 'Оплатить снова';

  @override
  String get ordersReturnExchange => 'Возврат / обмен';

  @override
  String get ordersWhatsApp => 'Написать в WhatsApp';

  @override
  String get ordersTimeline => 'Статус';

  @override
  String get ordersItems => 'Товары';

  @override
  String ordersCourier(String name) {
    return 'Курьер: $name';
  }

  @override
  String ordersStopsAway(int count) {
    return 'Через $count остановок';
  }

  @override
  String ordersEta(int minutes) {
    return '~$minutes мин';
  }

  @override
  String get ordersNotReturnable => 'Изделие на заказ — без возврата';

  @override
  String get ordersReturnReason => 'Причина';

  @override
  String get ordersSendRequest => 'Отправить запрос';

  @override
  String get ordersReturnSent => 'Запрос отправлен';

  @override
  String get ordersReturnSentBody =>
      'Мы свяжемся с вами в течение 1–2 рабочих дней.';

  @override
  String get ordersGiftReceiptBody =>
      'Введите код с подарочного чека и телефон — сможете обменять размер.';

  @override
  String get ordersGiftCode => 'Код подарка';

  @override
  String get ordersRecipientPhone => 'Ваш телефон';

  @override
  String ordersGiftFor(String name) {
    return 'Подарок для $name';
  }

  @override
  String ordersGiftFrom(String name) {
    return 'от $name';
  }

  @override
  String get ordersExchangeTo => 'Обменять на';

  @override
  String ordersExchangeUntil(String date) {
    return 'Обмен возможен до $date';
  }

  @override
  String get ordersRequestExchange => 'Запросить обмен';

  @override
  String get ordersExchangeSent => 'Обмен запрошен';

  @override
  String get profileSignOutConfirm => 'Выйти из аккаунта?';

  @override
  String get profileShopping => 'Покупки';

  @override
  String get profileMyDesigns => 'Мои дизайны';

  @override
  String get profileAccount => 'Аккаунт';

  @override
  String get profileStyleProfile => 'Профиль стиля';

  @override
  String get profileAddresses => 'Адреса';

  @override
  String get profileSavedCards => 'Сохранённые карты';

  @override
  String get profilePersonalInfo => 'Личные данные';

  @override
  String get profileChangePassword => 'Сменить пароль';

  @override
  String get profileSetPassword => 'Задать пароль';

  @override
  String get profileDevices => 'Активные устройства';

  @override
  String get profileNotifications => 'Уведомления';

  @override
  String get profileServices => 'Сервисы';

  @override
  String get profileHelp => 'Помощь';

  @override
  String get profileSettings => 'Настройки';

  @override
  String profileHello(String name) {
    return 'Привет, $name';
  }

  @override
  String get profileActiveOrders => 'Активные';

  @override
  String get profileGuestTitle => 'Ваш аккаунт HOO';

  @override
  String get profileGuestBody =>
      'Отслеживайте заказы, сохраняйте дизайны и избранное на любом устройстве.';

  @override
  String get profilePasswordChanged => 'Пароль изменён';

  @override
  String get profileCurrentPassword => 'Текущий пароль';

  @override
  String get profilePasswordOtherDevices =>
      'На других устройствах будет выполнен выход.';

  @override
  String get profileAddAddress => 'Добавить адрес';

  @override
  String get profileEditAddress => 'Изменить адрес';

  @override
  String get profileNoAddresses => 'Нет сохранённых адресов';

  @override
  String get profileDefault => 'Основной';

  @override
  String get profileDeleteAddress => 'Удалить адрес?';

  @override
  String get profileAddressLabel => 'Название';

  @override
  String get profileAddressLabelHint => 'Дом, работа…';

  @override
  String get profileMakeDefault => 'Сделать основным';

  @override
  String get profileNoCards => 'Нет сохранённых карт';

  @override
  String get profileNoCardsBody => 'Выберите «Сохранить карту» при оплате.';

  @override
  String get profileDeleteCard => 'Удалить карту?';

  @override
  String profileDeviceApp(String platform) {
    return 'Приложение HOO · $platform';
  }

  @override
  String get profileDeviceUnknown => 'Неизвестное устройство';

  @override
  String get profileThisDevice => 'Это устройство';

  @override
  String profileLastSeen(String time) {
    return 'Активность: $time';
  }

  @override
  String get profileRequiredNotification => 'Обязательно для заказов';

  @override
  String get profileLanguage => 'Язык';

  @override
  String get profileAppearance => 'Оформление';

  @override
  String get profileThemeSystem => 'Системная';

  @override
  String get profileThemeLight => 'Светлая';

  @override
  String get profileThemeDark => 'Тёмная';

  @override
  String get profileContactUs => 'Связаться с нами';

  @override
  String get profileFaq => 'Частые вопросы';

  @override
  String get profileFaqDeliveryQ => 'Сколько идёт доставка?';

  @override
  String get profileFaqDeliveryA =>
      'По Баку курьер — обычно 1–2 дня, в выбранное вами окно. В регионы почтой — 3–5 дней.';

  @override
  String get profileFaqReturnsQ => 'Как вернуть товар?';

  @override
  String get profileFaqReturnsA =>
      'Откройте заказ и выберите «Возврат / обмен». Изделия из студии не возвращаются.';

  @override
  String get profileFaqStudioQ => 'Когда будет готов заказ из студии?';

  @override
  String get profileFaqStudioA =>
      'Команда проверяет дизайн, затем он уходит в производство. Срок указан при заказе; есть срочное производство.';

  @override
  String get profileFaqPaymentQ => 'Какие способы оплаты есть?';

  @override
  String get profileFaqPaymentA =>
      'Apple Pay, Google Pay, карта и наличные курьеру (до лимита).';

  @override
  String get profileSizeGuideBody =>
      'На каждой странице товара есть таблица размеров. Заполните профиль стиля — и мы порекомендуем размер.';

  @override
  String get profileAbout => 'О HOO';

  @override
  String get profileAboutBody =>
      'HOO — премиальный streetwear-бренд из Баку. Плотный хлопок, точный крой, мало цвета и 3D-студия для собственного дизайна.';

  @override
  String get profileStyleIntro =>
      'Укажите параметры — подберём размер и отсортируем товары по вашему вкусу.';

  @override
  String get profileMeasurements => 'Параметры';

  @override
  String get profileHeight => 'Рост';

  @override
  String get profileWeight => 'Вес';

  @override
  String get profileWaist => 'Талия';

  @override
  String get profileUsualSize => 'Обычный размер';

  @override
  String get profilePreferredFit => 'Любимый крой';

  @override
  String get profileFavoriteColors => 'Любимые цвета';

  @override
  String get profileUpToThree => 'До 3';

  @override
  String get profileStyles => 'Стиль';

  @override
  String get searchHint => 'Худи, футболки, цвета…';

  @override
  String get searchRecent => 'Недавние запросы';

  @override
  String get searchSuggestions => 'Подсказки';

  @override
  String searchResults(int count, String query) {
    return '$count результатов по «$query»';
  }

  @override
  String searchNoResultsTitle(String query) {
    return 'По запросу «$query» ничего нет';
  }

  @override
  String get searchNoResultsBody =>
      'Попробуйте другое слово или посмотрите хиты.';

  @override
  String get searchDesignYourOwnTitle => 'Не нашли? Создайте сами';

  @override
  String get searchDesignYourOwnBody =>
      'В 3D-студии — с нужным цветом и принтом.';

  @override
  String get studioModelFallback =>
      '3D-модель не загрузилась — показываем упрощённую форму.';

  @override
  String studioTooManyLayers(int max) {
    return 'Можно добавить не более $max слоёв';
  }

  @override
  String studioUploadTooLarge(int mb) {
    return 'Файл слишком большой (макс. $mb МБ)';
  }

  @override
  String get studioUndo => 'Отменить';

  @override
  String get studioRedo => 'Повторить';

  @override
  String get studioSavedOffline => 'Сохранено офлайн';

  @override
  String get studioSaveFailed => 'Не сохранено';

  @override
  String get studioFront => 'Перед';

  @override
  String get studioBack => 'Спина';

  @override
  String get studioLeftSleeve => 'Левый рукав';

  @override
  String get studioRightSleeve => 'Правый рукав';

  @override
  String get studioHood => 'Капюшон';

  @override
  String get studioFreeSpot => 'Свободное место';

  @override
  String get studioStepProduct => 'Изделие';

  @override
  String get studioStepFabric => 'Ткань и детали';

  @override
  String get studioStepFit => 'Размер и крой';

  @override
  String get studioStepColor => 'Цвет';

  @override
  String get studioStepEditor => 'Дизайн';

  @override
  String get studioStepReview => 'Проверка';

  @override
  String get studioCustomSize => 'Индивидуальный';

  @override
  String studioLeadTime(int min, int max) {
    return 'Производство $min–$max дн.';
  }

  @override
  String get studioReview => 'Проверить';

  @override
  String get studioSetupFee => 'Подготовка';

  @override
  String get studioRushFee => 'Срочное производство';

  @override
  String studioVolumeDiscount(int percent) {
    return 'Скидка за количество −$percent%';
  }

  @override
  String get studioIncluded => 'Включено';

  @override
  String get studioChooseProduct => 'Что создаём?';

  @override
  String studioFromPrice(String price) {
    return 'от $price';
  }

  @override
  String get studioFabric => 'Ткань';

  @override
  String studioGsm(int gsm) {
    return '$gsm г/м²';
  }

  @override
  String get studioFeatures => 'Детали';

  @override
  String get studioFit => 'Крой';

  @override
  String get studioCustomMeasurements => 'Индивидуальные мерки';

  @override
  String get studioColor => 'Цвет';

  @override
  String get studioSpotPicked => 'Следующий слой появится там, где вы нажали';

  @override
  String get studioAddText => 'Текст';

  @override
  String get studioAddImage => 'Изображение';

  @override
  String studioLayers(int count, int max) {
    return 'Слои · $count/$max';
  }

  @override
  String get studioNoLayers =>
      'Добавьте текст или изображение — или нажмите на модель, чтобы выбрать место.';

  @override
  String studioUploadHint(int mb, int dpi) {
    return 'PNG или JPG до $mb МБ. Для лучшей печати — $dpi DPI.';
  }

  @override
  String get studioFromGallery => 'Из галереи';

  @override
  String get studioFromCamera => 'Сделать фото';

  @override
  String get studioImageLayer => 'Изображение';

  @override
  String get studioShowLayer => 'Показать';

  @override
  String get studioHideLayer => 'Скрыть';

  @override
  String get studioTextLayer => 'Текст';

  @override
  String get studioCenter => 'По центру';

  @override
  String get studioDuplicate => 'Дублировать';

  @override
  String get studioSize => 'Размер';

  @override
  String get studioRotation => 'Поворот';

  @override
  String studioQualityPoor(int dpi) {
    return 'Низкое качество печати ($dpi DPI) — уменьшите изображение или загрузите файл крупнее';
  }

  @override
  String studioQualityWarning(int dpi) {
    return 'Среднее качество ($dpi DPI)';
  }

  @override
  String studioQualityOk(int dpi) {
    return 'Хорошее качество печати ($dpi DPI)';
  }

  @override
  String get studioEditText => 'Изменить текст';

  @override
  String get studioFont => 'Шрифт';

  @override
  String studioTextSize(int pt) {
    return 'Размер · $pt pt';
  }

  @override
  String get studioLayersShort => 'Слои';

  @override
  String get studioQuantity => 'Количество';

  @override
  String studioVolumeTier(int min, int percent) {
    return '$min+: −$percent%';
  }

  @override
  String get studioRush => 'Срочное производство';

  @override
  String studioRushHint(String fee, int days) {
    return '+$fee · на $days дн. быстрее';
  }

  @override
  String get studioImageRights => 'Права на эти изображения принадлежат мне';

  @override
  String get studioAddSomething =>
      'Добавьте хотя бы один текст или изображение.';

  @override
  String get studioSaveDesign => 'Сохранить дизайн';

  @override
  String get studioDesignSaved => 'Дизайн сохранён';

  @override
  String get studioBackToEditor => 'Вернуться к дизайну';

  @override
  String get studioIntro =>
      'Выберите ткань, крой и цвет, добавьте текст и изображения — цена каждого изменения сразу.';

  @override
  String get studioStart => 'Начать дизайн';

  @override
  String get studioContinueDraft => 'Продолжить последний дизайн';

  @override
  String get studioHowItWorks => 'Как это работает';

  @override
  String get studioHowPick => 'Выберите изделие, ткань и цвет';

  @override
  String get studioHowDesign => 'Разместите текст и изображения в 3D';

  @override
  String get studioHowOrder => 'Закажите — мы проверим и изготовим';

  @override
  String get studioUntitled => 'Без названия';

  @override
  String get studioNoDesigns => 'Дизайнов пока нет';

  @override
  String get studioNoDesignsBody =>
      'Здесь хранится всё, что вы создали в студии.';

  @override
  String get studioResubmit => 'Отправить снова';

  @override
  String get studioResubmitted => 'Дизайн снова отправлен на проверку';

  @override
  String get studioDeleteConfirm => 'Удалить дизайн?';

  @override
  String get studioSharedTitle => 'Общий дизайн';

  @override
  String get studioDesignYourOwn => 'Создать свой дизайн';

  @override
  String get wishlistSignInReason =>
      'Войдите, чтобы сохранять избранное и видеть его на любом устройстве.';

  @override
  String get wishlistTitle => 'Избранное';

  @override
  String get wishlistShareSubject => 'Моё избранное в HOO';

  @override
  String get wishlistEmptyTitle => 'Пока ничего не сохранено';

  @override
  String get wishlistEmptyBody =>
      'Нажмите ♡ на товаре, чтобы сохранить его здесь.';

  @override
  String get wishlistChooseSize => 'Выбрать размер';

  @override
  String get wishlistNotifyMe => 'Сообщить о поступлении';

  @override
  String wishlistSharedTitle(String name) {
    return 'Избранное $name';
  }

  @override
  String get wishlistAlertsTitle => 'Уведомления';

  @override
  String get wishlistAlertsEmptyTitle => 'Нет активных уведомлений';

  @override
  String get wishlistAlertsEmptyBody =>
      'Используйте «Сообщить о поступлении» или «Сообщить о снижении цены» на странице товара.';

  @override
  String get wishlistAlertBackInStock => 'При поступлении';

  @override
  String get wishlistAlertPriceDrop => 'При снижении цены';

  @override
  String wishlistAlertNotified(String date) {
    return 'Уведомлено $date';
  }
}
