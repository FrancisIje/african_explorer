import 'package:flutter/material.dart';

/// Design tokens for the app, in light and dark mode.
///
/// The palette mirrors the `African Explorer` variable collection in the
/// "African Explorer — Safari App UI" Figma file, and matches
/// `react_native_variant/src/constants/theme.ts`. That collection ships a
/// single (dark) mode, so [AppColors.dark] matches the design 1:1 and
/// [AppColors.light] is its cream-ground counterpart built from
/// `color/bg/cream`.
///
/// Tokens that Material's [ColorScheme] has no slot for — `textSecondary`,
/// `backgroundElement`, `accentPressed` — are reached through the theme
/// extension:
///
/// ```dart
/// final colors = Theme.of(context).extension<AppColors>()!;
/// ```
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.text,
    required this.textSecondary,
    required this.background,
    required this.backgroundElement,
    required this.backgroundSelected,
    required this.surface,
    required this.accent,
    required this.accentPressed,
  });

  final Color text;
  final Color textSecondary;
  final Color background;
  final Color backgroundElement;
  final Color backgroundSelected;
  final Color surface;
  final Color accent;
  final Color accentPressed;

  static const AppColors light = AppColors(
    // Figma `color/bg/base`, used as ink on cream
    text: Color(0xFF17120F),
    textSecondary: Color(0xFF6B6259),
    // Figma `color/bg/cream`
    background: Color(0xFFFFFFFF),
    backgroundElement: Color(0xFFF3EFEA),
    backgroundSelected: Color(0xFFE6DFD8),
    surface: Color(0xFFF3EFEA),
    // Figma `color/accent/red`
    accent: Color(0xFFE8402A),
    // Figma `color/accent/sunset`
    accentPressed: Color(0xFFC03A25),
  );

  static const AppColors dark = AppColors(
    // Figma `color/text/primary`
    text: Color(0xFFFFFFFF),
    // Figma `color/text/secondary`
    textSecondary: Color(0xFF9A8F86),
    // Figma `color/bg/base`
    background: Color(0xFF17120F),
    // Figma `color/bg/surface`
    backgroundElement: Color(0xFF2E2724),
    backgroundSelected: Color(0xFF3B3330),
    // Figma `color/bg/surface`
    surface: Color(0xFF2E2724),
    // Figma `color/accent/red`
    accent: Color(0xFFE8402A),
    // Figma `color/accent/sunset`
    accentPressed: Color(0xFFC03A25),
  );

  @override
  AppColors copyWith({
    Color? text,
    Color? textSecondary,
    Color? background,
    Color? backgroundElement,
    Color? backgroundSelected,
    Color? surface,
    Color? accent,
    Color? accentPressed,
  }) {
    return AppColors(
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      background: background ?? this.background,
      backgroundElement: backgroundElement ?? this.backgroundElement,
      backgroundSelected: backgroundSelected ?? this.backgroundSelected,
      surface: surface ?? this.surface,
      accent: accent ?? this.accent,
      accentPressed: accentPressed ?? this.accentPressed,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      text: Color.lerp(text, other.text, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundElement:
          Color.lerp(backgroundElement, other.backgroundElement, t)!,
      backgroundSelected:
          Color.lerp(backgroundSelected, other.backgroundSelected, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentPressed: Color.lerp(accentPressed, other.accentPressed, t)!,
    );
  }
}

/// Spacing scale. `gap` and `gutter` come from the Figma `space/*` tokens; the
/// rest is the shared step scale used by the React Native variant.
abstract final class AppSpacing {
  static const double half = 2;
  static const double one = 4;
  static const double two = 8;
  static const double three = 16;
  static const double four = 24;
  static const double five = 32;
  static const double six = 64;

  /// Figma `space/gap`
  static const double gap = 12;

  /// Figma `space/gutter`
  static const double gutter = 24;
}

/// Figma `radius/*`
abstract final class AppRadius {
  static const double card = 6;
  static const double pill = 999;
}

abstract final class AppLayout {
  static const double maxContentWidth = 800;
}

/// [ThemeData] built from the tokens above, for [MaterialApp.theme] and
/// [MaterialApp.darkTheme].
abstract final class AppTheme {
  static final ThemeData light = _build(Brightness.light, AppColors.light);
  static final ThemeData dark = _build(Brightness.dark, AppColors.dark);

  static ThemeData _build(Brightness brightness, AppColors colors) {
    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.accent,
        onPrimary: const Color(0xFFFFFFFF),
        secondary: colors.accentPressed,
        onSecondary: const Color(0xFFFFFFFF),
        surface: colors.background,
        onSurface: colors.text,
        surfaceContainer: colors.backgroundElement,
        surfaceContainerHighest: colors.backgroundSelected,
        onSurfaceVariant: colors.textSecondary,
        error: colors.accent,
        onError: const Color(0xFFFFFFFF),
      ),
      scaffoldBackgroundColor: colors.background,
      extensions: <ThemeExtension<dynamic>>[colors],
    );
  }
}
