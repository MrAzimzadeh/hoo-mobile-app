import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// `flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
///  --dart-define=HOO_MOCK=true` — screenshots land in build/screenshots/.
Future<void> main() => integrationDriver(
      onScreenshot: (name, bytes, [args]) async {
        final file = File('build/screenshots/$name.png')..createSync(recursive: true);
        file.writeAsBytesSync(bytes);
        return true;
      },
    );
