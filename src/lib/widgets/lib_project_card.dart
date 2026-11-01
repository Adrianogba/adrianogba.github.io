import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../localization/app_localizations.dart';
import '../models/lib_project_model.dart';
import 'project_link_button.dart';
import 'project_screenshot.dart';
import 'tech_chip.dart';

/// Card de uma biblioteca publicada. O link do registro de pacotes vem antes do
/// repositório, por ser o que interessa a quem vai usar a biblioteca.
class LibProjectCard extends StatelessWidget {
  final LibProjectModel lib;
  final AppLocalizations strings;

  const LibProjectCard({super.key, required this.lib, required this.strings});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.widgets_outlined, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: SelectableText(lib.name, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, letterSpacing: -0.2)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SelectableText(lib.description, style: TextStyle(height: 1.5, color: theme.colorScheme.onSurfaceVariant)),
            if (lib.technologies.isNotEmpty) ...[
              const SizedBox(height: 14),
              Wrap(spacing: 6, runSpacing: 6, children: lib.technologies.map((tech) => TechChip(label: tech)).toList()),
            ],
            if (lib.screenshot != null) ...[const SizedBox(height: 16), ProjectScreenshot(asset: lib.screenshot!, label: lib.name)],
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (lib.packageUrl != null)
                  ProjectLinkButton(
                    label: lib.packageLabel ?? strings.get('getPackage'),
                    url: lib.packageUrl!,
                    icon: Icons.download_outlined,
                    linkType: 'library_package',
                    primary: true,
                  ),
                ProjectLinkButton(
                  label: strings.get('sourceCode'),
                  url: lib.repositoryUrl,
                  icon: FontAwesomeIcons.github.data,
                  linkType: 'library_repository',
                  primary: lib.packageUrl == null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
