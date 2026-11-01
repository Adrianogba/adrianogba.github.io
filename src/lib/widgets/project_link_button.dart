import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/analytics_service.dart';

/// Botão de link usado nos cards do portfólio. O [primary] é destacado — nas
/// bibliotecas é o registro de pacotes, que vem antes do repositório.
class ProjectLinkButton extends StatelessWidget {
  final String label;
  final String url;
  final IconData icon;
  final bool primary;

  /// Categoria registrada no analytics ('app_store', 'library_package', ...).
  final String linkType;

  const ProjectLinkButton({super.key, required this.label, required this.url, required this.icon, required this.linkType, this.primary = false});

  Future<void> _open() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      AnalyticsService().logLinkClick(linkType, url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final icone = Icon(icon, size: 16);
    final texto = Text(label);

    if (primary) {
      return FilledButton.tonalIcon(onPressed: _open, icon: icone, label: texto);
    }
    return OutlinedButton.icon(onPressed: _open, icon: icone, label: texto);
  }
}
