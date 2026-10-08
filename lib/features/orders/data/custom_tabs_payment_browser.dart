import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as tabs;

import '../domain/repositories.dart';

/// EPoint's hosted payment page in Custom Tabs (Android) / SFSafariViewController (iOS). The gateway redirects
/// back to `/checkout/success|error`, which arrives as a `PaymentReturnLink` through the deep-link service.
class CustomTabsPaymentBrowser implements PaymentBrowser {
  @override
  Future<void> open(Uri url) => tabs.launchUrl(
    url,
    customTabsOptions: const tabs.CustomTabsOptions(showTitle: true, urlBarHidingEnabled: true, shareState: tabs.CustomTabsShareState.off),
    safariVCOptions: const tabs.SafariViewControllerOptions(dismissButtonStyle: tabs.SafariViewControllerDismissButtonStyle.cancel, barCollapsingEnabled: true),
  );

  @override
  Future<void> close() async {
    try {
      await tabs.closeCustomTabs();
    } catch (_) {
      // nothing open / unsupported platform version — nothing to close
    }
  }
}
