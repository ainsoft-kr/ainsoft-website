import 'package:flutter/material.dart';

import '../data/services/theme_service.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeViewModel(this._themeService) {
    _initializeTheme();
  }

  final ThemeService _themeService;

  static const ThemeMode fallbackTheme = ThemeMode.light;

  bool _isDark = false;
  ThemeMode _themeMode = ThemeMode.light;

  bool get isDark => _isDark;
  ThemeMode get themeMode => _themeMode;

  void _initializeTheme() {
    _applyTheme(_getSavedThemeMode(), persist: false);
  }

  void changeTheme(ThemeMode newThemeMode) {
    _applyTheme(newThemeMode);
  }

  void toggleTheme() {
    changeTheme(_isDark ? ThemeMode.light : ThemeMode.dark);
  }

  void _applyTheme(ThemeMode mode, {bool persist = true}) {
    _themeMode = mode;
    _isDark = mode == ThemeMode.dark;

    if (persist) {
      _themeService.saveThemeMode(mode.toString());
    }

    notifyListeners();
  }

  ThemeMode _getSavedThemeMode() {
    final savedString = _themeService.getSavedThemeMode();

    if (savedString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }
    if (savedString == ThemeMode.system.toString()) {
      return ThemeMode.system;
    }
    return fallbackTheme;
  }
}
