import 'package:flutter/widgets.dart';

import '../domain/models.dart';

/// Cross-feature contracts. Features never import each other's implementations — they depend on these narrow
/// interfaces, which the owning feature implements and the composition root (`app/di`) registers.

/// Signed-in state + "Sign in to continue" sheet. Implemented by the auth feature.
abstract interface class AuthGate {
  Me? get currentUser;
  bool get isSignedIn;
  Stream<Me?> get userChanges;

  /// Shows the "Sign in to continue" bottom sheet when signed out. Resolves `true` once the user is signed in
  /// (returning to the same place), `false` if they dismissed it.
  Future<bool> requireSignIn(BuildContext context, {String? reason});

  /// `POST /auth/logout` (optionally on all devices), clears the token; the guest id and guest bag stay.
  Future<void> signOut({bool allDevices = false});

  /// Re-reads `GET /auth/session` (after profile edits, style profile save…).
  Future<void> refreshUser();
}

/// The bag, as seen from outside the cart feature (PDP add-to-bag, Studio add-to-bag, nav badge).
abstract interface class BagService {
  /// Number of pieces in the bag (drives the Bag tab badge).
  Stream<int> get count;
  int get currentCount;

  /// Adds a stock variant. Throws `ApiException` (e.g. `catalog.out_of_stock`).
  Future<void> addVariant(String variantId, {int quantity = 1});

  /// Adds a Studio design (`POST /cart/items { designId, quantity }`).
  Future<void> addDesign(String designId, {int quantity = 1});

  /// Re-fetches the bag (after login, order placed, app resume).
  Future<void> refresh();

  /// Shows the mini-bag sheet after a successful add (haptic + summary + "View bag").
  Future<void> showAddedSheet(BuildContext context);
}

/// Wishlist ids for hearts on product cards across Home, Shop, Search, PDP. Implemented by the wishlist feature.
abstract interface class WishlistService {
  Stream<Set<String>> get ids;
  Set<String> get currentIds;
  bool contains(String productId);

  /// Toggles after `AuthGate.requireSignIn`; returns the new state, or null if the user is not signed in.
  Future<bool?> toggle(BuildContext context, String productId);

  Future<void> refresh();
}

/// Recently viewed (guests too) — PDP records, Home shows. Implemented by the wishlist feature.
abstract interface class RecentlyViewedService {
  Future<void> record(String productId);
}

/// Store meta (`GET /meta/store`): mode, launch date, contacts, languages. Loaded at splash by the launch feature.
abstract interface class StoreInfoProvider {
  StoreInfo get info;
  Stream<StoreInfo> get changes;
  bool get isLive;
  Future<StoreInfo> refresh();
}

/// The Studio's 3D renderer, offered to other features (PDP "3D view", order line design previews) without them
/// importing the studio feature. Implemented by the studio feature.
abstract interface class GarmentViewerFactory {
  /// Read-only, rotatable view of a product model (`ProductDetail.model3D`), tinted with [colorHex] when
  /// [tintable].
  Widget productModel({Key? key, required String modelUrl, required double heightCm, required bool tintable, required String colorHex});
}
