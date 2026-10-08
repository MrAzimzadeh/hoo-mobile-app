import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/coming_soon_cubit.dart';
import '../cubit/launch_forms_cubit.dart';
import '../launch_navigation.dart';
import '../widgets/language_options.dart';
import '../widgets/launch_countdown.dart';
import '../widgets/signup_forms.dart';
import '../widgets/social_links.dart';

/// Pre-launch experience (store mode `ComingSoon`, SPEC §6.2): campaign image, server copy and perks, countdown to
/// `launchAt`, live waitlist counter, waitlist + newsletter sign-up, socials, and a discreet staff sign-in that lets
/// staff into the app. Always on black, like the splash.
@RoutePage()
class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HooThemeData.dark(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ComingSoonCubit>()..load()),
          BlocProvider(create: (_) => sl<WaitlistCubit>()),
          BlocProvider(create: (_) => sl<NewsletterCubit>()),
        ],
        child: const _ComingSoonView(),
      ),
    );
  }
}

class _ComingSoonView extends StatelessWidget {
  const _ComingSoonView();

  Future<void> _staffSignIn(BuildContext context) async {
    final router = context.router;
    final noAccess = context.l10n.launchStaffNoAccess;
    final messengerContext = context;
    await router.push(
      SignInRoute(
        onResult: (ok) {
          if (!ok) return;
          final auth = sl<AuthGate>();
          if (auth.currentUser?.isStaff ?? false) {
            LaunchNavigation.enterApp(router, sl<DeepLinkService>());
          } else if (messengerContext.mounted) {
            HooToast.show(messengerContext, noAccess, kind: HooAlertKind.warning);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocListener<ComingSoonCubit, ComingSoonState>(
        listenWhen: (a, b) => !a.storeLive && b.storeLive,
        listener: (context, _) => LaunchNavigation.enterApp(context.router, sl<DeepLinkService>()),
        child: Scaffold(
          backgroundColor: colors.background,
          body: BlocBuilder<ComingSoonCubit, ComingSoonState>(
            builder: (context, state) {
              final cubit = context.read<ComingSoonCubit>();
              return RefreshIndicator(
                color: colors.textPrimary,
                backgroundColor: colors.surface,
                onRefresh: cubit.checkLaunch,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(child: _TopBar(onStaffSignIn: () => _staffSignIn(context))),
                    SliverToBoxAdapter(child: OfflineBanner(visible: state.stale)),
                    const SliverToBoxAdapter(child: _CampaignImage()),
                    SliverToBoxAdapter(
                      child: HooConstrained(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.xl, HooSpacing.screen, HooSpacing.xxl),
                          child: _Body(state: state, onStaffSignIn: () => _staffSignIn(context)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onStaffSignIn});

  final VoidCallback onStaffSignIn;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.xs, HooSpacing.xs, HooSpacing.xs),
        child: Row(
          children: [
            // Hidden staff entrance: long-press the wordmark.
            GestureDetector(
              onLongPress: onStaffSignIn,
              child: const HooLogo(variant: HooLogoVariant.light),
            ),
            const Spacer(),
            HooIconButton(icon: HooIcons.globe, semanticLabel: l.launchLanguage, onPressed: () => showLanguageSheet(context, sl<AppSettingsCubit>())),
          ],
        ),
      ),
    );
  }
}

class _CampaignImage extends StatelessWidget {
  const _CampaignImage();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: HooSize.productImageAspect,
      child: ClipRect(
        child: HooImageReveal(
          child: Image.asset('assets/images/look-1.jpg', fit: BoxFit.cover, alignment: Alignment.topCenter, excludeFromSemantics: true),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state, required this.onStaffSignIn});

  final ComingSoonState state;
  final VoidCallback onStaffSignIn;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final colors = context.hoo.colors;
    final cubit = context.read<ComingSoonCubit>();
    final content = state.content;
    final launchAt = content?.launchAt;
    final loading = state.status == ComingSoonStatus.loading;
    final title = (content?.title.trim().isNotEmpty ?? false) ? content!.title : l.launchComingSoonFallbackTitle;
    final subtitle = (content?.subtitle.trim().isNotEmpty ?? false) ? content!.subtitle : l.launchComingSoonFallbackSubtitle;
    final upcoming = launchAt != null && launchAt.isAfter(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HooReveal(
          child: Row(
            children: [
              Container(
                width: HooSpacing.xs,
                height: HooSpacing.xs,
                decoration: BoxDecoration(color: colors.success, shape: BoxShape.circle),
              ),
              const SizedBox(width: HooSpacing.xs),
              Expanded(
                child: Text(
                  (launchAt == null ? l.launchComingSoonEyebrow : l.launchComingSoonOpensOn(_date(context, launchAt))).toUpperCase(),
                  style: context.hoo.text.labelSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: HooSpacing.md),
        if (loading) ...[
          const HooSkeleton(height: HooSpacing.xxl),
          const SizedBox(height: HooSpacing.sm),
          const HooSkeleton(height: HooSpacing.md),
          const SizedBox(height: HooSpacing.xs),
          const FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.7,
            child: HooSkeleton(height: HooSpacing.md),
          ),
        ] else ...[
          HooTextReveal(
            key: ValueKey(title),
            child: Text(title, style: context.hoo.text.hero),
          ),
          const SizedBox(height: HooSpacing.sm),
          HooReveal(index: 1, child: Text(subtitle, style: context.hoo.text.bodySecondary)),
        ],
        if (state.status == ComingSoonStatus.failure && state.error != null) ...[
          const SizedBox(height: HooSpacing.md),
          InlineAlert(message: errorMessage(context, state.error!), kind: HooAlertKind.error, action: l.commonRetry, onAction: cubit.load),
        ],
        if (upcoming) ...[
          const SizedBox(height: HooSpacing.lg),
          HooReveal(
            index: 2,
            child: LaunchCountdown(launchAt: launchAt, onReached: cubit.checkLaunch),
          ),
        ],
        const SizedBox(height: HooSpacing.xl),
        HooReveal(index: 3, child: _WaitlistSection(state: state)),
        if (content != null && content.perks.isNotEmpty) ...[
          const SizedBox(height: HooSpacing.lg),
          for (final (i, perk) in content.perks.indexed)
            HooReveal(
              index: 4 + i,
              child: _Perk(text: perk),
            ),
        ],
        const SizedBox(height: HooSpacing.xl),
        Divider(color: colors.border, height: HooSize.borderWidth, thickness: HooSize.borderWidth),
        const SizedBox(height: HooSpacing.xl),
        Text(l.launchNewsletterTitle, style: context.hoo.text.h3),
        const SizedBox(height: HooSpacing.xxs),
        Text(l.launchNewsletterBody, style: context.hoo.text.caption),
        const SizedBox(height: HooSpacing.md),
        const NewsletterForm(),
        const SizedBox(height: HooSpacing.xl),
        Text(l.launchFollow.toUpperCase(), style: context.hoo.text.labelSecondary),
        const SizedBox(height: HooSpacing.sm),
        SocialLinksRow(contacts: content?.contacts ?? cubit.fallbackContacts),
        const SizedBox(height: HooSpacing.xl),
        Align(
          alignment: Alignment.centerLeft,
          child: HooTextButton(label: l.launchStaffSignIn, color: colors.textTertiary, style: HooType.caption, onPressed: onStaffSignIn),
        ),
      ],
    );
  }

  static String _date(BuildContext context, DateTime d) {
    final lang = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMMd(lang == 'az' || lang == 'ru' || lang == 'tr' ? lang : 'en').format(d.toLocal());
  }
}

class _WaitlistSection extends StatelessWidget {
  const _WaitlistSection({required this.state});

  final ComingSoonState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final total = state.waitlistTotal;
    final today = state.count?.today ?? 0;
    final number = NumberFormat.decimalPattern(Localizations.localeOf(context).languageCode);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l.launchWaitlistTitle, style: context.hoo.text.h2),
        const SizedBox(height: HooSpacing.xxs),
        Text(l.launchWaitlistBody, style: context.hoo.text.caption),
        const SizedBox(height: HooSpacing.md),
        WaitlistForm(onJoined: context.read<ComingSoonCubit>().waitlistJoined),
        if (total > 0) ...[
          const SizedBox(height: HooSpacing.sm),
          AnimatedSwitcher(
            duration: context.hoo.motion(HooDurations.normal),
            child: Text.rich(
              key: ValueKey('$total-$today'),
              TextSpan(
                children: [
                  TextSpan(text: l.launchWaitlistCount(total).replaceFirst('$total', number.format(total)), style: context.hoo.text.captionPrimary),
                  if (today > 0) TextSpan(text: '  ·  ${l.launchWaitlistToday(today)}', style: context.hoo.text.caption),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _Perk extends StatelessWidget {
  const _Perk({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: HooSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(HooIcons.check, size: HooSize.iconSmall, color: context.hoo.colors.textPrimary),
          const SizedBox(width: HooSpacing.sm),
          Expanded(child: Text(text, style: context.hoo.text.body)),
        ],
      ),
    );
  }
}
