# Common tasks. `make setup` once after cloning.
# Build-time config comes from .env.<flavor> (keys documented in .env.example); a --dart-define overrides one key.
.PHONY: setup gen l10n engine analyze test run-mock run-local run-staging run-prod icons format

setup:
	@test -f .env.dev || cp .env.example .env.dev
	flutter pub get
	$(MAKE) gen l10n

gen:
	dart run build_runner build --delete-conflicting-outputs --force-jit

l10n:
	dart run tool/merge_l10n.dart && flutter gen-l10n

# Rebuilds assets/studio/engine.js from tool/studio_engine/src (needs Node 18+).
engine:
	cd tool/studio_engine && npm install --no-audit --no-fund && npm run build

format:
	dart format --line-length 160 lib test tool

analyze:
	flutter analyze --fatal-infos

test:
	flutter test

# UI on the in-app fake backend (no server needed).
run-mock:
	flutter run -t lib/main_dev.dart --dart-define-from-file=.env.dev --dart-define=HOO_MOCK=true

# Against a local Hoo.Api (dotnet run in hoo-back), URL from .env.dev. Android emulator: HOO_API_URL=http://10.0.2.2:5131 make run-local
run-local:
	flutter run -t lib/main_dev.dart --dart-define-from-file=.env.dev $(if $(HOO_API_URL),--dart-define=HOO_API_URL=$(HOO_API_URL))

run-staging:
	flutter run -t lib/main_staging.dart --dart-define-from-file=.env.staging

run-prod:
	flutter run -t lib/main_prod.dart --dart-define-from-file=.env.prod

icons:
	flutter test tool/icon/render_icon_test.dart && tool/icon/make_icons.sh
