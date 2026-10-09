import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/localization/content_strings.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/widgets/contact_links.dart';
import '../cubit/coming_soon_cubit.dart';

/// Pre-launch experience: countdown, perks, waitlist (email or phone), newsletter, socials, hidden staff sign-in.
@RoutePage()
class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ComingSoonCubit>()..load(),
      child: Theme(data: HooThemeData.dark(), child: const _ComingSoonView()),
    );
  }
}

class _ComingSoonView extends StatelessWidget {
  const _ComingSoonView();

  Future<void> _staffSignIn(BuildContext context) async {
    final router = context.router;
    await router.push(SignInRoute(onResult: (ok) {
      if (ok && (sl<AuthGate>().currentUser?.isStaff ?? false)) router.replaceAll([const MainShellRoute()]);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final content = sl<ContentStrings>();
    return Scaffold(
      backgroundColor: HooPalette.green,
      body: BlocBuilder<ComingSoonCubit, ComingSoonState>(
        builder: (context, s) {
          final c = s.content;
          // admin may leave some perks untranslated → skip empty ones
          final perks = c?.perks.where((p) => p.trim().isNotEmpty).toList() ?? const <String>[];
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                const HooReveal(child: HooLogo(variant: HooLogoVariant.onGreen, size: 32)),
                const SizedBox(height: HooSpacing.xxl),
                HooTextReveal(
                  child: Text(
                    (c?.title.isNotEmpty ?? false) ? c!.title : content.text('comingSoon.title', l.launchComingSoonTitle),
                    style: HooType.hero.copyWith(color: HooPalette.white),
                  ),
                ),
                const SizedBox(height: HooSpacing.md),
                HooReveal(
                  index: 2,
                  child: Text(
                    (c?.subtitle.isNotEmpty ?? false) ? c!.subtitle : content.text('comingSoon.subtitle', l.launchComingSoonSubtitle),
                    style: HooType.body.copyWith(color: HooPalette.white.withValues(alpha: 0.85)),
                  ),
                ),
                if (c?.launchAt != null) ...[
                  const SizedBox(height: HooSpacing.xl),
                  HooReveal(index: 3, child: _Countdown(launchAt: c!.launchAt!)),
                ],
                if (perks.isNotEmpty) ...[
                  const SizedBox(height: HooSpacing.xl),
                  for (final (i, perk) in perks.indexed)
                    HooReveal(
                      index: 4 + i,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(HooIcons.check, color: HooPalette.white, size: HooSize.iconSmall),
                            const SizedBox(width: HooSpacing.sm),
                            Expanded(child: Text(perk, style: HooType.body.copyWith(color: HooPalette.white))),
                          ],
                        ),
                      ),
                    ),
                ],
                const SizedBox(height: HooSpacing.xl),
                const _WaitlistForm(),
                const SizedBox(height: HooSpacing.xl),
                const _NewsletterForm(),
                if (s.loadError != null) ...[
                  const SizedBox(height: HooSpacing.md),
                  InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, s.loadError!), action: l.commonRetry, onAction: () => context.read<ComingSoonCubit>().load()),
                ],
                const SizedBox(height: HooSpacing.xl),
                ContactIconsRow(contacts: c?.contacts ?? sl<StoreInfoProvider>().info.contacts, color: HooPalette.white),
                const SizedBox(height: HooSpacing.lg),
                Center(
                  child: HooTextButton(
                    label: l.launchStaffSignIn,
                    color: HooPalette.white.withValues(alpha: 0.6),
                    style: HooType.caption,
                    onPressed: () => _staffSignIn(context),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Countdown extends StatefulWidget {
  const _Countdown({required this.launchAt});
  final DateTime launchAt;

  @override
  State<_Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<_Countdown> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    var left = widget.launchAt.difference(DateTime.now());
    if (left.isNegative) left = Duration.zero;
    final parts = [
      (left.inDays, l.launchDays),
      (left.inHours % 24, l.launchHours),
      (left.inMinutes % 60, l.launchMinutes),
      (left.inSeconds % 60, l.launchSeconds),
    ];
    return Semantics(
      label: l.launchCountdownA11y(left.inDays, left.inHours % 24, left.inMinutes % 60),
      excludeSemantics: true,
      child: Row(
        children: [
          for (final (value, unit) in parts)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value.toString().padLeft(2, '0'), style: HooType.display.copyWith(color: HooPalette.white, fontFeatures: const [FontFeature.tabularFigures()])),
                  Text(unit.toUpperCase(), style: HooType.label.copyWith(color: HooPalette.white.withValues(alpha: 0.7))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _WaitlistForm extends StatefulWidget {
  const _WaitlistForm();

  @override
  State<_WaitlistForm> createState() => _WaitlistFormState();
}

class _WaitlistFormState extends State<_WaitlistForm> {
  bool _byPhone = false;
  final _email = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<ComingSoonCubit>();
    return BlocBuilder<ComingSoonCubit, ComingSoonState>(
      builder: (context, s) {
        final joined = s.joined;
        return Container(
          padding: const EdgeInsets.all(HooSpacing.lg),
          decoration: BoxDecoration(color: HooPalette.black.withValues(alpha: 0.35), borderRadius: HooRadius.cardAll),
          child: AnimatedSwitcher(
            duration: context.hoo.motion(HooDurations.medium),
            child: joined != null
                ? Column(
                    key: const ValueKey('joined'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HooSuccessCheck(size: 48),
                      const SizedBox(height: HooSpacing.md),
                      Text(l.launchWaitlistPosition(joined.position, joined.total), style: context.hoo.text.h2),
                      const SizedBox(height: HooSpacing.xs),
                      Text(joined.alreadyJoined ? l.launchWaitlistAlready : l.launchWaitlistThanks, style: context.hoo.text.bodySecondary),
                    ],
                  )
                : Column(
                    key: const ValueKey('form'),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(l.launchWaitlistTitle, style: context.hoo.text.h2),
                      if (s.count != null && s.count!.total > 0) ...[
                        const SizedBox(height: HooSpacing.xxs),
                        Text(l.launchWaitlistCount(s.count!.total), style: context.hoo.text.caption),
                      ],
                      const SizedBox(height: HooSpacing.md),
                      Row(
                        children: [
                          OptionChip(label: l.authEmailLabel, selected: !_byPhone, style: OptionChipStyle.tint, onTap: () => setState(() => _byPhone = false)),
                          const SizedBox(width: HooSpacing.xs),
                          OptionChip(label: l.authPhoneLabel, selected: _byPhone, style: OptionChipStyle.tint, onTap: () => setState(() => _byPhone = true)),
                        ],
                      ),
                      const SizedBox(height: HooSpacing.md),
                      if (_byPhone)
                        HooPhoneField(controller: _phone, errorText: s.joinError?.fieldError('phone'))
                      else
                        HooTextField(
                          controller: _email,
                          hint: 'you@example.com',
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          errorText: s.joinError?.fieldError('email'),
                        ),
                      if (s.joinError != null && s.joinError!.fieldErrors.isEmpty) ...[
                        const SizedBox(height: HooSpacing.sm),
                        InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, s.joinError!)),
                      ],
                      const SizedBox(height: HooSpacing.md),
                      PrimaryButton(
                        label: l.launchJoinWaitlist,
                        loading: s.joining,
                        onPressed: () => _byPhone
                            ? cubit.join(phone: HooFormat.phoneWire(_phone.text))
                            : cubit.join(email: _email.text.trim()),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _NewsletterForm extends StatefulWidget {
  const _NewsletterForm();

  @override
  State<_NewsletterForm> createState() => _NewsletterFormState();
}

class _NewsletterFormState extends State<_NewsletterForm> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<ComingSoonCubit, ComingSoonState>(
      builder: (context, s) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l.launchNewsletterTitle, style: context.hoo.text.h3),
          const SizedBox(height: HooSpacing.sm),
          if (s.newsletterDone)
            InlineAlert(kind: HooAlertKind.success, message: l.launchNewsletterDone)
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: HooTextField(
                    controller: _email,
                    hint: 'you@example.com',
                    keyboardType: TextInputType.emailAddress,
                    errorText: s.newsletterError == null ? null : (s.newsletterError!.fieldError('email') ?? errorMessage(context, s.newsletterError!)),
                  ),
                ),
                const SizedBox(width: HooSpacing.sm),
                SecondaryButton(label: l.launchSubscribe, expand: false, loading: s.newsletterBusy, onPressed: () => context.read<ComingSoonCubit>().subscribe(_email.text)),
              ],
            ),
        ],
      ),
    );
  }
}
