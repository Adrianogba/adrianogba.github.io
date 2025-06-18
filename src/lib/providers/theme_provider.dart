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

  void toggleTheme() {
    final previousTheme = _themeMode.toString();
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    
    // Registrar evento de mudança de tema
    final analyticsService = AnalyticsService();
    analyticsService.logThemeChange(previousTheme, _themeMode.toString());
    
    notifyListeners();
  }

  // Temas da aplicação obtidos do repositório
  ThemeData get lightTheme => _repository.getLightTheme();

  ThemeData get darkTheme => _repository.getDarkTheme();
}