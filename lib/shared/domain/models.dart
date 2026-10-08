import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// Models shared by several features (product cards, colors, paging, the signed-in user, store meta, addresses).
/// Shapes mirror Hoo.Application contracts 1:1 — the API already returns client-facing view models, so a
/// separate DTO ↔ entity mapping would only add ceremony here. Feature-specific models live in their feature.

@freezed
abstract class ColorInfo with _$ColorInfo {
  const factory ColorInfo({
    required String id,
    required String code,
    required String name,
    required String hex,
    @JsonKey(unknownEnumValue: ColorFamily.unknown) @Default(ColorFamily.unknown) ColorFamily family,
  }) = _ColorInfo;

  factory ColorInfo.fromJson(Map<String, dynamic> json) => _$ColorInfoFromJson(json);
}

@freezed
abstract class ProductCard with _$ProductCard {
  const ProductCard._();

  const factory ProductCard({
    required String id,
    required String slug,
    required String name,
    required double price,
    double? compareAtPrice,
    int? discountPercent,
    @Default(<String>[]) List<String> badges,
    @Default(0) int colorsCount,
    ColorInfo? defaultColor,
    @Default(<String>[]) List<String> colorHexes,
    String? imageUrl,
    double? rating,
    @Default(0) int reviewCount,
    @Default(true) bool inStock,
  }) = _ProductCard;

  factory ProductCard.fromJson(Map<String, dynamic> json) => _$ProductCardFromJson(json);

  List<ProductBadge> get badgeList => badges.map(ProductBadge.fromWire).where((b) => b != ProductBadge.unknown).toList();
  bool get isDiscounted => compareAtPrice != null && compareAtPrice! > price;
}

/// `PagedResult<T>` — `{ items, page, pageSize, totalCount, totalPages, hasMore }`.
@Freezed(genericArgumentFactories: true)
abstract class Paged<T> with _$Paged<T> {
  const Paged._();

  const factory Paged({
    @Default([]) List<T> items,
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(0) int totalCount,
    int? totalPages,
    bool? hasMore,
  }) = _Paged<T>;

  factory Paged.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$PagedFromJson(json, fromJsonT);

  bool get canLoadMore => hasMore ?? page * pageSize < totalCount;
}

/// `GET /auth/session` → `MeResponse`.
@freezed
abstract class Me with _$Me {
  const Me._();

  const factory Me({
    required String id,
    required String fullName,
    String? email,
    String? phone,
    @Default(false) bool emailVerified,
    @Default(false) bool phoneVerified,
    @Default(AppLanguage.az) AppLanguage language,
    @Default(false) bool marketingConsent,
    @Default(false) bool hasPassword,
    @Default(false) bool hasStyleProfile,
    @Default(<String>[]) List<String> roles,
    @Default(<String>[]) List<String> permissions,
  }) = _Me;

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  /// Staff accounts bypass the Coming Soon gate.
  bool get isStaff => roles.isNotEmpty && roles.any((r) => r.toLowerCase() != 'customer');
  String get firstName => fullName.trim().split(RegExp(r'\s+')).first;
}

@freezed
abstract class StoreContacts with _$StoreContacts {
  const factory StoreContacts({
    @Default('') String phone,
    String? whatsApp,
    String? email,
    String? instagram,
    String? tikTok,
    String? telegram,
  }) = _StoreContacts;

  factory StoreContacts.fromJson(Map<String, dynamic> json) => _$StoreContactsFromJson(json);
}

/// `GET /meta/store`.
@freezed
abstract class StoreInfo with _$StoreInfo {
  const factory StoreInfo({
    @Default(StoreMode.live) StoreMode mode,
    DateTime? launchAt,
    @Default(StoreContacts()) StoreContacts contacts,
    @Default('AZN') String currency,
    @Default(AppLanguage.az) AppLanguage defaultLanguage,
    @Default(AppLanguage.values) List<AppLanguage> languages,
    @Default(0) double vatRate,
  }) = _StoreInfo;

  factory StoreInfo.fromJson(Map<String, dynamic> json) => _$StoreInfoFromJson(json);
}

@freezed
abstract class DeliveryAddress with _$DeliveryAddress {
  const DeliveryAddress._();

  const factory DeliveryAddress({
    required String city,
    String? district,
    required String street,
    String? apartment,
    String? courierNote,
  }) = _DeliveryAddress;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => _$DeliveryAddressFromJson(json);

  String get oneLine => [street, if (apartment?.isNotEmpty ?? false) apartment, if (district?.isNotEmpty ?? false) district, city].join(', ');
}

@freezed
abstract class ContactInfo with _$ContactInfo {
  const factory ContactInfo({required String fullName, required String phone, String? email}) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);
}

/// Saved address (`AddressResponse`).
@freezed
abstract class SavedAddress with _$SavedAddress {
  const factory SavedAddress({required String id, required String label, required DeliveryAddress address, @Default(false) bool isDefault}) = _SavedAddress;

  factory SavedAddress.fromJson(Map<String, dynamic> json) => _$SavedAddressFromJson(json);
}

/// Saved card (`SavedCardResponse`) — only a mask ever reaches the client.
@freezed
abstract class SavedCard with _$SavedCard {
  const factory SavedCard({required String id, required String brand, required String maskedPan, DateTime? createdAt}) = _SavedCard;

  factory SavedCard.fromJson(Map<String, dynamic> json) => _$SavedCardFromJson(json);
}

/// `{ code, message }` returned by several command endpoints (logout, password reset…).
@freezed
abstract class MessageResponse with _$MessageResponse {
  const factory MessageResponse({@Default('') String code, @Default('') String message}) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);
}

/// Server-side line adjustment (promo, studio volume discount, rush…).
@freezed
abstract class LineAdjustment with _$LineAdjustment {
  const factory LineAdjustment({
    @JsonKey(unknownEnumValue: AdjustmentType.unknown) required AdjustmentType type,
    required double amount,
  }) = _LineAdjustment;

  factory LineAdjustment.fromJson(Map<String, dynamic> json) => _$LineAdjustmentFromJson(json);
}
