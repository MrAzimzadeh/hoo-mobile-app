import 'package:json_annotation/json_annotation.dart';

/// Domain enums with their exact wire values (Hoo.Domain / Hoo.Application, serialized by JsonStringEnumConverter).
/// Every enum has an `unknown` member so a value added on the server never crashes the app; models mark
/// such fields with `unknownEnumValue: <Enum>.unknown`.

@JsonEnum(valueField: 'wire')
enum AppLanguage {
  az('az', 'Azərbaycan'),
  ru('ru', 'Русский'),
  en('en', 'English'),
  tr('tr', 'Türkçe');

  const AppLanguage(this.wire, this.nativeName);
  final String wire;
  final String nativeName;

  static AppLanguage fromCode(String? code) => values.firstWhere((l) => l.wire == code, orElse: () => AppLanguage.az);
}

@JsonEnum(valueField: 'wire')
enum ProductType {
  hoodie('Hoodie'),
  zipHoodie('ZipHoodie'),
  tShirt('TShirt'),
  sweatshirt('Sweatshirt'),
  sweatpants('Sweatpants'),
  shorts('Shorts'),
  unknown('');

  const ProductType(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum Fit {
  oversized('Oversized'),
  boxy('Boxy'),
  regular('Regular'),
  fitted('Fitted'),
  cropped('Cropped'),
  unknown('');

  const Fit(this.wire);
  final String wire;

  static Fit fromWire(String? v) => values.firstWhere((e) => e.wire == v, orElse: () => Fit.unknown);
}

@JsonEnum(valueField: 'wire')
enum Size {
  xs('XS'),
  s('S'),
  m('M'),
  l('L'),
  xl('XL'),
  xxl('XXL'),
  xxxl('3XL'),
  unknown('');

  const Size(this.wire);
  final String wire;

  /// Label shown in chips (identical to the wire value).
  String get label => wire;

  static Size fromWire(String? v) => values.firstWhere((e) => e.wire == v, orElse: () => Size.unknown);
  static const customerSizes = [xs, s, m, l, xl, xxl];
}

@JsonEnum(valueField: 'wire')
enum ColorFamily {
  black('Black'),
  forest('Forest'),
  cream('Cream'),
  white('White'),
  grey('Grey'),
  sand('Sand'),
  olive('Olive'),
  red('Red'),
  unknown('');

  const ColorFamily(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum StyleTag {
  minimal('Minimal'),
  streetwear('Streetwear'),
  graphicPrints('GraphicPrints'),
  monochrome('Monochrome'),
  sport('Sport'),
  vintage('Vintage'),
  unknown('');

  const StyleTag(this.wire);
  final String wire;
}

/// Badges arrive as strings on product cards: NEW, NEW_DROP, BESTSELLER, SALE.
enum ProductBadge {
  newIn('NEW'),
  newDrop('NEW_DROP'),
  bestseller('BESTSELLER'),
  sale('SALE'),
  unknown('');

  const ProductBadge(this.wire);
  final String wire;

  static ProductBadge fromWire(String v) {
    final norm = v.toUpperCase().replaceAll(' ', '_');
    if (norm == 'NEWDROP') return newDrop;
    return values.firstWhere((e) => e.wire == norm, orElse: () => unknown);
  }
}

@JsonEnum(valueField: 'wire')
enum LayerKind {
  text('Text'),
  image('Image'),
  graphic('Graphic');

  const LayerKind(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum DesignStatus {
  draft('Draft'),
  submitted('Submitted'),
  changesRequested('ChangesRequested'),
  approved('Approved'),
  inProduction('InProduction'),
  ready('Ready'),
  cancelled('Cancelled'),
  unknown('');

  const DesignStatus(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum OrderStatus {
  newOrder('New'),
  paid('Paid'),
  awaitingApproval('AwaitingApproval'),
  inProduction('InProduction'),
  packed('Packed'),
  outForDelivery('OutForDelivery'),
  readyForPickup('ReadyForPickup'),
  delivered('Delivered'),
  cancelled('Cancelled'),
  returnRequested('ReturnRequested'),
  returned('Returned'),
  refunded('Refunded'),
  unknown('');

  const OrderStatus(this.wire);
  final String wire;

  bool get isActive => !const {delivered, cancelled, returned, refunded, unknown}.contains(this);
}

@JsonEnum(valueField: 'wire')
enum OrderLineKind {
  stock('Stock'),
  custom('Custom'),
  unknown('');

  const OrderLineKind(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum OrderSource {
  web('Web'),
  app('App'),
  admin('Admin'),
  unknown('');

  const OrderSource(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum OrderEventType {
  placed('Placed'),
  statusChanged('StatusChanged'),
  paymentCaptured('PaymentCaptured'),
  paymentFailed('PaymentFailed'),
  courierAssigned('CourierAssigned'),
  courierEtaUpdated('CourierEtaUpdated'),
  slotChanged('SlotChanged'),
  refundIssued('RefundIssued'),
  giftMessageEdited('GiftMessageEdited'),
  returnRequested('ReturnRequested'),
  returnUpdated('ReturnUpdated'),
  designApproved('DesignApproved'),
  designChangesRequested('DesignChangesRequested'),
  unknown('');

  const OrderEventType(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum ActorKind {
  customer('Customer'),
  staff('Staff'),
  courier('Courier'),
  system('System'),
  gateway('Gateway'),
  unknown('');

  const ActorKind(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum PaymentMethod {
  applePay('ApplePay'),
  googlePay('GooglePay'),
  card('Card'),
  savedCard('SavedCard'),
  cashOnDelivery('CashOnDelivery'),
  cardOnDelivery('CardOnDelivery'),
  invoice('Invoice'),
  unknown('');

  const PaymentMethod(this.wire);
  final String wire;

  /// Online methods go through the EPoint redirect.
  bool get isOnline => const {applePay, googlePay, card, savedCard}.contains(this);
}

@JsonEnum(valueField: 'wire')
enum PaymentStatus {
  pending('Pending'),
  captured('Captured'),
  failed('Failed'),
  cancelled('Cancelled'),
  refunded('Refunded'),
  partiallyRefunded('PartiallyRefunded'),
  unknown('');

  const PaymentStatus(this.wire);
  final String wire;

  bool get isFinal => this != pending && this != unknown;
}

@JsonEnum(valueField: 'wire')
enum DeliveryKind {
  courier('Courier'),
  post('Post'),
  pickup('Pickup'),
  unknown('');

  const DeliveryKind(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum ReturnKind {
  returnItem('Return'),
  exchange('Exchange');

  const ReturnKind(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum ReturnStatus {
  requested('Requested'),
  approved('Approved'),
  rejected('Rejected'),
  received('Received'),
  refunded('Refunded'),
  exchanged('Exchanged'),
  unknown('');

  const ReturnStatus(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum ReturnChannel {
  customer('Customer'),
  giftReceipt('GiftReceipt'),
  admin('Admin'),
  unknown('');

  const ReturnChannel(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum Occasion {
  birthday('Birthday'),
  anniversary('Anniversary'),
  novruz('Novruz'),
  newYear('NewYear'),
  justBecause('JustBecause'),
  unknown('');

  const Occasion(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum GreetingCardKind {
  none('None'),
  printed('Printed'),
  handwritten('Handwritten'),
  unknown('');

  const GreetingCardKind(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum StockAlertType {
  backInStock('BackInStock'),
  priceDrop('PriceDrop');

  const StockAlertType(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum NotificationTopic {
  orders('Orders'),
  delivery('Delivery'),
  alerts('Alerts'),
  marketing('Marketing'),
  unknown('');

  const NotificationTopic(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum NotificationChannel {
  email('Email'),
  sms('Sms'),
  whatsApp('WhatsApp'),
  push('Push'),
  unknown('');

  const NotificationChannel(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum StoreMode {
  comingSoon('ComingSoon'),
  live('Live');

  const StoreMode(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum OtpChannel {
  sms('Sms'),
  whatsApp('WhatsApp');

  const OtpChannel(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum OtpPurpose {
  login('Login'),
  resetPassword('ResetPassword'),
  verifyPhone('VerifyPhone');

  const OtpPurpose(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum StockState {
  inStock('InStock'),
  lowStock('LowStock'),
  preorder('Preorder'),
  outOfStock('OutOfStock'),
  madeToOrder('MadeToOrder'),
  unavailable('Unavailable'),
  unknown('');

  const StockState(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum AdjustmentType {
  promoDiscount('PromoDiscount'),
  delivery('Delivery'),
  giftPackaging('GiftPackaging'),
  greetingCard('GreetingCard'),
  studioVolumeDiscount('StudioVolumeDiscount'),
  studioRushFee('StudioRushFee'),
  studioSetupFee('StudioSetupFee'),
  unknown('');

  const AdjustmentType(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum RecommendationBasis {
  measurements('Measurements'),
  heightWeight('HeightWeight'),
  usualSize('UsualSize'),
  unknown('');

  const RecommendationBasis(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum ProductSort {
  newest('Newest'),
  priceAsc('PriceAsc'),
  priceDesc('PriceDesc'),
  popular('Popular');

  const ProductSort(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum ProductChip {
  all('All'),
  newIn('New'),
  sale('Sale'),
  oversized('Oversized');

  const ProductChip(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum GarmentModel {
  tShirt('TShirt'),
  hoodie('Hoodie'),
  sweatshirt('Sweatshirt'),
  longSleeve('LongSleeve'),
  unknown('');

  const GarmentModel(this.wire);
  final String wire;
}

/// Analytics event types accepted by `POST /events`.
@JsonEnum(valueField: 'wire')
enum AnalyticsEventType {
  visit('Visit'),
  productView('ProductView'),
  addToCart('AddToCart'),
  checkoutStarted('CheckoutStarted'),
  orderPlaced('OrderPlaced'),
  studioOpened('StudioOpened');

  const AnalyticsEventType(this.wire);
  final String wire;
}
