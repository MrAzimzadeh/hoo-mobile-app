import 'package:flutter/widgets.dart';

import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';

extension L10nX on BuildContext {
  /// Generated, type-safe strings for the current locale (ARB: lib/l10n/core + lib/l10n/fragments/*).
  AppLocalizations get l10n => AppLocalizations.of(this);
}
