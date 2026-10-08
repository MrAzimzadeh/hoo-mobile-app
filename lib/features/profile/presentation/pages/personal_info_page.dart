import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../cubit/personal_info_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Name, language (synced with the app language) and marketing consent. Email / phone are read-only.
@RoutePage()
class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<PersonalInfoCubit>(), child: const _View());
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final _name = TextEditingController(text: context.read<PersonalInfoCubit>().state.fullName);

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final user = sl<AuthGate>().currentUser;
    return BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
      listenWhen: (a, b) => !a.saved && b.saved,
      listener: (context, state) => HooToast.success(context, l.commonSaved),
      builder: (context, state) {
        final cubit = context.read<PersonalInfoCubit>();
        final nameError = switch (state.nameError) {
          PersonalInfoNameError.required => l.fieldRequired,
          PersonalInfoNameError.tooLong => l.profileNameTooLong,
          null => state.serverNameError,
        };
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: l.profilePersonalInfo),
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
                  HooTextField(
                    controller: _name,
                    label: l.checkoutFullName,
                    textCapitalization: TextCapitalization.words,
                    errorText: nameError,
                    onChanged: cubit.setName,
                  ),
                  const SizedBox(height: HooSpacing.md),
                  HooTextField(initialValue: user?.email ?? '—', label: l.checkoutEmail, enabled: false),
                  const SizedBox(height: HooSpacing.md),
                  HooTextField(initialValue: user?.phone ?? '—', label: l.checkoutPhone, enabled: false),
                  const SizedBox(height: HooSpacing.lg),
                  Text(l.profileLanguage, style: context.hoo.text.bodyStrong),
                  const SizedBox(height: HooSpacing.xs),
                  Wrap(
                    spacing: HooSpacing.xs,
                    children: [
                      for (final lang in AppLanguage.values)
                        OptionChip(label: lang.nativeName, uppercase: false, selected: lang == state.language, onTap: () => cubit.setLanguage(lang)),
                    ],
                  ),
                  const SizedBox(height: HooSpacing.md),
                  HooCheckboxTile(
                    value: state.marketingConsent,
                    onChanged: cubit.setMarketingConsent,
                    label: Text(l.authMarketingConsent, style: context.hoo.text.body),
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
