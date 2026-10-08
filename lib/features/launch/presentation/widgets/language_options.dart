import 'package:flutter/material.dart';

import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';

/// The four app languages as large selectable rows, each in its own script (onboarding, Coming Soon sheet).
class LanguageOptions extends StatelessWidget {
  const LanguageOptions({super.key, required this.selected, required this.onSelected, this.staggered = false});

  final AppLanguage selected;
  final ValueChanged<AppLanguage> onSelected;

  /// Reveal the rows one after another (onboarding entrance).
  final bool staggered;

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (i, language) in AppLanguage.values.indexed) ...[
          if (i > 0) const SizedBox(height: HooSpacing.sm),
          _maybeReveal(
            i,
            SelectableCard(
              selected: language == selected,
              onTap: () {
                if (language != selected) HooHaptics.selection();
                onSelected(language);
              },
              padding: const EdgeInsets.symmetric(horizontal: HooSpacing.md, vertical: HooSpacing.md),
              child: Semantics(
                inMutuallyExclusiveGroup: true,
                checked: language == selected,
                child: Row(
                  children: [
                    Expanded(child: Text(language.nativeName, style: context.hoo.text.h3)),
                    AnimatedOpacity(
                      opacity: language == selected ? 1 : 0,
                      duration: context.hoo.motion(HooDurations.fast),
                      child: Icon(HooIcons.check, size: HooSize.iconSmall, color: colors.accent),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _maybeReveal(int index, Widget child) => staggered ? HooReveal(index: index + 2, child: child) : child;
}

/// Bottom sheet with [LanguageOptions], applying the choice through [AppSettingsCubit].
Future<void> showLanguageSheet(BuildContext context, AppSettingsCubit settings) {
  return showHooSheet<void>(
    context,
    title: context.l10n.launchLanguage,
    builder: (sheetContext) => LanguageOptions(
      selected: settings.state.language,
      onSelected: (language) {
        settings.setLanguage(language);
        Navigator.of(sheetContext).pop();
      },
    ),
  );
}
