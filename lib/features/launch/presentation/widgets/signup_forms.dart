import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/contact_input.dart';
import '../../domain/launch_models.dart';
import '../cubit/launch_forms_cubit.dart';

String? _fieldError(BuildContext context, SignupFormState<Object?> s) {
  final l = context.l10n;
  return switch (s.fieldError) {
        ContactError.required => l.fieldRequired,
        ContactError.invalidEmail => l.fieldInvalidEmail,
        ContactError.invalidPhone => l.fieldInvalidPhone,
        null => null,
      } ??
      s.fieldMessage;
}

/// "Join the waitlist": one field (email or +994 phone) → "You are #position of total". Expects a [WaitlistCubit]
/// above it. The page's single green CTA.
class WaitlistForm extends StatefulWidget {
  const WaitlistForm({super.key, this.onJoined});

  final ValueChanged<WaitlistJoined>? onJoined;

  @override
  State<WaitlistForm> createState() => _WaitlistFormState();
}

class _WaitlistFormState extends State<WaitlistForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    context.read<WaitlistCubit>().submit(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<WaitlistCubit, SignupFormState<WaitlistJoined>>(
      listenWhen: (a, b) => a.status != b.status && b.status == SubmitStatus.success,
      listener: (context, state) {
        HooHaptics.light();
        final joined = state.result;
        if (joined != null) widget.onJoined?.call(joined);
      },
      builder: (context, state) {
        final joined = state.status == SubmitStatus.success ? state.result : null;
        return AnimatedSwitcher(
          duration: context.hoo.motion(HooDurations.medium),
          switchInCurve: HooCurves.enter,
          switchOutCurve: HooCurves.exit,
          child: joined != null
              ? _SuccessNote(
                  key: const ValueKey('joined'),
                  message: joined.alreadyJoined
                      ? l.launchWaitlistAlready(joined.position, joined.total)
                      : l.launchWaitlistJoined(joined.position, joined.total),
                )
              : Column(
                  key: const ValueKey('form'),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HooTextField(
                      controller: _controller,
                      label: l.launchWaitlistField,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.email, AutofillHints.telephoneNumber],
                      errorText: _fieldError(context, state),
                      enabled: !state.submitting,
                      onChanged: (_) => context.read<WaitlistCubit>().edited(),
                      onSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: HooSpacing.sm),
                    PrimaryButton.accent(label: l.launchWaitlistJoin, loading: state.submitting, onPressed: state.throttled ? null : _submit),
                    _FormFootnote(state: state, onThrottleEnded: context.read<WaitlistCubit>().throttleEnded),
                  ],
                ),
        );
      },
    );
  }
}

/// Newsletter sign-up (`POST /newsletter`). Expects a [NewsletterCubit] above it.
class NewsletterForm extends StatefulWidget {
  const NewsletterForm({super.key});

  @override
  State<NewsletterForm> createState() => _NewsletterFormState();
}

class _NewsletterFormState extends State<NewsletterForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    context.read<NewsletterCubit>().submit(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<NewsletterCubit, SignupFormState<bool>>(
      builder: (context, state) {
        final done = state.status == SubmitStatus.success;
        return AnimatedSwitcher(
          duration: context.hoo.motion(HooDurations.medium),
          switchInCurve: HooCurves.enter,
          switchOutCurve: HooCurves.exit,
          child: done
              ? _SuccessNote(key: const ValueKey('done'), message: state.result == true ? l.launchNewsletterAlready : l.launchNewsletterDone)
              : Column(
                  key: const ValueKey('form'),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HooTextField(
                      controller: _controller,
                      label: l.launchNewsletterField,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.email],
                      errorText: _fieldError(context, state),
                      enabled: !state.submitting,
                      onChanged: (_) => context.read<NewsletterCubit>().edited(),
                      onSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: HooSpacing.sm),
                    SecondaryButton(label: l.launchNewsletterSubscribe, loading: state.submitting, onPressed: state.throttled ? null : _submit),
                    _FormFootnote(state: state, onThrottleEnded: context.read<NewsletterCubit>().throttleEnded),
                  ],
                ),
        );
      },
    );
  }
}

/// 429 countdown or a non-field error under the button.
class _FormFootnote extends StatelessWidget {
  const _FormFootnote({required this.state, required this.onThrottleEnded});

  final SignupFormState<Object?> state;
  final VoidCallback onThrottleEnded;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    final until = state.retryUntil;
    Widget? child;
    if (until != null) {
      child = RetryCountdown(
        until: until,
        onDone: onThrottleEnded,
        builder: (context, left) => Text(context.l10n.launchRetryIn(HooFormat.countdown(left)), style: context.hoo.text.caption.copyWith(color: colors.error)),
      );
    } else if (state.error != null) {
      child = Text(errorMessage(context, state.error!), style: context.hoo.text.caption.copyWith(color: colors.error));
    }
    return AnimatedSize(
      duration: context.hoo.motion(HooDurations.normal),
      curve: HooCurves.standard,
      alignment: Alignment.topLeft,
      child: child == null
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.only(top: HooSpacing.xs),
              child: Semantics(liveRegion: true, child: child),
            ),
    );
  }
}

class _SuccessNote extends StatelessWidget {
  const _SuccessNote({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(HooSpacing.md),
        decoration: BoxDecoration(
          color: colors.accentTint,
          borderRadius: HooRadius.cardAll,
          border: Border.all(color: colors.accent),
        ),
        child: Row(
          children: [
            Icon(HooIcons.checkCircle, color: colors.textPrimary, size: HooSize.icon),
            const SizedBox(width: HooSpacing.sm),
            Expanded(child: Text(message, style: context.hoo.text.bodyStrong)),
          ],
        ),
      ),
    );
  }
}
