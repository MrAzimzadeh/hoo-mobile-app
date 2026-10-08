import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';

import '../config/env.dart';
import '../storage/preferences.dart';

/// A parsed app link, independent of the router (the app layer maps it to typed routes).
sealed class AppLink {
  const AppLink();
}

class ProductLink extends AppLink {
  const ProductLink(this.slug);
  final String slug;
}

class CollectionLink extends AppLink {
  const CollectionLink(this.slug);
  final String slug;
}

class ShopLink extends AppLink {
  const ShopLink({this.category});
  final String? category;
}

class SearchLink extends AppLink {
  const SearchLink(this.query);
  final String? query;
}

class CartLink extends AppLink {
  const CartLink();
}

class OrderConfirmedLink extends AppLink {
  const OrderConfirmedLink(this.number);
  final String number;
}

class OrderLink extends AppLink {
  const OrderLink(this.number);
  final String number;
}

class StudioLink extends AppLink {
  const StudioLink({this.productSlug, this.designId});
  final String? productSlug;
  final String? designId;
}

class SharedDesignLink extends AppLink {
  const SharedDesignLink(this.token);
  final String token;
}

class SharedWishlistLink extends AppLink {
  const SharedWishlistLink(this.token);
  final String token;
}

class GiftReceiptLink extends AppLink {
  const GiftReceiptLink(this.code);
  final String code;
}

class TrackOrderLink extends AppLink {
  const TrackOrderLink({this.number});
  final String? number;
}

class ResetPasswordLink extends AppLink {
  const ResetPasswordLink({this.identifier, this.token});
  final String? identifier;
  final String? token;
}

/// EPoint redirected back (`/checkout/success|error`). Not a screen: the waiting checkout polls the payment.
class PaymentReturnLink extends AppLink {
  const PaymentReturnLink({required this.success, this.orderNumber});
  final bool success;
  final String? orderNumber;
}

class HomeLink extends AppLink {
  const HomeLink();
}

/// Universal links (`https://hoo.az/...`, all four locale prefixes) and the `hoo://` scheme.
/// Mirrors the web routes; UTM parameters are captured for `/events`.
class DeepLinkService {
  DeepLinkService({required this.env, required this.prefs, AppLinks? appLinks}) : _appLinks = appLinks ?? AppLinks();

  final Env env;
  final Preferences prefs;
  final AppLinks _appLinks;
  final _payments = StreamController<PaymentReturnLink>.broadcast();

  /// A link that arrived while the splash was still initialising; the splash opens it once it routes into the app.
  AppLink? pendingLink;

  AppLink? takePendingLink() {
    final l = pendingLink;
    pendingLink = null;
    return l;
  }

  /// Payment returns, consumed by the checkout flow.
  Stream<PaymentReturnLink> get paymentReturns => _payments.stream;

  /// Incoming links while the app runs (payment returns are routed to [paymentReturns] as well).
  Stream<AppLink> links() => _appLinks.uriLinkStream.map(_handle).where((l) => l != null).cast<AppLink>();

  /// The link that cold-started the app, if any.
  Future<AppLink?> initialLink() async {
    try {
      final uri = await _appLinks.getInitialLink();
      return uri == null ? null : _handle(uri);
    } catch (e) {
      if (kDebugMode) debugPrint('[links] initial link failed: $e');
      return null;
    }
  }

  AppLink? _handle(Uri uri) {
    _captureUtm(uri);
    final link = parse(uri);
    if (link is PaymentReturnLink) _payments.add(link);
    return link;
  }

  void _captureUtm(Uri uri) {
    final utm = {
      for (final k in const ['utm_source', 'utm_medium', 'utm_campaign'])
        if (uri.queryParameters[k]?.isNotEmpty ?? false) k.substring(4): uri.queryParameters[k]!,
    };
    if (utm.isNotEmpty) prefs.setPendingUtm(utm);
  }

  static const _locales = {'az', 'ru', 'en', 'tr'};

  /// Pure parser (unit-tested). `hoo://products/x` and `https://hoo.az/ru/products/x` both work.
  static AppLink? parse(Uri uri) {
    var segments = [
      if (uri.scheme == 'hoo' && uri.host.isNotEmpty) uri.host,
      ...uri.pathSegments.where((s) => s.isNotEmpty),
    ];
    if (segments.isNotEmpty && _locales.contains(segments.first)) segments = segments.sublist(1);
    final q = uri.queryParameters;
    String? at(int i) => segments.length > i ? Uri.decodeComponent(segments[i]) : null;

    switch (at(0)) {
      case null:
        return const HomeLink();
      case 'products' when at(1) != null:
        return ProductLink(at(1)!);
      case 'collections' when at(1) != null:
        return CollectionLink(at(1)!);
      case 'shop':
        return ShopLink(category: q['category']);
      case 'search':
        return SearchLink(q['q']);
      case 'cart' || 'bag':
        return const CartLink();
      case 'checkout':
        if (at(1) == 'confirmed' && at(2) != null) return OrderConfirmedLink(at(2)!);
        if (at(1) == 'success' || at(1) == 'error') {
          return PaymentReturnLink(success: at(1) == 'success', orderNumber: q['order'] ?? q['orderNumber'] ?? q['number']);
        }
        return const CartLink();
      case 'payment' when at(1) == 'return':
        return PaymentReturnLink(success: q['status'] != 'error', orderNumber: q['order']);
      case 'account' when at(1) == 'orders' && at(2) != null:
        return OrderLink(at(2)!);
      case 'design-your-own' || 'studio' when at(1) != 'shared':
        return StudioLink(productSlug: q['product'], designId: q['design']);
      case 'studio' when at(1) == 'shared' && at(2) != null:
        return SharedDesignLink(at(2)!);
      case 'wishlist' when at(1) == 'shared' && at(2) != null:
        return SharedWishlistLink(at(2)!);
      case 'gift' when at(1) == 'receipt' && at(2) != null:
        return GiftReceiptLink(at(2)!);
      case 'track-order':
        return TrackOrderLink(number: q['number']);
      case 'reset-password':
        return ResetPasswordLink(identifier: q['identifier'] ?? q['email'], token: q['token']);
      default:
        return null;
    }
  }

  /// Public web URL for sharing (product, wishlist, shared design).
  String webUrl(String path) => '${env.webBaseUrl}${path.startsWith('/') ? path : '/$path'}';

  Future<void> dispose() => _payments.close();
}
