import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../auth_flow.dart';

/// Landing for signed-out users after onboarding (or after a 401): sign in, create an account, or browse as guest.
@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final router = context.router;
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      body: SafeArea(
        child: HooConstrained(
          child: Padding(
            padding: const EdgeInsets.all(HooSpacing.screen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: HooSpacing.md),
                const Align(alignment: Alignment.centerLeft, child: HooLogo()),
                const Spacer(),
                HooReveal(child: Text(l.authWelcomeTitle, style: context.hoo.text.display)),
                const SizedBox(height: HooSpacing.sm),
                HooReveal(
                  index: 1,
                  child: Text(l.authWelcomeBody, style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary)),
                ),
                const SizedBox(height: HooSpacing.xl),
                HooReveal(
                  index: 2,
                  child: PrimaryButton(
                    label: l.authSignInSubmit,
                    onPressed: () => router.push(SignInRoute(onResult: AuthFlow.intoApp(router))),
                  ),
                ),
                const SizedBox(height: HooSpacing.sm),
                HooReveal(
                  index: 3,
                  child: SecondaryButton(
                    label: l.authCreateAccount,
                    onPressed: () => router.push(SignUpRoute(onResult: AuthFlow.intoApp(router))),
                  ),
                ),
                const SizedBox(height: HooSpacing.xs),
                HooReveal(
                  index: 4,
                  child: TextButton(
                    onPressed: () => router.replaceAll([const MainShellRoute()]),
                    child: Text(l.authWelcomeGuest, style: context.hoo.text.bodyStrong.copyWith(color: context.hoo.colors.textPrimary)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
