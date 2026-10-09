import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/app/bootstrap/bootstrap.dart';
import 'package:hoo/core/config/env.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// End-to-end journeys on the in-app fake backend (run with `--dart-define=HOO_MOCK=true`):
/// onboarding → home → product → add to bag → checkout → confirmation, and the Studio flow.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> shot(WidgetTester t, String name) async {
    await t.pump(const Duration(milliseconds: 400));
    await binding.takeScreenshot(name);
  }

  Future<void> settle(WidgetTester t, [int seconds = 2]) async {
    for (var i = 0; i < seconds * 10; i++) {
      await t.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> tapText(WidgetTester t, String text) async {
    final f = find.text(text);
    await t.ensureVisible(f.first);
    await t.tap(f.first);
    await settle(t);
  }

  testWidgets('shop → bag → checkout → confirmation', (t) async {
    SharedPreferences.setMockInitialValues({});
    await startApp(Flavor.dev);
    await settle(t, 4);

    // onboarding: language → slides → welcome
    await shot(t, '01_onboarding_language');
    await tapText(t, 'Davam et');
    await shot(t, '02_onboarding_slide');
    await tapText(t, 'Keç');
    await shot(t, '03_welcome');
    await tapText(t, 'Qonaq kimi davam et');
    await settle(t, 3);
    await shot(t, '04_home');

    // product
    await t.drag(find.byType(CustomScrollView).first, const Offset(0, -700));
    await settle(t);
    await shot(t, '05_home_sections');
    await t.tap(find.text('Essential Oversized Hudi').first);
    await settle(t, 3);
    await shot(t, '06_pdp');
    await tapText(t, 'L');
    await shot(t, '07_pdp_size');
    await tapText(t, 'Səbətə əlavə et');
    await settle(t, 2);
    await shot(t, '08_added_sheet');
    await tapText(t, 'Sifarişi rəsmiləşdir');
    await settle(t, 3);
    await shot(t, '09_checkout_contact');

    await t.enterText(find.byType(TextField).at(0), 'Aysel Məmmədova');
    await t.enterText(find.byType(TextField).at(1), '501234567');
    await settle(t);
    await tapText(t, 'Davam et');
    await settle(t, 2);
    await shot(t, '10_checkout_delivery');
    await t.enterText(find.byType(TextField).at(2), 'Rəşid Behbudov küç. 12');
    await settle(t);
    await tapText(t, 'Davam et');
    await settle(t, 2);
    await shot(t, '11_checkout_slot');
    await tapText(t, '14:00–18:00');
    await settle(t, 2);
    await shot(t, '12_checkout_payment');
    await tapText(t, 'Qapıda nağd');
    await settle(t, 2);
    await tapText(t, 'Davam et');
    await settle(t, 2);
    await shot(t, '13_checkout_review');
    await tapText(t, 'Satış şərtlərini və qaytarma siyasətini qəbul edirəm');
    final place = find.textContaining('Sifarişi təsdiqlə');
    await t.ensureVisible(place);
    await t.tap(place);
    await settle(t, 5);
    await shot(t, '14_confirmation');
    expect(find.text('Sifarişiniz qəbul olundu'), findsOneWidget);
  });
}
