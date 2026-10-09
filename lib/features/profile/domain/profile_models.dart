import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';

part 'profile_models.freezed.dart';
part 'profile_models.g.dart';

/// Account read models — 1:1 with `Hoo.Application/Identity/{Account,Sessions}/Contracts`.

/// `AccountOverviewResponse` (`GET /account/overview`).
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

/// `StyleProfileDto`. Every field is optional; at most [maxFavoriteColors] colors.
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

  /// `StyleProfileDtoValidator` ranges (inclusive).
  static const heightRange = (min: 120, max: 230);
  static const weightRange = (min: 30, max: 250);
  static const chestRange = (min: 60, max: 180);
  static const waistRange = (min: 50, max: 180);

  /// Wire body for `PUT /account/style-profile` (unknown enum values are never sent).
  Map<String, dynamic> toRequest() => {
        'heightCm': heightCm,
        'weightKg': weightKg,
        'chestCm': chestCm,
        'waistCm': waistCm,
        'usualSize': usualSize == null || usualSize == Size.unknown ? null : usualSize!.wire,
        'preferredFit': preferredFit == null || preferredFit == Fit.unknown ? null : preferredFit!.wire,
        'favoriteColors': favoriteColors.where((c) => c != ColorFamily.unknown).map((c) => c.wire).toSet().take(maxFavoriteColors).toList(),
        'styles': styles.where((s) => s != StyleTag.unknown).map((s) => s.wire).toSet().toList(),
      };
}

/// `NotificationPreferenceDto`. `locked` rows (order e-mail/SMS) cannot be switched off.
@freezed
abstract class NotificationPreference with _$NotificationPreference {
  const NotificationPreference._();

  const factory NotificationPreference({
    @JsonKey(unknownEnumValue: NotificationTopic.unknown) required NotificationTopic topic,
    @JsonKey(unknownEnumValue: NotificationChannel.unknown) required NotificationChannel channel,
    @Default(false) bool enabled,
    @Default(false) bool locked,
  }) = _NotificationPreference;

  factory NotificationPreference.fromJson(Map<String, dynamic> json) => _$NotificationPreferenceFromJson(json);

  bool get isKnown => topic != NotificationTopic.unknown && channel != NotificationChannel.unknown;

  Map<String, dynamic> toRequest() => {'topic': topic.wire, 'channel': channel.wire, 'enabled': enabled, 'locked': locked};
}

/// `SessionInfo` (`GET /auth/sessions`) — an active device.
@freezed
abstract class DeviceSession with _$DeviceSession {
  const factory DeviceSession({
    required String id,
    required DateTime createdAt,
    required DateTime lastSeenAt,
    String? ipAddress,
    String? userAgent,
    @Default(false) bool isCurrent,
  }) = _DeviceSession;

  factory DeviceSession.fromJson(Map<String, dynamic> json) => _$DeviceSessionFromJson(json);
}
