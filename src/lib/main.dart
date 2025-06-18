import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'firebase_options.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // Firebase Analytics instance
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return Consumer<LanguageProvider>(
            builder: (context, languageProvider, _) {
              return MaterialApp(
                title: 'Portfólio - Adriano Pontes',
                debugShowCheckedModeBanner: false,
                navigatorObservers: [observer],
                theme: themeProvider.lightTheme.copyWith(
                  textTheme: GoogleFonts.robotoTextTheme(
                    themeProvider.lightTheme.textTheme,
                  ),
                ),
                darkTheme: themeProvider.darkTheme.copyWith(
                  textTheme: GoogleFonts.robotoTextTheme(
                    themeProvider.darkTheme.textTheme,
                  ),
                ),
                themeMode: themeProvider.themeMode,
                home: const PortfolioPage(),
              );
            },
          );
        },
      ),
    );
  }
}
