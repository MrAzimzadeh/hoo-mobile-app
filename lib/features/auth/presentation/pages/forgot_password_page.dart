import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../bloc/password_bloc.dart';
import '../widgets/auth_widgets.dart';

/// Asks for the email or phone; the server sends a reset link (email) or code (phone).
@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<PasswordBloc>(), child: const _ForgotView());
}

class _ForgotView extends StatefulWidget {
  const _ForgotView();

  @override
  State<_ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<_ForgotView> {
  final _identifier = TextEditingController();

  @override
  void dispose() {
    _identifier.dispose();
    super.dispose();
  }

  void _submit() => context.read<PasswordBloc>().add(ForgotPasswordSubmitted(_identifier.text));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<PasswordBloc, PasswordState>(
      builder: (context, state) {
        final sent = state.status == PasswordStatus.sent;
        return AuthScaffold(
          title: l.authForgotTitle,
          subtitle: sent ? null : l.authForgotBody,
          children: [
            FormErrorBanner(error: state.error),
            if (sent) ...[
              InlineAlert(message: state.isPhone ? l.authForgotSentPhone : l.authForgotSentEmail, kind: HooAlertKind.success),
              if (state.isPhone) ...[
                const SizedBox(height: HooSpacing.lg),
                PrimaryButton(
                  label: l.authResetEnterCode,
                  onPressed: () => context.router.replace(ResetPasswordRoute(identifier: state.identifier)),
                ),
              ],
            ] else ...[
              HooTextField(
                controller: _identifier,
                label: l.authIdentifierLabel,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                autofocus: true,
                errorText: issueText(context, state.fieldErrors['identifier']),
                onChanged: (_) => context.read<PasswordBloc>().add(const PasswordFieldEdited('identifier')),
                onSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: HooSpacing.lg),
              if (state.throttledUntil != null && state.throttledUntil!.isAfter(DateTime.now()))
                RetryCountdown(
                  until: state.throttledUntil!,
                  builder: (context, r) => PrimaryButton(label: l.errorTooManyRequests(r.inSeconds + 1)),
                )
              else
                PrimaryButton(label: l.authForgotSubmit, loading: state.busy, onPressed: state.busy ? null : _submit),
            ],
          ],
        );
      },
    );
  }
}
