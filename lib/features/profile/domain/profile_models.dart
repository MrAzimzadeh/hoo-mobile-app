import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';

part 'profile_models.freezed.dart';
part 'profile_models.g.dart';

/// `GET /account/overview` → `AccountOverviewResponse`.
@freezed
abstract class AccountOverview with _$AccountOverview {
  const factory AccountOverview({
    @Default('') String fullName,
    @Default(0) int ordersCount,
    @Default(0) int designsCount,
    @Default(0) int wishlistCount,
    @Default(0) int activeOrders,
  }) = _AccountOverview;

  factory AccountOverview.fromJson(Map<String, dynamic> json) => _$AccountOverviewFromJson(json);
}

/// `PUT /account/profile` body → `UpdateProfileRequest`.
@freezed
abstract class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({required String fullName, required AppLanguage language, required bool marketingConsent}) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestFromJson(json);
}

/// `GET/PUT /account/style-profile` → `StyleProfileDto`. Every field is optional; at most
/// [StyleProfile.maxFavoriteColors] color families.
@freezed
abstract class StyleProfile with _$StyleProfile {
  const StyleProfile._();

  const factory StyleProfile({
    int? heightCm,
    int? weightKg,
    int? chestCm,
    int? waistCm,
    @JsonKey(unknownEnumValue: Size.unknown) Size? usualSize,
    @JsonKey(unknownEnumValue: Fit.unknown) Fit? preferredFit,
    @JsonKey(unknownEnumValue: ColorFamily.unknown) @Default(<ColorFamily>[]) List<ColorFamily> favoriteColors,
    @JsonKey(unknownEnumValue: StyleTag.unknown) @Default(<StyleTag>[]) List<StyleTag> styles,
  }) = _StyleProfile;

  factory StyleProfile.fromJson(Map<String, dynamic> json) => _$StyleProfileFromJson(json);

  /// `StyleProfile.MaxFavoriteColors` on the server.
  static const maxFavoriteColors = 3;

  /// Server validation ranges (`StyleProfileDtoValidator`).
  static const heightRange = (min: 120, max: 230);
  static const weightRange = (min: 30, max: 250);
  static const chestRange = (min: 60, max: 180);
  static const waistRange = (min: 50, max: 180);

  bool get isEmpty =>
      heightCm == null &&
      weightKg == null &&
      chestCm == null &&
      waistCm == null &&
      usualSize == null &&
      preferredFit == null &&
      favoriteColors.isEmpty &&
      styles.isEmpty;
}

/// One cell of the notification grid (`NotificationPreferenceDto`). [locked] cells (order e-mail/SMS) can't be
/// switched off.
@freezed
abstract class NotificationPreference with _$NotificationPreference {
  const NotificationPreference._();

  const factory NotificationPreference({
    @JsonKey(unknownEnumValue: NotificationTopic.unknown) required NotificationTopic topic,
    @JsonKey(unknownEnumValue: NotificationChannel.unknown) required NotificationChannel channel,
    required bool enabled,
    @Default(false) bool locked,
  }) = _NotificationPreference;

  factory NotificationPreference.fromJson(Map<String, dynamic> json) => _$NotificationPreferenceFromJson(json);

  String get key => '${topic.wire}/${channel.wire}';
}

/// `GET /auth/sessions` → `SessionInfo` (an active device).
@freezed
abstract class ActiveSession with _$ActiveSession {
  const factory ActiveSession({
    required String id,
    required DateTime createdAt,
    required DateTime lastSeenAt,
    String? ipAddress,
    String? userAgent,
    @Default(false) bool isCurrent,
  }) = _ActiveSession;

  factory ActiveSession.fromJson(Map<String, dynamic> json) => _$ActiveSessionFromJson(json);
}
