import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';

/// Language, appearance, sign out. Long-press the version for the design-system screen.
@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final settings = context.watch<AppSettingsCubit>();
    final s = settings.state;
    final auth = sl<AuthGate>();
    return Scaffold(
      appBar: HooAppBar(title: l.profileSettings),
      body: ListView(
        padding: const EdgeInsets.all(HooSpacing.screen),
        children: [
          Text(l.profileLanguage.toUpperCase(), style: context.hoo.text.labelSecondary),
          const SizedBox(height: HooSpacing.xs),
          RadioGroup<AppLanguage>(
            groupValue: s.language,
            onChanged: (v) => v == null ? null : settings.setLanguage(v),
            child: Column(children: [
              for (final lang in AppLanguage.values)
                RadioListTile<AppLanguage>.adaptive(contentPadding: EdgeInsets.zero, value: lang, title: Text(lang.nativeName, style: context.hoo.text.body)),
            ]),
          ),
          const SizedBox(height: HooSpacing.lg),
          Text(l.profileAppearance.toUpperCase(), style: context.hoo.text.labelSecondary),
          const SizedBox(height: HooSpacing.xs),
          Wrap(spacing: HooSpacing.xs, children: [
            for (final (mode, label) in [(ThemeMode.system, l.profileThemeSystem), (ThemeMode.light, l.profileThemeLight), (ThemeMode.dark, l.profileThemeDark)])
              OptionChip(label: label, uppercase: false, selected: s.themeMode == mode, onTap: () => settings.setThemeMode(mode)),
          ]),
          const SizedBox(height: HooSpacing.xl),
          if (auth.isSignedIn)
            SecondaryButton(
              label: l.commonSignOut,
              icon: HooIcons.signOut,
              onPressed: () async {
                if (await showHooConfirm(context, title: l.profileSignOutConfirm, confirmLabel: l.commonSignOut)) {
                  await auth.signOut();
                  if (context.mounted) await context.router.maybePop();
                }
              },
            ),
          const SizedBox(height: HooSpacing.xl),
          Center(
            child: GestureDetector(
              onLongPress: () => context.router.push(const DesignSystemRoute()),
              child: Padding(padding: const EdgeInsets.all(HooSpacing.sm), child: Text('HOO · 0.1.0', style: context.hoo.text.caption)),
            ),
          ),
        ],
      ),
    );
  }
}
