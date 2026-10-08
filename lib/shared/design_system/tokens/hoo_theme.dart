import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hoo_tokens.dart';

/// Theme extension carrying the resolved HOO palette and text styles.
@immutable
class HooTheme extends ThemeExtension<HooTheme> {
  const HooTheme({required this.colors});

  final HooColorScheme colors;

  bool get isDark => identical(colors, HooColorScheme.dark);

  @override
  HooTheme copyWith({HooColorScheme? colors}) => HooTheme(colors: colors ?? this.colors);

  @override
  HooTheme lerp(covariant HooTheme? other, double t) => t < 0.5 ? this : (other ?? this);
}

/// Text styles already colored for the current palette.
@immutable
class HooTextStyles {
  const HooTextStyles(this._c);
  final HooColorScheme _c;

  TextStyle get display => HooType.display.copyWith(color: _c.textPrimary);
  TextStyle get hero => HooType.hero.copyWith(color: _c.textPrimary);
  TextStyle get h1 => HooType.h1.copyWith(color: _c.textPrimary);
  TextStyle get h2 => HooType.h2.copyWith(color: _c.textPrimary);
  TextStyle get h3 => HooType.h3.copyWith(color: _c.textPrimary);
  TextStyle get body => HooType.body.copyWith(color: _c.textPrimary);
  TextStyle get bodySecondary => HooType.body.copyWith(color: _c.textSecondary);
  TextStyle get bodyStrong => HooType.bodyStrong.copyWith(color: _c.textPrimary);
  TextStyle get caption => HooType.caption.copyWith(color: _c.textSecondary);
  TextStyle get captionPrimary => HooType.caption.copyWith(color: _c.textPrimary);
  TextStyle get label => HooType.label.copyWith(color: _c.textPrimary);
  TextStyle get labelSecondary => HooType.label.copyWith(color: _c.textSecondary);
}

/// `context.hoo.colors.accent`, `context.hoo.text.h2`, `context.hoo.reducedMotion`.
class HooContext {
  HooContext(this._context);
  final BuildContext _context;

  HooColorScheme get colors => Theme.of(_context).extension<HooTheme>()!.colors;
  HooTextStyles get text => HooTextStyles(colors);
  bool get isDark => Theme.of(_context).brightness == Brightness.dark;

  /// Accessibility: OS "reduce motion" / "remove animations".
  bool get reducedMotion => MediaQuery.maybeDisableAnimationsOf(_context) ?? false;

  /// Duration that collapses to zero when the user asked for reduced motion.
  Duration motion(Duration d) => reducedMotion ? Duration.zero : d;

  bool get isTablet => MediaQuery.sizeOf(_context).shortestSide >= 600;
}

extension HooThemeX on BuildContext {
  HooContext get hoo => HooContext(this);
}

abstract final class HooThemeData {
  static ThemeData light() => _build(HooColorScheme.light, Brightness.light);
  static ThemeData dark() => _build(HooColorScheme.dark, Brightness.dark);

  static ThemeData _build(HooColorScheme c, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primaryAction,
      onPrimary: c.onPrimaryAction,
      secondary: c.accent,
      onSecondary: c.onAccent,
      tertiary: c.accent,
      onTertiary: c.onAccent,
      error: c.error,
      onError: HooPalette.white,
      surface: c.background,
      onSurface: c.textPrimary,
      surfaceContainerLowest: c.background,
      surfaceContainerLow: c.surface,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surface,
      surfaceContainerHighest: c.surface,
      onSurfaceVariant: c.textSecondary,
      outline: c.border,
      outlineVariant: c.border,
      shadow: c.shadow,
      scrim: c.scrim,
    );
    final text = HooTextStyles(c);
    final textTheme = TextTheme(
      displayLarge: text.display,
      displayMedium: text.display,
      displaySmall: text.h1,
      headlineLarge: text.h1,
      headlineMedium: text.h1,
      headlineSmall: text.h2,
      titleLarge: text.h2,
      titleMedium: text.h3,
      titleSmall: text.bodyStrong,
      bodyLarge: text.body,
      bodyMedium: text.body,
      bodySmall: text.caption,
      labelLarge: text.bodyStrong,
      labelMedium: text.label,
      labelSmall: text.label,
    );
    final overlayStyle = brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: HooType.family,
      textTheme: textTheme,
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      dividerColor: c.border,
      splashFactory: InkSparkle.splashFactory,
      highlightColor: Colors.transparent,
      extensions: [HooTheme(colors: c)],
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: text.h3,
        systemOverlayStyle: overlayStyle.copyWith(statusBarColor: Colors.transparent),
      ),
      dividerTheme: DividerThemeData(color: c.border, thickness: HooSize.borderWidth, space: HooSize.borderWidth),
      iconTheme: IconThemeData(color: c.textPrimary, size: HooSize.icon),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.background,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: c.scrim,
        shape: const RoundedRectangleBorder(borderRadius: HooRadius.sheetTop),
        showDragHandle: false,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.background,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: HooRadius.cardAll),
        titleTextStyle: text.h2,
        contentTextStyle: text.body,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.primaryAction,
        contentTextStyle: HooType.body.copyWith(color: c.onPrimaryAction),
        shape: const RoundedRectangleBorder(borderRadius: HooRadius.cardAll),
        elevation: 0,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.textPrimary, linearTrackColor: c.border, circularTrackColor: Colors.transparent),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.accent : Colors.transparent),
        checkColor: WidgetStatePropertyAll(c.onAccent),
        side: BorderSide(color: c.textSecondary, width: 1.5),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.onAccent : c.textSecondary),
        trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.accent : c.surface),
        trackOutlineColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.accent : c.border),
      ),
      radioTheme: RadioThemeData(fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.accent : c.textSecondary)),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.primaryAction,
        inactiveTrackColor: c.border,
        thumbColor: c.primaryAction,
        overlayColor: c.accentTint,
        trackHeight: 2,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: c.textPrimary, selectionColor: c.accentTint, selectionHandleColor: c.accent),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface,
        hintStyle: HooType.body.copyWith(color: c.textTertiary),
        labelStyle: HooType.body.copyWith(color: c.textSecondary),
        floatingLabelStyle: HooType.caption.copyWith(color: c.textSecondary),
        errorStyle: HooType.caption.copyWith(color: c.error),
        contentPadding: const EdgeInsets.symmetric(horizontal: HooSpacing.md, vertical: HooSpacing.md),
        border: const OutlineInputBorder(borderRadius: HooRadius.inputAll, borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderRadius: HooRadius.inputAll, borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: HooRadius.inputAll, borderSide: BorderSide(color: c.textPrimary)),
        errorBorder: OutlineInputBorder(borderRadius: HooRadius.inputAll, borderSide: BorderSide(color: c.error)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: HooRadius.inputAll, borderSide: BorderSide(color: c.error)),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
