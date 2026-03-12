import 'data/services/theme_service.dart';

/// **ThemeBindings**
///
/// Dependency injection bindings for the theme module.
///
/// **Why**
/// - Ensure ThemeViewModel and ThemeService are properly initialized.
/// - Follow GetX dependency injection pattern consistently.
///
/// **Key Features**
/// - Lazily creates ThemeService singleton.
/// - Lazily creates ThemeViewModel with ThemeService dependency.
/// - Uses fenix mode to allow recreation if deleted.
///
/// **Example**
/// ```dart
/// ThemeBindings().dependencies();
/// final themeVM = Get.find<ThemeViewModel>();
/// ```
///
// ────────────────────────────────────────────────
class ThemeBindings {
  ThemeService createService() => ThemeService();
}
