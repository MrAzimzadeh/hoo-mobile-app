import 'app/bootstrap/bootstrap.dart';
import 'core/config/env.dart';

/// Default entrypoint = dev flavor. Use `main_staging.dart` / `main_prod.dart` for release builds.
Future<void> main() => bootstrap(Flavor.dev);
