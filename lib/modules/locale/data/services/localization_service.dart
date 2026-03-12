import 'dart:ui';

import '/core/infrastructure/storage/preferences_storage.dart';
import '/modules/locale/data/lang/lang.dart';

class LocalizationService {
  static const fallbackLocale = Locale('en');

  static final Map<String, Map<String, String>> translations = {
    'en': englishTranslationsMap,
    'ar': arabicTranslationsMap,
  };

  static Locale _locale = fallbackLocale;

  static Locale get locale => _locale;

  static List<Locale> get supportedLocales => translations.keys
      .map((languageCode) => Locale(languageCode))
      .toList(growable: false);

  static String get savedLanguageCode {
    try {
      final saved = PreferencesStorage.instance.languageCode;
      if (saved != null && translations.containsKey(saved)) {
        return saved;
      }

      final deviceCode = PlatformDispatcher.instance.locale.languageCode;
      if (translations.containsKey(deviceCode)) {
        return deviceCode;
      }
    } catch (_) {
      // Fall back to English when storage is not available.
    }

    return fallbackLocale.languageCode;
  }

  static void init() {
    _updateLocale(savedLanguageCode);
  }

  static void changeLocale(String languageCode) {
    if (!translations.containsKey(languageCode)) return;

    _updateLocale(languageCode);
    _saveLocale(languageCode);
  }

  static String tr(String key) {
    final current = translations[_locale.languageCode];
    final fallback = translations[fallbackLocale.languageCode];
    return current?[key] ?? fallback?[key] ?? key;
  }

  static void _saveLocale(String languageCode) {
    try {
      PreferencesStorage.instance.languageCode = languageCode;
    } catch (_) {
      // Ignore persistence failures and keep the in-memory locale.
    }
  }

  static void _updateLocale(String languageCode) {
    _locale = Locale(languageCode);
  }
}
