import 'launch_models.dart';

/// Coming Soon content, waitlist and newsletter (`/content/coming-soon`, `/waitlist`, `/newsletter`).
abstract interface class LaunchRepository {
  Future<ComingSoonContent> comingSoon();
  Future<WaitlistCount> waitlistCount();

  /// Exactly one of [email] / [phone] (wire format). Throws `launch.contact_required`, validation errors.
  Future<WaitlistJoined> joinWaitlist({String? email, String? phone});

  /// Throws `launch.already_subscribed`.
  Future<void> subscribeNewsletter(String email);
}

/// `POST /guest` — the id every guest request carries in `X-Guest-Id`.
abstract interface class GuestRepository {
  /// Returns the stored guest id, creating one on first launch.
  Future<String> ensureGuestId();
}
