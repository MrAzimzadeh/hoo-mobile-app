import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../design_system/design_system.dart';

/// Opens the EPoint payment page in Custom Tabs (Android) / SFSafariViewController (iOS). The app learns the outcome
/// from the universal-link return or, when the sheet is closed, by polling the payment status.
Future<void> openPaymentPage(BuildContext context, String url) {
  final c = context.hoo.colors;
  return launchUrl(
    Uri.parse(url),
    customTabsOptions: const CustomTabsOptions(showTitle: true, urlBarHidingEnabled: true, shareState: CustomTabsShareState.off),
    safariVCOptions: SafariViewControllerOptions(
      preferredBarTintColor: c.background,
      preferredControlTintColor: c.textPrimary,
      dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      barCollapsingEnabled: true,
    ),
  );
}
