import 'dart:async';

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

/// Email → reset link; phone → SMS code entered on the next screen.
@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _identifier = TextEditingController();
  late final _cubit = sl<AuthSubmitCubit>();
  bool _emailSent = false;

  @override
  void dispose() {
    _identifier.dispose();
    _cubit.close();
    super.dispose();
  }

  bool get _isPhone => RegExp(r'^\+?[\d\s()-]{9,16}$').hasMatch(_identifier.text.trim());

  Future<void> _submit() async {
    final id = _isPhone ? HooFormat.phoneWire(_identifier.text) : _identifier.text.trim();
    final ok = await _cubit.run(() => sl<AuthRepository>().forgotPassword(id));
    if (!ok || !mounted) return;
    if (_isPhone) {
      unawaited(context.router.push(ResetPasswordRoute(identifier: id)));
    } else {
      setState(() => _emailSent = true);
    }
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
            builder: (context, s) => ListView(
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                AuthHeader(title: l.authForgotTitle, subtitle: l.authForgotSubtitle),
                const SizedBox(height: HooSpacing.xl),
                if (_emailSent)
                  HooReveal(child: InlineAlert(kind: HooAlertKind.success, title: l.authForgotEmailSentTitle, message: l.authForgotEmailSent))
                else ...[
                  HooTextField(
                    controller: _identifier,
                    label: l.authIdentifierLabel,
                    hint: l.authIdentifierHint,
                    keyboardType: TextInputType.emailAddress,
                    errorText: s.fieldError('identifier'),
                    onSubmitted: (_) => _submit(),
                  ),
                  AuthErrorBlock(state: s, fields: const ['identifier']),
                  const SizedBox(height: HooSpacing.lg),
                  PrimaryButton(label: l.commonContinue, loading: s.submitting, onPressed: s.throttled ? null : _submit),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
