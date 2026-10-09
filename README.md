# HOO — mobile app

Flutter (iOS + Android) twin of the HOO storefront: shop, bag & checkout, orders, and the 3D **Studio**
("Design Your Own"). Talks to the same backend as the web (`hoo-back/hoo-backend`, `/api/v1`).

- Product spec: [docs/SPEC.md](docs/SPEC.md)
- Architecture & conventions: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- Status & open items: [docs/TODO.md](docs/TODO.md)

## Requirements

Flutter 3.38 (Dart 3.10), Xcode 16+ / Android SDK 35, CocoaPods. Node 18+ only to rebuild the Studio engine.

## Setup

```bash
make setup        # pub get + codegen (freezed, json, auto_route, drift) + localizations
```

Codegen must run in JIT mode (`--force-jit`) because sqlite3's build hooks can't be AOT-compiled:
`dart run build_runner build --delete-conflicting-outputs --force-jit`.

## Run

| Mode | Command |
|---|---|
| Fake backend (no server) | `make run-mock` → `flutter run -t lib/main_dev.dart --dart-define=HOO_MOCK=true` |
| Local Hoo.Api | `make run-local` (iOS simulator: `localhost:5131`; Android emulator: `HOO_API=http://10.0.2.2:5131 make run-local`) |
| Staging / prod | `flutter run -t lib/main_staging.dart` / `-t lib/main_prod.dart` |

Fake backend demo data: sign in with any e-mail + password `Hoo12345!`, phone OTP code `123456`, promo code
`HOO10`; card payments are "captured" after two status polls.

Integration test (simulator/device, fake backend, screenshots in `build/screenshots/`):
`flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart --dart-define=HOO_MOCK=true`

`--dart-define`s: `HOO_API` (API origin), `HOO_MOCK` (fake backend), `HOO_GOOGLE_SERVER_CLIENT_ID`,
`HOO_GOOGLE_IOS_CLIENT_ID`, `HOO_CERT_PINS` (prod SPKI pins, comma-separated).

## Day-to-day

```bash
make gen          # after touching freezed/json models, routes or Drift tables
make l10n         # after editing lib/l10n/core or lib/l10n/fragments/<feature>
make analyze      # flutter analyze --fatal-infos
make test
make engine       # rebuild assets/studio/engine.js from tool/studio_engine/src
make icons        # regenerate app icons from the wordmark
```

## Project layout

```
lib/app/        bootstrap, DI (get_it), router (auto_route + access guard), tab shell
lib/core/       env, network (Dio, problem+json → ApiException), storage, session, l10n, analytics, links, push
lib/shared/     design system (tokens, motion, components), shared models/enums, cross-feature contracts
lib/features/   launch, auth, home, catalog, search, wishlist, cart, checkout, orders, profile, studio
lib/l10n/       core ARB + per-feature fragments (az default, en, ru, tr)
assets/studio/  three.js Studio renderer hosted in a WebView
tool/           l10n merge, Studio engine sources, icon generator
```

## Platform notes

- **Deep links**: `https://hoo.az/…` (any locale prefix) and `hoo://…`. Publish `/.well-known/assetlinks.json` and
  `/.well-known/apple-app-site-association` on hoo.az for verified links.
- **Payments**: EPoint opens in Custom Tabs / SFSafariViewController; its return URLs
  (`https://hoo.az/checkout/success|error`) come back as universal links and the app polls the payment status.
- **Push**: transport not wired yet (needs Firebase config per flavor) — see `lib/core/push/push_service.dart`.
- **Debug design system**: `/debug/design-system` (also via long-press on the version in Settings).
