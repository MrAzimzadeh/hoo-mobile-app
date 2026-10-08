import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';

/// One contact channel from `StoreContacts`.
@immutable
class SocialLink {
  const SocialLink({required this.icon, required this.name, required this.uri});

  final IconData icon;

  /// Brand name (Instagram…) or the localized channel name (email, phone).
  final String name;
  final Uri uri;

  /// Builds the links the store has configured. Handles may be stored as `@hoo.az`, a bare handle or a full URL.
  static List<SocialLink> fromContacts(StoreContacts c, {required String emailLabel, required String phoneLabel}) {
    String strip(String v) => v.trim().replaceFirst(RegExp('^@'), '').replaceFirst(RegExp(r'^https?://[^/]+/'), '').replaceFirst(RegExp(r'/$'), '');
    Uri web(String v, String Function(String handle) make) => Uri.parse(RegExp(r'^https?://').hasMatch(v.trim()) ? v.trim() : make(strip(v)));
    String digits(String v) => v.replaceAll(RegExp(r'\D'), '');
    bool has(String? v) => v != null && v.trim().isNotEmpty;

    return [
      if (has(c.instagram)) SocialLink(icon: HooIcons.instagram, name: 'Instagram', uri: web(c.instagram!, (h) => 'https://instagram.com/$h')),
      if (has(c.tikTok)) SocialLink(icon: HooIcons.tiktok, name: 'TikTok', uri: web(c.tikTok!, (h) => 'https://www.tiktok.com/@${h.replaceFirst('@', '')}')),
      if (has(c.telegram)) SocialLink(icon: HooIcons.telegram, name: 'Telegram', uri: web(c.telegram!, (h) => 'https://t.me/$h')),
      if (has(c.whatsApp)) SocialLink(icon: HooIcons.whatsapp, name: 'WhatsApp', uri: Uri.parse('https://wa.me/${digits(c.whatsApp!)}')),
      if (has(c.email))
        SocialLink(
          icon: HooIcons.email,
          name: emailLabel,
          uri: Uri(scheme: 'mailto', path: c.email!.trim()),
        ),
      if (has(c.phone))
        SocialLink(
          icon: HooIcons.phone,
          name: phoneLabel,
          uri: Uri(scheme: 'tel', path: c.phone.replaceAll(RegExp(r'[^\d+]'), '')),
        ),
    ];
  }
}

/// Row of monochrome icon buttons opening the store's socials and contacts.
class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({super.key, required this.contacts});

  final StoreContacts contacts;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final links = SocialLink.fromContacts(contacts, emailLabel: l.launchContactEmail, phoneLabel: l.launchContactPhone);
    if (links.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: HooSpacing.xs,
      runSpacing: HooSpacing.xs,
      children: [
        for (final link in links)
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.hoo.colors.border),
            ),
            child: HooIconButton(icon: link.icon, semanticLabel: l.launchOpenLink(link.name), onPressed: () => _open(context, link.uri)),
          ),
      ],
    );
  }

  Future<void> _open(BuildContext context, Uri uri) async {
    final failed = context.l10n.launchCannotOpenLink;
    var ok = false;
    try {
      ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } on Object {
      ok = false;
    }
    if (!ok && context.mounted) HooToast.show(context, failed, kind: HooAlertKind.error);
  }
}
