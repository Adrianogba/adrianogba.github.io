import 'package:flutter/material.dart';

/// Captura de tela dentro de um card do portfólio.
///
/// As imagens têm proporções bem diferentes entre si, então ela ocupa a largura
/// do card e cresce só até [maxHeight], sem cortar nada.
class ProjectScreenshot extends StatelessWidget {
  final String asset;
  final String label;
  final double maxHeight;

  const ProjectScreenshot({super.key, required this.asset, required this.label, this.maxHeight = 260});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: maxHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        ),
        child: Image.asset(asset, fit: BoxFit.contain, semanticLabel: label, filterQuality: FilterQuality.medium),
      ),
    );
  }
}
