import 'app/bootstrap/bootstrap.dart';
import 'core/config/env.dart';

/// `flutter run -t lib/main_dev.dart` (add `--dart-define=HOO_MOCK=true` to run on fixtures, or
/// `--dart-define=HOO_API=http://10.0.2.2:5131` for the Android emulator).
Future<void> main() => bootstrap(Flavor.dev);
