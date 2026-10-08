import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../data/social_identity_provider.dart';
import '../auth_flow.dart';
import '../bloc/auth_form_bloc.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/social_terms_sheet.dart';

/// Email or phone + password, plus SMS code and Google / Apple.
@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key, this.onResult});

  /// Set by the access guard: called with `true` once signed in so navigation resumes where it was.
  final void Function(bool success)? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthFormBloc>(),
      child: _SignInView(onResult: onResult),
    );
  }
}

class _SignInView extends StatefulWidget {
  const _SignInView({this.onResult});
  final void Function(bool success)? onResult;

  @override
  State<_SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<_SignInView> {
  final _identifier = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _identifier.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() => context.read<AuthFormBloc>().add(SignInSubmitted(identifier: _identifier.text, password: _password.text));

  Future<void> _onState(BuildContext context, AuthFormState state) async {
    final bloc = context.read<AuthFormBloc>();
    if (state.succeeded) {
      AuthFlow.finish(context, onResult: widget.onResult, offerStyleProfile: state.isNewUser);
    } else if (state.termsPending != null) {
      final accepted = await showSocialTermsSheet(context);
      bloc.add(accepted ? const SocialTermsAccepted() : const SocialTermsDeclined());
    } else if (state.socialFailed) {
      HooToast.show(context, context.l10n.authSocialFailed, kind: HooAlertKind.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final router = context.router;
    final social = sl<SocialIdentityProvider>();
    return BlocConsumer<AuthFormBloc, AuthFormState>(
      listener: _onState,
      builder: (context, state) {
        final bloc = context.read<AuthFormBloc>();
        return AuthScaffold(
          title: l.authSignInTitle,
          subtitle: l.authSignInSubtitle,
          children: [
            FormErrorBanner(error: state.error),
            HooTextField(
              controller: _identifier,
              label: l.authIdentifierLabel,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.username],
              errorText: issueText(context, state.fieldErrors['identifier']),
              onChanged: (_) => bloc.add(const AuthFieldEdited('identifier')),
            ),
            const SizedBox(height: HooSpacing.md),
            HooTextField.password(
              controller: _password,
              label: l.authPasswordLabel,
              textInputAction: TextInputAction.done,
              errorText: issueText(context, state.fieldErrors['password']),
              onChanged: (_) => bloc.add(const AuthFieldEdited('password')),
              onSubmitted: (_) => _submit(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () => router.push(const ForgotPasswordRoute()), child: Text(l.authForgotLink)),
            ),
            const SizedBox(height: HooSpacing.xs),
            if (state.lockedUntil != null && state.lockedUntil!.isAfter(DateTime.now()))
              RetryCountdown(
                until: state.lockedUntil!,
                builder: (context, remaining) => PrimaryButton(label: l.errorTooManyRequests(remaining.inSeconds + 1)),
              )
            else
              PrimaryButton(label: l.authSignInSubmit, loading: state.busy && state.social == null, onPressed: state.busy ? null : _submit),
            const SizedBox(height: HooSpacing.sm),
            SecondaryButton(
              label: l.authSignInWithSms,
              onPressed: state.busy
                  ? null
                  : () =>
                        router.push(OtpRoute(onResult: AuthFlow.subFlow(router, SignInRoute.name, () => AuthFlow.finish(context, onResult: widget.onResult)))),
            ),
            SocialButtons(
              state: state,
              googleAvailable: social.googleAvailable,
              appleAvailable: social.appleAvailable,
              onPressed: (p) => bloc.add(SocialSignInRequested(p)),
            ),
            const SizedBox(height: HooSpacing.lg),
            AuthLink(
              prefix: l.authNoAccount,
              label: l.authCreateAccount,
              onPressed: () =>
                  router.push(SignUpRoute(onResult: AuthFlow.subFlow(router, SignInRoute.name, () => AuthFlow.finish(context, onResult: widget.onResult)))),
            ),
          ],
        );
      },
    );
  }
}
