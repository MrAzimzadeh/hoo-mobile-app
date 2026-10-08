import 'package:auto_route/auto_route.dart';

import '../../shared/application/contracts.dart';
import 'app_router.dart';

/// Who may open a route. Stored in the route's `meta` and enforced by one reusable [AccessGuard] —
/// there is no global "everything needs login" guard.
enum AccessPolicy {
  /// Anyone (browse, bag, studio, checkout, tracking).
  public,

  /// Only when signed out (welcome, sign in/up) — signed-in users are sent to the app.
  guest,

  /// Requires a session (wishlist, reviews, saved designs, addresses, cards…).
  authenticated,

  /// Staff only.
  staff,
}

const accessKey = 'access';
const storeLiveKey = 'storeLive';

Map<String, dynamic> access(AccessPolicy policy, {bool storeLive = false}) => {accessKey: policy, storeLiveKey: storeLive};

/// Enforces [AccessPolicy] and the Coming Soon gate. When a protected route needs a session, the sign-in flow is
/// shown on top and the original navigation resumes (same destination) once it reports success.
class AccessGuard extends AutoRouteGuard {
  AccessGuard(this._auth, this._store);

  final AuthGate _auth;
  final StoreInfoProvider _store;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final meta = resolver.route.meta;
    final policy = meta[accessKey] as AccessPolicy? ?? AccessPolicy.public;
    final needsLiveStore = meta[storeLiveKey] as bool? ?? false;
    final user = _auth.currentUser;

    if (needsLiveStore && !_store.isLive && !(user?.isStaff ?? false)) {
      resolver.redirectUntil(const ComingSoonRoute(), replace: true);
      return;
    }

    switch (policy) {
      case AccessPolicy.public:
        resolver.next();
      case AccessPolicy.guest:
        if (_auth.isSignedIn) {
          resolver.next(false);
          router.replaceAll([const MainShellRoute()]);
        } else {
          resolver.next();
        }
      case AccessPolicy.authenticated:
        if (_auth.isSignedIn) {
          resolver.next();
        } else {
          resolver.redirectUntil(SignInRoute(onResult: (ok) => resolver.next(ok)));
        }
      case AccessPolicy.staff:
        if (user?.isStaff ?? false) {
          resolver.next();
        } else if (!_auth.isSignedIn) {
          resolver.redirectUntil(SignInRoute(onResult: (ok) => resolver.next(ok && (_auth.currentUser?.isStaff ?? false))));
        } else {
          resolver.next(false);
        }
    }
  }
}
