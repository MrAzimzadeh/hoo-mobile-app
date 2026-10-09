import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../core/storage/preferences.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';

/// First launch: language, then three editorial slides (the brand · design your own · fast delivery in Baku).
@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pages = PageController();
  int _index = 0;

  static const _images = ['assets/images/hero.jpg', 'assets/images/cat-design.jpg', 'assets/images/look-3.jpg'];

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await sl<Preferences>().setOnboardingDone();
    if (mounted) await context.router.replaceAll([const WelcomeRoute()]);
  }

  void _next() {
    if (_index >= _images.length) {
      _finish();
    } else {
      _pages.nextPage(duration: context.hoo.motion(HooDurations.medium), curve: HooCurves.emphasized);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final slides = [
      (l.launchSlideBrandTitle, l.launchSlideBrandBody),
      (l.launchSlideStudioTitle, l.launchSlideStudioBody),
      (l.launchSlideDeliveryTitle, l.launchSlideDeliveryBody),
    ];
    final total = slides.length + 1;
    return Scaffold(
      backgroundColor: HooPalette.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pages,
            itemCount: total,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) => i == 0
                ? const _LanguageStep()
                : _Slide(image: _images[i - 1], title: slides[i - 1].$1, body: slides[i - 1].$2, key: ValueKey(i)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(HooSpacing.screen),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HooLogo(variant: HooLogoVariant.light, size: 22),
                      const Spacer(),
                      if (_index > 0) HooTextButton(label: l.launchSkip, color: HooPalette.white, onPressed: _finish),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      for (var i = 0; i < total; i++)
                        AnimatedContainer(
                          duration: context.hoo.motion(HooDurations.normal),
                          curve: HooCurves.standard,
                          margin: const EdgeInsets.only(right: HooSpacing.xxs),
                          width: i == _index ? 24 : 8,
                          height: 2,
                          color: HooPalette.white.withValues(alpha: i == _index ? 1 : 0.35),
                        ),
                    ],
                  ),
                  const SizedBox(height: HooSpacing.lg),
                  Theme(
                    data: HooThemeData.dark(),
                    child: _index == total - 1
                        ? PrimaryButton.accent(label: l.launchGetStarted, onPressed: _next)
                        : PrimaryButton(label: l.commonContinue, onPressed: _next),
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

class _LanguageStep extends StatelessWidget {
  const _LanguageStep();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final current = context.watch<AppSettingsCubit>().state.language;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 120, HooSpacing.screen, 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HooTextReveal(child: Text(l.launchChooseLanguage, style: HooType.h1.copyWith(color: HooPalette.white))),
            const SizedBox(height: HooSpacing.xl),
            for (final (i, lang) in AppLanguage.values.indexed)
              HooReveal(
                index: i + 1,
                child: HooPressable(
                  onTap: () => context.read<AppSettingsCubit>().setLanguage(lang),
                  semanticLabel: lang.nativeName,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: HooSpacing.md),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HooPalette.white.withValues(alpha: 0.15)))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            lang.nativeName,
                            style: HooType.h2.copyWith(color: lang == current ? HooPalette.white : HooPalette.white.withValues(alpha: 0.45)),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: lang == current ? 1 : 0,
                          duration: context.hoo.motion(HooDurations.fast),
                          child: const Icon(HooIcons.check, color: HooPalette.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({super.key, required this.image, required this.title, required this.body});

  final String image;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        HooImageReveal(child: Image.asset(image, fit: BoxFit.cover)),
        ColoredBox(color: HooPalette.black.withValues(alpha: 0.4)),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HooTextReveal(delay: HooDurations.stagger * 2, child: Text(title, style: HooType.hero.copyWith(color: HooPalette.white))),
                const SizedBox(height: HooSpacing.md),
                HooReveal(index: 4, child: Text(body, style: HooType.body.copyWith(color: HooPalette.white.withValues(alpha: 0.85)))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
