import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/change_password_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Change the password (accounts that signed up with Google / Apple set one without a current password).
@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hasPassword = sl<AuthGate>().currentUser?.hasPassword ?? true;
    return BlocProvider(
      create: (_) => sl<ChangePasswordCubit>(param1: hasPassword),
      child: _View(hasPassword: hasPassword),
    );
  }
}

class _View extends StatelessWidget {
  const _View({required this.hasPassword});
  final bool hasPassword;

  String? _field(AppLocalizations l, PasswordFieldError? e, String? server) => switch (e) {
    PasswordFieldError.required => l.fieldRequired,
    PasswordFieldError.weak => l.authErrWeakPassword,
    PasswordFieldError.mismatch => l.profilePasswordMismatch,
    null => server,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (a, b) => !a.done && b.done,
      listener: (context, state) {
        HooToast.success(context, l.profilePasswordChanged);
        context.router.maybePop();
      },
      builder: (context, state) {
        final cubit = context.read<ChangePasswordCubit>();
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: l.profileChangePassword),
          bottomNavigationBar: ProfileBottomAction(
            child: PrimaryButton(label: l.commonSave, loading: state.saving, onPressed: state.saving ? null : cubit.submit),
          ),
          body: SafeArea(
            child: HooConstrained(
              child: ListView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                children: [
                  if (state.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: HooSpacing.md),
                      child: InlineAlert(message: errorMessage(context, state.error!), kind: HooAlertKind.error),
                    ),
                  if (hasPassword) ...[
                    HooTextField.password(
                      label: l.profileCurrentPassword,
                      autofillHints: const [AutofillHints.password],
                      textInputAction: TextInputAction.next,
                      onChanged: cubit.setCurrent,
                      errorText: _field(l, state.currentError(hasPassword: hasPassword), state.serverCurrentError),
                    ),
                    const SizedBox(height: HooSpacing.md),
                  ],
                  HooTextField.password(
                    label: l.authResetNewPassword,
                    helperText: l.authPasswordHint,
                    autofillHints: const [AutofillHints.newPassword],
                    textInputAction: TextInputAction.next,
                    onChanged: cubit.setNext,
                    errorText: _field(l, state.nextError, state.serverNextError),
                  ),
                  const SizedBox(height: HooSpacing.md),
                  HooTextField.password(
                    label: l.profileConfirmPassword,
                    autofillHints: const [AutofillHints.newPassword],
                    onChanged: cubit.setConfirm,
                    errorText: _field(l, state.confirmError, null),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
