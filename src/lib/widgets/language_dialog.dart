import 'dart:ui';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/app_localizations.dart';
import '../providers/language_provider.dart';
import '../services/analytics_service.dart';
import 'frosted_glass_container.dart';

/// Abre o seletor de idioma no mesmo padrão do app Eleições: cartão de vidro
/// centralizado, entrando com escala sobre um fundo desfocado, e uma lista
/// agrupada como nos Ajustes do iOS.
///
/// O vidro líquido do app não funciona na web, então o cartão usa o vidro
/// fosco (desfoque real do fundo) no lugar.
Future<void> showLanguagePicker(BuildContext context) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.35),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (ctx, _, _) => const LanguageDialog(),
    transitionBuilder: (ctx, animation, _, child) {
      final curva = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic, reverseCurve: Curves.easeInCubic);
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6 * curva.value, sigmaY: 6 * curva.value),
        child: FadeTransition(
          opacity: curva,
          child: ScaleTransition(scale: Tween(begin: 1.15, end: 1.0).animate(curva), child: child),
        ),
      );
    },
  );
}

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  static const List<({AppLanguage idioma, String rotulo, String bandeira})> _opcoes = [
    (idioma: AppLanguage.portuguese, rotulo: 'Português', bandeira: 'pt-BR'),
    (idioma: AppLanguage.english, rotulo: 'English', bandeira: 'en-US'),
    (idioma: AppLanguage.spanish, rotulo: 'Español', bandeira: 'es'),
    (idioma: AppLanguage.german, rotulo: 'Deutsch', bandeira: 'de'),
  ];

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  AppLanguage? _selecionado;
  bool _fechando = false;

  /// O check muda primeiro e só depois o diálogo fecha: dá para ver a escolha.
  Future<void> _escolher(AppLanguage idioma) async {
    if (_fechando) return;
    _fechando = true;
    final provider = Provider.of<LanguageProvider>(context, listen: false);
    final anterior = provider.currentLanguage.code;
    setState(() => _selecionado = idioma);
    await Future<void>.delayed(const Duration(milliseconds: 220));
    if (!mounted) return;
    Navigator.of(context).pop();
    provider.setLanguage(idioma);
    AnalyticsService().logLanguageChange(anterior, idioma.code);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final strings = AppLocalizations(provider.currentLanguage);
    final theme = Theme.of(context);
    final escuro = theme.brightness == Brightness.dark;
    final primaria = theme.colorScheme.primary;
    final atual = _selecionado ?? provider.currentLanguage;

    final fundoDoGrupo = escuro ? Colors.white.withValues(alpha: 0.07) : Colors.black.withValues(alpha: 0.04);
    final divisor = escuro ? Colors.white.withValues(alpha: 0.10) : Colors.black.withValues(alpha: 0.08);

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 340),
            child: Material(
              type: MaterialType.transparency,
              child: FrostedGlassContainer(
                borderRadius: 28,
                blur: 24,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: primaria.withValues(alpha: 0.14), shape: BoxShape.circle),
                        child: Icon(Icons.translate, color: primaria, size: 28),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      strings.get('selectLanguage'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.colorScheme.onSurface, fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      strings.get('chooseLanguageMessage'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 15, height: 1.4),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: ColoredBox(
                        color: fundoDoGrupo,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var i = 0; i < LanguageDialog._opcoes.length; i++) ...[
                              // Divisor recuado até depois da bandeira, como nos Ajustes do iOS.
                              if (i > 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 58),
                                  child: Container(height: 0.6, color: divisor),
                                ),
                              _LinhaDeIdioma(
                                rotulo: LanguageDialog._opcoes[i].rotulo,
                                bandeira: LanguageDialog._opcoes[i].bandeira,
                                selecionado: LanguageDialog._opcoes[i].idioma == atual,
                                cor: primaria,
                                onTap: () => _escolher(LanguageDialog._opcoes[i].idioma),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        strings.get('cancel'),
                        style: TextStyle(color: primaria, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LinhaDeIdioma extends StatelessWidget {
  final String rotulo;
  final String bandeira;
  final bool selecionado;
  final Color cor;
  final VoidCallback onTap;

  const _LinhaDeIdioma({required this.rotulo, required this.bandeira, required this.selecionado, required this.cor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 52),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: Center(
                  child: CountryFlag.fromLanguageCode(bandeira, theme: const ImageTheme(width: 28, height: 20, shape: RoundedRectangle(4))),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  rotulo,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 16, fontWeight: selecionado ? FontWeight.w600 : FontWeight.w400),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
                child: selecionado
                    ? Icon(Icons.check_rounded, key: const ValueKey(true), color: cor, size: 20)
                    : const SizedBox(key: ValueKey(false), width: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
