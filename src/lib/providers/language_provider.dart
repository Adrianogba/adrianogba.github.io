import 'package:flutter/material.dart';
import '../repositories/language_repository.dart';

enum AppLanguage {
  portuguese('pt', 'Português'),
  english('en', 'English'),
  spanish('es', 'Español'),
  german('de', 'Deutsch');

  final String code;
  final String displayName;

  const AppLanguage(this.code, this.displayName);
}

class LanguageProvider extends ChangeNotifier {
  final LanguageRepository _repository = LanguageRepository();
  late AppLanguage _currentLanguage;

  LanguageProvider() {
    _currentLanguage = _repository.getDefaultLanguage();
  }

  AppLanguage get currentLanguage => _currentLanguage;
  String get languageCode => _currentLanguage.code;
  String get displayName => _currentLanguage.displayName;
  List<AppLanguage> get availableLanguages => _repository.getAllLanguages();

  void setLanguage(AppLanguage language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      notifyListeners();
    }
  }

  // Método para alternar entre os idiomas disponíveis
  void toggleLanguage() {
    final languages = availableLanguages;
    final currentIndex = languages.indexOf(_currentLanguage);
    final nextIndex = (currentIndex + 1) % languages.length;
    setLanguage(languages[nextIndex]);
  }
}