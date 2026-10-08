import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/l10n/l10n.dart';
import 'package:hoo/shared/design_system/tokens/hoo_theme.dart';

/// Wraps [child] in the HOO theme + localizations (default az) for widget tests.
extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget child, {Locale locale = const Locale('az'), bool dark = false}) async {
    await pumpWidget(
      MaterialApp(
        theme: dark ? HooThemeData.dark() : HooThemeData.light(),
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(body: child),
      ),
    );
    await pump();
  }
}
