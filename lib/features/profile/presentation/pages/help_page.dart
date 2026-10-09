import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/widgets/contact_links.dart';

/// Help: size guide basics, about HOO, contact channels from the store settings, FAQ.
@RoutePage()
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final contacts = sl<StoreInfoProvider>().info.contacts;
    final faq = [(l.profileFaqDeliveryQ, l.profileFaqDeliveryA), (l.profileFaqReturnsQ, l.profileFaqReturnsA), (l.profileFaqStudioQ, l.profileFaqStudioA), (l.profileFaqPaymentQ, l.profileFaqPaymentA)];
    return Scaffold(
      appBar: HooAppBar(title: l.profileHelp),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          Text(l.profileContactUs, style: context.hoo.text.h2),
          const SizedBox(height: HooSpacing.sm),
          for (final link in contactLinks(contacts)) HooListTile(icon: link.icon, title: link.label, onTap: () => openLink(link.uri)),
          const SizedBox(height: HooSpacing.section),
          Text(l.profileFaq, style: context.hoo.text.h2),
          for (final (q, a) in faq) HooAccordion(title: q, child: Text(a, style: context.hoo.text.bodySecondary)),
          HooAccordion(title: l.catalogSizeGuide, child: Text(l.profileSizeGuideBody, style: context.hoo.text.bodySecondary)),
          const SizedBox(height: HooSpacing.section),
          Text(l.profileAbout, style: context.hoo.text.h2),
          const SizedBox(height: HooSpacing.sm),
          Text(l.profileAboutBody, style: context.hoo.text.bodySecondary),
        ],
      ),
    );
  }
}
