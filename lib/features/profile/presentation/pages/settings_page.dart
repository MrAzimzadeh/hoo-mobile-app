import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../widgets/profile_widgets.dart';

/// App language and appearance (system / light / dark). Language also syncs to the account while signed in.
@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    return BlocProvider.value(
      value: sl<AppSettingsCubit>(),
      child: BlocBuilder<AppSettingsCubit, AppSettings>(
        builder: (context, settings) {
          final cubit = context.read<AppSettingsCubit>();
          return Scaffold(
            backgroundColor: context.hoo.colors.background,
            appBar: HooAppBar(title: l.profileSettings),
            body: HooConstrained(
              child: ListView(
                children: [
                  ProfileGroupLabel(l.profileLanguage),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
                    child: Wrap(
                      spacing: HooSpacing.xs,
                      runSpacing: HooSpacing.xs,
                      children: [
                        for (final lang in AppLanguage.values)
                          OptionChip(label: lang.nativeName, uppercase: false, selected: lang == settings.language, onTap: () => cubit.setLanguage(lang)),
                      ],
                    ),
                  ),
                  ProfileGroupLabel(l.profileAppearance),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
                    child: Wrap(
                      spacing: HooSpacing.xs,
                      runSpacing: HooSpacing.xs,
                      children: [
                        OptionChip(
                          label: l.profileThemeSystem,
                          uppercase: false,
                          selected: settings.themeMode == ThemeMode.system,
                          onTap: () => cubit.setThemeMode(ThemeMode.system),
                        ),
                        OptionChip(
                          label: l.profileThemeLight,
                          uppercase: false,
                          selected: settings.themeMode == ThemeMode.light,
                          onTap: () => cubit.setThemeMode(ThemeMode.light),
                        ),
                        OptionChip(
                          label: l.profileThemeDark,
                          uppercase: false,
                          selected: settings.themeMode == ThemeMode.dark,
                          onTap: () => cubit.setThemeMode(ThemeMode.dark),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: HooSpacing.xl),
                  Center(
                    child: Text(l.appName, style: t.caption.copyWith(color: context.hoo.colors.textTertiary)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
