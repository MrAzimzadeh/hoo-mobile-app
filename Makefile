# Common tasks. `make setup` once after cloning.
.PHONY: setup gen l10n engine analyze test run-mock run-local icons format

setup:
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
	flutter run -t lib/main_dev.dart --dart-define=HOO_MOCK=true

# Against a local Hoo.Api (dotnet run in hoo-back). Android emulator: HOO_API=http://10.0.2.2:5131
run-local:
	flutter run -t lib/main_dev.dart --dart-define=HOO_API=$${HOO_API:-http://localhost:5131}

icons:
	flutter test tool/icon/render_icon_test.dart && tool/icon/make_icons.sh
