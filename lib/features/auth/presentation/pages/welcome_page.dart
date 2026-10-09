import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';

/// Welcome: full-bleed editorial image, wordmark, Sign in / Create account / Continue as guest.
@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: HooPalette.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const HooImageReveal(child: Image(image: AssetImage('assets/images/look-1.jpg'), fit: BoxFit.cover)),
          ColoredBox(color: HooPalette.black.withValues(alpha: 0.45)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(HooSpacing.screen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    children: [
                      HooReveal(child: HooLogo(variant: HooLogoVariant.light, size: 28)),
                      Spacer(),
                      _LanguageChip(),
                    ],
                  ),
                  const Spacer(),
                  HooTextReveal(
                    delay: HooDurations.stagger * 2,
                    child: Text(l.authWelcomeTitle, style: HooType.hero.copyWith(color: HooPalette.white)),
                  ),
                  const SizedBox(height: HooSpacing.sm),
                  HooReveal(
                    index: 3,
                    child: Text(l.authWelcomeSubtitle, style: HooType.body.copyWith(color: HooPalette.white.withValues(alpha: 0.85))),
                  ),
                  const SizedBox(height: HooSpacing.xl),
                  HooReveal(
                    index: 4,
                    child: Theme(
                      data: HooThemeData.dark(),
                      child: Builder(
                        builder: (context) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PrimaryButton.accent(label: l.commonCreateAccount, onPressed: () => context.router.push(SignUpRoute())),
                            const SizedBox(height: HooSpacing.sm),
                            SecondaryButton(label: l.commonSignIn, onPressed: () => context.router.push(SignInRoute())),
                            const SizedBox(height: HooSpacing.xs),
                            Center(
                              child: HooTextButton(
                                label: l.commonContinueAsGuest,
                                color: HooPalette.white,
                                onPressed: () => context.router.replaceAll([const MainShellRoute()]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip();

  @override
  Widget build(BuildContext context) {
    final current = context.watch<AppSettingsCubit>().state.language;
    return PopupMenuButton<AppLanguage>(
      tooltip: '',
      color: HooPalette.black,
      onSelected: (lang) => context.read<AppSettingsCubit>().setLanguage(lang),
      itemBuilder: (_) => [
        for (final lang in AppLanguage.values)
          PopupMenuItem(value: lang, child: Text(lang.nativeName, style: HooType.body.copyWith(color: HooPalette.white))),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.sm, vertical: HooSpacing.xs),
        decoration: BoxDecoration(borderRadius: HooRadius.pillAll, border: Border.all(color: HooPalette.white.withValues(alpha: 0.5))),
        child: Text(current.wire.toUpperCase(), style: HooType.label.copyWith(color: HooPalette.white)),
      ),
    );
  }
}
