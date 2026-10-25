import 'package:shared_preferences/shared_preferences.dart';

/// **PreferencesStorage**
///
/// Singleton wrapper around `shared_preferences` for lightweight app
/// preferences such as theme mode and language code.
///
/// **Why**
/// - Centralize keys to avoid drift.
/// - Keep reads synchronous after a single async [initialize].
///
/// **Example**
/// ```dart
/// await PreferencesStorage.instance.initialize();
/// PreferencesStorage.instance.languageCode = 'en';
/// ```
///
// ────────────────────────────────────────────────
class PreferencesStorage {
  PreferencesStorage._internal();

  static final PreferencesStorage _instance = PreferencesStorage._internal();
  static PreferencesStorage get instance => _instance;

  // Keys
  static const String _kThemeMode = 'themeMode';
  static const String _kLanguageCode = 'languageCode';

  late SharedPreferencesWithCache _prefs;

  /// **initialize**
  ///
  /// Load saved preferences into memory so reads stay synchronous.
  // ────────────────────────────────────────────────
  Future<void> initialize() async {
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {_kThemeMode, _kLanguageCode},
      ),
    );
  }

  // ---------- Theme Mode ----------

  /// **themeMode**
  ///
  /// Read the saved theme mode (string) or `null` when not set.
  String? get themeMode => _prefs.getString(_kThemeMode);

  /// **themeMode**
  ///
  /// Persist the theme mode (fire-and-forget write).
  set themeMode(String? value) => _write(_kThemeMode, value);

  // ---------- Language Code ----------

  /// **languageCode**
  String? get languageCode => _prefs.getString(_kLanguageCode);

  /// **languageCode**
  set languageCode(String? value) => _write(_kLanguageCode, value);

  void _write(String key, String? value) {
    value == null ? _prefs.remove(key) : _prefs.setString(key, value);
  }
}
