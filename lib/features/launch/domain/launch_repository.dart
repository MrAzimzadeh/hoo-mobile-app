import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import 'launch_models.dart';

/// Pre-launch experience: Coming Soon content, waitlist and newsletter.
abstract interface class LaunchRepository {
  /// `GET /content/coming-soon`, cached per language for offline (stale) rendering.
  Future<Cached<ComingSoonContent>> comingSoon(AppLanguage language);

  /// `GET /waitlist/count`.
  Future<WaitlistCount> waitlistCount();

  /// `POST /waitlist`. Throws `ApiException` (400 validation / `launch.contact_required`, 429).
  Future<WaitlistJoined> joinWaitlist(WaitlistContact contact, {required AppLanguage language});

  /// `POST /newsletter`. Throws `ApiException` (`launch.already_subscribed` 409, 400, 429).
  Future<void> subscribeNewsletter(String email, {required AppLanguage language});
}

/// The device's guest identity (`POST /guest` → `X-Guest-Id`).
abstract interface class GuestRepository {
  /// Creates and persists a guest id when the device has none yet. Returns the id (null when offline).
  Future<String?> ensureGuestId();
}
