import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/onboarding_cubit.dart';
import '../launch_navigation.dart';
import '../widgets/language_options.dart';

/// First launch only: language choice (applied live) followed by three editorial slides.
@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => sl<OnboardingCubit>(), child: const _OnboardingView());
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _next(OnboardingState state) async {
    if (!state.isLast) {
      await _controller.nextPage(duration: context.hoo.motion(HooDurations.normal), curve: HooCurves.standard);
      return;
    }
    await _finish();
  }

  Future<void> _finish() async {
    final router = context.router;
    final cubit = context.read<OnboardingCubit>();
    final exit = await cubit.complete();
    if (!mounted) return;
    if (exit == OnboardingExit.main) {
      await LaunchNavigation.enterApp(router, sl<DeepLinkService>());
    } else {
      await LaunchNavigation.toWelcome(router);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.hoo.colors;
    final slides = [
      (l10n.launchOnboardingSlide1Eyebrow, l10n.launchOnboardingSlide1Title, l10n.launchOnboardingSlide1Body),
      (l10n.launchOnboardingSlide2Eyebrow, l10n.launchOnboardingSlide2Title, l10n.launchOnboardingSlide2Body),
      (l10n.launchOnboardingSlide3Eyebrow, l10n.launchOnboardingSlide3Title, l10n.launchOnboardingSlide3Body),
    ];
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.background,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen, vertical: HooSpacing.sm),
                  child: Row(
                    children: [
                      const HooLogo(),
                      const Spacer(),
                      if (!state.isLanguageStep && !state.isLast) TextButton(onPressed: _finish, child: Text(l10n.launchOnboardingSkip)),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: context.read<OnboardingCubit>().pageChanged,
                    children: [
                      _Page(
                        title: l10n.launchOnboardingLanguageTitle,
                        body: l10n.launchOnboardingLanguageBody,
                        child: LanguageOptions(selected: state.language, onSelected: context.read<OnboardingCubit>().selectLanguage, staggered: true),
                      ),
                      for (final s in slides) _Page(eyebrow: s.$1, title: s.$2, body: s.$3),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(HooSpacing.screen),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < OnboardingState.pageCount; i++)
                            AnimatedContainer(
                              duration: context.hoo.motion(HooDurations.normal),
                              margin: const EdgeInsets.symmetric(horizontal: HooSpacing.xxs),
                              width: i == state.page ? HooSpacing.lg : HooSpacing.xs,
                              height: HooSpacing.xs,
                              decoration: BoxDecoration(color: i == state.page ? colors.textPrimary : colors.border, borderRadius: HooRadius.pillAll),
                            ),
                        ],
                      ),
                      const SizedBox(height: HooSpacing.lg),
                      PrimaryButton(label: state.isLast ? l10n.launchOnboardingStart : l10n.commonContinue, onPressed: () => _next(state)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({this.eyebrow, required this.title, required this.body, this.child});

  final String? eyebrow;
  final String title;
  final String body;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    final text = context.hoo.text;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: HooSpacing.xl),
          if (eyebrow != null)
            HooReveal(
              child: Text(eyebrow!.toUpperCase(), style: text.label.copyWith(color: colors.textSecondary)),
            ),
          const SizedBox(height: HooSpacing.sm),
          HooReveal(index: 1, child: Text(title, style: text.h1)),
          const SizedBox(height: HooSpacing.sm),
          HooReveal(
            index: 1,
            child: Text(body, style: text.body.copyWith(color: colors.textSecondary)),
          ),
          if (child != null) ...[const SizedBox(height: HooSpacing.lg), child!],
        ],
      ),
    );
  }
}
