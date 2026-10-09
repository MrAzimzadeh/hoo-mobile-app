import 'app/bootstrap/bootstrap.dart';
import 'core/config/env.dart';

/// `flutter run -t lib/main_dev.dart --dart-define-from-file=.env.dev` (add `--dart-define=HOO_MOCK=true` to run on
/// fixtures, or set `HOO_API_URL=http://10.0.2.2:5131` in `.env.dev` for the Android emulator).
Future<void> main() => bootstrap(Flavor.dev);
