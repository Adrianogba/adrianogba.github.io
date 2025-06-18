import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_flags/country_flags.dart';

import '../providers/language_provider.dart';
import '../localization/app_localizations.dart';
import '../services/analytics_service.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final strings = AppLocalizations(languageProvider.currentLanguage);

    return AlertDialog(
      title: Text(strings.get('selectLanguage')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageOption(
            context,
            AppLanguage.portuguese,
            'Português',
            Icons.language,
            languageProvider,
          ),
          const SizedBox(height: 8),
          _buildLanguageOption(
            context,
            AppLanguage.english,
            'English',
            Icons.language,
            languageProvider,
          ),
          const SizedBox(height: 8),
          _buildLanguageOption(
            context,
            AppLanguage.spanish,
            'Español',
            Icons.language,
            languageProvider,
          ),
          const SizedBox(height: 8),
          _buildLanguageOption(
            context,
            AppLanguage.german,
            'Deutsch',
            Icons.language,
            languageProvider,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(strings.get('back')),
        ),
      ],
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    AppLanguage language,
    String label,
    IconData icon,
    LanguageProvider provider,
  ) {
    final isSelected = provider.currentLanguage == language;
    final theme = Theme.of(context);
    final analyticsService = AnalyticsService();
    
    // Definir o código do país para a bandeira
    Widget flagWidget;
    switch (language.code) {
      case 'pt':
        flagWidget = CountryFlag.fromLanguageCode(
          'pt-BR',
          height: 24,
          width: 32,
          shape: const RoundedRectangle(8),
        );
        break;
      case 'en':
        flagWidget = CountryFlag.fromLanguageCode(
          'en-US',
          height: 24,
          width: 32,
          shape: const RoundedRectangle(8),
        );
        break;
      case 'es':
        flagWidget = CountryFlag.fromLanguageCode(
          'es',
          height: 24,
          width: 32,
          shape: const RoundedRectangle(8),
        );
      case 'de':
        flagWidget = CountryFlag.fromLanguageCode(
          'de',
          height: 24,
          width: 32,
          shape: const RoundedRectangle(8),
        );
        break;
      default:
        flagWidget = Icon(
          icon,
          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
        );
    }

    return InkWell(
      onTap: () {
        final previousLanguage = provider.currentLanguage.code;
        provider.setLanguage(language);
        
        // Registrar evento de mudança de idioma
        analyticsService.logLanguageChange(previousLanguage, language.code);
        
        // Comentado para manter o diálogo aberto após a seleção
        // Navigator.of(context).pop();
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary.withValues(alpha: 0.1) : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected 
                ? theme.colorScheme.primary 
                : theme.colorScheme.onSurface.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            flagWidget,
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}