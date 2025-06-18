import 'package:flutter/material.dart';

class ThemeRepository {
  // Singleton pattern
  static final ThemeRepository _instance = ThemeRepository._internal();
  
  factory ThemeRepository() {
    return _instance;
  }
  
  ThemeRepository._internal();
  
  // Método para obter o tema claro
  ThemeData getLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      iconTheme: const IconThemeData(
        color: Colors.blue,
        size: 24,
      ),
    );
  }
  
  // Método para obter o tema escuro
  ThemeData getDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      iconTheme: const IconThemeData(
        color: Colors.lightBlue,
        size: 24,
      ),
    );
  }
  
  // Método para obter o tema padrão
  ThemeMode getDefaultThemeMode() {
    return ThemeMode.system;
  }
}