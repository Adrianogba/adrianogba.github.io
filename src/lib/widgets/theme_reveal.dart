import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Troca de tema com uma bolha que cresce a partir de onde se tocou.
///
/// Antes de trocar, fotografa a tela no tema atual e a mantém por cima; o tema
/// novo já fica desenhado embaixo e é revelado por um círculo que se abre do
/// ponto do toque até cobrir a tela.
class ThemeReveal extends StatefulWidget {
  final Widget child;

  const ThemeReveal({super.key, required this.child});

  static ThemeRevealState of(BuildContext context) => context.findAncestorStateOfType<ThemeRevealState>()!;

  @override
  State<ThemeReveal> createState() => ThemeRevealState();
}

class ThemeRevealState extends State<ThemeReveal> with SingleTickerProviderStateMixin {
  final GlobalKey _fronteira = GlobalKey();
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 650));

  ui.Image? _telaAnterior;
  Offset _origem = Offset.zero;

  /// Fotografa a tela, aplica [trocarTema] e anima a revelação a partir de
  /// [origem] (coordenadas globais). Se a foto falhar, só troca o tema.
  Future<void> trocar(Offset origem, VoidCallback trocarTema) async {
    if (_controller.isAnimating) return;

    final limite = _fronteira.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    ui.Image? foto;
    try {
      foto = await limite?.toImage(pixelRatio: MediaQuery.devicePixelRatioOf(context));
    } catch (_) {
      foto = null;
    }
    if (!mounted) return;
    if (foto == null) {
      trocarTema();
      return;
    }

    setState(() {
      _telaAnterior?.dispose();
      _telaAnterior = foto;
      _origem = origem;
    });
    trocarTema();

    await _controller.forward(from: 0);
    if (!mounted) return;
    setState(() {
      _telaAnterior?.dispose();
      _telaAnterior = null;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _telaAnterior?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(key: _fronteira, child: widget.child),
        if (_telaAnterior != null)
          Positioned.fill(
            // A foto é só imagem: os toques passam direto para a tela nova.
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => CustomPaint(
                  painter: _RevelacaoPainter(imagem: _telaAnterior!, origem: _origem, progresso: Curves.easeInOutCubic.transform(_controller.value)),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Desenha a tela antiga com um furo circular crescendo em [origem].
class _RevelacaoPainter extends CustomPainter {
  final ui.Image imagem;
  final Offset origem;
  final double progresso;

  _RevelacaoPainter({required this.imagem, required this.origem, required this.progresso});

  @override
  void paint(Canvas canvas, Size size) {
    // Raio que alcança o canto mais distante do toque.
    final cantos = [Offset.zero, Offset(size.width, 0), Offset(0, size.height), Offset(size.width, size.height)];
    final raioMaximo = cantos.map((c) => (c - origem).distance).reduce(math.max);

    final tela = Offset.zero & size;
    final furo = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(tela)
      ..addOval(Rect.fromCircle(center: origem, radius: raioMaximo * progresso));

    canvas.clipPath(furo);
    canvas.drawImageRect(imagem, Offset.zero & Size(imagem.width.toDouble(), imagem.height.toDouble()), tela, Paint()..filterQuality = FilterQuality.medium);
  }

  @override
  bool shouldRepaint(_RevelacaoPainter old) => old.progresso != progresso || old.imagem != imagem || old.origem != origem;
}
