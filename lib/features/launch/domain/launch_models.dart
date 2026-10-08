import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';

part 'launch_models.freezed.dart';
part 'launch_models.g.dart';

/// `GET /content/coming-soon` → `ComingSoonResponse`. Title, subtitle and perks arrive in the request language.
@freezed
abstract class ComingSoonContent with _$ComingSoonContent {
  const factory ComingSoonContent({
    @Default(StoreMode.comingSoon) StoreMode mode,
    DateTime? launchAt,
    @Default('') String title,
    @Default('') String subtitle,
    @Default(<String>[]) List<String> perks,
    @Default(StoreContacts()) StoreContacts contacts,
    @Default(0) int waitlistCount,
  }) = _ComingSoonContent;

  factory ComingSoonContent.fromJson(Map<String, dynamic> json) => _$ComingSoonContentFromJson(json);
}

/// `GET /waitlist/count` → `WaitlistCountResponse` ("1,248 people are waiting", "+96 today").
@freezed
abstract class WaitlistCount with _$WaitlistCount {
  const factory WaitlistCount({@Default(0) int total, @Default(0) int today}) = _WaitlistCount;

  factory WaitlistCount.fromJson(Map<String, dynamic> json) => _$WaitlistCountFromJson(json);
}

/// `POST /waitlist` → `WaitlistJoinedResponse` ("You are #1249 of 1249"). Joining twice returns the same position.
@freezed
abstract class WaitlistJoined with _$WaitlistJoined {
  const factory WaitlistJoined({required int position, required int total, @Default(false) bool alreadyJoined}) = _WaitlistJoined;

  factory WaitlistJoined.fromJson(Map<String, dynamic> json) => _$WaitlistJoinedFromJson(json);
}

/// Waitlist contact: exactly one of [email] / [phone] (wire format `+994XXXXXXXXX`).
@immutable
class WaitlistContact {
  const WaitlistContact.email(String this.email) : phone = null;
  const WaitlistContact.phone(String this.phone) : email = null;

  final String? email;
  final String? phone;
}
