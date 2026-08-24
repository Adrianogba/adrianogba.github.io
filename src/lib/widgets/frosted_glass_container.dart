import 'dart:ui';

import 'package:flutter/material.dart';

/// Container com fundo de vidro fosco: desfoca de verdade o conteúdo que passa
/// por trás ([BackdropFilter]), sobre uma superfície translúcida com brilho no
/// topo e borda sutil.
class FrostedGlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double blur;

  const FrostedGlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    this.margin,
    this.blur = 18,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surface = theme.colorScheme.surface;
    final radius = BorderRadius.circular(borderRadius);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.15), blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 6))],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(color: (isDark ? Colors.white : Colors.black).withValues(alpha: isDark ? 0.16 : 0.08), width: 1),
              // Superfície translúcida com um leve brilho no topo, imitando o
              // reflexo de uma lâmina de vidro.
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.alphaBlend(Colors.white.withValues(alpha: isDark ? 0.10 : 0.30), surface.withValues(alpha: isDark ? 0.55 : 0.6)),
                  surface.withValues(alpha: isDark ? 0.68 : 0.72),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
