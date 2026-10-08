import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../data/social_identity_provider.dart';
import '../auth_flow.dart';
import '../bloc/auth_form_bloc.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/social_terms_sheet.dart';

/// Create an account: name, email, optional phone, password, terms. Google / Apple create one too.
@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key, this.onResult});

  final void Function(bool success)? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthFormBloc>(),
      child: _SignUpView(onResult: onResult),
    );
  }
}

class _SignUpView extends StatefulWidget {
  const _SignUpView({this.onResult});
  final void Function(bool success)? onResult;

  @override
  State<_SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<_SignUpView> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  bool _terms = false;
  bool _marketing = false;

  @override
  void dispose() {
    for (final c in [_name, _email, _phone, _password]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() => context.read<AuthFormBloc>().add(
    SignUpSubmitted(fullName: _name.text, email: _email.text, password: _password.text, phone: _phone.text, marketingConsent: _marketing, acceptTerms: _terms),
  );

  Future<void> _onState(BuildContext context, AuthFormState state) async {
    final bloc = context.read<AuthFormBloc>();
    if (state.succeeded) {
      AuthFlow.finish(context, onResult: widget.onResult, offerStyleProfile: true);
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
    final social = sl<SocialIdentityProvider>();
    return BlocConsumer<AuthFormBloc, AuthFormState>(
      listener: _onState,
      builder: (context, state) {
        final bloc = context.read<AuthFormBloc>();
        void edited(String field) => bloc.add(AuthFieldEdited(field));
        return AuthScaffold(
          title: l.authSignUpTitle,
          subtitle: l.authSignUpSubtitle,
          children: [
            FormErrorBanner(error: state.error),
            HooTextField(
              controller: _name,
              label: l.authFullNameLabel,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.name],
              errorText: issueText(context, state.fieldErrors['fullName']),
              onChanged: (_) => edited('fullName'),
            ),
            const SizedBox(height: HooSpacing.md),
            HooTextField(
              controller: _email,
              label: l.authEmailLabel,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email],
              errorText: issueText(context, state.fieldErrors['email']),
              onChanged: (_) => edited('email'),
            ),
            const SizedBox(height: HooSpacing.md),
            HooPhoneField(
              controller: _phone,
              label: '${l.authPhoneLabel} (${l.commonOptional.toLowerCase()})',
              textInputAction: TextInputAction.next,
              errorText: issueText(context, state.fieldErrors['phone']),
              onChanged: (_) => edited('phone'),
            ),
            const SizedBox(height: HooSpacing.md),
            HooTextField.password(
              controller: _password,
              label: l.authPasswordLabel,
              helperText: l.authPasswordHint,
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.done,
              errorText: issueText(context, state.fieldErrors['password']),
              onChanged: (_) => edited('password'),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: HooSpacing.md),
            HooCheckboxTile(
              value: _terms,
              label: Text(l.authAcceptTerms, style: context.hoo.text.body),
              errorText: issueText(context, state.fieldErrors['acceptTerms']),
              onChanged: (v) {
                setState(() => _terms = v);
                edited('acceptTerms');
              },
            ),
            HooCheckboxTile(
              value: _marketing,
              label: Text(l.authMarketingConsent, style: context.hoo.text.body),
              onChanged: (v) => setState(() => _marketing = v),
            ),
            const SizedBox(height: HooSpacing.lg),
            PrimaryButton(label: l.authCreateAccount, loading: state.busy && state.social == null, onPressed: state.busy ? null : _submit),
            SocialButtons(
              state: state,
              googleAvailable: social.googleAvailable,
              appleAvailable: social.appleAvailable,
              onPressed: (p) => bloc.add(SocialSignInRequested(p, acceptTerms: _terms)),
            ),
            const SizedBox(height: HooSpacing.lg),
            AuthLink(prefix: l.authHaveAccount, label: l.authSignInSubmit, onPressed: () => context.router.maybePop()),
          ],
        );
      },
    );
  }
}
