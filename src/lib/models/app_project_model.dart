/// Um aplicativo exibido na aba de portfólio.
class AppProjectModel {
  final String name;
  final String description;

  /// Link da Google Play, quando o app está publicado.
  final String? storeUrl;

  /// Link da App Store, quando o app também saiu no iOS.
  final String? appStoreUrl;

  /// Link para o site, artigo ou página do projeto.
  final String? websiteUrl;

  /// Rótulo do link acima ("Site do projeto", "Artigo", ...).
  final String? websiteLabel;

  /// Política de privacidade hospedada neste site, quando o app precisa de uma.
  final String? privacyPolicyUrl;

  /// Captura de tela do app, quando existe.
  final String? screenshot;

  const AppProjectModel({
    required this.name,
    required this.description,
    this.storeUrl,
    this.appStoreUrl,
    this.websiteUrl,
    this.websiteLabel,
    this.privacyPolicyUrl,
    this.screenshot,
  });
}
