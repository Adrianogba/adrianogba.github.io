import 'package:flutter/widgets.dart';

/// Um link do cabeçalho: contato ou página onde minhas bibliotecas são
/// publicadas.
class ProfileLinkModel {
  final String label;
  final String url;
  final IconData icon;

  /// Categoria registrada no analytics.
  final String linkType;

  const ProfileLinkModel({required this.label, required this.url, required this.icon, required this.linkType});
}
