import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../data/models/language_model.dart';
import '../data/services/localization_service.dart';

class LocalizationViewModel extends ChangeNotifier {
  LocalizationViewModel() {
    _initializeLanguage();
  }

  static const List<LanguageModel> supportedLanguages = [
    LanguageModel('English', 'en', 'GB'),
    LanguageModel('العربية', 'ar', 'AE'),
  ];

  late LanguageModel _language;

  LanguageModel get language => _language;
  Locale get locale => LocalizationService.locale;

  void _initializeLanguage() {
    final savedCode = LocalizationService.savedLanguageCode;
    _language = supportedLanguages.firstWhere(
      (lang) => lang.code == savedCode,
      orElse: () => supportedLanguages.first,
    );
    selectLanguage(_language);
  }

  Future<void> selectLanguage(LanguageModel languageModel) async {
    _language = languageModel;
    LocalizationService.changeLocale(languageModel.code);
    await initializeDateFormatting(languageModel.code, null);
    notifyListeners();
  }

  void onChange(LanguageModel? value) {
    if (value == null) return;
    _language = value;
    notifyListeners();
  }

  void saveLanguageChange() {
    LocalizationService.changeLocale(_language.code);
    notifyListeners();
  }

  void dismiss() {
    final currentLocale = LocalizationService.locale.languageCode;
    _language = supportedLanguages.firstWhere(
      (element) => currentLocale == element.code,
      orElse: () => supportedLanguages.first,
    );
    notifyListeners();
  }
}
