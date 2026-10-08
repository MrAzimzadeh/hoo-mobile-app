import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../widgets/profile_widgets.dart';

/// Help: contact the store (phone, WhatsApp, email), track an order, and short answers to the common questions.
@RoutePage()
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  Future<void> _open(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final contacts = sl<StoreInfoProvider>().info.contacts;
    final phone = contacts.phone.replaceAll(RegExp(r'[^\d+]'), '');
    final whatsApp = contacts.whatsApp?.replaceAll(RegExp(r'\D'), '');
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(title: l.profileHelp),
      body: HooConstrained(
        child: ListView(
          children: [
            ProfileGroupLabel(l.profileHelpContact),
            if (contacts.phone.isNotEmpty)
              HooListTile(title: contacts.phone, icon: HooIcons.help, subtitle: l.profileHelpCall, onTap: () => _open('tel:$phone')),
            if (whatsApp != null && whatsApp.isNotEmpty)
              HooListTile(title: 'WhatsApp', icon: HooIcons.help, subtitle: l.profileHelpWhatsApp, onTap: () => _open('https://wa.me/$whatsApp')),
            if (contacts.email != null && contacts.email!.isNotEmpty)
              HooListTile(title: contacts.email!, icon: HooIcons.help, subtitle: l.profileHelpEmail, onTap: () => _open('mailto:${contacts.email}')),
            HooListTile(title: l.profileTrackOrder, icon: HooIcons.package, onTap: () => context.router.push(TrackOrderRoute())),
            ProfileGroupLabel(l.profileHelpFaq),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
              child: Column(
                children: [
                  HooAccordion(
                    title: l.profileFaqDeliveryQ,
                    child: Text(l.profileFaqDeliveryA, style: context.hoo.text.body),
                  ),
                  HooAccordion(
                    title: l.profileFaqReturnsQ,
                    child: Text(l.profileFaqReturnsA, style: context.hoo.text.body),
                  ),
                  HooAccordion(
                    title: l.profileFaqPaymentQ,
                    child: Text(l.profileFaqPaymentA, style: context.hoo.text.body),
                  ),
                  HooAccordion(
                    title: l.profileFaqCustomQ,
                    child: Text(l.profileFaqCustomA, style: context.hoo.text.body),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
