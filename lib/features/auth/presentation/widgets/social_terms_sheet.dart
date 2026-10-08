import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';

/// Shown when a Google / Apple identity has no HOO account yet (`auth.terms_required`): accept the terms to
/// create it. Resolves `true` when accepted.
Future<bool> showSocialTermsSheet(BuildContext context) async {
  final accepted = await showHooSheet<bool>(
    context,
    title: context.l10n.authTermsPromptTitle,
    builder: (sheetContext) {
      final l = sheetContext.l10n;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.authTermsPromptBody, style: sheetContext.hoo.text.body.copyWith(color: sheetContext.hoo.colors.textSecondary)),
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton(label: l.authTermsPromptAccept, onPressed: () => Navigator.of(sheetContext).pop(true)),
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(label: l.commonCancel, onPressed: () => Navigator.of(sheetContext).pop(false)),
        ],
      );
    },
  );
  return accepted ?? false;
}
