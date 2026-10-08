import 'package:flutter/foundation.dart';

import '../../shared/domain/enums.dart';
import '../network/api_client.dart';
import '../storage/preferences.dart';

/// `POST /events` — Visit, ProductView, AddToCart, CheckoutStarted, OrderPlaced, StudioOpened.
/// Fire-and-forget: analytics must never break or slow a user flow.
class Analytics {
  Analytics(this._api, this._prefs);

  final ApiClient _api;
  final Preferences _prefs;

  void track(AnalyticsEventType type, {String? productId}) {
    final utm = _prefs.pendingUtm;
    _api
        .post<void>('/events', body: {
          'type': type.wire,
          'productId': productId,
          // The backend currently ignores extra fields; UTM is sent so attribution works once it reads them.
          'utm': ?utm,
        })
        .catchError((Object e) {
          if (kDebugMode) debugPrint('[analytics] ${type.wire} dropped: $e');
        });
  }

  void visit() => track(AnalyticsEventType.visit);
  void productView(String productId) => track(AnalyticsEventType.productView, productId: productId);
  void addToCart({String? productId}) => track(AnalyticsEventType.addToCart, productId: productId);
  void checkoutStarted() => track(AnalyticsEventType.checkoutStarted);
  void orderPlaced() => track(AnalyticsEventType.orderPlaced);
  void studioOpened() => track(AnalyticsEventType.studioOpened);
}
