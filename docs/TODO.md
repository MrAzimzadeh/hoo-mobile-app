# HOO mobile — status & TODO

Status as of 2026-10-08. `flutter analyze` is clean on everything listed under "Done".

## Done (foundation)

- Flutter project `az.hoo.app` (iOS + Android), dependencies, Dart flavors (`main_dev|staging|prod.dart`, `Env`
  with `--dart-define` overrides `HOO_API`, `HOO_MOCK`, `HOO_CERT_PINS`, Google client ids).
- Design system: tokens (`hoo_tokens.dart`: colors light/dark, Inter type scale, spacing, radius, elevation,
  durations/curves), `HooThemeData`, motion system (`HooReveal`, `HooTextReveal`, `HooImageReveal`, `HooPressable`,
  `HooSuccessCheck`, route transitions, haptics), components (logo, buttons, product card, swatches, chips,
  text/phone/OTP/password fields, sheets, price summary bar, bottom nav, states/skeletons, stepper, quantity stepper,
  timeline, accordion, rating, alerts, toast), hidden design-system screen. Inter fonts bundled.
- Core: `ApiClient` + interceptors (session token, `X-Session-Transport`, guest id, language, idempotency, redacted
  dev logs), problem+json → `ApiException`, error-code constants from the backend, secure storage, preferences,
  Drift DB (cache + Studio autosave queue), `cachedFetch` (offline/stale), session store + events (401, coming soon),
  app settings (language/theme), `/content/strings` overrides, analytics, connectivity, deep-link parser (all routes,
  locale prefixes, UTM, payment return), push service scaffold, certificate pinning.
- Shared domain: all wire enums + shared models (freezed) mirroring `Hoo.Application` contracts; cross-feature
  contracts (`AuthGate`, `BagService`, `WishlistService`, `RecentlyViewedService`, `StoreInfoProvider`,
  `GarmentViewerFactory`).
- Localization pipeline: core ARB (az/en/ru/tr, ~180 keys incl. all enum labels) + per-feature fragments merged by
  `tool/merge_l10n.dart`.
- Navigation: full typed route table (auto_route) with every page as a placeholder at its final path, access policies
  + `AccessGuard` (sign-in redirect that resumes navigation, Coming Soon gate), main shell with 5 tabs (tablet rail),
  link navigator, app widget (theme, locale, session/deep-link/push listeners), DI composition root with one module
  per feature (stubs).
- Studio 3D engine: three.js port of the web studio-engine (procedural garments + GLB templates, decal print zones,
  free layers, drag/snap, camera focus, tint transitions, snapshots), bundled into `assets/studio/engine.js` with a
  documented WebView message protocol (`tool/studio_engine/src`).
- Native: bundle/app id, black launch screens, app icons (generated from the wordmark), deep-link intent filters /
  URL scheme / associated domains, camera & photo permissions, ATS local networking, cleartext only in debug,
  Sign in with Apple entitlement.
- Docs (`docs/SPEC.md`, `docs/ARCHITECTURE.md`), test helpers (`pump_app`, `fake_api`), Makefile, CI workflow.

## TODO — features (each page is a placeholder today)

Conventions for all of them: `docs/ARCHITECTURE.md`. Contracts: `hoo-back/.../Hoo.Application/**/Contracts`.

1. **launch** — `StoreInfoProvider` impl (`GET /meta/store`, cached); Splash (brand reveal + parallel init: store,
   `POST /guest`, session restore, content strings, visit event, routing, pending deep link); Coming Soon (content,
   countdown, waitlist, newsletter, socials, staff sign-in); Onboarding (language + 3 slides).
2. **auth** — `AuthRepository`, `AuthGate` impl (sign-in sheet, signOut, refreshUser); Welcome, Sign in, Sign up,
   OTP (SMS/WhatsApp, resend timer, 429), Forgot/Reset password, Google/Apple sign-in.
3. **home / catalog / search / wishlist** — Home sections; Shop (tabs, chips, filter/sort sheet from facets, infinite
   grid); Catalog list; PDP (gallery, 3D view via `GarmentViewerFactory`, swatches, sizes, recommended size, size
   guide, delivery promise, accordions, reviews, alerts, recommendations, share, "Customize this", add to bag);
   Reviews + write review; Search (suggest, recent, results); `WishlistService` + `RecentlyViewedService` impls;
   Wishlist, shared wishlist, Alerts.
4. **cart / checkout** — `BagService` impl + Bag page (lines, errors, promo, gift toggle, free-delivery progress);
   `CheckoutBloc` (contact, gift, delivery, slot, payment, review, place order with Idempotency-Key, session-expiry
   recovery); EPoint redirect in custom tabs + payment polling + retry/COD; Confirmation page.
5. **orders / profile** — Orders list, order detail (signed-in + guest tracking), timeline, pay again, slot change
   (check which backend endpoint lists slots for an existing order), returns/exchanges, Returns list, Track order,
   Gift receipt + exchange; Profile tab, personal info (+ language sync), change password, addresses CRUD, saved
   cards, active devices, notification preferences grid, settings, help, style profile.
6. **studio** — config repository, domain helpers (port from web `studio-engine/src/domain`), editor bloc (steps,
   layers, undo/redo), pricing cubit (debounce + cancel), uploads (image_picker, progress), autosave (create → PATCH,
   offline queue), WebView engine bridge, 5 steps + review (mockup snapshots → upload → add to bag), Studio home tab,
   My designs, shared design viewer, `GarmentViewerFactory` impl.
7. **mock backend** — `MockBackendAdapter` with JSON fixtures in `assets/fixtures/` so the app runs with
   `HOO_MOCK=true`.

## TODO — quality & release

- Core unit tests (problem mapper, ApiClient, interceptors, deep-link parser, formatters, cachedFetch); feature tests;
  integration tests (auth → add to bag → checkout on the mock API; Studio flow) — `integration_test` is already a
  dev dependency.
- `dart format` pass (CI checks line length 160) and `flutter analyze --fatal-infos`.
- README (setup, run modes, demo credentials once the mock exists).
- Push: add `firebase_messaging` + per-flavor `google-services.json` / `GoogleService-Info.plist`, implement
  `PushTransport`. Device-token registration endpoint does not exist in the backend yet (`PushService._register`
  calls a placeholder path) — needs a backend endpoint.
- Analytics: backend `TrackEventRequest` has no UTM field yet; the client already sends `utm`.
- Universal links: publish `assetlinks.json` and `apple-app-site-association` on hoo.az; set the Apple Team ID.
- Google sign-in: client ids per flavor (+ iOS reversed client id URL scheme in Info.plist).
- Release signing (Android keystore, iOS provisioning), optional native flavors (separate app ids) with matching
  Xcode schemes.
- Certificate pins for prod (`HOO_CERT_PINS`).
- Verify on device: Studio WebView performance on low-end Android, accessibility at 1.3× text, long ru/tr strings.
