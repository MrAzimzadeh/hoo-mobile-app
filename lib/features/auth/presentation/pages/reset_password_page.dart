import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/auth_repository.dart';
import '../cubit/auth_submit_cubit.dart';
import '../widgets/auth_widgets.dart';

/// New password with the SMS code (phone) or the token from the e-mail link (deep link `/reset-password`).
@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, @QueryParam('identifier') this.identifier, @QueryParam('token') this.token});

  final String? identifier;
  final String? token;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final _identifier = TextEditingController(text: widget.identifier ?? '');
  late final _code = TextEditingController(text: widget.token ?? '');
  final _password = TextEditingController();
  late final _cubit = sl<AuthSubmitCubit>();
  bool _done = false;

  @override
  void dispose() {
    _identifier.dispose();
    _code.dispose();
    _password.dispose();
    _cubit.close();
    super.dispose();
  }

  Future<void> _submit() async {
    final ok = await _cubit.run(() => sl<AuthRepository>().resetPassword(identifier: _identifier.text, token: _code.text, newPassword: _password.text));
    if (ok && mounted) setState(() => _done = true);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final fromLink = widget.token != null;
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: const HooAppBar(),
        body: SafeArea(
          child: BlocBuilder<AuthSubmitCubit, AuthSubmitState>(
            builder: (context, s) => ListView(
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                AuthHeader(title: l.authResetTitle, subtitle: _done ? null : l.authResetSubtitle),
                const SizedBox(height: HooSpacing.xl),
                if (_done) ...[
                  HooReveal(child: InlineAlert(kind: HooAlertKind.success, message: l.authResetDone)),
                  const SizedBox(height: HooSpacing.lg),
                  PrimaryButton(label: l.commonSignIn, onPressed: () => context.router.replaceAll([const MainShellRoute(), SignInRoute()])),
                ] else ...[
                  if (widget.identifier == null) ...[
                    HooTextField(controller: _identifier, label: l.authIdentifierLabel, keyboardType: TextInputType.emailAddress, errorText: s.fieldError('identifier')),
                    const SizedBox(height: HooSpacing.md),
                  ],
                  if (!fromLink) ...[
                    HooTextField(controller: _code, label: l.authResetCodeLabel, keyboardType: TextInputType.number, autofillHints: const [AutofillHints.oneTimeCode], errorText: s.fieldError('token')),
                    const SizedBox(height: HooSpacing.md),
                  ],
                  HooTextField.password(
                    controller: _password,
                    label: l.authNewPasswordLabel,
                    helperText: l.fieldPasswordRule,
                    errorText: s.fieldError('newPassword'),
                    onSubmitted: (_) => _submit(),
                  ),
                  AuthErrorBlock(state: s, fields: const ['identifier', 'token', 'newPassword']),
                  const SizedBox(height: HooSpacing.lg),
                  PrimaryButton(label: l.commonSave, loading: s.submitting, onPressed: s.throttled ? null : _submit),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
