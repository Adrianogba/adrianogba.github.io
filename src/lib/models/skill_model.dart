class SkillModel {
  final String name;
  final double proficiency; // Valor de 0.0 a 1.0 representando o nível de proficiência
  final String? description;
  final String category; // Ex: 'Linguagens de Programação', 'Frameworks', 'Ferramentas', etc.

  SkillModel({
    required this.name,
    required this.proficiency,
    required this.category,
    this.description,
  });

  /// Retorna o nível de proficiência em formato de texto
  String get proficiencyLevel {
    if (proficiency >= 0.9) {
      return 'Especialista';
    } else if (proficiency >= 0.7) {
      return 'Avançado';
    } else if (proficiency >= 0.5) {
      return 'Intermediário';
    } else if (proficiency >= 0.3) {
      return 'Básico';
    } else {
      return 'Iniciante';
    }
  }
}