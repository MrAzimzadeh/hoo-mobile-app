import 'package:flutter/material.dart';

import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';

enum HooLogoVariant {
  /// Black wordmark (on white).
  dark,

  /// White wordmark (on black).
  light,

  /// White wordmark on the brand green.
  onGreen,
}

/// The `HOo` wordmark — "Modern Classic": capital H, capital O, lowercase o, Inter Bold, tight tracking.
/// Text-only, no icon. [variant] null → follows the theme (black in light mode, white in dark mode).
class HooLogo extends StatelessWidget {
  const HooLogo({super.key, this.variant, this.size = 28, this.letterSpacingEm});

  final HooLogoVariant? variant;

  /// Font size of the wordmark.
  final double size;

  /// Override tracking (em) — the splash animates it into the final −2%.
  final double? letterSpacingEm;

  static const text = 'HOo';

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    final color = switch (variant) {
      HooLogoVariant.dark => HooPalette.black,
      HooLogoVariant.light || HooLogoVariant.onGreen => HooPalette.white,
      null => colors.textPrimary,
    };
    return Semantics(
      label: 'HOO',
      excludeSemantics: true,
      child: Text(
        text,
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          fontFamily: HooType.family,
          fontWeight: FontWeight.w700,
          fontSize: size,
          height: 1,
          letterSpacing: size * (letterSpacingEm ?? HooType.wordmarkTracking),
          color: color,
        ),
      ),
    );
  }
}
