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

/// Email-or-phone + password sign in, SMS code, Google / Apple.
@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key, this.onResult});

  /// Set by the access guard: called with `true` once signed in so navigation resumes where it was.
  final void Function(bool success)? onResult;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with AuthResultReporter {
  final _identifier = TextEditingController();
  final _password = TextEditingController();
  late final _cubit = sl<AuthSubmitCubit>();

  @override
  void Function(bool success)? get onResult => widget.onResult;

  @override
  void dispose() {
    _identifier.dispose();
    _password.dispose();
    _cubit.close();
    super.dispose();
  }

  /// Phone numbers are accepted in local form ("050 123 45 67") and sent in wire format.
  String get _identifierWire {
    final raw = _identifier.text.trim();
    final digits = raw.replaceAll(RegExp(r'[\s()-]'), '');
    return RegExp(r'^\+?\d{9,12}$').hasMatch(digits) ? HooFormat.phoneWire(digits) : raw;
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final r = await _cubit.submit(() => sl<AuthRepository>().login(identifier: _identifierWire, password: _password.text));
    if (r != null && mounted) completeAuth(r);
  }

  void _goTo(PageRouteInfo route) {
    if (widget.onResult != null) {
      handOff();
      context.router.replace(route);
    } else {
      context.router.push(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: HooAppBar(leading: HooIconButton(icon: HooIcons.close, semanticLabel: l.a11yClose, onPressed: () => context.router.maybePop())),
        body: SafeArea(
          child: BlocBuilder<AuthSubmitCubit, AuthSubmitState>(
            builder: (context, s) => AutofillGroup(
              child: ListView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                children: [
                  AuthHeader(title: l.authSignInTitle, subtitle: l.authSignInSubtitle),
                  const SizedBox(height: HooSpacing.xl),
                  HooTextField(
                    controller: _identifier,
                    label: l.authIdentifierLabel,
                    hint: l.authIdentifierHint,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.email, AutofillHints.telephoneNumber],
                    errorText: s.fieldError('identifier'),
                    onChanged: (_) => s.error == null ? null : _cubit.clearError(),
                  ),
                  const SizedBox(height: HooSpacing.md),
                  HooTextField.password(
                    controller: _password,
                    label: l.authPasswordLabel,
                    textInputAction: TextInputAction.done,
                    errorText: s.fieldError('password'),
                    onSubmitted: (_) => _submit(),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: HooTextButton(label: l.authForgotPassword, style: HooType.caption.copyWith(fontWeight: FontWeight.w600), onPressed: () => context.router.push(const ForgotPasswordRoute())),
                  ),
                  AuthErrorBlock(state: s, fields: const ['identifier', 'password']),
                  const SizedBox(height: HooSpacing.md),
                  PrimaryButton(label: l.commonSignIn, loading: s.submitting, onPressed: s.throttled ? null : _submit),
                  const SizedBox(height: HooSpacing.sm),
                  SecondaryButton(label: l.authSignInWithSms, onPressed: () => _goTo(OtpRoute(onResult: widget.onResult))),
                  const SizedBox(height: HooSpacing.xl),
                  SocialSignInButtons(onResult: completeAuth),
                  const SizedBox(height: HooSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Text(l.authNoAccount, style: context.hoo.text.bodySecondary)),
                      const SizedBox(width: HooSpacing.xxs),
                      HooTextButton(label: l.commonCreateAccount, onPressed: () => _goTo(SignUpRoute(onResult: widget.onResult))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
