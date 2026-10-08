import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';

enum SignInChoice { signIn, signUp }

/// "Sign in to continue" — shown by `AuthGate.requireSignIn` for inline gates (heart, review, alerts…).
Future<SignInChoice?> showSignInSheet(BuildContext context, {String? reason}) {
  return showHooSheet<SignInChoice>(
    context,
    title: context.l10n.authGateTitle,
    builder: (sheetContext) {
      final l10n = sheetContext.l10n;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(reason ?? l10n.authGateBody, style: sheetContext.hoo.text.body.copyWith(color: sheetContext.hoo.colors.textSecondary)),
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton(label: l10n.authSignInSubmit, onPressed: () => Navigator.of(sheetContext).pop(SignInChoice.signIn)),
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(label: l10n.authCreateAccount, onPressed: () => Navigator.of(sheetContext).pop(SignInChoice.signUp)),
        ],
      );
    },
  );
}
