# HOO mobile — architecture & conventions

Feature-based modular Clean Architecture on Flutter. **Module boundary = business feature; inside a feature =
Clean Architecture layers.** Abstractions exist only where they buy testability or changeability.

```
lib/
├── app/            composition root: bootstrap, DI (get_it), router (auto_route), shell (tabs)
├── core/           config/flavors, network (Dio + interceptors + problem+json), storage (secure, prefs, Drift),
│                   session, localization, analytics, deep links, push, connectivity, security, utils
├── shared/         design_system (tokens, motion, components), domain (shared models/enums),
│                   application (cross-feature contracts), extensions, debug (design-system screen)
├── l10n/           core ARB + per-feature fragments → generated AppLocalizations
└── features/<f>/
    ├── <f>_module.dart          registerXModule(GetIt) — the feature's composition
    ├── data/                    <f>_api.dart (HTTP via ApiClient), repositories (impl), cache
    ├── domain/                  models (freezed), repository interfaces, use cases only when meaningful
    └── presentation/            pages (@RoutePage), widgets, bloc|cubit
```

Dependency direction: `core ← shared ← features ← app`. A feature never imports another feature. It talks to
others through `shared/application/contracts.dart` (`AuthGate`, `BagService`, `WishlistService`,
`RecentlyViewedService`, `StoreInfoProvider`) and through typed routes in `app/router/app_router.dart`.

## Hard rules

* **Tokens only.** Colors, sizes, radii, type, durations and curves come from `shared/design_system/tokens` via
  `context.hoo` (`context.hoo.colors.accent`, `context.hoo.text.h2`). No `Color(0x…)`, no raw `TextStyle`, no
  `Duration(milliseconds: …)` in feature code. Garment hexes from the API are the only exception (`parseHex`).
* **The server calculates every price.** Send selections; render the totals the API returns. Never add, multiply,
  discount or estimate money on the client (`AnimatedMoney` only tweens between two server values).
* **No hard-coded user-facing strings.** Everything goes through `context.l10n`. Marketing copy can be overridden by
  `/content/strings` through `sl<ContentStrings>().text(key, fallback)`.
* **Branch on `ApiException.code`**, never on the message. Display `errorMessage(context, e)` (server's localized
  `title`) or field errors via `e.fieldError('phone')`.
* One green (accent) CTA per screen at most.

## Data layer

* `ApiClient` (core/network) is the only HTTP entry point. Every call returns decoded data or throws `ApiException`
  (never `DioException`). Interceptors add `Authorization: Session <token>`, `X-Session-Transport: header`,
  `X-Guest-Id`, `Accept-Language`, `Idempotency-Key` (pass `idempotencyKey:` — reuse the same key on retry).
* Models mirror `Hoo.Application/**/Contracts` 1:1 (names, nullability, enums with exact wire values in
  `shared/domain/enums.dart`). The backend contract wins over any doc. Freezed + json_serializable.
* Repository interface in `domain/`, implementation in `data/`. Keep them narrow and split by responsibility.
* Pass `CancelToken` for search-as-you-type, live pricing and uploads; cancel the previous one.
* Offline: repositories that back browse screens write the last good response to `AppDatabase.putCache` and fall back
  to `readCache` on `ApiException.isNetwork`, returning a result flagged `stale` so the UI shows `OfflineBanner`
  and disables mutations.

## State

* `Cubit` for state-oriented flows (catalog filters, wishlist, profile sections, simple forms).
* `Bloc` for event-heavy machines (auth/OTP, checkout, payment, Studio editor, uploads, autosave).
* Immutable states (freezed or `Equatable`) with explicit loading / empty / error / stale states.
* Pages create their bloc: `BlocProvider(create: (_) => sl<ProductCubit>()..load(slug))`. Register blocs as
  factories in the feature module. Widgets stay dumb: render state, dispatch intent.

## Navigation

auto_route, typed routes. Access is declared per route (`AccessPolicy.public | guest | authenticated | staff`) and
enforced by one `AccessGuard`; a protected route opens Sign in on top and resumes the original navigation on success.
Inline gates (heart, write review) use `AuthGate.requireSignIn(context)` which shows the "Sign in to continue" sheet
and returns to the same place.

## Motion

`HooReveal` (staggered content), `HooTextReveal`, `HooImageReveal`, `HooPressable` (press feedback),
`HooSuccessCheck`, route transitions in `HooRouteTransitions`, durations/curves in `HooDurations`/`HooCurves`.
Everything respects reduced motion (`context.hoo.motion(d)` / `context.hoo.reducedMotion`). Haptics via
`HooHaptics` (light: add-to-bag, wishlist, studio step; success: order placed). Product images use `Hero` tags
`ProductCardTile.heroTag(prefix, slug)` so cards expand into the PDP.

## Localization

`lib/l10n/core/app_<lang>.arb` holds shared strings; each feature owns `lib/l10n/fragments/<feature>/app_<lang>.arb`
(keys prefixed with the feature name, all four languages: az template, en, ru, tr; placeholders described in az).
Regenerate: `dart run tool/merge_l10n.dart && flutter gen-l10n`. Test long ru/tr strings: buttons wrap to two lines,
titles ellipsize.

## Codegen

`dart run build_runner build --delete-conflicting-outputs --force-jit` (`--force-jit` is required because
sqlite3's build hooks cannot be AOT-compiled by `dart compile`).

## Tests

* Repositories/mappers: `test/helpers/fake_api.dart` (`fakeApiClient({'GET /cart': (r) => (200, json)})`) runs the
  real `ApiClient` (query building, decoding, problem mapping).
* Blocs/cubits: plain `flutter_test` with stream expectations.
* Widgets: `tester.pumpApp(widget)` from `test/helpers/pump_app.dart`.
