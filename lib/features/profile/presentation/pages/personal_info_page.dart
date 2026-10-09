import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/profile_repositories.dart';

/// Name, marketing consent; e-mail and phone are shown (changed through support / verification flows).
@RoutePage()
class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _auth = sl<AuthGate>();
  late final _name = TextEditingController(text: _auth.currentUser?.fullName ?? '');
  late bool _marketing = _auth.currentUser?.marketingConsent ?? false;
  bool _saving = false;
  ApiException? _error;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await sl<AccountRepository>().updateProfile(fullName: _name.text, language: context.read<AppSettingsCubit>().state.language, marketingConsent: _marketing);
      await _auth.refreshUser();
      if (mounted) HooToast.success(context, context.l10n.commonSaved);
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final u = _auth.currentUser;
    return Scaffold(
      appBar: HooAppBar(title: l.profilePersonalInfo),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          HooTextField(controller: _name, label: l.authFullNameLabel, textCapitalization: TextCapitalization.words, errorText: _error?.fieldError('fullName')),
          const SizedBox(height: HooSpacing.lg),
          if (u?.email != null) SummaryRow(label: l.authEmailLabel, value: u!.email!),
          if (u?.phone != null) SummaryRow(label: l.authPhoneLabel, value: HooFormat.phone(u!.phone!)),
          const SizedBox(height: HooSpacing.md),
          HooCheckboxTile(value: _marketing, onChanged: (v) => setState(() => _marketing = v), label: Text(l.authMarketingConsent)),
          if (_error != null && _error!.fieldErrors.isEmpty) InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!)),
          const SizedBox(height: HooSpacing.lg),
          PrimaryButton(label: l.commonSave, loading: _saving, onPressed: _save),
        ],
      ),
    );
  }
}
