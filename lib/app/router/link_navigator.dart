import 'package:auto_route/auto_route.dart';

import '../../core/deeplinks/deep_link_service.dart';
import 'app_router.dart';

/// Maps parsed [AppLink]s (deep links, push taps) onto typed routes.
abstract final class LinkNavigator {
  static List<PageRouteInfo>? routesFor(AppLink link) => switch (link) {
        HomeLink() => const [MainShellRoute()],
        ProductLink(:final slug) => [const MainShellRoute(), ProductRoute(slug: slug)],
        CollectionLink(:final slug) => [const MainShellRoute(), CatalogListRoute(collection: slug)],
        ShopLink(:final category) => [
            if (category == null) const MainShellRoute(children: [ShopRoute()]) else const MainShellRoute(),
            if (category != null) CatalogListRoute(category: category),
          ],
        SearchLink(:final query) => [const MainShellRoute(), SearchRoute(query: query)],
        CartLink() => const [MainShellRoute(children: [BagRoute()])],
        OrderConfirmedLink(:final number) => [const MainShellRoute(), CheckoutConfirmationRoute(number: number)],
        OrderLink(:final number) => [const MainShellRoute(), OrderDetailRoute(number: number)],
        StudioLink(:final productSlug, :final designId) => [const MainShellRoute(), StudioRoute(productSlug: productSlug, designId: designId)],
        SharedDesignLink(:final token) => [const MainShellRoute(), StudioSharedRoute(token: token)],
        SharedWishlistLink(:final token) => [const MainShellRoute(), SharedWishlistRoute(token: token)],
        GiftReceiptLink(:final code) => [const MainShellRoute(), GiftReceiptRoute(code: code)],
        TrackOrderLink(:final number) => [const MainShellRoute(), TrackOrderRoute(number: number)],
        ResetPasswordLink(:final identifier, :final token) => [ResetPasswordRoute(identifier: identifier, token: token)],
        // handled by the checkout flow that is waiting for it
        PaymentReturnLink() => null,
      };

  static Future<void> open(StackRouter router, AppLink link) async {
    final routes = routesFor(link);
    if (routes == null || routes.isEmpty) return;
    if (routes.length == 1) {
      await router.navigate(routes.first);
    } else {
      // keep the shell underneath so back returns into the app, not out of it
      await router.navigate(routes.first);
      for (final r in routes.skip(1)) {
        await router.push(r);
      }
    }
  }
}
