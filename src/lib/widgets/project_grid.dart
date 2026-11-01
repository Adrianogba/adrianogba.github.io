import 'package:flutter/material.dart';

/// Distribui os cards do portfólio em colunas de mais ou menos [larguraAlvo],
/// em vez de uma única coluna ocupando a linha inteira.
class ProjectGrid extends StatelessWidget {
  final List<Widget> children;
  final double larguraAlvo;
  final double espacamento;

  const ProjectGrid({super.key, required this.children, this.larguraAlvo = 350, this.espacamento = 16});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final disponivel = constraints.maxWidth;
        final colunas = ((disponivel + espacamento) / (larguraAlvo + espacamento)).floor().clamp(1, 4);
        // Divide o espaço entre as colunas, mas sem deixar o bloco esticar
        // muito além da largura alvo: o conteúdo fica mais fácil de varrer.
        final largura = ((disponivel - espacamento * (colunas - 1)) / colunas).clamp(0.0, larguraAlvo);

        return Wrap(
          spacing: espacamento,
          runSpacing: espacamento,
          alignment: WrapAlignment.center,
          children: [for (final child in children) SizedBox(width: largura, child: child)],
        );
      },
    );
  }
}
