import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../application/social_sign_in.dart';
import '../../domain/auth_models.dart';
import '../../domain/auth_repository.dart';
import '../cubit/auth_submit_cubit.dart';

/// Reports the outcome of an auth page opened with `onResult` (access guard or "sign in to continue"): `true` once,
/// on success; `false` when the page goes away without success. [handOff] passes the duty to the next auth page.
mixin AuthResultReporter<T extends StatefulWidget> on State<T> {
  void Function(bool success)? get onResult;
  bool _reported = false;

  void handOff() => _reported = true;

  /// After a successful sign-in: report and close (embedded flow), or enter the app (standalone flow).
  void completeAuth(AuthResult result) {
    final cb = onResult;
    if (cb != null) {
      _reported = true;
      cb(true);
      context.router.maybePop(true);
      return;
    }
    _reported = true;
    if (result.isNewUser) {
      context.router.replaceAll([StyleProfileRoute(onboarding: true)]);
    } else {
      context.router.replaceAll([const MainShellRoute()]);
    }
  }

  @override
  void dispose() {
    if (!_reported) onResult?.call(false);
    super.dispose();
  }
}

/// Editorial header of the auth screens: small wordmark, big title, optional subtitle.
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HooReveal(child: HooLogo(size: 22)),
        const SizedBox(height: HooSpacing.xl),
        HooTextReveal(child: Semantics(header: true, child: Text(title, style: context.hoo.text.h1))),
        if (subtitle != null) ...[
          const SizedBox(height: HooSpacing.xs),
          HooReveal(index: 1, child: Text(subtitle!, style: context.hoo.text.bodySecondary)),
        ],
      ],
    );
  }
}

/// Error block for an auth form: server message (non-field errors) or the 429 countdown.
class AuthErrorBlock extends StatelessWidget {
  const AuthErrorBlock({super.key, required this.state, this.fields = const []});

  final AuthSubmitState state;

  /// Field names rendered inline by the form (their errors are not repeated here).
  final List<String> fields;

  @override
  Widget build(BuildContext context) {
    final e = state.error;
    if (e == null) return const SizedBox.shrink();
    final api = state.apiError;
    if (api != null && api.fieldErrors.isNotEmpty && api.fieldErrors.keys.every((k) => fields.any((f) => f.toLowerCase() == k.toLowerCase()))) {
      return const SizedBox.shrink();
    }
    if (state.throttled) {
      return Padding(
        padding: const EdgeInsets.only(top: HooSpacing.md),
        child: RetryCountdown(
          until: state.retryAt!,
          builder: (context, left) => InlineAlert(kind: HooAlertKind.warning, message: context.l10n.errorTooManyRequests(left.inSeconds)),
        ),
      );
    }
    return Padding(padding: const EdgeInsets.only(top: HooSpacing.md), child: InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, e)));
  }
}

/// "or" divider + Google / Apple buttons. Social sign-ups accept the terms by continuing (stated under the buttons).
class SocialSignInButtons extends StatelessWidget {
  const SocialSignInButtons({super.key, required this.onResult});

  final void Function(AuthResult result) onResult;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final social = sl<SocialSignIn>();
    final repo = sl<AuthRepository>();
    final cubit = context.read<AuthSubmitCubit>();

    Future<void> run(Future<AuthResult> Function() call) async {
      try {
        final r = await cubit.submit(call);
        if (r != null) onResult(r);
      } on SocialSignInUnavailable catch (e) {
        if (!e.cancelled && context.mounted) HooToast.show(context, l.authSocialUnavailable);
      }
    }

    Future<AuthResult> google() async => repo.google(idToken: await social.googleIdToken(), acceptTerms: true);
    Future<AuthResult> apple() async {
      final c = await social.appleCredential();
      return repo.apple(identityToken: c.identityToken, fullName: c.fullName, acceptTerms: true);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: context.hoo.colors.border)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: HooSpacing.sm), child: Text(l.authOr.toUpperCase(), style: context.hoo.text.labelSecondary)),
            Expanded(child: Divider(color: context.hoo.colors.border)),
          ],
        ),
        const SizedBox(height: HooSpacing.md),
        SecondaryButton(label: l.authContinueWithGoogle, onPressed: () => run(google)),
        if (social.appleAvailable) ...[
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(label: l.authContinueWithApple, onPressed: () => run(apple)),
        ],
        const SizedBox(height: HooSpacing.sm),
        Text(l.authSocialTerms, textAlign: TextAlign.center, style: context.hoo.text.caption),
      ],
    );
  }
}
