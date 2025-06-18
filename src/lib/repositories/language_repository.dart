import '../providers/language_provider.dart';

class LanguageRepository {
  // Singleton pattern
  static final LanguageRepository _instance = LanguageRepository._internal();
  
  factory LanguageRepository() {
    return _instance;
  }
  
  LanguageRepository._internal();
  
  // Método para obter todos os idiomas disponíveis
  List<AppLanguage> getAllLanguages() {
    return AppLanguage.values;
  }
  
  // Método para obter o idioma padrão
  AppLanguage getDefaultLanguage() {
    return AppLanguage.portuguese;
  }
}