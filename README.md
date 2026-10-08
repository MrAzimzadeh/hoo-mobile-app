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




<pasted_content id="97ce">
# HOO — Mobile App Master Prompt (Design + Features + Backend API)

Copy everything below into your AI app builder / coding agent.

---

## 0. ROLE & GOAL

You are a senior mobile engineer and product designer. Build a production-quality mobile app (iOS + Android) for **HOO**, a premium streetwear brand from Azerbaijan (hoodies, zip hoodies, T-shirts, sweatshirts, sweatpants, shorts). The app is the **mobile twin of the existing HOO web storefront**: everything a customer can do on the website must be possible in the app, against the **same backend API**. It has two pillars:

1. **Shop**: catalog, product pages, wishlist, bag, checkout, orders, returns, gifts.

2. **Studio ("Design Your Own")**: a 3D customizer where the customer picks a garment, adds text and images to print zones, sees a live server-calculated price and orders it.

Build it directly in code (no Figma step).

**Stack (default):** Flutter (Material 3, Dart 3) with **Feature-based Modular Clean Architecture**. Use `flutter_bloc` with **Cubit for straightforward state** and **Bloc for event-heavy or complex state machines**. Use **auto_route** for typed navigation, deep links and route guards. Use **get_it** for dependency injection. Use **dio** for HTTP, **freezed + json_serializable** for models/DTOs, `flutter_secure_storage` for the session token, `flutter_localizations` + ARB for i18n, `cached_network_image`, and a 3D renderer that loads `.glb` (e.g. `flutter_scene` / `model_viewer_plus` / Three.js inside a WebView, whichever supports runtime decals, tinting and interaction best). Use **Drift** for structured local persistence/cache where offline support requires it. Studio is treated as a separate subsystem inside the app architecture, with a clear bridge between Flutter UI/state and the 3D engine.

**Hard rules**

- All design values live in **one theme/token file**. Never hard-code colors, sizes or text styles in widgets.

- **The server calculates every price.** The client only sends selections (variant, design spec, promo, delivery, gift…) and renders the totals the API returns. Never compute totals, discounts, delivery fees or Studio prices locally.

- No hard-coded user-facing strings. Everything comes from ARB files, optionally overridden by `/content/strings`.

- Client logic branches on the error **`code`** returned by the API, never on the message text.

---

## 0.1 ARCHITECTURE — FEATURE-BASED MODULAR CLEAN ARCHITECTURE

Use **Feature-based Modular Clean Architecture**. Do not treat “modular” and “clean” as competing choices:

- **Module boundary = business feature.**
- **Inside each feature = Clean Architecture boundaries.**
- Keep dependencies explicit and one-directional.
- Do not create abstractions only for the sake of architecture. Introduce interfaces/use-cases where there is real complexity, testing value or expected implementation change.

Recommended structure:

```text
lib/
├── app/
│   ├── bootstrap/
│   ├── router/
│   ├── di/
│   └── app.dart
├── core/
│   ├── network/
│   ├── error/
│   ├── storage/
│   ├── analytics/
│   ├── localization/
│   ├── security/
│   └── utils/
├── shared/
│   ├── design_system/
│   │   ├── tokens/
│   │   ├── components/
│   │   └── motion/
│   ├── widgets/
│   └── extensions/
└── features/
    ├── auth/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── home/
    ├── catalog/
    ├── search/
    ├── wishlist/
    ├── cart/
    ├── checkout/
    ├── orders/
    ├── profile/
    └── studio/
        ├── data/
        ├── domain/
        ├── presentation/
        └── engine/
```

### Dependency direction

`core ← shared ← features`.

Features must not directly depend on other feature implementations. Cross-feature communication should happen through shared domain contracts, navigation, application services or well-defined interfaces.

### State management

Use `flutter_bloc`:

- **Cubit** for simple, state-oriented flows: catalog filters, wishlist state, profile sections, simple forms, UI preferences.
- **Bloc** for event-heavy or state-machine flows: authentication/OTP, checkout, payment, Studio editor, uploads, autosave and other flows where events and transitions matter.
- Keep business logic out of widgets.
- UI listens to states and dispatches user intent; repositories/services own external data access.

### Navigation

Use **auto_route**:

- typed routes;
- nested navigation for the main shell;
- deep/universal links;
- `AutoRouteGuard` for access control;
- avoid one giant global auth guard.

Define explicit route access policies such as:

`public`, `guest`, `authenticated`, `staff`.

A protected route should know its access policy and redirect through a reusable auth flow, preserving the intended destination so the user can return to the same place after login.

### Dependency injection

Use `get_it` as the composition root. Register API clients, repositories, local stores, analytics, feature services and Cubit/Bloc factories centrally. Keep feature code independent from the concrete DI mechanism where practical.

### Network layer

Use Dio with layered interceptors for:

1. session authorization;
2. guest ID;
3. `Accept-Language`;
4. idempotency keys where required;
5. development-only request logging with secrets/redacted headers;
6. problem+json error mapping.

Expose typed exceptions such as `ApiException(code, title, fieldErrors, statusCode)` and never make UI logic depend on raw Dio errors or server message strings.

### Local persistence

Use Drift where structured local state/cache is required. Keep secure credentials in `flutter_secure_storage`. Separate cache models from API DTOs when necessary. Offline behavior must be explicit rather than accidental.

### Studio subsystem

Treat Studio as a high-complexity subsystem rather than a normal form screen. Separate:

- Studio configuration/data;
- Studio specification/domain model;
- editor interaction state;
- pricing state;
- upload state;
- autosave state;
- 3D engine bridge.

The 3D engine must not own business pricing or checkout logic. Flutter/domain state remains the source of truth for the DesignSpec; the renderer visualizes it.

### Reusable packages — only when justified

Do not split every feature into a package on day one. If the codebase grows, candidates for extraction are:

- `hoo_design_system`
- `hoo_networking`
- `hoo_analytics`
- `hoo_3d_engine`

Extract only when reuse, build isolation or ownership justifies the package boundary.

### Senior engineering rules

- Prefer composition over inheritance.
- Keep widgets dumb and state/domain logic testable.
- Avoid “God Cubits” and “God Repositories”. Split by responsibility.
- Do not put API DTOs directly into UI when a domain model is valuable.
- Do not add a use case for every single one-line repository call automatically.
- Use interfaces at boundaries where testing/changeability matters.
- Keep feature APIs narrow and explicit.
- Prefer immutable state/models.
- Make loading, empty, error, retry and stale-data states explicit.
- Cancellation and race conditions must be considered for search, pricing, uploads and checkout.
- Never leak tokens, payment data or sensitive user data into logs.
- Use environment flavors for dev/staging/prod.
- Keep CI able to run formatting, static analysis, unit/widget/integration tests and build validation.

## 1. BRAND IDENTITY

- **Name:** HOO

- **Logo / wordmark:** `HOo` in the "Modern Classic" style: capital H, capital O, lowercase o. Font Inter Bold (700), tight letter-spacing (≈ -2%). Text-only wordmark, no icon.

- **Logo variants:** black on white, white on black, white on dark green.

- **Personality:** premium, minimal, confident, calm. Lots of whitespace, big product imagery, few colors. Think high-end streetwear, not a discount store.

## 1.1 VISUAL ART DIRECTION — PREMIUM FASHION EDITORIAL

The implementation must not look like a generic Material 3 shopping application. Material 3 is the implementation foundation; the visual result must be distinctly HOO.

- Premium streetwear / fashion-editorial aesthetic.
- Large imagery, bold typography, generous whitespace and restrained color.
- Calm, confident and tactile rather than playful.
- Strong black/white contrast with HOO green used intentionally.
- Avoid excessive cards, gradients, shadows, decorative illustrations, badges or UI chrome.
- Prefer full-bleed imagery and strong composition where appropriate.
- Every screen should have a clear visual hierarchy and one primary action.
- Motion is part of the brand language and must follow Section 13.

## 2. COLOR TOKENS

Only three brand colors. Everything else is a neutral derived from them.

| Token | Hex | Usage |

|---|---|---|

| brand.white | #FFFFFF | Main background (light mode), text on dark |

| brand.black | #121212 | Primary text, primary buttons, dark-mode background |

| brand.green | #1C3829 | Accent: key CTAs ("Design Your Own", "Checkout"), selected states, badges, active tab |

| surface.muted | #F7F7F5 | Cards, input fields, bottom sheets (light mode) |

| border.subtle | #E8E8E5 | 1px card borders, dividers |

| text.secondary | #6B6B6B | Captions, hex labels, helper text |

| text.tertiary | #9A9A9A | Placeholders, disabled |

| green.tint | #1C3829 @ 8% | Selected chip background, subtle highlights |

| state.error | #B3261E | Errors only |

| state.success | #1C3829 | Success (reuse brand green) |

**Dark mode:** background #121212, surface #1C1C1C, border #2A2A2A, text #FFFFFF, secondary text #A0A0A0. The accent stays #1C3829, with white text on it.

**Rules:** green is the only accent. No blue, red or orange decoration. At most one green CTA per screen. Product color swatches show the real garment hex from the API and are exempt from this rule.

## 3. TYPOGRAPHY (Inter)

| Style | Size / Line height | Weight | Use |

|---|---|---|---|

| display | 40 / 44 | 700 | Splash / hero logo |

| h1 | 28 / 34 | 700 | Screen titles |

| h2 | 22 / 28 | 700 | Section titles |

| h3 | 17 / 22 | 600 | Card titles, product names |

| body | 15 / 22 | 400 | Body text |

| bodyStrong | 15 / 22 | 600 | Prices, emphasis |

| caption | 13 / 18 | 400 | Meta, helper text (text.secondary) |

| label | 12 / 16 | 600, UPPERCASE, +6% tracking | Tags, chips, tab labels |

Letter-spacing on headings: -1% to -2%. Inter must include Azerbaijani (ə, ğ, ı, ö, ş, ü, ç), Turkish and Cyrillic glyphs.

## 4. SPACING, SHAPE, ELEVATION

- **Spacing scale (4-pt):** 4, 8, 12, 16, 24, 32, 48, 64. Screen horizontal padding: 24. Gap between sections: 32.

- **Radius:** cards & images 12, buttons 12, chips 999 (pill), bottom sheets 20 (top corners), inputs 12.

- **Borders over shadows:** cards use a 1px border.subtle with a surface.muted fill. Shadows only on floating elements (bottom sheet, FAB): `0 8 24 rgba(18,18,18,0.08)`.

- **Touch targets:** min 48×48.

- **Icons:** outline style, 1.5px stroke, 24px (Lucide / Phosphor Light). Monochrome.

## 5. CORE COMPONENTS (build first, as a reusable design system)

1. **HooLogo**: wordmark widget, `variant: dark | light | onGreen`, `size`.

2. **PrimaryButton**: height 52, full width, black bg / white text. `accent` variant = green bg / white text. Loading + disabled states.

3. **SecondaryButton**: outlined 1px black, transparent bg.

4. **TextButton / Link**: black, underline on press.

5. **ProductCard**: 4:5 image on surface.muted, radius 12, name (h3), price (bodyStrong) + struck-through `compareAtPrice` and `-X%` when discounted, color dots below (`colorHexes`), badge (NEW / NEW DROP / BESTSELLER), heart icon top-right.

6. **ColorSwatch**: 32px circle, 1px border; selected = 2px green ring with a 2px gap; unavailable = diagonal strike.

7. **SizeChip / OptionChip**: pill, label style; selected = black bg white text (or green tint for secondary options); out of stock = text.tertiary with a strike, still tappable for "Notify me".

8. **TextField**: surface.muted fill, no border, radius 12, height 52; focused = 1px black border; error = 1px error border + caption. Variants: phone (+994 prefix mask), OTP (6 boxes), password (show/hide).

9. **SectionHeader**: h2 title + optional "See all →" link.

10. **BottomSheet**: radius 20 top, drag handle 36×4 grey.

11. **PriceSummaryBar**: sticky bottom bar, running total on the left, CTA on the right; tap the total to expand the breakdown.

12. **Bottom Navigation**: 5 tabs, white bg, 1px top border, active icon + label in black with a small green dot indicator; the Studio tab is centered and highlighted; Bag shows a count badge.

13. **Empty / Error / Loading states**: skeleton shimmer in surface.muted; centered icon + message + action.

14. **Stepper**: thin progress bar (green fill) + "Step 2 of 5".

15. **QuantityStepper**: − / value / +, respects min 1 and max (stock or `maxQuantity`).

16. **StatusTimeline**: vertical timeline for order events (dot + label + timestamp).

17. **Accordion**, **RatingStars**, **Banner / InlineAlert** (info, warning, error), **Toast / Snackbar**.

Add a hidden **"Design system" debug screen** that shows every component in light and dark mode.

---

## 6. BACKEND INTEGRATION (shared with the web storefront)

**Base URL:** configurable per flavor (`dev` = `http://localhost:5131`, `staging`, `prod`). All endpoints are prefixed `/api/v1`. OpenAPI: `/openapi/public.json` (Scalar docs at `/docs`). Generate or hand-write typed DTOs from it.

### 6.1 Conventions (must follow)

- **Auth (server-side sessions, no JWT):** on every login/register/OTP/Google/Apple call, send the header `X-Session-Transport: header`. The response `AuthResponse { sessionToken, expiresAt, isNewUser, user }` returns a `sessionToken`. Store it in secure storage and send `Authorization: Session <token>` on every request. **No cookies and no CSRF on mobile.** On `401`, clear the token and route to Welcome (keep the guest bag).

- **Guests:** on first launch call `POST /guest` and persist the returned id. Send `X-Guest-Id: <id>` on every request, so guests can use the bag and Studio. After login, the server attaches the guest bag and designs to the user. Keep sending the guest id.

- **Language:** send `Accept-Language: az|ru|en|tr` (or `?lang=`). All server messages, including errors, come back in that language. When the user changes language while logged in, also `PUT /account/profile` with it.

- **Money:** AZN (₼), decimals with 2 places, formatted per locale (`12,50 ₼` for az/ru/tr, `₼12.50` for en).

- **Pagination:** `page` (from 1) and `pageSize` (max 100) → `{ items, page, pageSize, totalCount, totalPages, hasMore }`. Use infinite scroll.

- **Idempotency:** send an `Idempotency-Key` (UUID v4 per user action, reused on retry) on `POST /checkout/{id}/place-order` and `POST /orders/{number}/payment/retry`.

- **Errors:** RFC 9457 `application/problem+json` with a stable `code`, a localized `title`, and on 400 `errors` (field → messages) + `errorCodes`. Map field errors to form fields; show the rest as a toast or inline alert. Fetch the catalog of codes from `GET /meta/errors`.

  - 400 validation · 401 no session · 403 forbidden · 404 not found · **409 conflict** (slot full, last item sold, invalid status transition): refresh the data and explain · **422 business rule** (COD limit, promo condition…) · **429** too many requests (OTP/login): show a countdown · **502** external provider (EPoint, SMS) · **503 `store.coming_soon`**: show the Coming Soon screen.

- **Analytics:** `POST /events` with `Visit`, `ProductView`, `AddToCart`, `CheckoutStarted`, `OrderPlaced`, `StudioOpened` (+ UTM from deep links).

- **Orders placed from the app** must send `source: "App"` in `PlaceOrderRequest`.

### 6.2 Store mode (Coming Soon vs Live)

On app start call `GET /meta/store` → `{ mode, launchAt, contacts, currency, defaultLanguage, languages, vatRate }`.

- `mode = "ComingSoon"`: show the **Coming Soon** experience (data from `GET /content/coming-soon`): HOo logo, title, subtitle, perks, a countdown to `launchAt`, the waitlist count (`GET /waitlist/count`), a **Join the waitlist** form (email or phone → `POST /waitlist` → show "You are #position of total"), newsletter signup and social contacts (Instagram, TikTok, Telegram, WhatsApp, phone, email). Catalog, search, Studio, bag and checkout return `503` for normal users. Staff accounts bypass this, so a hidden "Staff sign in" link must exist.

- `mode = "Live"`: the full app.

### 6.3 Endpoint map (customer API)

| Area | Endpoints |

|---|---|

| **Meta** | `GET /meta/store`, `GET /meta/languages`, `GET /meta/errors`, `POST /guest`, `POST /events` |

| **Content** | `GET /content/strings` (published UI text overrides), `GET /content/coming-soon` |

| **Launch** | `POST /waitlist`, `GET /waitlist/count`, `POST /newsletter`, `POST /newsletter/unsubscribe` |

| **Auth** | `POST /auth/register`, `POST /auth/login`, `POST /auth/otp/send` (`{ phone, purpose, channel: Sms\|WhatsApp }`), `POST /auth/otp/verify` (`{ phone, code, fullName?, acceptTerms, marketingConsent, rememberMe }`), `POST /auth/google` (`{ idToken, rememberMe, acceptTerms }`), `POST /auth/apple`, `POST /auth/logout`, `GET /auth/session`, `GET /auth/sessions`, `DELETE /auth/sessions/{id}`, `POST /auth/password/forgot`, `POST /auth/password/reset`, `POST /auth/password/change` |

| **Account** | `GET /account/overview` (ordersCount, designsCount, wishlistCount, activeOrders), `PUT /account/profile`, `GET/PUT /account/style-profile`, `GET /account/size-recommendations`, `GET /account/payment-methods`, `DELETE /account/payment-methods/{id}`, `GET/PUT /account/notification-preferences`, `GET /account/orders`, `GET /account/orders/{number}`, `POST /account/orders/{number}/returns`, `GET /account/returns`, `GET/POST/PUT/DELETE /account/addresses[/{id}]` |

| **Catalog** | `GET /catalog/categories`, `/collections`, `/colors`, `/products` (filters), `/products/{slug}`, `/products/{slug}/recommendations`, `GET/POST /products/{slug}/reviews`, `/bestsellers`, `/new-arrivals`, `/looks` (lookbook / shop the look) |

| **Search** | `GET /search`, `GET /search/suggest`, `GET /search/recent`, `DELETE /search/recent` |

| **Wishlist & history** | `GET /wishlist`, `POST/DELETE /wishlist/{productId}` (login required), `POST /wishlist/share`, `GET /wishlist/shared/{token}`, `GET/DELETE /recently-viewed`, `POST /recently-viewed/{productId}` |

| **Alerts** | `GET /alerts`, `POST /alerts` (`BackInStock` \| `PriceDrop`), `DELETE /alerts/{id}` |

| **Cart (Bag)** | `GET /cart`, `POST /cart/items` (`{ variantId?, quantity, designId? }`), `PATCH /cart/items/{id}`, `DELETE /cart/items/{id}`, `PUT/DELETE /cart/promo`, `PUT /cart/gift` |

| **Checkout** | `POST /checkout`, `GET /checkout/{id}`, `PUT /checkout/{id}/contact`, `PUT /checkout/{id}/gift`, `PUT /checkout/{id}/delivery`, `GET /checkout/{id}/slots`, `PUT /checkout/{id}/slot`, `PUT /checkout/{id}/payment-method`, `POST /checkout/{id}/place-order` |

| **Payments** | `GET /orders/{number}/payment`, `POST /orders/{number}/payment/retry` |

| **Delivery** | `GET /delivery/zones`, `GET /delivery/promise` |

| **Tracking (guest)** | `GET /orders/track` (number + phone), `PUT /orders/track/{number}/slot`, `POST /orders/track/{number}/returns` |

| **Gift** | `GET /gift/options`, `POST /gift/message/validate`, `GET /gift-receipts/{code}`, `POST /gift-receipts/{code}/exchange` |

| **Studio** | `GET /studio/config`, `POST /studio/price`, `POST /studio/uploads` (multipart), `GET/POST /studio/designs`, `GET/PATCH/DELETE /studio/designs/{id}`, `POST /studio/designs/{id}/duplicate`, `/share`, `/resubmit`, `/mockups`, `GET /studio/shared/{token}` |

### 6.4 Domain enums (exact wire values)

- **ProductType:** Hoodie, ZipHoodie, TShirt, Sweatshirt, Sweatpants, Shorts

- **Fit:** Oversized, Boxy, Regular, Fitted, Cropped

- **Size:** XS, S, M, L, XL, XXL

- **ColorFamily:** Black, Forest, Cream, White, Grey, Sand, Olive, Red

- **StyleTag:** Minimal, Streetwear, GraphicPrints, Monochrome, Sport, Vintage

- **ProductBadge:** New, NewDrop, Bestseller

- **Placement (print zones):** Front, Back, LeftSleeve, RightSleeve, Hood (+ `free-…` for freely anchored layers)

- **LayerKind:** Text, Image, Graphic

- **DesignStatus:** Draft, Submitted, ChangesRequested, Approved, InProduction, Ready, Cancelled

- **OrderStatus:** New, Paid, AwaitingApproval, InProduction, Packed, OutForDelivery, ReadyForPickup, Delivered, Cancelled, ReturnRequested, Returned, Refunded

- **OrderLineKind:** Stock, Custom

- **PaymentMethod:** ApplePay, GooglePay, Card, SavedCard, CashOnDelivery

- **PaymentStatus:** Pending, Captured, Failed, Cancelled, Refunded, PartiallyRefunded

- **DeliveryKind:** Courier, Post, Pickup

- **ReturnKind:** Return, Exchange · **ReturnStatus:** Requested, Approved, Rejected, Received, Refunded, Exchanged

- **Occasion:** Birthday, Anniversary, Novruz, NewYear, JustBecause · **GreetingCardKind:** None, Printed, Handwritten

- **StockAlertType:** BackInStock, PriceDrop

- **NotificationTopic:** Orders, Delivery, Alerts, Marketing · **NotificationChannel:** Email, Sms, WhatsApp, Push

- **StoreMode:** ComingSoon, Live

### 6.5 Key models (fields to render)

- **ProductCard:** id, slug, name, price, compareAtPrice, discountPercent, badges[], colorsCount, defaultColor, colorHexes[], imageUrl, rating, reviewCount, inStock.

- **ProductDetail:** + description, fabricAndCare, sizeAndFit, category, collection, productType, fit, fabric, tags[], `colors[] { color{id,code,name,hex,family}, images[], variants[] { id, size, sku, price, inStock, lowStockLeft, preorder } }`, sizeChart[] { size, measurements }, rating, reviewCount, recommendedSize, deliveryPromise { minDays, maxDays, label }, **availableInStudio**, isWishlisted, model3D { modelUrl, heightCm, tintable }.

- **CartItem:** id, kind (Stock/Custom), productSlug, variantId, designId, name, color, colorHex, size, imageUrl, unitPrice, quantity, lineTotal, adjustments[], stock state, stockLeft, leadTimeDays, **errorCode / errorMessage** (show inline: out of stock, price changed…).

- **Cart:** items, subtotal, discount, promoCode, isGift, total.

- **Checkout:** id, expiresAt, items, contact, gift, zone, address, slot, paymentMethod, savedCardId, promoCode/promoError, `totals { subtotal, discount, delivery, giftPackaging, giftPackagingSaving, greetingCard, total, vatIncluded, freeDeliveryRemaining }`, estimatedDeliveryFrom/To, zones[], paymentMethods[] { method, available, unavailableReason }, savedCards[], savedAddresses[], hasCustomItems, **missingSteps[]**, **canPlaceOrder**.

- **OrderPlaced:** orderId, orderNumber, status, total, paymentMethod, paymentStatus, **paymentRedirectUrl**, giftReceiptCode.

- **OrderDetail:** number, status, createdAt, contact, delivery, lines[] (Custom lines include `design`), adjustments, totals, payment, gift, **timeline[]**, canChangeSlot, canReturn, canPay.

- **StyleProfile:** heightCm, weightKg, chestCm, waistCm, usualSize, preferredFit, favoriteColors[ColorFamily], styles[StyleTag].

- **Studio:** see section 8.

---

## 7. APP HIERARCHY (information architecture)

```

App

├── Splash (HOo logo centered, black bg) → GET /meta/store, POST /guest, restore session

├── Coming Soon (if store mode = ComingSoon; see 6.2)

├── Onboarding (first launch only)

│   ├── Language select: Azərbaycan · Русский · English · Türkçe

│   └── 3 intro slides (the brand, "Design your own", fast delivery in Baku)

├── Auth

│   ├── Welcome (Sign in / Create account / Continue as guest)

│   ├── Sign in: email or phone + password · "Sign in with SMS code" · Google · Apple

│   ├── Sign up: full name, email, password, phone (optional), marketing consent, accept-terms checkbox (required)

│   ├── Phone / OTP: +994 phone → 6-digit code via SMS or WhatsApp, resend timer, 429 handling

│   ├── Forgot password → reset (code) → new password

│   └── Style profile (skippable, after sign-up): height, weight, chest, waist, usual size (XS–XXL),

│       preferred fit, favorite color families, style tags → used as defaults everywhere

│       (size pre-selection on PDP & Studio, sorting/recommendations)

└── Main (Bottom Nav)

    ├── 1. Home

    │   ├── Header: HOo logo + search + bag icons

    │   ├── Hero banner (new drop, full-width image, green CTA)

    │   ├── "Design Your Own" promo card (dark green bg, white text) → Studio

    │   ├── New arrivals (horizontal ProductCards, /catalog/new-arrivals)

    │   ├── Categories (Hoodies, T-shirts, …) and Collections

    │   ├── Lookbook / Shop the look (/catalog/looks)

    │   ├── Bestsellers (/catalog/bestsellers)

    │   └── Recently viewed (/recently-viewed)

    ├── 2. Shop

    │   ├── Category tabs + filter/sort sheet: category, collection, size, color, price range;

    │   │   sort: newest · price ↑ · price ↓ · bestselling; active-filter chips; result count

    │   ├── Product grid (2 columns, infinite scroll)

    │   ├── Search (full-screen): suggestions while typing (debounce 250ms), recent searches

    │   │   (clear all), results grid, empty state with bestsellers

    │   └── Product Detail

    │       ├── Image gallery per selected color (swipe, dots, pinch-zoom, full-screen),

    │       │   optional 3D view if model3D is set

    │       ├── Name, price (+ compareAt / -%), badges, rating → reviews

    │       ├── Color swatches (switch gallery + variants), size chips (stock state, "Only N left",

    │       │   preorder label), recommended size from style profile ("We recommend M"), size-guide sheet

    │       ├── Delivery promise ("Delivered in 1–2 days")

    │       ├── Accordions: description · size & fit · fabric & care

    │       ├── Reviews list + "Write a review" (rating 1–5, title, body; login required)

    │       ├── "Notify me when back in stock" / "Price drop alert" (POST /alerts)

    │       ├── Recommendations ("You may also like")

    │       ├── Heart (wishlist; login required → auth sheet), Share (deep link)

    │       ├── "Customize this" (only if availableInStudio) → Studio with this product as base

    │       └── Sticky "Add to bag" (disabled until size is chosen; haptic + mini-bag sheet on success)

    ├── 3. Studio (Design Your Own; center tab, highlighted) → see section 8

    ├── 4. Bag

    │   ├── Line items: thumbnail (design mockup for Custom lines), options, qty stepper, remove

    │   │   (swipe), per-line errors (out of stock / price changed / design needs approval)

    │   ├── Free-delivery progress ("X ₼ until free delivery")

    │   ├── Promo code (apply / remove, show server error message)

    │   ├── "This is a gift" toggle

    │   ├── Summary (subtotal, discount, total from server) + PriceSummaryBar "Checkout"

    │   └── Checkout (section 9) → Confirmation

    └── 5. Profile

        ├── Header: name + overview counters (orders, designs, wishlist, active orders)

        ├── Orders (list → order detail: lines, totals, payment, delivery, gift,

        │   status timeline, actions: Pay again · Change delivery slot · Return / Exchange)

        ├── Returns (list of my return/exchange requests + status)

        ├── My designs (saved Studio designs, section 8.6)

        ├── Wishlist (grid, move to bag, share list link)

        ├── Alerts (back-in-stock / price-drop subscriptions)

        ├── Style profile (edit)

        ├── Addresses (CRUD, default address)

        ├── Saved cards (list, delete)

        ├── Personal info (name, email, phone, language) · Change password

        ├── Active devices (list sessions, sign out a device)

        ├── Notifications (per topic × channel toggles: Orders, Delivery, Alerts, Marketing ×

        │   Email, SMS, WhatsApp, Push)

        ├── Track an order (guest: number + phone)

        ├── Gift receipt (enter code → view gift, request size exchange)

        ├── Help: size guide, about, contact (phone, WhatsApp, Instagram, TikTok, Telegram, email), FAQ

        └── Settings: language (AZ/RU/EN/TR), appearance (system/light/dark), logout

```

Guests can browse, use the bag and Studio, check out, and track orders. Wishlist, reviews, saved designs list, addresses and saved cards require login: show a bottom-sheet "Sign in to continue" and return to the same place afterwards.

---

## 8. STUDIO — "DESIGN YOUR OWN" (detailed)

### 8.1 Config

`GET /studio/config` returns everything the UI needs. The response is versioned (`pricingVersionId`).

- `baseProducts[] { code, productType, name, price, leadTimeMinDays, leadTimeMaxDays, fits[], featureCodes[], fabricCodes[], colors[], sizes[], printAreas[] { placement, widthCm, heightCm }, model, template { modelUrl (.glb), heightCm, tintable, zones[] { code, name, position, normal, rotation, widthCm, heightCm } }, maxQuantity, product?, variants[] { colorId, size, price, available } }`

- `fits[] { fit, surcharge }`, `features[] { code, name, surcharge }`, `fabrics[] { code, name, gsm, surcharge, included }`, `sizeSurcharges[]`, `printMethods[] { code, name, maxWidthCm, maxHeightCm, tiers[] }`, `extras { rushFee, rushLeadTimeDays, customMeasurementsFee, setupFee, volumeTiers[] }`, `fonts[]`, `maxUploadMegabytes`, `recommendedDpi`, `maxLayers`.

When opened from a PDP via "Customize this", preselect that product (`baseCode = p-<productId>`).

### 8.2 Steps (Stepper "Step N of 5", progress persisted)

1. **Product**: base product cards (hoodie / T-shirt / …) with image, from-price and lead time.

2. **Fabric & features**: fabric cards (name, gsm weight, feel, `+surcharge` or "Included"); feature chips (e.g. kangaroo pocket, zip) with price deltas.

3. **Size & Fit**: fit chips (with surcharge), size chips (prefilled from the style profile, size surcharge shown), optional **custom measurements** (+fee).

4. **Color**: the base's color swatches (disable unavailable variant combos).

5. **Editor** (full screen):

   - **3D preview** of the garment tinted in the chosen color; rotate / zoom; quick views **Front · Back · Left sleeve · Right sleeve · Hood**; the print zones are highlighted.

   - **Add text**: content, font (from `fonts[]`), color, size (pt), alignment.

   - **Upload image / logo**: from gallery or camera → `POST /studio/uploads` (multipart, ≤ `maxUploadMegabytes`; show progress). Then crop, scale, rotate, position by drag and pinch inside the zone. Show **print-quality warnings** (effective DPI: ok / warning / poor) from the quote.

   - **Layers list**: reorder (zIndex), duplicate, delete, hide/show; max `maxLayers`.

   - **Placement zones**: chest/front, back, sleeves, hood; each layer belongs to one zone and is clamped to the zone's cm size and the print method's max size.

   - Undo / redo, snap-to-center guides.

   - A "Graphics" tab can stay hidden (no library yet); curved text is not supported yet.

6. **Review**: rendered mockups (front/back), spec summary, quantity stepper (1…maxQuantity, show **volume discount tiers**), **rush production** toggle (+fee, shorter lead time), estimated delivery dates, a required checkbox **"I own the rights to these images"**, then **Save design** / **Add to bag** (`POST /cart/items { designId, quantity }`).

### 8.3 Live price

On every change (debounce ~300ms) call `POST /studio/price` with `{ spec, layers, pricingVersionId }` and render the response in the **PriceSummaryBar**: unitPrice × quantity, an expandable **breakdown** (base, fabric, fit, features, size, each print area/method, setup fee, rush fee, volume discount), total, lead time and estimated delivery. Never compute it locally. Show a subtle loading state on the total while the request is in flight; cancel stale requests.

### 8.4 Design model (DesignSpec + DesignLayer)

- `spec { baseCode, fit, featureCodes[], fabricCode, colorId, size, customMeasurements?, quantity, rush }`

- `layer { id, kind, placement, zIndex, printMethodCode, widthCm, heightCm, xCm, yCm, rotation, text?, font?, fontSizePt?, align?, colorHex?, uploadId?, graphicId?, anchor? }`. Positions are in **centimeters** relative to the print zone, not pixels.

### 8.5 Persistence

- Create the design on the first meaningful change (`POST /studio/designs`), then **autosave** with `PATCH /studio/designs/{id}` (debounced, offline queue, "Saved" indicator).

- Upload rendered PNG mockups with `POST /studio/designs/{id}/mockups` before adding to bag.

- Guests' designs are kept by `X-Guest-Id` and move to the account on login.

### 8.6 My designs (Profile)

A grid of designs with mockup, name, **status chip** (Draft, Submitted, ChangesRequested, Approved, InProduction, Ready, Cancelled) and last-edited time. Actions: open/edit (only if `editable`), duplicate, delete, **share** (read-only link → `/studio/shared/{token}`, opens a read-only 3D viewer in the app), **resubmit** after "Changes requested" (show the reviewer's `changeRequestMessage` in a banner).

Custom orders go to admin review first: the order shows `AwaitingApproval` until the design is approved. Explain this on the review step and in the order timeline.

---

## 9. CHECKOUT FLOW

`POST /checkout` creates a session from the bag (it has an `expiresAt`; if it expires, recreate it silently). Every step `PUT`s to the server and re-renders from the returned `CheckoutResponse`. Drive the progress UI from `missingSteps[]`, and enable "Place order" only when `canPlaceOrder` is true.

1. **Contact**: full name, phone (+994), email (optional). Prefill from the account.

2. **Gift (optional)**: when the bag is a gift (`GET /gift/options`): recipient name & phone, occasion (Birthday, Anniversary, Novruz, New Year, Just because), surprise toggle, **packaging** option (image, price, free above threshold), **greeting card** type (None / Printed / Handwritten) + card design, message (live validation via `POST /gift/message/validate`, max length and moderation), "from" name, **hide prices** on the packing slip. Respect `rules.allowForCustomOrders`.

3. **Delivery**: method/zone (Courier, Post, Pickup; with price, free threshold, ETA), address (choose a saved one or add a new one with city, district, street, building, apartment, note; optional map pin).

4. **Time slot** (courier): `GET /checkout/{id}/slots` → day chips + time window chips; full slots disabled; `409` = slot taken, so refresh.

5. **Payment**: list `paymentMethods[]` (Apple Pay, Google Pay, Card, Saved card, Cash on delivery); show unavailable methods disabled with their `unavailableReason` (e.g. COD limit); saved cards; a "Save card" checkbox.

6. **Review & place**: items, the server totals (subtotal, discount, delivery, gift packaging & saving, greeting card, total, VAT included), required "I accept the terms" checkbox, plus "I confirm image rights" if `hasCustomItems`. → `POST /checkout/{id}/place-order { acceptTerms, confirmImageRights, saveCard, source: "App" }` with an `Idempotency-Key`.

7. **Payment redirect**: if `paymentRedirectUrl` is returned (EPoint card payment), open it in an in-app browser (`flutter_custom_tabs` / SFSafariViewController). On return (deep link or close), poll `GET /orders/{number}/payment` until `Captured` or `Failed`. If it failed, offer **Retry payment** (`POST /orders/{number}/payment/retry`) or switch to cash on delivery.

8. **Confirmation**: big check icon, order number, payment status, delivery estimate, gift receipt code (if any), buttons "Track order" and "Continue shopping". Haptic success. Clear the bag locally and refetch it.

---

## 10. ORDERS, TRACKING, RETURNS

- **Order detail:** status chip + **StatusTimeline** from `timeline[]` (Placed, payment captured/failed, design approved / changes requested, packed, courier assigned, ETA updated, slot changed, out for delivery, delivered, refund issued…).

- **Change delivery slot** when `canChangeSlot`.

- **Pay again** when `canPay`.

- **Return / Exchange** when `canReturn`: pick lines and quantities, kind (Return / Exchange → new size), reason, phone → `POST /account/orders/{number}/returns`. Returns list with status.

- **Guest tracking:** order number + phone → `GET /orders/track` → same detail UI; slot change and return also available for guests.

- **Gift receipt:** the recipient opens a deep link `/gift/receipt/{code}` or enters the code → sees the gift without prices → can request a **size exchange**.

---

## 11. NOTIFICATIONS & DEEP LINKS

- **Push** (FCM / APNs): register the device token, respect `notification-preferences` (topic × channel). Events: OTP, order confirmed, payment failed, design approved, design changes requested, order packed, out for delivery, ready for pickup, delivered, back in stock, price drop, waitlist launch promo.

- Tapping a push opens the matching screen.

- **Deep / universal links** (mirror the web routes, all 4 locales): `/products/{slug}`, `/collections/{slug}`, `/shop`, `/search?q=`, `/cart`, `/checkout/confirmed/{number}`, `/account/orders/{number}`, `/design-your-own?product={slug}`, `/studio/shared/{token}`, `/wishlist/shared/{token}`, `/gift/receipt/{code}`, `/track-order`, payment return URL. Capture UTM parameters for `/events`.

---

## 12. LOCALIZATION

- 4 languages: **az (default)**, ru, en, tr. ARB files + `flutter_localizations`; no hard-coded strings. On start, merge server overrides from `GET /content/strings` (cache them, fall back to the bundled ARB).

- Send the language with every request. Product names and descriptions come already translated from the API.

- Currency AZN (₼) formatted per locale; dates and relative times per locale.

- Test long Russian and Turkish strings: buttons must not overflow (allow two-line labels, ellipsize titles).

## 13. MOTION & FEEL — PREMIUM CINEMATIC MOTION SYSTEM

Motion is a first-class part of the HOO brand identity. The app should feel highly animated, but **never noisy, childish, bouncy or like an animation showcase**. The principle is: **more motion, less visual noise**. Motion must communicate hierarchy, continuity and brand character.

### 13.1 Motion philosophy

- HOO should feel like a premium fashion/editorial product, not a generic Material app.
- Use cinematic transitions for brand moments and subtle micro-interactions for everyday UI.
- Never add animation merely because an element can be animated.
- Prefer continuity: an element should visually transform into the next state rather than disappear and reappear.
- Avoid excessive bounce, elastic effects, cartoon-like scaling, random parallax and flashy particles.
- Motion should support the user's task and preserve perceived performance.
- Respect `prefers-reduced-motion` / accessibility settings and provide reduced-motion variants.

### 13.2 Three motion levels

**Level A — Cinematic Motion:** Splash, Onboarding, Home hero, Product Detail hero transition, Studio, Success/Confirmation, major brand moments.

**Level B — Premium Micro Motion:** product cards, wishlist, filters, tabs, selections, bottom sheets, form states, loading, add-to-bag and similar interactions.

**Level C — Invisible Motion:** tiny state transitions such as focus, button press, checkbox, chip selection and validation. These should feel natural rather than call attention to themselves.

### 13.3 Timing and curves

Use centralized tokens; developers must not invent arbitrary durations/curves in feature code.

- `fast`: 150ms — taps and micro feedback.
- `normal`: 280ms — standard component transitions.
- `medium`: 450ms — meaningful UI transitions.
- `slow`: 700ms — premium reveals.
- `cinematic`: 900–1200ms — Splash and major brand transitions only.
- Default easing: `easeOutCubic` or the appropriate centralized HOO curve.
- Enter/exit curves must be defined in the Motion Design System.

### 13.4 Splash — brand intro

The Splash must be a **brand experience**, not a static loading screen.

- Full `brand.black` background.
- Centered `HOo` wordmark in white.
- Logo reveal should use a controlled typography/reveal animation, not a generic FadeIn.
- Letter spacing can animate from tighter spacing into the final wordmark spacing.
- A very subtle scale settle (`1.00 → ~1.02 → 1.00`) is allowed.
- Hold the completed wordmark briefly so the brand is readable.
- Exit using a **mask/reveal transition** that visually exposes the next screen instead of simply fading to black.
- While the animation runs, initialize `/meta/store`, guest session and session restoration in parallel.
- Route after initialization to Coming Soon, Onboarding, Welcome/Login or Main according to store mode and session state.
- The Splash must never become an unnecessary long blocker; if initialization completes earlier, finish the animation gracefully, and if it takes longer, show no spinner unless absolutely necessary.

### 13.5 Onboarding motion

Onboarding must feel editorial rather than like a generic `PageView` with dots.

- Use large typography, whitespace and full-bleed imagery.
- Images may enter with subtle scale (`1.05 → 1.00`) and opacity transitions.
- Typography should reveal with controlled vertical/clip transitions.
- Use staggered sequencing: image → headline → supporting copy → CTA.
- Page changes should maintain visual continuity.
- Avoid excessive page indicators and bouncing transitions.
- Final onboarding screen should transition naturally into Welcome/Login or Main.

### 13.6 Home motion

- Hero imagery: subtle scale/parallax only where it improves depth.
- Hero text/CTA: staggered reveal.
- Product sections: controlled reveal as they enter the viewport.
- Do not animate every ProductCard independently with random effects.
- Keep scrolling smooth and avoid expensive effects that cause frame drops.

### 13.7 Product and catalog motion

- ProductCard image → Product Detail must use a **Hero/shared-element style transition** where possible, so the product feels like it expands into the detail screen.
- Wishlist interaction: small scale/state transition, never a large bounce.
- Color selection: image/gallery transition should feel continuous.
- Size/chip selection: fast state transition with no exaggerated movement.
- Gallery swipe/zoom should remain direct and gesture-driven.
- Bottom sheets use a controlled slide/fade with the HOO sheet radius and motion curve.

### 13.8 Studio motion

Studio is the most motion-rich part of the app.

- Keep the 3D garment persistent between configuration steps whenever possible.
- Product/fabric/color changes should visually update the same 3D model rather than replacing the whole page.
- Material/color changes should transition smoothly.
- Editor layers should appear/disappear/reorder with subtle transitions.
- Selected print zones should use an elegant highlight, never flashing outlines.
- Text/image placement should be direct-manipulation first; animation must not fight gestures.
- Step completion may use a subtle progress transition and light haptic feedback.
- Price updates should animate the displayed value/breakdown subtly while clearly indicating server recalculation.
- Autosave should use a small non-intrusive “Saved” state transition.

### 13.9 Checkout and success motion

Checkout should prioritize confidence and clarity. Use restrained motion for step changes, validation and payment states.

The Confirmation/Success screen is a brand moment:

- Use a clean success/check animation.
- Reveal order confirmation and order number progressively.
- Show delivery estimate and actions with subtle stagger.
- Use success haptic once the order is confirmed.
- Do not use confetti or generic celebratory effects unless explicitly approved by the brand direction.

### 13.10 Motion Design System

Motion is part of the shared design system and must live centrally alongside colors, typography, spacing and radius.

Create a reusable `HooMotion` system containing:

- `HooDurations`: fast, normal, medium, slow, cinematic.
- `HooCurves`: standard, emphasized, enter, exit, cinematic.
- `HooTransitions`: fade, slide, scale, reveal, hero, sheet, modal, stagger.
- `HooAnimations`: logo reveal, image reveal, text reveal, selection, success, loading.
- Reduced-motion alternatives for every major animation.

No feature should define arbitrary animation durations or curves unless there is a documented reason.

### 13.11 Haptics

- Light impact: add-to-bag, wishlist, Studio step completion and meaningful selection.
- Success haptic: order placed.
- Avoid haptics on every tap.

The goal is **minimal UI + bold typography + large imagery + cinematic transitions + subtle micro-interactions + restrained color + smooth motion**.

## 14. ACCESSIBILITY, PERFORMANCE & QUALITY

- WCAG AA contrast (all black/white/green combinations above pass).

- Dynamic text scaling up to 1.3×; semantic labels on all icons; screen-reader friendly; color swatches announce the color name.

- Responsive from 360px to tablet width (tablet: 3–4 column grid, Studio editor with a side panel).

- Image caching, thumbnails in grids, lazy 3D loading, request cancellation, pull-to-refresh on lists.

- Offline: show cached catalog and bag read-only with an offline banner; queue Studio autosaves.

- Security: token only in secure storage, never logged; certificate pinning in prod; no secrets in the app (Google/Apple client ids only).

- Tests: unit tests for repositories and mappers, widget tests for components, integration tests for auth → add to bag → checkout (mock API) and the Studio flow.

---

## 15. DELIVERY ORDER

1. **Theme & tokens file** (colors, typography, spacing, radius, elevation and the centralized HOO Motion Design System) + light/dark themes.

2. **Component library** (section 5) + the hidden "Design system" debug screen.

3. **API core**: dio client with interceptors (session token, guest id, language, idempotency key, problem+json → typed `ApiException(code, title, fieldErrors)`), environment flavors, DTOs for section 6.

4. **Repository interfaces + mock implementations** (JSON fixtures) for every feature, so the UI can run without a backend; switch with a flavor flag.

5. **Navigation shell** (auto_route, typed routes, route guards, route access policies, bottom nav, deep links) + Splash / Store mode / Coming Soon / Onboarding.

6. **Auth** (email, phone OTP, Google, Apple, forgot password) + style profile.

7. **Shop**: Home, Shop, Search, PDP, Reviews, Wishlist, Alerts, Recently viewed.

8. **Bag & Checkout** (incl. gift, slots, payments, EPoint redirect, confirmation).

9. **Profile**: orders, tracking, returns, addresses, cards, sessions, notifications, settings.

10. **Studio** (config, 5 steps, 3D editor, live price, autosave, uploads, review, my designs, share).

11. **Push notifications** + analytics events.

12. **Localization pass** (az, ru, en, tr) + accessibility pass + tests.

Keep the code clean, documented and consistent with these tokens. When unsure, choose the more minimal, premium option, and when the web storefront and this prompt disagree about data, **the backend API contract wins**.
</pasted_content id="97ce">

Sene lazim olan hersey ui , back ve lahiyeni create edeceyin hisseler workspace de var ona uygun sekilde hell et!