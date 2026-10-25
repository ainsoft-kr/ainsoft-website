import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_font_config.dart';

/// **Light Theme**
///
/// Material 3 rosy-red seeded light theme.
///
/// **Why**
/// - Adopt Material 3 for modern components and dynamic color harmonization.
/// - Use a single seed to derive a cohesive ColorScheme.
///
/// **Notes**
/// - Prefer Theme.of(context).colorScheme.* in widgets instead of legacy fields.
///
// ────────────────────────────────────────────────
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0E2A2B),
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFF4F0E8),
  textTheme: _dmSansTextTheme(ThemeData.light().textTheme).apply(
    fontFamilyFallback: appFontFallback,
  ),
  appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
);

/// **Dark Theme**
///
/// Material 3 rosy-red seeded dark theme.
///
/// **Why**
/// - Provide dark mode support for better UX in low-light environments.
/// - Match light theme color palette for consistency.
///
/// **Notes**
/// - Uses same seed color to maintain brand consistency.
///
// ────────────────────────────────────────────────
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFC66B3D),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFC66B3D),
    brightness: Brightness.dark,
  ),
  textTheme: _dmSansTextTheme(ThemeData.dark().textTheme).apply(
    fontFamilyFallback: appFontFallback,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);

/// Applies DM Sans to every style of [base].
///
/// google_fonts 9 builds its `TextTheme` helpers on the `material_ui` package,
/// whose `TextTheme` is a different type from Flutter's, so the per-style
/// `GoogleFonts.dmSans` call is used instead.
TextTheme _dmSansTextTheme(TextTheme base) {
  TextStyle? dmSans(TextStyle? style) => GoogleFonts.dmSans(textStyle: style);
  return base.copyWith(
    displayLarge: dmSans(base.displayLarge),
    displayMedium: dmSans(base.displayMedium),
    displaySmall: dmSans(base.displaySmall),
    headlineLarge: dmSans(base.headlineLarge),
    headlineMedium: dmSans(base.headlineMedium),
    headlineSmall: dmSans(base.headlineSmall),
    titleLarge: dmSans(base.titleLarge),
    titleMedium: dmSans(base.titleMedium),
    titleSmall: dmSans(base.titleSmall),
    bodyLarge: dmSans(base.bodyLarge),
    bodyMedium: dmSans(base.bodyMedium),
    bodySmall: dmSans(base.bodySmall),
    labelLarge: dmSans(base.labelLarge),
    labelMedium: dmSans(base.labelMedium),
    labelSmall: dmSans(base.labelSmall),
  );
}

/// Legacy export for backwards compatibility
@Deprecated('Use lightTheme instead')
final ThemeData theme = lightTheme;
