import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../bloc/auth_errors.dart';
import '../bloc/auth_form_bloc.dart';

/// Resolves a [FieldIssue] (local check or server message) to text.
String? issueText(BuildContext context, FieldIssue? issue) {
  if (issue == null) return null;
  if (issue.message != null) return issue.message;
  final l = context.l10n;
  return switch (issue.code!) {
    AuthFieldError.required => l.authErrRequired,
    AuthFieldError.invalidEmail => l.authErrInvalidEmail,
    AuthFieldError.invalidPhone => l.authErrInvalidPhone,
    AuthFieldError.invalidIdentifier => l.authErrInvalidIdentifier,
    AuthFieldError.weakPassword => l.authErrWeakPassword,
    AuthFieldError.termsRequired => l.authErrTerms,
    AuthFieldError.invalidCode => l.authErrInvalidCode,
  };
}

/// Page frame for the auth screens: back/close, title block, scrolling content, safe padding.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.title, this.subtitle, required this.children, this.showBack = true});

  final String title;
  final String? subtitle;
  final List<Widget> children;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: HooAppBar(showBack: showBack),
      body: SafeArea(
        child: HooConstrained(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HooReveal(child: Text(title, style: context.hoo.text.h1)),
                if (subtitle != null) ...[
                  const SizedBox(height: HooSpacing.xs),
                  HooReveal(
                    index: 1,
                    child: Text(subtitle!, style: context.hoo.text.body.copyWith(color: colors.textSecondary)),
                  ),
                ],
                const SizedBox(height: HooSpacing.lg),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// "or" divider + Google / Apple buttons (Apple only on iOS-capable providers).
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key, required this.state, required this.googleAvailable, required this.appleAvailable, required this.onPressed});

  final AuthFormState state;
  final bool googleAvailable;
  final bool appleAvailable;
  final ValueChanged<SocialProvider> onPressed;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    if (!googleAvailable && !appleAvailable) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: HooSpacing.lg),
        Row(
          children: [
            Expanded(child: Divider(color: context.hoo.colors.border)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: HooSpacing.sm),
              child: Text(l.authOr, style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary)),
            ),
            Expanded(child: Divider(color: context.hoo.colors.border)),
          ],
        ),
        const SizedBox(height: HooSpacing.lg),
        if (appleAvailable)
          SecondaryButton(
            label: l.authContinueWithApple,
            loading: state.social == SocialProvider.apple,
            onPressed: state.busy ? null : () => onPressed(SocialProvider.apple),
          ),
        if (appleAvailable && googleAvailable) const SizedBox(height: HooSpacing.sm),
        if (googleAvailable)
          SecondaryButton(
            label: l.authContinueWithGoogle,
            loading: state.social == SocialProvider.google,
            onPressed: state.busy ? null : () => onPressed(SocialProvider.google),
          ),
      ],
    );
  }
}

/// Plain text link button (secondary navigation inside forms).
class AuthLink extends StatelessWidget {
  const AuthLink({super.key, required this.label, required this.onPressed, this.prefix});

  final String label;
  final VoidCallback onPressed;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (prefix != null) Text('$prefix ', style: t.body.copyWith(color: c.textSecondary)),
        TextButton(
          onPressed: onPressed,
          child: Text(label, style: t.bodyStrong.copyWith(color: c.textPrimary)),
        ),
      ],
    );
  }
}

/// Server/network failure shown above a form (field errors sit under their inputs).
class FormErrorBanner extends StatelessWidget {
  const FormErrorBanner({super.key, required this.error});
  final Object? error;

  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: HooSpacing.md),
      child: InlineAlert(message: errorMessage(context, error!), kind: HooAlertKind.error),
    );
  }
}

/// Digits only (verification codes).
final digitsOnly = FilteringTextInputFormatter.digitsOnly;
