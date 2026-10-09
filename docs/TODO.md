# HOO mobile — status & TODO

Status as of 2026-10-09. `flutter analyze`: 0 issues. `flutter test`: all unit/bloc tests pass.

## Done

**Foundation** — flavors (`main_dev|staging|prod.dart` + `--dart-define`), design system (tokens, motion, 17+
components, hidden design-system screen), core (Dio + interceptors, problem+json → `ApiException`, secure storage,
Drift cache + Studio autosave queue, session, l10n pipeline with server overrides, analytics, deep links, push
scaffold, pinning), typed router with access policies, tab shell (tablet rail), DI, native setup (icons, launch
screens, deep links, permissions), CI, Makefile.

**Features** (all screens implemented against the Hoo.Api contracts, 4 languages):

| Feature | Screens / pieces |
|---|---|
| launch | Splash brand intro + parallel init (store mode, guest id, session, content strings, Visit), Coming Soon (countdown, waitlist, newsletter, socials, staff sign-in), Onboarding (language + 3 slides), `StoreInfoProvider` |
| auth | Welcome, Sign in, Sign up, Phone/OTP (SMS/WhatsApp, resend timer, 429), Forgot/Reset, Google/Apple, `AuthGate` (sign-in sheet that resumes navigation) |
| home | Hero (parallax, content overrides), Studio promo, new arrivals, categories, collections, lookbook, bestsellers, recently viewed, offline cache |
| catalog | Shop tab (categories, chips, filter/sort sheet from facets, infinite grid), lists, PDP (gallery + zoom, 3D view, swatches, sizes/stock, recommended size, size guide, delivery promise, accordions, reviews, alerts, recommendations, share, customize, add to bag), reviews, write review |
| search | Suggestions (debounced, cancelled), recent, results, empty state with bestsellers + Studio promo |
| wishlist | `WishlistService` (optimistic), recently viewed, wishlist, shared wishlist, alerts |
| cart | `BagService` (serialized mutations, debounced quantities), bag (errors, swipe-remove + undo, promo, gift, free-delivery bar), mini-bag sheet |
| checkout | Step machine from `missingSteps` (contact, gift, delivery+address, slot, payment, review), silent session recreation, idempotent place-order, EPoint in custom tabs + polling + retry/COD, confirmation |
| orders | Orders, order detail (timeline, pay again, slot change, return/exchange), returns, guest tracking, gift receipt + exchange |
| profile | Profile tab, personal info, password, addresses, cards, devices, notifications grid, settings (language sync, theme), help, style profile |
| studio | Config, 5 steps + review, persistent three.js stage (WebView bridge), text/image layers, inspector, layers list (reorder/hide), undo/redo, live server pricing, uploads with progress, autosave (+offline queue), mockups → add to bag, Studio tab, My designs, shared viewer, PDP 3D viewer |
| mock | `HOO_MOCK=true` fake backend (catalog, bag, checkout, orders, account, studio) |

Verified on the iOS simulator against the local Hoo.Api (Coming Soon flow) and end-to-end on the fake backend
(`integration_test/app_test.dart`).

## TODO

- **Backend gaps found** (need backend work, the app degrades gracefully today):
  - No endpoint lists delivery slots for an existing order (`/orders/track/{n}/slots`) — "Change delivery slot"
    shows "contact us".
  - No device-token registration endpoint for push (`PushService._register` placeholder).
  - `TrackEventRequest` has no UTM field (the app sends `utm`, ignored by the server).
  - Coming Soon perks are empty for `az` in the dev DB (the app hides empty perks).
- **Push**: add `firebase_messaging` + per-flavor Firebase config and implement `PushTransport`.
- **Release config**: Google client ids, Apple Team ID + AASA / assetlinks on hoo.az, signing, prod cert pins.
- **More tests**: widget tests for key screens, a Studio integration journey, repository tests per feature.
- **QA on devices**: Studio WebView performance on low-end Android, 1.3× text, long ru/tr strings, dark mode pass.
