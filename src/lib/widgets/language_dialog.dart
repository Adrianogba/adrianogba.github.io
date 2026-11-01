import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/app_localizations.dart';
import '../providers/language_provider.dart';
import '../services/analytics_service.dart';

/// Seleção de idioma no estilo iOS: uma ação por idioma, com a bandeira e um
/// check no que está ativo.
class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  static const Map<AppLanguage, ({String rotulo, String bandeira})> _idiomas = {
    AppLanguage.portuguese: (rotulo: 'Português', bandeira: 'pt-BR'),
    AppLanguage.english: (rotulo: 'English', bandeira: 'en-US'),
    AppLanguage.spanish: (rotulo: 'Español', bandeira: 'es'),
    AppLanguage.german: (rotulo: 'Deutsch', bandeira: 'de'),
  };

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final strings = AppLocalizations(languageProvider.currentLanguage);

    return CupertinoTheme(
      data: CupertinoThemeData(brightness: Theme.of(context).brightness, primaryColor: Theme.of(context).colorScheme.primary),
      child: CupertinoAlertDialog(
        title: Padding(padding: const EdgeInsets.only(bottom: 4), child: Text(strings.get('selectLanguage'))),
        actions: [
          for (final entrada in _idiomas.entries) _OpcaoDeIdioma(language: entrada.key, rotulo: entrada.value.rotulo, bandeira: entrada.value.bandeira),
          CupertinoDialogAction(isDefaultAction: true, onPressed: () => Navigator.of(context).pop(), child: Text(strings.get('back'))),
        ],
      ),
    );
  }
}

class _OpcaoDeIdioma extends StatelessWidget {
  final AppLanguage language;
  final String rotulo;
  final String bandeira;

  const _OpcaoDeIdioma({required this.language, required this.rotulo, required this.bandeira});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final selecionado = provider.currentLanguage == language;
    final cor = Theme.of(context).colorScheme.primary;

    return CupertinoDialogAction(
      onPressed: () {
        final anterior = provider.currentLanguage.code;
        provider.setLanguage(language);
        AnalyticsService().logLanguageChange(anterior, language.code);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryFlag.fromLanguageCode(bandeira, theme: const ImageTheme(height: 20, width: 28, shape: RoundedRectangle(6))),
          const SizedBox(width: 12),
          Text(rotulo, style: TextStyle(fontWeight: selecionado ? FontWeight.w600 : FontWeight.w400)),
          if (selecionado) ...[const SizedBox(width: 8), Icon(CupertinoIcons.check_mark_circled_solid, size: 18, color: cor)],
        ],
      ),
    );
  }
}
