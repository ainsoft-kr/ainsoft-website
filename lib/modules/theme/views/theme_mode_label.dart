import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/shared/presentation/custom/custom_text.dart';
import '/modules/locale/data/keys.dart';

/// **ThemeModeLabel**
///
/// A text widget displaying the localized label for dark mode setting.
///
/// **Why**
/// - Provide consistent labeling for theme controls.
/// - Support internationalization via GetX translations.
///
/// **Key Features**
/// - Uses CustomText for consistent styling.
/// - Translatable via localization keys.
/// - Displays "Dark mode" label.
///
/// **Example**
/// ```dart
/// ThemeModeLabel()
/// ```
///
// ────────────────────────────────────────────────
class ThemeModeLabel extends StatelessWidget {
  /// Constructor for ThemeModeLabel.
  const ThemeModeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(tkDarkMode.tr);
  }
}
