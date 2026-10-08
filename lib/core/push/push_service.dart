import 'dart:async';

import 'package:flutter/foundation.dart';

import '../network/api_client.dart';

/// A push notification (FCM on Android, APNs via FCM on iOS) reduced to what navigation needs.
@immutable
class PushMessage {
  const PushMessage({required this.event, this.link, this.title, this.body});

  /// Server `NotificationEvent` (OrderConfirmed, PaymentFailed, DesignApproved, DesignChangesRequested,
  /// OrderPacked, OrderOutForDelivery, OrderReadyForPickup, OrderDelivered, BackInStock, PriceDrop, Launch…).
  final String event;

  /// App path to open on tap (`/account/orders/HOO-1042`, `/products/essential-hoodie`…) — same paths as deep links.
  final String? link;
  final String? title;
  final String? body;

  factory PushMessage.fromData(Map<String, dynamic> data) => PushMessage(
        event: data['event']?.toString() ?? '',
        link: data['link']?.toString() ?? data['url']?.toString(),
        title: data['title']?.toString(),
        body: data['body']?.toString(),
      );
}

/// Push integration point. The transport (firebase_messaging) needs the project's `google-services.json` /
/// `GoogleService-Info.plist`, which are environment secrets and not part of this repo — wire it in
/// [PushTransport] (see README → Push notifications). Everything above it (permission flow, token
/// registration, tap routing, topic×channel preferences) is transport-agnostic.
abstract interface class PushTransport {
  Future<bool> requestPermission();
  Future<String?> token();
  Stream<String> get tokenRefresh;
  Stream<PushMessage> get opened;
  Future<PushMessage?> initialMessage();
}

/// No-op transport used until Firebase is configured for a flavor.
class NoopPushTransport implements PushTransport {
  @override
  Future<bool> requestPermission() async => false;
  @override
  Future<String?> token() async => null;
  @override
  Stream<String> get tokenRefresh => const Stream.empty();
  @override
  Stream<PushMessage> get opened => const Stream.empty();
  @override
  Future<PushMessage?> initialMessage() async => null;
}

class PushService {
  PushService(this._api, {PushTransport? transport}) : _transport = transport ?? NoopPushTransport();

  final ApiClient _api;
  final PushTransport _transport;
  final _taps = StreamController<PushMessage>.broadcast();
  StreamSubscription<PushMessage>? _openedSub;
  StreamSubscription<String>? _refreshSub;

  /// Notification taps (cold start included) — the app routes them like deep links.
  Stream<PushMessage> get taps => _taps.stream;

  Future<void> start() async {
    _openedSub ??= _transport.opened.listen(_taps.add);
    final initial = await _transport.initialMessage();
    if (initial != null) _taps.add(initial);
  }

  /// Asks for permission (after sign-in or when the user enables a Push channel) and registers the device.
  Future<void> enable() async {
    if (!await _transport.requestPermission()) return;
    final token = await _transport.token();
    if (token != null) await _register(token);
    _refreshSub ??= _transport.tokenRefresh.listen(_register);
  }

  Future<void> _register(String token) async {
    try {
      // Registration endpoint is not part of the current public API; kept behind one call so it can be enabled
      // as soon as the backend exposes it.
      await _api.post<void>('/account/devices', body: {'token': token, 'platform': defaultTargetPlatform.name});
    } catch (e) {
      if (kDebugMode) debugPrint('[push] device registration skipped: $e');
    }
  }

  Future<void> dispose() async {
    await _openedSub?.cancel();
    await _refreshSub?.cancel();
    await _taps.close();
  }
}
