/// Uma biblioteca publicada, exibida na aba de portfólio.
class LibProjectModel {
  final String name;
  final String description;
  final List<String> technologies;

  /// Onde a biblioteca é obtida como dependência (pub.dev, npm, Maven Central,
  /// Swift Package Index). Vem antes do repositório na interface.
  final String? packageUrl;

  /// Nome do registro do link acima ("pub.dev", "Maven Central", ...).
  final String? packageLabel;

  /// Repositório com o código-fonte.
  final String repositoryUrl;

  /// Captura de tela do app de exemplo, quando existe.
  final String? screenshot;

  const LibProjectModel({
    required this.name,
    required this.description,
    required this.repositoryUrl,
    this.technologies = const [],
    this.packageUrl,
    this.packageLabel,
    this.screenshot,
  });
}
