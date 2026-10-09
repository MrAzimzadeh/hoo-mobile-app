import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design_system/design_system.dart';
import '../domain/models.dart';

/// One way to reach HOO (store contacts from `/meta/store` or `/content/coming-soon`).
class ContactLink {
  const ContactLink(this.icon, this.label, this.uri);
  final IconData icon;
  final String label;
  final Uri uri;
}

/// Builds launchable links from [StoreContacts]: Instagram, TikTok, Telegram, WhatsApp, phone, email.
/// Values may be handles (`@hoo.az`) or full URLs.
List<ContactLink> contactLinks(StoreContacts c) {
  String handle(String v) => v.trim().replaceFirst(RegExp(r'^@'), '');
  Uri web(String v, String base) => v.startsWith('http') ? Uri.parse(v) : Uri.parse('$base${handle(v)}');
  return [
    if (c.instagram?.isNotEmpty ?? false) ContactLink(HooIcons.instagram, 'Instagram', web(c.instagram!, 'https://instagram.com/')),
    if (c.tikTok?.isNotEmpty ?? false) ContactLink(HooIcons.tiktok, 'TikTok', web(c.tikTok!, 'https://www.tiktok.com/@')),
    if (c.telegram?.isNotEmpty ?? false) ContactLink(HooIcons.telegram, 'Telegram', web(c.telegram!, 'https://t.me/')),
    if (c.whatsApp?.isNotEmpty ?? false) ContactLink(HooIcons.whatsapp, 'WhatsApp', Uri.parse('https://wa.me/${c.whatsApp!.replaceAll(RegExp(r'\D'), '')}')),
    if (c.phone.isNotEmpty) ContactLink(HooIcons.phone, c.phone, Uri(scheme: 'tel', path: c.phone.replaceAll(' ', ''))),
    if (c.email?.isNotEmpty ?? false) ContactLink(HooIcons.email, c.email!, Uri(scheme: 'mailto', path: c.email)),
  ];
}

Future<void> openLink(Uri uri) => launchUrl(uri, mode: LaunchMode.externalApplication);

/// Row of round icon buttons for the social/contact links.
class ContactIconsRow extends StatelessWidget {
  const ContactIconsRow({super.key, required this.contacts, this.color});

  final StoreContacts contacts;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final links = contactLinks(contacts);
    return Wrap(
      spacing: HooSpacing.xs,
      children: [
        for (final link in links) HooIconButton(icon: link.icon, semanticLabel: link.label, color: color, onPressed: () => openLink(link.uri)),
      ],
    );
  }
}
