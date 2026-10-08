import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../bloc/password_bloc.dart';
import '../widgets/auth_widgets.dart';

/// New password for an email link (`?identifier=&token=`) or a phone code. Opens from a deep link too.
@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, @QueryParam('identifier') this.identifier, @QueryParam('token') this.token});

  final String? identifier;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PasswordBloc>(),
      child: _ResetView(identifier: identifier, token: token),
    );
  }
}

class _ResetView extends StatefulWidget {
  const _ResetView({this.identifier, this.token});
  final String? identifier;
  final String? token;

  @override
  State<_ResetView> createState() => _ResetViewState();
}

class _ResetViewState extends State<_ResetView> {
  late final _identifier = TextEditingController(text: widget.identifier);
  late final _token = TextEditingController(text: widget.token);
  final _password = TextEditingController();

  @override
  void dispose() {
    _identifier.dispose();
    _token.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() => context.read<PasswordBloc>().add(ResetPasswordSubmitted(identifier: _identifier.text, token: _token.text, newPassword: _password.text));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state.status == PasswordStatus.reset) {
          HooToast.success(context, l.authResetDone);
          context.router.replaceAll([SignInRoute()]);
        }
      },
      builder: (context, state) {
        final bloc = context.read<PasswordBloc>();
        return AuthScaffold(
          title: l.authResetTitle,
          children: [
            FormErrorBanner(error: state.error),
            if (widget.identifier == null) ...[
              HooTextField(
                controller: _identifier,
                label: l.authIdentifierLabel,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: issueText(context, state.fieldErrors['identifier']),
                onChanged: (_) => bloc.add(const PasswordFieldEdited('identifier')),
              ),
              const SizedBox(height: HooSpacing.md),
            ],
            if (widget.token == null) ...[
              HooTextField(
                controller: _token,
                label: l.authResetCodeLabel,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                errorText: issueText(context, state.fieldErrors['token']),
                onChanged: (_) => bloc.add(const PasswordFieldEdited('token')),
              ),
              const SizedBox(height: HooSpacing.md),
            ],
            HooTextField.password(
              controller: _password,
              label: l.authResetNewPassword,
              helperText: l.authPasswordHint,
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.done,
              errorText: issueText(context, state.fieldErrors['newPassword']),
              onChanged: (_) => bloc.add(const PasswordFieldEdited('newPassword')),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: HooSpacing.lg),
            PrimaryButton(label: l.authResetSubmit, loading: state.busy, onPressed: state.busy ? null : _submit),
          ],
        );
      },
    );
  }
}
