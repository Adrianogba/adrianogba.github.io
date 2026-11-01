import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/profile_link_model.dart';
import '../services/analytics_service.dart';
import '../services/profile_link_service.dart';
import 'grid_banner.dart';

/// Conteúdo do cabeçalho, no mesmo arranjo do banner do repositório: foto à
/// esquerda, nome e cargo ao lado e, abaixo, os contatos em ícones.
class BannerHeader extends StatelessWidget {
  final bool isDark;
  final String jobTitle;

  const BannerHeader({super.key, required this.isDark, required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.sizeOf(context).width;
    final compacto = larguraTela < 600;
    final fg = GridBannerColors.foreground(isDark);
    final fg2 = GridBannerColors.secondaryForeground(isDark);

    final foto = Container(
      width: compacto ? 72 : 96,
      height: compacto ? 72 : 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(image: AssetImage('web/icons/2891052.jpeg'), fit: BoxFit.cover),
        border: Border.all(color: GridBannerColors.border(isDark), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.15),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
    );

    final textos = Column(
      crossAxisAlignment: compacto ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Adriano Pontes',
          textAlign: compacto ? TextAlign.center : TextAlign.start,
          style: TextStyle(fontSize: compacto ? 28 : 40, fontWeight: FontWeight.w700, letterSpacing: -1, color: fg, height: 1.1),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: compacto ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                jobTitle,
                textAlign: compacto ? TextAlign.center : TextAlign.start,
                style: TextStyle(fontSize: compacto ? 15 : 18, fontWeight: FontWeight.w500, color: fg2),
              ),
            ),
            const SizedBox(width: 8),
            CountryFlag.fromCountryCode('BR', theme: const ImageTheme(height: 14, width: 20, shape: RoundedRectangle(3))),
          ],
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(compacto ? 16 : 32, compacto ? 8 : 24, compacto ? 16 : 32, 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (compacto) ...[
            foto,
            const SizedBox(height: 10),
            textos,
          ] else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                foto,
                const SizedBox(width: 24),
                Flexible(child: textos),
              ],
            ),
          const SizedBox(height: 12),
          _LinhaDeContatos(isDark: isDark, compacto: compacto),
        ],
      ),
    );
  }
}

/// Ícones de contato.
class _LinhaDeContatos extends StatelessWidget {
  final bool isDark;
  final bool compacto;

  const _LinhaDeContatos({required this.isDark, required this.compacto});

  @override
  Widget build(BuildContext context) {
    const servico = ProfileLinkService();
    final fg = GridBannerColors.foreground(isDark);

    return Wrap(
      spacing: compacto ? 0 : 4,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: [for (final link in servico.contatos) _BotaoDeLink(link: link, cor: fg, compacto: compacto)],
    );
  }
}

class _BotaoDeLink extends StatelessWidget {
  final ProfileLinkModel link;
  final Color cor;
  final bool compacto;

  const _BotaoDeLink({required this.link, required this.cor, required this.compacto});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(link.icon, size: compacto ? 18 : 20),
      color: cor,
      tooltip: link.label,
      visualDensity: VisualDensity.compact,
      constraints: BoxConstraints(minWidth: compacto ? 36 : 40, minHeight: compacto ? 36 : 40),
      padding: EdgeInsets.zero,
      onPressed: () async {
        final uri = Uri.parse(link.url);
        if (await canLaunchUrl(uri)) {
          AnalyticsService().logLinkClick(link.linkType, link.url);
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
