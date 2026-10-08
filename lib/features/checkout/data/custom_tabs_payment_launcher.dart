import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../domain/payment_launcher.dart';

class CustomTabsPaymentLauncher implements PaymentRedirectLauncher {
  const CustomTabsPaymentLauncher();

  @override
  Future<void> open(String url) => launchUrl(
    Uri.parse(url),
    customTabsOptions: const CustomTabsOptions(shareState: CustomTabsShareState.off),
    safariVCOptions: const SafariViewControllerOptions(),
  );
}
