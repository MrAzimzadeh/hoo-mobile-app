# HOO — Mobile App Master Spec (Design + Features + Backend API)

> Product spec for the HOO mobile app. When this document and the backend disagree about data, **the backend API
> contract wins** (`hoo-back/hoo-backend/src/Hoo.Application/**/Contracts`). Implementation conventions:
> `docs/ARCHITECTURE.md`.

## 0. Goal

Production-quality iOS + Android app for **HOO**, a premium streetwear brand from Azerbaijan (hoodies, zip hoodies,
T-shirts, sweatshirts, sweatpants, shorts). It is the **mobile twin of the HOO web storefront**: everything a customer
can do on the website is possible in the app, against the same backend API. Two pillars:

1. **Shop** — catalog, product pages, wishlist, bag, checkout, orders, returns, gifts.
2. **Studio ("Design Your Own")** — a 3D customizer: pick a garment, add text and images to print zones, see a live
   server-calculated price and order it.

Stack: Flutter (Material 3, Dart 3), feature-based modular Clean Architecture, flutter_bloc (Cubit for simple state,
Bloc for event-heavy machines), auto_route (typed routes, deep links, guards), get_it, dio, freezed +
json_serializable, flutter_secure_storage, ARB i18n, cached_network_image, a WebView three.js renderer for `.glb`
(runtime decals, tinting, interaction), Drift for structured local persistence.

**Hard rules**
- All design values live in one token file. Never hard-code colors, sizes or text styles in widgets.
- The server calculates every price. Never compute totals, discounts, delivery fees or Studio prices locally.
- No hard-coded user-facing strings (ARB, optionally overridden by `/content/strings`).
- Client logic branches on the error `code`, never on message text.

## 0.1 Architecture

Module boundary = business feature; inside each feature = Clean Architecture. Dependencies explicit and
one-directional (`core ← shared ← features`); features don't depend on other features' implementations — they use
shared contracts, navigation or narrow interfaces. Cubit for simple state-oriented flows (catalog filters, wishlist,
profile sections, simple forms, UI prefs); Bloc for auth/OTP, checkout, payment, Studio editor, uploads, autosave.
auto_route: typed routes, nested shell navigation, deep/universal links, `AutoRouteGuard` with per-route access
policies (`public`, `guest`, `authenticated`, `staff`) that redirect through a reusable auth flow and return to the
intended destination. get_it composition root. Dio interceptors: session authorization, guest id,
`Accept-Language`, idempotency keys, dev-only redacted logging, problem+json mapping → typed
`ApiException(code, title, fieldErrors, statusCode)`. Drift for structured cache; secure storage for credentials;
explicit offline behaviour. Studio is a subsystem: configuration/data, DesignSpec domain, editor interaction state,
pricing state, upload state, autosave state, 3D engine bridge — Flutter/domain state is the source of truth, the
renderer only visualizes. Senior rules: composition over inheritance, dumb widgets, no God cubits/repositories, no
use case per one-line call, interfaces at boundaries, immutable state, explicit loading/empty/error/retry/stale,
cancellation and race conditions for search/pricing/uploads/checkout, never log tokens/payment data, flavors
dev/staging/prod, CI-ready (format, analyze, tests, build).

## 1. Brand

- **Wordmark:** `HOo` — capital H, capital O, lowercase o. Inter Bold, tracking ≈ −2%. Text-only. Variants: black on
  white, white on black, white on dark green.
- **Personality:** premium, minimal, confident, calm. Whitespace, big imagery, few colors. High-end streetwear.
- **Art direction:** must not look like a generic Material 3 shop. Fashion-editorial: large imagery, bold type,
  generous whitespace, restrained color, strong black/white contrast with HOO green used intentionally. Avoid
  excessive cards, gradients, shadows, illustrations, badges, chrome. Full-bleed imagery where appropriate. Every
  screen: clear hierarchy, one primary action. Motion is part of the brand (section 13).

## 2. Color tokens

| Token | Value | Usage |
|---|---|---|
| brand.white | #FFFFFF | Light background, text on dark |
| brand.black | #121212 | Primary text, primary buttons, dark background |
| brand.green | #1C3829 | Accent: key CTAs, selected states, badges, active tab |
| surface.muted | #F7F7F5 | Cards, inputs, sheets (light) |
| border.subtle | #E8E8E5 | 1px borders, dividers |
| text.secondary | #6B6B6B | Captions, helper text |
| text.tertiary | #9A9A9A | Placeholders, disabled |
| green.tint | #1C3829 @ 8% | Selected chip bg, subtle highlights |
| state.error | #B3261E | Errors only |
| state.success | #1C3829 | Success |

Dark: background #121212, surface #1C1C1C, border #2A2A2A, text #FFFFFF, secondary #A0A0A0; accent stays #1C3829
with white text. Green is the only accent; at most one green CTA per screen. Product swatches show real garment hexes.

## 3. Typography (Inter)

display 40/44 700 · h1 28/34 700 · h2 22/28 700 · h3 17/22 600 · body 15/22 400 · bodyStrong 15/22 600 ·
caption 13/18 400 (secondary) · label 12/16 600 UPPERCASE +6%. Headings −1…−2% tracking. Glyphs for az, tr, Cyrillic.

## 4. Spacing, shape, elevation

4-pt scale (4, 8, 12, 16, 24, 32, 48, 64); screen padding 24; section gap 32. Radius: cards/images/buttons/inputs 12,
chips pill, sheets 20 (top). Borders over shadows (1px border.subtle on surface.muted); shadows only on floating
elements `0 8 24 rgba(18,18,18,.08)`. Touch targets ≥ 48. Icons outline 1.5px 24px (Phosphor Light), monochrome.

## 5. Core components

HooLogo (dark|light|onGreen) · PrimaryButton (52, full width, black; accent = green; loading/disabled) ·
SecondaryButton (1px outline) · TextButton/Link (underline on press) · ProductCard (4:5 image, name h3, price +
struck compareAt + −X%, color dots, badge NEW/NEW DROP/BESTSELLER, heart) · ColorSwatch (32, selected = 2px green ring
with 2px gap, unavailable = diagonal strike) · Size/OptionChip (pill; selected black or green tint; out of stock
struck but tappable for "Notify me") · TextField (filled, 52, focused 1px black, error 1px + caption; phone +994
mask, OTP 6 boxes, password show/hide) · SectionHeader (h2 + See all →) · BottomSheet (radius 20, handle 36×4) ·
PriceSummaryBar (sticky; total left, CTA right; tap total → breakdown) · Bottom Navigation (5 tabs, 1px top border,
active black + green dot, Studio centered & highlighted, Bag badge) · Empty/Error/Loading (shimmer skeletons) ·
Stepper (thin green progress + "Step 2 of 5") · QuantityStepper (min 1, max stock/maxQuantity) · StatusTimeline ·
Accordion · RatingStars · Banner/InlineAlert · Toast. Hidden "Design system" debug screen (light + dark).

## 6. Backend integration

Base URL per flavor (dev `http://localhost:5131`), prefix `/api/v1`, OpenAPI `/openapi/public.json`, Scalar `/docs`.

### 6.1 Conventions
- **Auth (server sessions, no JWT):** send `X-Session-Transport: header` on login/register/OTP/Google/Apple →
  `AuthResponse { sessionToken, expiresAt, isNewUser, user }`. Store token securely; send
  `Authorization: Session <token>`. No cookies/CSRF on mobile. On 401 clear the token and route to Welcome (keep the
  guest bag).
- **Guests:** first launch `POST /guest` → persist id → `X-Guest-Id` on every request (bag + Studio for guests). After
  login the server attaches the guest bag and designs; keep sending the guest id.
- **Language:** `Accept-Language: az|ru|en|tr`; server messages (errors too) come back localized. When the language
  changes while logged in, also `PUT /account/profile`.
- **Money:** AZN, 2 decimals, per-locale (`12,50 ₼` az/ru/tr, `₼12.50` en).
- **Pagination:** `page` (1-based), `pageSize` (≤100) → `{ items, page, pageSize, totalCount, totalPages, hasMore }`;
  infinite scroll.
- **Idempotency:** `Idempotency-Key` (UUID v4 per user action, reused on retry) on
  `POST /checkout/{id}/place-order` and `POST /orders/{number}/payment/retry`.
- **Errors:** RFC 9457 problem+json with stable `code`, localized `title`, on 400 `errors` (field → messages) +
  `errorCodes`. Map field errors to fields; otherwise toast/inline. `GET /meta/errors` lists codes. 400 validation ·
  401 no session · 403 forbidden · 404 · **409** conflict (slot full, last item sold, invalid transition) → refresh and
  explain · **422** business rule (COD limit, promo condition) · **429** → countdown · **502** provider (EPoint, SMS) ·
  **503 `store.coming_soon`** → Coming Soon.
- **Analytics:** `POST /events` — Visit, ProductView, AddToCart, CheckoutStarted, OrderPlaced, StudioOpened (+UTM).
- **Orders placed from the app** send `source: "App"`.

### 6.2 Store mode
`GET /meta/store` → `{ mode, launchAt, contacts, currency, defaultLanguage, languages, vatRate }`.
`ComingSoon`: Coming Soon experience (`GET /content/coming-soon`): logo, title, subtitle, perks, countdown to
`launchAt`, waitlist count (`GET /waitlist/count`), Join the waitlist (email or phone → `POST /waitlist` → "You are
#position of total"), newsletter, socials (Instagram, TikTok, Telegram, WhatsApp, phone, email). Catalog, search,
Studio, bag, checkout return 503 for normal users; staff bypass → hidden "Staff sign in" link. `Live`: full app.

### 6.3 Endpoints (customer API)
Meta `GET /meta/store|languages|errors`, `POST /guest`, `POST /events` · Content `GET /content/strings`,
`/content/coming-soon` · Launch `POST /waitlist`, `GET /waitlist/count`, `POST /newsletter`,
`/newsletter/unsubscribe` · Auth `POST /auth/register|login|otp/send|otp/verify|google|apple|logout`,
`GET /auth/session|sessions`, `DELETE /auth/sessions/{id}`, `POST /auth/password/forgot|reset|change` · Account
`GET /account/overview`, `PUT /account/profile`, `GET/PUT /account/style-profile`, `GET /account/size-recommendations`,
`GET /account/payment-methods`, `DELETE /account/payment-methods/{id}`, `GET/PUT /account/notification-preferences`,
`GET /account/orders`, `GET /account/orders/{number}`, `POST /account/orders/{number}/returns`,
`GET /account/returns`, `GET/POST/PUT/DELETE /account/addresses[/{id}]` · Catalog `GET /catalog/categories|collections|
colors|products|products/{slug}|products/{slug}/recommendations|bestsellers|new-arrivals|looks`,
`GET/POST /catalog/products/{slug}/reviews` · Search `GET /search`, `/search/suggest`, `/search/recent`,
`DELETE /search/recent` · Wishlist & history `GET /wishlist`, `POST/DELETE /wishlist/{productId}` (login),
`POST /wishlist/share`, `GET /wishlist/shared/{token}`, `GET/DELETE /recently-viewed`,
`POST /recently-viewed/{productId}` · Alerts `GET /alerts`, `POST /alerts` (BackInStock|PriceDrop),
`DELETE /alerts/{id}` · Cart `GET /cart`, `POST /cart/items` (`{ variantId?, quantity, designId? }`),
`PATCH/DELETE /cart/items/{id}`, `PUT/DELETE /cart/promo`, `PUT /cart/gift` · Checkout `POST /checkout`,
`GET /checkout/{id}`, `PUT /checkout/{id}/contact|gift|delivery|slot|payment-method`, `GET /checkout/{id}/slots`,
`POST /checkout/{id}/place-order` · Payments `GET /orders/{number}/payment`, `POST /orders/{number}/payment/retry` ·
Delivery `GET /delivery/zones|promise` · Tracking `GET /orders/track` (number + phone),
`PUT /orders/track/{number}/slot`, `POST /orders/track/{number}/returns` · Gift `GET /gift/options`,
`POST /gift/message/validate`, `GET /gift-receipts/{code}`, `POST /gift-receipts/{code}/exchange` · Studio
`GET /studio/config`, `POST /studio/price`, `POST /studio/uploads` (multipart), `GET/POST /studio/designs`,
`GET/PATCH/DELETE /studio/designs/{id}`, `POST /studio/designs/{id}/duplicate|share|resubmit|mockups`,
`GET /studio/shared/{token}`.

### 6.4–6.5 Enums & models
Exact wire values: `lib/shared/domain/enums.dart`. Models: `Hoo.Application` contracts (see ARCHITECTURE.md).

## 7. App hierarchy

```
Splash (HOo on black) → GET /meta/store, POST /guest, restore session
Coming Soon (store mode = ComingSoon)
Onboarding (first launch): language (Azərbaycan · Русский · English · Türkçe) + 3 intro slides
  (the brand, "Design your own", fast delivery in Baku)
Auth
  Welcome (Sign in / Create account / Continue as guest)
  Sign in: email or phone + password · "Sign in with SMS code" · Google · Apple
  Sign up: full name, email, password, phone (optional), marketing consent, accept terms (required)
  Phone/OTP: +994 → 6-digit code via SMS or WhatsApp, resend timer, 429 handling
  Forgot password → reset (code) → new password
  Style profile (skippable, after sign-up): height, weight, chest, waist, usual size, preferred fit, favorite color
    families, style tags → defaults everywhere (size pre-selection on PDP & Studio, sorting/recommendations)
Main (bottom nav)
  1 Home: header (logo + search + bag), hero banner (new drop, full-width image, green CTA), "Design Your Own" promo
    (dark green, white text) → Studio, New arrivals rail, Categories + Collections, Lookbook / Shop the look,
    Bestsellers, Recently viewed
  2 Shop: category tabs + filter/sort sheet (category, collection, size, color, price; newest · price ↑ · price ↓ ·
    bestselling), active-filter chips, result count, 2-col infinite grid. Search (full screen): suggestions while
    typing (250ms debounce), recent searches (clear all), results, empty state with bestsellers.
    Product detail: gallery per color (swipe, dots, pinch-zoom, full screen), optional 3D view (model3D); name, price
    (+compareAt/−%), badges, rating → reviews; color swatches, size chips (stock, "Only N left", preorder), recommended
    size ("We recommend M"), size-guide sheet; delivery promise; accordions (description · size & fit · fabric &
    care); reviews + write a review (1–5, title, body; login); Notify me / Price drop alert; recommendations; heart
    (login → auth sheet), share (deep link); "Customize this" (availableInStudio) → Studio; sticky "Add to bag"
    (disabled until size chosen; haptic + mini-bag sheet).
  3 Studio (center, highlighted) → section 8
  4 Bag: lines (thumbnail / design mockup, options, qty stepper, swipe remove, per-line errors), free-delivery
    progress, promo (apply/remove, server error), "This is a gift", summary from server, PriceSummaryBar "Checkout"
    → Checkout (section 9) → Confirmation
  5 Profile: name + counters (orders, designs, wishlist, active orders); Orders (→ detail: lines, totals, payment,
    delivery, gift, timeline; Pay again · Change slot · Return/Exchange); Returns; My designs; Wishlist (move to bag,
    share); Alerts; Style profile; Addresses (CRUD, default); Saved cards; Personal info (name, email, phone,
    language) · Change password; Active devices; Notifications (topic × channel); Track an order (guest: number +
    phone); Gift receipt; Help (size guide, about, contact, FAQ); Settings (language, appearance, logout)
```
Guests can browse, use bag and Studio, check out and track orders. Wishlist, reviews, saved designs list, addresses
and saved cards require login: "Sign in to continue" sheet, return to the same place.

## 8. Studio

**Config** `GET /studio/config` (versioned `pricingVersionId`): baseProducts (code, productType, name, price, lead time,
fits, featureCodes, fabricCodes, colors, sizes, printAreas, model, template {modelUrl .glb, heightCm, tintable,
zones}, maxQuantity, product, variants), fits (surcharge), features, fabrics (gsm, surcharge, included),
sizeSurcharges, printMethods (max size, tiers), extras (rush fee/lead time, custom measurements fee, setup fee, volume
tiers), fonts, maxUploadMegabytes, recommendedDpi, maxLayers. From a PDP "Customize this" → preselect `p-<productId>`.

**Steps** (Stepper "Step N of 5", progress persisted): 1 Product (cards: image, from-price, lead time) · 2 Fabric &
features (fabric cards: name, gsm, feel, +surcharge or Included; feature chips with deltas) · 3 Size & fit (fit chips
+surcharge, size chips prefilled from style profile + surcharge, optional custom measurements +fee) · 4 Color (base
swatches; disable unavailable combos) · 5 Editor (full screen): 3D preview tinted, rotate/zoom, quick views
Front · Back · Left sleeve · Right sleeve · Hood, zones highlighted; Add text (content, font, color, size pt,
alignment); Upload image (gallery/camera → `POST /studio/uploads`, ≤ maxUploadMegabytes, progress; crop, scale,
rotate, drag/pinch in zone; print-quality warnings from the quote); Layers (reorder zIndex, duplicate, delete,
hide/show, max maxLayers); each layer belongs to one zone, clamped to zone cm and print-method max; undo/redo,
snap-to-center. Graphics tab hidden; no curved text. 6 Review: mockups (front/back), spec summary, quantity
(1…maxQuantity, volume tiers), rush toggle, estimated delivery, required "I own the rights to these images", Save
design / Add to bag (`POST /cart/items { designId, quantity }`).

**Live price:** every change (debounce ~300ms) `POST /studio/price { spec, layers, pricingVersionId }` → PriceSummaryBar
(unitPrice × quantity, breakdown, total, lead time, estimated delivery). Never compute locally; subtle in-flight
state; cancel stale requests.

**Model:** `spec { baseCode, fit, featureCodes[], fabricCode, colorId, size, customMeasurements?, quantity, rush }`,
`layer { id, kind, placement, zIndex, printMethodCode, widthCm, heightCm, xCm, yCm, rotation, text?, font?,
fontSizePt?, align?, colorHex?, uploadId?, graphicId?, anchor? }` — positions in cm relative to the zone.

**Persistence:** create on first meaningful change (`POST /studio/designs`), autosave `PATCH` (debounced, offline
queue, "Saved" indicator); upload PNG mockups (`POST /studio/designs/{id}/mockups`) before adding to bag; guest designs
by `X-Guest-Id` move to the account on login.

**My designs:** grid (mockup, name, status chip, last edited); open/edit (if `editable`), duplicate, delete, share
(read-only link → in-app read-only 3D viewer), resubmit after ChangesRequested (show `changeRequestMessage`). Custom
orders show `AwaitingApproval` until approved — explain on review and in the timeline.

## 9. Checkout

`POST /checkout` creates a session from the bag (`expiresAt`; recreate silently when expired). Each step `PUT`s and
re-renders from `CheckoutResponse`; progress from `missingSteps[]`; "Place order" only when `canPlaceOrder`.
1 Contact (name, +994 phone, optional email; prefilled) · 2 Gift (optional; `GET /gift/options`): recipient
name/phone, occasion, surprise, packaging (image, price, free above threshold), greeting card type + design, message
(live `POST /gift/message/validate`), from name, hide prices; respect `rules.allowForCustomOrders` · 3 Delivery: zone
(Courier/Post/Pickup; price, free threshold, ETA), address (saved or new: city, district, street, apartment, note) ·
4 Slot (courier): `GET /checkout/{id}/slots` → day + window chips; full disabled; 409 → refresh · 5 Payment:
`paymentMethods[]` with `unavailableReason`, saved cards, "Save card" · 6 Review & place: items, totals (subtotal,
discount, delivery, gift packaging & saving, greeting card, total, VAT), accept terms, + image rights if
`hasCustomItems` → `POST /checkout/{id}/place-order { acceptTerms, confirmImageRights, saveCard, source: "App" }` with
Idempotency-Key · 7 Redirect: `paymentRedirectUrl` → in-app browser; on return poll `GET /orders/{number}/payment`
until Captured/Failed; failed → Retry (`POST …/payment/retry`) or switch to cash on delivery · 8 Confirmation: check
animation, order number, payment status, delivery estimate, gift receipt code, "Track order" / "Continue shopping",
success haptic, clear and refetch the bag.

## 10. Orders, tracking, returns
Order detail: status chip + timeline (placed, payment captured/failed, design approved/changes requested, packed,
courier assigned, ETA updated, slot changed, out for delivery, delivered, refund…); change slot (`canChangeSlot`);
pay again (`canPay`); return/exchange (`canReturn`: lines + quantities, kind, new size for exchange, reason, phone).
Guest tracking (number + phone) → same UI incl. slot change and returns. Gift receipt (`/gift/receipt/{code}` or
code entry) → gift without prices → size exchange.

## 11. Notifications & deep links
Push (FCM/APNs), respect notification preferences (topic × channel). Events: OTP, order confirmed, payment failed,
design approved, design changes requested, packed, out for delivery, ready for pickup, delivered, back in stock,
price drop, waitlist launch. Tap opens the matching screen. Deep/universal links mirror web routes in all 4 locales:
`/products/{slug}`, `/collections/{slug}`, `/shop`, `/search?q=`, `/cart`, `/checkout/confirmed/{number}`,
`/account/orders/{number}`, `/design-your-own?product={slug}`, `/studio/shared/{token}`, `/wishlist/shared/{token}`,
`/gift/receipt/{code}`, `/track-order`, payment return. Capture UTM.

## 12. Localization
az (default), ru, en, tr. ARB + overrides from `/content/strings` (cached, bundled fallback). Product content arrives
translated. Locale money/dates. Long ru/tr strings must not overflow (two-line buttons, ellipsized titles).

## 13. Motion — premium cinematic
More motion, less noise. Never bouncy/childish. Levels: **A cinematic** (splash, onboarding, home hero, PDP hero
transition, Studio, confirmation), **B micro** (cards, wishlist, filters, tabs, selections, sheets, forms, loading,
add-to-bag), **C invisible** (focus, press, checkbox, chip, validation). Tokens: fast 150 · normal 280 · medium 450 ·
slow 700 · cinematic 900–1200; default easeOutCubic. Splash: black, white `HOo`, typographic reveal (tracking
animates into place, subtle 1.00→1.02→1.00 settle), brief hold, mask/reveal exit; init runs in parallel; no spinner
unless needed. Onboarding: editorial, full-bleed imagery 1.05→1.00, clip text reveals, stagger image → headline →
copy → CTA. Home: subtle hero parallax, staggered hero text, sections reveal on entry, no random per-card effects.
Catalog: card → PDP shared-element hero; small heart transition; continuous color/gallery change; fast chip states;
direct gestures; controlled sheets. Studio: persistent 3D model across steps, smooth material/color transitions,
subtle layer transitions, elegant zone highlight, gesture-first manipulation, subtle step progress + light haptic,
price value animates while showing recalculation, small "Saved" transition. Checkout: restrained. Confirmation:
clean check animation, progressive reveal, staggered actions, success haptic, no confetti. Reduced-motion variants
everywhere. Haptics: light (add-to-bag, wishlist, Studio step, meaningful selection), success (order placed); never on
every tap.

## 14. Accessibility, performance, quality
WCAG AA; dynamic type to 1.3×; semantic labels on icons; swatches announce color names; 360px → tablet (3–4 column
grids, Studio side panel); image caching/thumbnails, lazy 3D, request cancellation, pull-to-refresh; offline: cached
catalog and bag read-only + banner, queued Studio autosaves; token only in secure storage, never logged; cert pinning
in prod; no secrets in the app. Tests: unit (repositories, mappers), widget (components), integration (auth → add to
bag → checkout with mock API; Studio flow).
