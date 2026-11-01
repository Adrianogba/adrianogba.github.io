import 'package:flutter/material.dart';

/// Cores do banner, iguais às do banner do perfil do GitHub.
class GridBannerColors {
  const GridBannerColors._();

  static List<Color> background(bool isDark) => isDark ? const [Color(0xFF0D1117), Color(0xFF10212F)] : const [Color(0xFFFFFFFF), Color(0xFFE8F1FA)];

  static Color grid(bool isDark) => isDark ? const Color(0xFF8B949E) : const Color(0xFF59636E);

  /// Texto e ícones sobre o banner.
  static Color foreground(bool isDark) => isDark ? const Color(0xFFF0F6FC) : const Color(0xFF1F2328);

  static Color secondaryForeground(bool isDark) => isDark ? const Color(0xFFC9D1D9) : const Color(0xFF59636E);

  static Color border(bool isDark) => isDark ? const Color(0xFF30363D) : const Color(0xFFD1D9E0);
}

/// Fundo do cabeçalho: gradiente diagonal com uma malha de 40px que vai
/// surgindo da esquerda para a direita, como no banner do perfil do GitHub.
class GridBanner extends StatelessWidget {
  final bool isDark;

  const GridBanner({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _GridBannerPainter(isDark: isDark),
    );
  }
}

class _GridBannerPainter extends CustomPainter {
  final bool isDark;

  const _GridBannerPainter({required this.isDark});

  static const double _cell = 40;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Gradiente de fundo, na diagonal.
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.35, 1.0],
          colors: GridBannerColors.background(isDark),
        ).createShader(rect),
    );

    // A malha é desenhada em uma camada à parte para poder ser recortada pela
    // máscara de opacidade logo abaixo.
    canvas.saveLayer(rect, Paint());

    final linha = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = GridBannerColors.grid(isDark).withValues(alpha: 0.16);

    for (double x = _cell; x < size.width; x += _cell) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linha);
    }
    for (double y = _cell; y < size.height; y += _cell) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linha);
    }

    // Máscara horizontal: invisível à esquerda, cheia à direita.
    canvas.drawRect(
      rect,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..shader = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.3, 1.0],
          colors: [Colors.white.withValues(alpha: 0), Colors.white],
        ).createShader(rect),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(_GridBannerPainter oldDelegate) => oldDelegate.isDark != isDark;
}
