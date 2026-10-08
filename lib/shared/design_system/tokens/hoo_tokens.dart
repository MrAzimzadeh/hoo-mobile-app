import 'package:flutter/animation.dart';
import 'package:flutter/painting.dart';

/// The single source of HOO design values: colors, typography, spacing, radius, elevation and motion.
///
/// Widgets never hard-code any of these — they read them through `context.hoo` (see `hoo_theme.dart`),
/// which resolves the light/dark palette. Only three brand colors exist; everything else is a neutral.
abstract final class HooPalette {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF121212);
  static const green = Color(0xFF1C3829);

  // light neutrals
  static const surfaceMuted = Color(0xFFF7F7F5);
  static const borderSubtle = Color(0xFFE8E8E5);
  static const textSecondary = Color(0xFF6B6B6B);
  static const textTertiary = Color(0xFF9A9A9A);
  static const error = Color(0xFFB3261E);

  // dark neutrals
  static const darkSurface = Color(0xFF1C1C1C);
  static const darkBorder = Color(0xFF2A2A2A);
  static const darkTextSecondary = Color(0xFFA0A0A0);
  static const darkTextTertiary = Color(0xFF6E6E6E);
  static const darkError = Color(0xFFE5776F);

  /// Scrim behind sheets/dialogs and the floating shadow color (black @ 8%).
  static const shadow = Color(0x14121212);
  static const scrim = Color(0x66121212);
}

/// Semantic color roles, resolved per brightness.
final class HooColorScheme {
  const HooColorScheme({
    required this.background,
    required this.surface,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.onAccent,
    required this.accentTint,
    required this.primaryAction,
    required this.onPrimaryAction,
    required this.error,
    required this.success,
    required this.scrim,
    required this.shadow,
    required this.skeleton,
  });

  final Color background;
  final Color surface;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  /// Brand green — the only accent. At most one green CTA per screen.
  final Color accent;
  final Color onAccent;

  /// Green @ 8%: selected chips and subtle highlights.
  final Color accentTint;

  /// Black in light mode, white in dark mode.
  final Color primaryAction;
  final Color onPrimaryAction;
  final Color error;
  final Color success;
  final Color scrim;
  final Color shadow;
  final Color skeleton;

  static const light = HooColorScheme(
    background: HooPalette.white,
    surface: HooPalette.surfaceMuted,
    border: HooPalette.borderSubtle,
    textPrimary: HooPalette.black,
    textSecondary: HooPalette.textSecondary,
    textTertiary: HooPalette.textTertiary,
    accent: HooPalette.green,
    onAccent: HooPalette.white,
    accentTint: Color(0x141C3829),
    primaryAction: HooPalette.black,
    onPrimaryAction: HooPalette.white,
    error: HooPalette.error,
    success: HooPalette.green,
    scrim: HooPalette.scrim,
    shadow: HooPalette.shadow,
    skeleton: Color(0xFFEFEFEC),
  );

  static const dark = HooColorScheme(
    background: HooPalette.black,
    surface: HooPalette.darkSurface,
    border: HooPalette.darkBorder,
    textPrimary: HooPalette.white,
    textSecondary: HooPalette.darkTextSecondary,
    textTertiary: HooPalette.darkTextTertiary,
    accent: HooPalette.green,
    onAccent: HooPalette.white,
    accentTint: Color(0x3D4F7A62),
    primaryAction: HooPalette.white,
    onPrimaryAction: HooPalette.black,
    error: HooPalette.darkError,
    success: Color(0xFF8FB09A),
    scrim: Color(0x99000000),
    shadow: Color(0x40000000),
    skeleton: Color(0xFF242424),
  );
}

/// Inter type scale (size / line height / weight). Heading tracking −1…−2%.
abstract final class HooType {
  static const family = 'Inter';

  static const display = TextStyle(fontFamily: family, fontSize: 40, height: 44 / 40, fontWeight: FontWeight.w700, letterSpacing: -0.8);
  static const h1 = TextStyle(fontFamily: family, fontSize: 28, height: 34 / 28, fontWeight: FontWeight.w700, letterSpacing: -0.56);
  static const h2 = TextStyle(fontFamily: family, fontSize: 22, height: 28 / 22, fontWeight: FontWeight.w700, letterSpacing: -0.33);
  static const h3 = TextStyle(fontFamily: family, fontSize: 17, height: 22 / 17, fontWeight: FontWeight.w600, letterSpacing: -0.17);
  static const body = TextStyle(fontFamily: family, fontSize: 15, height: 22 / 15, fontWeight: FontWeight.w400);
  static const bodyStrong = TextStyle(fontFamily: family, fontSize: 15, height: 22 / 15, fontWeight: FontWeight.w600);
  static const caption = TextStyle(fontFamily: family, fontSize: 13, height: 18 / 13, fontWeight: FontWeight.w400);

  /// UPPERCASE, +6% tracking — callers uppercase the text through `HooText.label`.
  static const label = TextStyle(fontFamily: family, fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w600, letterSpacing: 0.72);

  /// Editorial hero headline (onboarding, home hero, confirmation). Not part of the everyday scale.
  static const hero = TextStyle(fontFamily: family, fontSize: 48, height: 1.0, fontWeight: FontWeight.w700, letterSpacing: -1.44);

  /// Wordmark: Inter Bold, −2% tracking.
  static const wordmarkTracking = -0.02;
}

/// 4-pt spacing scale.
abstract final class HooSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  /// Screen horizontal padding.
  static const double screen = 24;

  /// Gap between home/PDP sections.
  static const double section = 32;
}

abstract final class HooRadius {
  static const double card = 12;
  static const double button = 12;
  static const double input = 12;
  static const double sheet = 20;
  static const double pill = 999;

  static const cardAll = BorderRadius.all(Radius.circular(card));
  static const buttonAll = BorderRadius.all(Radius.circular(button));
  static const inputAll = BorderRadius.all(Radius.circular(input));
  static const pillAll = BorderRadius.all(Radius.circular(pill));
  static const sheetTop = BorderRadius.vertical(top: Radius.circular(sheet));
}

abstract final class HooSize {
  static const double buttonHeight = 52;
  static const double inputHeight = 52;
  static const double touchTarget = 48;
  static const double icon = 24;
  static const double iconSmall = 20;
  static const double swatch = 32;
  static const double borderWidth = 1;
  static const double selectedRing = 2;
  static const double sheetHandleWidth = 36;
  static const double sheetHandleHeight = 4;
  static const double bottomBar = 64;
  static const double productImageAspect = 4 / 5;
  static const double maxContentWidth = 720;
}

/// Borders over shadows. Shadows only for floating elements (sheets, FAB): 0 8 24 rgba(18,18,18,.08).
abstract final class HooElevation {
  static List<BoxShadow> floating(Color shadow) => [BoxShadow(color: shadow, blurRadius: 24, offset: const Offset(0, 8))];
}

/// Motion tokens. Feature code must use these instead of inventing durations or curves.
abstract final class HooDurations {
  /// Taps and micro feedback.
  static const fast = Duration(milliseconds: 150);

  /// Standard component transitions.
  static const normal = Duration(milliseconds: 280);

  /// Meaningful UI transitions (sheets, page changes).
  static const medium = Duration(milliseconds: 450);

  /// Premium reveals.
  static const slow = Duration(milliseconds: 700);

  /// Splash and major brand transitions only.
  static const cinematic = Duration(milliseconds: 1100);

  /// Stagger step between sequenced elements (image → headline → copy → CTA).
  static const stagger = Duration(milliseconds: 90);

  /// Debounces (not motion, but timing tokens all the same).
  static const searchDebounce = Duration(milliseconds: 250);
  static const priceDebounce = Duration(milliseconds: 300);
  static const autosaveDebounce = Duration(milliseconds: 1200);
}

abstract final class HooCurves {
  /// Default — easeOutCubic.
  static const standard = Cubic(0.33, 1, 0.68, 1);

  /// Strong deceleration for emphasized entrances.
  static const emphasized = Cubic(0.2, 0, 0, 1);

  static const enter = Cubic(0.16, 1, 0.3, 1);
  static const exit = Cubic(0.7, 0, 0.84, 0);

  /// Slow-in slow-out for brand moments (splash, hero reveals).
  static const cinematic = Cubic(0.83, 0, 0.17, 1);
}
