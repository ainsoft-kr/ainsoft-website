import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_starter/modules/locale/data/services/localization_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalizationService', () {
    tearDown(() => LocalizationService.changeLocale('en'));

    group('tr', () {
      test('returns the English string for a known key', () {
        LocalizationService.changeLocale('en');
        expect(LocalizationService.tr('buttons.confirm'), 'Confirm');
      });

      test('returns the key itself when it is unknown', () {
        expect(LocalizationService.tr('no.such.key'), 'no.such.key');
      });
    });

    group('supportedLocales', () {
      test('lists every translation table', () {
        expect(
          LocalizationService.supportedLocales.map((l) => l.languageCode),
          containsAll(['en', 'ar']),
        );
      });
    });

    group('savedLanguageCode', () {
      test('returns fallback locale code when no saved preference', () {
        // When no language is saved, should return fallback (English)
        final code = LocalizationService.savedLanguageCode;
        expect(code, equals('en'));
      });

      test('validates saved code against supported languages', () {
        // The service should validate against supported translations
        final code = LocalizationService.savedLanguageCode;
        final supportedCodes = LocalizationService.translations.keys;
        expect(supportedCodes.contains(code), isTrue);
      });
    });

    group('fallbackLocale', () {
      test('is set to English', () {
        expect(LocalizationService.fallbackLocale, equals(const Locale('en')));
      });
    });

    group('keys', () {
      test('contains English translations', () {
        expect(LocalizationService.translations.containsKey('en'), isTrue);
      });

      test('contains Arabic translations', () {
        expect(LocalizationService.translations.containsKey('ar'), isTrue);
      });

      test('English translations are not empty', () {
        final enTranslations = LocalizationService.translations['en'];
        expect(enTranslations, isNotNull);
        expect(enTranslations!.isNotEmpty, isTrue);
      });

      test('Arabic translations are not empty', () {
        final arTranslations = LocalizationService.translations['ar'];
        expect(arTranslations, isNotNull);
        expect(arTranslations!.isNotEmpty, isTrue);
      });

      test('both languages have same keys', () {
        final enKeys = LocalizationService.translations['en']!.keys.toSet();
        final arKeys = LocalizationService.translations['ar']!.keys.toSet();

        // Check if all English keys exist in Arabic
        expect(
          arKeys.containsAll(enKeys),
          isTrue,
          reason: 'Arabic translations should contain all English keys',
        );

        // Check if all Arabic keys exist in English
        expect(
          enKeys.containsAll(arKeys),
          isTrue,
          reason: 'English translations should contain all Arabic keys',
        );
      });
    });

    group('changeLocale', () {
      test('ignores invalid language codes', () {
        // Should not throw when given invalid code
        expect(
          () => LocalizationService.changeLocale('invalid'),
          returnsNormally,
        );
      });

      test('accepts valid language codes', () {
        // Should not throw when given valid codes
        expect(() => LocalizationService.changeLocale('en'), returnsNormally);
        expect(() => LocalizationService.changeLocale('ar'), returnsNormally);
      });
    });

    group('init', () {
      test('does not throw when called multiple times', () {
        // Should be idempotent
        expect(() {
          LocalizationService.init();
          LocalizationService.init();
          LocalizationService.init();
        }, returnsNormally);
      });
    });

    group('Translation keys', () {
      test('app name key exists in both languages', () {
        expect(
          LocalizationService.translations['en']!.containsKey('app.name'),
          isTrue,
        );
        expect(
          LocalizationService.translations['ar']!.containsKey('app.name'),
          isTrue,
        );
      });

      test('auth input keys exist', () {
        final enKeys = LocalizationService.translations['en']!;

        expect(enKeys.containsKey('auth.inputs.username'), isTrue);
        expect(enKeys.containsKey('auth.inputs.email'), isTrue);
        expect(enKeys.containsKey('auth.inputs.password'), isTrue);
        expect(enKeys.containsKey('auth.inputs.phone'), isTrue);
      });

      test('validation message keys exist', () {
        final enKeys = LocalizationService.translations['en']!;

        expect(enKeys.containsKey('validations.email.empty'), isTrue);
        expect(enKeys.containsKey('validations.email.notValid'), isTrue);
        expect(enKeys.containsKey('validations.password.empty'), isTrue);
      });

      test('error message keys exist', () {
        final enKeys = LocalizationService.translations['en']!;

        expect(enKeys.containsKey('errors.generic'), isTrue);
        expect(enKeys.containsKey('errors.network'), isTrue);
        expect(enKeys.containsKey('errors.noInternet'), isTrue);
      });

      test('page title keys exist', () {
        final enKeys = LocalizationService.translations['en']!;

        expect(enKeys.containsKey('pages.home.title'), isTrue);
        expect(enKeys.containsKey('pages.login.title'), isTrue);
        expect(enKeys.containsKey('pages.register.title'), isTrue);
      });

      test('button label keys exist', () {
        final enKeys = LocalizationService.translations['en']!;

        expect(enKeys.containsKey('buttons.confirm'), isTrue);
        expect(enKeys.containsKey('buttons.login'), isTrue);
        expect(enKeys.containsKey('buttons.register'), isTrue);
      });
    });
  });
}
