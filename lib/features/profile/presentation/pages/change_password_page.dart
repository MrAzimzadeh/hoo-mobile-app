import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/profile_repositories.dart';

/// Change (or set, for phone/social accounts) the password. Other devices are signed out by the server.
@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _current = TextEditingController();
  final _next = TextEditingController();
  bool _saving = false;
  ApiException? _error;

  @override
  void dispose() {
    _current.dispose();
    _next.dispose();
    super.dispose();
  }

  Future<void> _save(bool hasPassword) async {
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await sl<PasswordRepository>().change(currentPassword: hasPassword ? _current.text : null, newPassword: _next.text);
      await sl<AuthGate>().refreshUser();
      if (!mounted) return;
      HooToast.success(context, context.l10n.profilePasswordChanged);
      await context.router.maybePop();
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final hasPassword = sl<AuthGate>().currentUser?.hasPassword ?? true;
    return Scaffold(
      appBar: HooAppBar(title: hasPassword ? l.profileChangePassword : l.profileSetPassword),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          if (hasPassword) ...[
            HooTextField.password(controller: _current, label: l.profileCurrentPassword, errorText: _error?.fieldError('currentPassword') ?? (_error?.code == 'auth.current_password_invalid' ? errorMessage(context, _error!) : null)),
            const SizedBox(height: HooSpacing.md),
          ],
          HooTextField.password(controller: _next, label: l.authNewPasswordLabel, helperText: l.fieldPasswordRule, errorText: _error?.fieldError('newPassword')),
          if (_error != null && _error!.fieldErrors.isEmpty && _error!.code != 'auth.current_password_invalid') ...[
            const SizedBox(height: HooSpacing.md),
            InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!)),
          ],
          const SizedBox(height: HooSpacing.sm),
          Text(l.profilePasswordOtherDevices, style: context.hoo.text.caption),
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton(label: l.commonSave, loading: _saving, onPressed: () => _save(hasPassword)),
        ],
      ),
    );
  }
}
