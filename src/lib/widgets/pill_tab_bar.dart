import 'package:flutter/material.dart';

import 'grid_banner.dart';

/// Abas em formato de pílula, centralizadas e com largura própria, em vez de
/// duas metades da tela. Dá destaque à aba atual sem ocupar a linha inteira.
class PillTabBar extends StatelessWidget {
  final TabController controller;
  final bool isDark;
  final List<String> labels;

  const PillTabBar({super.key, required this.controller, required this.isDark, required this.labels});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selecionada = theme.colorScheme.primary;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: GridBannerColors.border(isDark).withValues(alpha: 0.8)),
        ),
        child: TabBar(
          controller: controller,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          dividerColor: Colors.transparent,
          splashBorderRadius: BorderRadius.circular(999),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: selecionada.withValues(alpha: isDark ? 0.28 : 0.14),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: selecionada.withValues(alpha: 0.55)),
          ),
          labelColor: GridBannerColors.foreground(isDark),
          unselectedLabelColor: GridBannerColors.secondaryForeground(isDark),
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.2),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.2),
          labelPadding: const EdgeInsets.symmetric(horizontal: 26),
          tabs: [for (final label in labels) Tab(height: 36, text: label)],
        ),
      ),
    );
  }
}
