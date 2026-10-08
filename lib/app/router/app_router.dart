import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/otp_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/cart/presentation/pages/bag_page.dart';
import '../../features/catalog/presentation/pages/catalog_list_page.dart';
import '../../features/catalog/presentation/pages/product_page.dart';
import '../../features/catalog/presentation/pages/reviews_page.dart';
import '../../features/catalog/presentation/pages/shop_page.dart';
import '../../features/catalog/presentation/pages/write_review_page.dart';
import '../../features/checkout/presentation/pages/checkout_confirmation_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/launch/presentation/pages/coming_soon_page.dart';
import '../../features/launch/presentation/pages/onboarding_page.dart';
import '../../features/launch/presentation/pages/splash_page.dart';
import '../../features/orders/presentation/pages/gift_receipt_page.dart';
import '../../features/orders/presentation/pages/order_detail_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/orders/presentation/pages/return_request_page.dart';
import '../../features/orders/presentation/pages/returns_page.dart';
import '../../features/orders/presentation/pages/track_order_page.dart';
import '../../features/profile/presentation/pages/active_devices_page.dart';
import '../../features/profile/presentation/pages/address_form_page.dart';
import '../../features/profile/presentation/pages/addresses_page.dart';
import '../../features/profile/presentation/pages/change_password_page.dart';
import '../../features/profile/presentation/pages/help_page.dart';
import '../../features/profile/presentation/pages/notification_settings_page.dart';
import '../../features/profile/presentation/pages/personal_info_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/saved_cards_page.dart';
import '../../features/profile/presentation/pages/settings_page.dart';
import '../../features/profile/presentation/pages/style_profile_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/studio/presentation/pages/my_designs_page.dart';
import '../../features/studio/presentation/pages/studio_home_page.dart';
import '../../features/studio/presentation/pages/studio_page.dart';
import '../../features/studio/presentation/pages/studio_shared_page.dart';
import '../../features/wishlist/presentation/pages/alerts_page.dart';
import '../../features/wishlist/presentation/pages/shared_wishlist_page.dart';
import '../../features/wishlist/presentation/pages/wishlist_page.dart';
import '../../shared/debug/design_system_page.dart';
import '../../shared/design_system/motion/hoo_motion.dart';
import '../../shared/design_system/tokens/hoo_tokens.dart';
import '../../shared/domain/enums.dart';
import '../../shared/domain/models.dart';
import '../shell/main_shell_page.dart';
import 'access_policy.dart';

part 'app_router.gr.dart';

/// Typed route table. Paths mirror the web storefront routes; deep links (all locales, UTM) are resolved by
/// `DeepLinkService`, which pushes these typed routes. Access is declared per route via [access].
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this._guard);

  final AccessGuard _guard;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRouteGuard> get guards => [_guard];

  CustomRoute<T> _sheet<T>(PageInfo page, String path, {Map<String, dynamic> meta = const {}, bool fullscreenDialog = true}) => CustomRoute<T>(
        page: page,
        path: path,
        meta: meta,
        fullscreenDialog: fullscreenDialog,
        transitionsBuilder: HooRouteTransitions.sheet,
        duration: HooDurations.medium,
        reverseDuration: HooDurations.normal,
      );

  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: SplashRoute.page, path: '/splash', initial: true, transitionsBuilder: HooRouteTransitions.fadeThrough),
        CustomRoute(page: ComingSoonRoute.page, path: '/coming-soon', transitionsBuilder: HooRouteTransitions.reveal, duration: HooDurations.slow),
        CustomRoute(page: OnboardingRoute.page, path: '/onboarding', transitionsBuilder: HooRouteTransitions.reveal, duration: HooDurations.slow),

        // auth
        CustomRoute(page: WelcomeRoute.page, path: '/welcome', meta: access(AccessPolicy.guest), transitionsBuilder: HooRouteTransitions.fadeThrough, duration: HooDurations.medium),
        _sheet(SignInRoute.page, '/sign-in'),
        AutoRoute(page: SignUpRoute.page, path: '/sign-up'),
        AutoRoute(page: OtpRoute.page, path: '/sign-in/phone'),
        AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password'),
        AutoRoute(page: ResetPasswordRoute.page, path: '/reset-password'),

        // main shell (tabs)
        CustomRoute(
          page: MainShellRoute.page,
          path: '/',
          meta: access(AccessPolicy.public, storeLive: true),
          transitionsBuilder: HooRouteTransitions.reveal,
          duration: HooDurations.slow,
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
            AutoRoute(page: ShopRoute.page, path: 'shop'),
            AutoRoute(page: StudioHomeRoute.page, path: 'studio'),
            AutoRoute(page: BagRoute.page, path: 'cart'),
            AutoRoute(page: ProfileRoute.page, path: 'account'),
          ],
        ),

        // shop
        AutoRoute(page: CatalogListRoute.page, path: '/shop/list', meta: access(AccessPolicy.public, storeLive: true)),
        AutoRoute(page: ProductRoute.page, path: '/products/:slug', meta: access(AccessPolicy.public, storeLive: true)),
        AutoRoute(page: ReviewsRoute.page, path: '/products/:slug/reviews', meta: access(AccessPolicy.public, storeLive: true)),
        _sheet(WriteReviewRoute.page, '/products/:slug/reviews/new', meta: access(AccessPolicy.authenticated, storeLive: true)),
        CustomRoute(page: SearchRoute.page, path: '/search', meta: access(AccessPolicy.public, storeLive: true), transitionsBuilder: HooRouteTransitions.fadeThrough, duration: HooDurations.normal),
        AutoRoute(page: WishlistRoute.page, path: '/wishlist', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: SharedWishlistRoute.page, path: '/wishlist/shared/:token'),
        AutoRoute(page: AlertsRoute.page, path: '/account/alerts', meta: access(AccessPolicy.authenticated)),

        // checkout
        AutoRoute(page: CheckoutRoute.page, path: '/checkout', meta: access(AccessPolicy.public, storeLive: true)),
        CustomRoute(page: CheckoutConfirmationRoute.page, path: '/checkout/confirmed/:number', transitionsBuilder: HooRouteTransitions.fadeThrough, duration: HooDurations.slow),

        // orders
        AutoRoute(page: OrdersRoute.page, path: '/account/orders', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: OrderDetailRoute.page, path: '/account/orders/:number'),
        AutoRoute(page: ReturnRequestRoute.page, path: '/account/orders/:number/return'),
        AutoRoute(page: ReturnsRoute.page, path: '/account/returns', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: TrackOrderRoute.page, path: '/track-order'),
        AutoRoute(page: GiftReceiptRoute.page, path: '/gift/receipt/:code'),

        // profile
        AutoRoute(page: PersonalInfoRoute.page, path: '/account/profile', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: ChangePasswordRoute.page, path: '/account/password', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: AddressesRoute.page, path: '/account/addresses', meta: access(AccessPolicy.authenticated)),
        _sheet(AddressFormRoute.page, '/account/addresses/edit', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: SavedCardsRoute.page, path: '/account/cards', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: ActiveDevicesRoute.page, path: '/account/devices', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: NotificationSettingsRoute.page, path: '/account/notifications', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: SettingsRoute.page, path: '/settings'),
        AutoRoute(page: HelpRoute.page, path: '/help'),
        AutoRoute(page: StyleProfileRoute.page, path: '/account/style-profile', meta: access(AccessPolicy.authenticated)),

        // studio
        CustomRoute(
          page: StudioRoute.page,
          path: '/design-your-own',
          meta: access(AccessPolicy.public, storeLive: true),
          transitionsBuilder: HooRouteTransitions.reveal,
          duration: HooDurations.slow,
        ),
        AutoRoute(page: MyDesignsRoute.page, path: '/account/designs', meta: access(AccessPolicy.authenticated)),
        AutoRoute(page: StudioSharedRoute.page, path: '/studio/shared/:token'),

        // hidden design-system screen (long-press the logo on Profile → Settings, or /debug/design-system)
        AutoRoute(page: DesignSystemRoute.page, path: '/debug/design-system'),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
