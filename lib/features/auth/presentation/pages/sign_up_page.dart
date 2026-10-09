import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/auth_repository.dart';
import '../cubit/auth_submit_cubit.dart';
import '../widgets/auth_widgets.dart';

/// Email registration: name, email, password, optional phone, marketing consent, required terms.
@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onResult});

  final void Function(bool success)? onResult;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with AuthResultReporter {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phone = TextEditingController();
  bool _marketing = false;
  bool _terms = false;
  bool _termsMissing = false;
  late final _cubit = sl<AuthSubmitCubit>();

  @override
  void Function(bool success)? get onResult => widget.onResult;

  @override
  void dispose() {
    for (final c in [_name, _email, _password, _phone]) {
      c.dispose();
    }
    _cubit.close();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!_terms) {
      setState(() => _termsMissing = true);
      return;
    }
    final phone = _phone.text.trim().isEmpty ? null : HooFormat.phoneWire(_phone.text);
    final r = await _cubit.submit(() => sl<AuthRepository>().register(
          fullName: _name.text,
          email: _email.text,
          password: _password.text,
          phone: phone,
          marketingConsent: _marketing,
          acceptTerms: _terms,
        ));
    if (r != null && mounted) completeAuth(r);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: const HooAppBar(),
        body: SafeArea(
          child: BlocBuilder<AuthSubmitCubit, AuthSubmitState>(
            builder: (context, s) {
              final termsError = _termsMissing || s.apiError?.code == 'auth.terms_required' ? l.authTermsRequired : null;
              return AutofillGroup(
                child: ListView(
                  padding: const EdgeInsets.all(HooSpacing.screen),
                  children: [
                    AuthHeader(title: l.authSignUpTitle, subtitle: l.authSignUpSubtitle),
                    const SizedBox(height: HooSpacing.xl),
                    HooTextField(
                      controller: _name,
                      label: l.authFullNameLabel,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.name],
                      errorText: s.fieldError('fullName'),
                    ),
                    const SizedBox(height: HooSpacing.md),
                    HooTextField(
                      controller: _email,
                      label: l.authEmailLabel,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      errorText: s.fieldError('email') ?? (s.apiError?.code == 'auth.email_taken' ? errorMessage(context, s.apiError!) : null),
                    ),
                    const SizedBox(height: HooSpacing.md),
                    HooTextField.password(
                      controller: _password,
                      label: l.authPasswordLabel,
                      helperText: l.fieldPasswordRule,
                      autofillHints: const [AutofillHints.newPassword],
                      textInputAction: TextInputAction.next,
                      errorText: s.fieldError('password'),
                    ),
                    const SizedBox(height: HooSpacing.md),
                    HooPhoneField(
                      controller: _phone,
                      label: '${l.authPhoneLabel} (${l.commonOptional})',
                      errorText: s.fieldError('phone') ?? (s.apiError?.code == 'auth.phone_taken' ? errorMessage(context, s.apiError!) : null),
                    ),
                    const SizedBox(height: HooSpacing.md),
                    HooCheckboxTile(value: _marketing, onChanged: (v) => setState(() => _marketing = v), label: Text(l.authMarketingConsent)),
                    HooCheckboxTile(
                      value: _terms,
                      onChanged: (v) => setState(() {
                        _terms = v;
                        _termsMissing = false;
                      }),
                      label: Text(l.authAcceptTerms),
                      errorText: termsError,
                    ),
                    AuthErrorBlock(state: s, fields: const ['fullName', 'email', 'password', 'phone', 'acceptTerms']),
                    const SizedBox(height: HooSpacing.lg),
                    PrimaryButton.accent(label: l.commonCreateAccount, loading: s.submitting, onPressed: s.throttled ? null : _submit),
                    const SizedBox(height: HooSpacing.xl),
                    SocialSignInButtons(onResult: completeAuth),
                    const SizedBox(height: HooSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Text(l.authHaveAccount, style: context.hoo.text.bodySecondary)),
                        const SizedBox(width: HooSpacing.xxs),
                        HooTextButton(
                          label: l.commonSignIn,
                          onPressed: () {
                            if (widget.onResult != null) {
                              handOff();
                              context.router.replace(SignInRoute(onResult: widget.onResult));
                            } else {
                              context.router.replace(SignInRoute());
                            }
                          },
                        ),
                      ],
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
