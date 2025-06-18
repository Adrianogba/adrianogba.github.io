import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  // Singleton pattern
  static final AnalyticsService _instance = AnalyticsService._internal();
  
  factory AnalyticsService() {
    return _instance;
  }
  
  AnalyticsService._internal();
  
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  
  // Eventos de navegação
  Future<void> logScreenView(String screenName) async {
    await _analytics.logScreenView(screenName: screenName);
  }
  
  // Eventos de interação com idiomas
  Future<void> logLanguageChange(String fromLanguage, String toLanguage) async {
    await _analytics.logEvent(
      name: 'language_change',
      parameters: {
        'from_language': fromLanguage,
        'to_language': toLanguage,
      },
    );
  }
  
  // Eventos de interação com tema
  Future<void> logThemeChange(String fromTheme, String toTheme) async {
    await _analytics.logEvent(
      name: 'theme_change',
      parameters: {
        'from_theme': fromTheme,
        'to_theme': toTheme,
      },
    );
  }
  
  // Eventos de interação com links externos
  Future<void> logLinkClick(String linkType, String url) async {
    await _analytics.logEvent(
      name: 'link_click',
      parameters: {
        'link_type': linkType,
        'url': url,
      },
    );
  }
  
  // Eventos de interação com seções
  Future<void> logSectionView(String sectionName) async {
    await _analytics.logEvent(
      name: 'section_view',
      parameters: {
        'section_name': sectionName,
      },
    );
  }
  
  // Eventos de interação com contatos
  Future<void> logContactClick(String contactType) async {
    await _analytics.logEvent(
      name: 'contact_click',
      parameters: {
        'contact_type': contactType,
      },
    );
  }
  
  // Método genérico para registrar eventos personalizados
  Future<void> logEvent({required String name, Map<String, Object>? parameters}) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}