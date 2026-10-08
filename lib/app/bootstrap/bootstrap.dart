import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/config/env.dart';
import '../app.dart';
import '../di/injector.dart';

/// Shared startup for every flavor: bindings, DI, error zones, then the app. Heavy initialisation
/// (`/meta/store`, guest id, session restore) runs on the Splash, in parallel with the brand animation.
Future<void> bootstrap(Flavor flavor) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      // Crash reporting hook (Crashlytics/Sentry) goes here; never include request bodies or tokens.
    };

    await configureDependencies(Env.forFlavor(flavor));
    runApp(const HooApp());
  }, (error, stack) {
    if (kDebugMode) debugPrint('Uncaught: $error\n$stack');
  });
}
