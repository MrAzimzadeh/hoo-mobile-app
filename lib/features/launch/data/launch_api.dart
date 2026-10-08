import '../../../core/network/api_client.dart';
import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import '../domain/launch_models.dart';

/// HTTP endpoints of the launch feature (Meta + Content + Launch groups of the customer API).
class LaunchApi {
  LaunchApi(this._api);

  final ApiClient _api;

  /// Raw JSON of `GET /meta/store` (cached verbatim, decoded with [StoreInfo.fromJson]).
  Future<Map<String, dynamic>> storeJson() => _api.get('/meta/store', decode: Decoders.map);

  /// `POST /guest` → `{ guestId }`.
  Future<String> createGuest() => _api.post('/guest', decode: (json) => Decoders.map(json)['guestId'] as String);

  /// Raw JSON of `GET /content/coming-soon`.
  Future<Map<String, dynamic>> comingSoonJson() => _api.get('/content/coming-soon', decode: Decoders.map);

  Future<WaitlistCount> waitlistCount() => _api.get('/waitlist/count', decode: (json) => WaitlistCount.fromJson(Decoders.map(json)));

  /// `POST /waitlist` — `JoinWaitlistRequest { email?, phone?, language?, source?, utm? }`.
  Future<WaitlistJoined> joinWaitlist(WaitlistContact contact, {required AppLanguage language, required String source, Map<String, String>? utm}) => _api.post(
    '/waitlist',
    body: {
      'email': contact.email,
      'phone': contact.phone,
      'language': language.wire,
      'source': source,
      'utm': utm == null ? null : {'source': utm['source'], 'medium': utm['medium'], 'campaign': utm['campaign']},
    },
    decode: (json) => WaitlistJoined.fromJson(Decoders.map(json)),
  );

  /// `POST /newsletter` — `NewsletterRequest { email, language?, source? }` → `MessageResponse`.
  Future<MessageResponse> subscribeNewsletter(String email, {required AppLanguage language, required String source}) => _api.post(
    '/newsletter',
    body: {'email': email, 'language': language.wire, 'source': source},
    decode: (json) => json is Map ? MessageResponse.fromJson(Decoders.map(json)) : const MessageResponse(),
  );
}
