import 'package:flutter/material.dart';
import '../providers/language_provider.dart';
import 'app_strings.dart';

class AppLocalizations {
  final AppLanguage language;

  AppLocalizations(this.language);

  String get(String key) {
    return AppStrings.get(key, language);
  }

  static AppLocalizations of(BuildContext context) {
    final languageProvider = LanguageProvider();
    return AppLocalizations(languageProvider.currentLanguage);
  }
}