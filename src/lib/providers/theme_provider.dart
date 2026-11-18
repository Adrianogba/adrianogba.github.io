import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';
import '../services/analytics_service.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepository _repository = ThemeRepository();
  late ThemeMode _themeMode;

  ThemeProvider() {
    _themeMode = _repository.getDefaultThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  /// Alterna a partir do brilho que está na tela ([atual]), e não do modo
  /// salvo: com ThemeMode.system e o sistema escuro, trocar "system" por
  /// "dark" não mudaria nada e o primeiro clique pareceria não funcionar.
  void toggleTheme(Brightness atual) {
    final previousTheme = _themeMode.toString();
    _themeMode = atual == Brightness.dark ? ThemeMode.light : ThemeMode.dark;

    // Registrar evento de mudança de tema
    final analyticsService = AnalyticsService();
    analyticsService.logThemeChange(previousTheme, _themeMode.toString());

    notifyListeners();
  }

  // Temas da aplicação obtidos do repositório
  ThemeData get lightTheme => _repository.getLightTheme();

  ThemeData get darkTheme => _repository.getDarkTheme();
}
