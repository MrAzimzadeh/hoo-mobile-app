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
}
