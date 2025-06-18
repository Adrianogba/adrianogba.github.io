import '../models/skill_model.dart';

class SkillService {
  /// Retorna uma lista de habilidades agrupadas por categoria
  Future<Map<String, List<SkillModel>>> getSkillsByCategory() async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));
    
    final List<SkillModel> allSkills = [
      // Linguagens de Programação
      SkillModel(
        name: 'Dart',
        proficiency: 0.9,
        category: 'Linguagens de Programação',
        description: 'Linguagem principal para desenvolvimento Flutter',
      ),
      SkillModel(
        name: 'JavaScript',
        proficiency: 0.85,
        category: 'Linguagens de Programação',
      ),
      SkillModel(
        name: 'TypeScript',
        proficiency: 0.8,
        category: 'Linguagens de Programação',
      ),
      SkillModel(
        name: 'Python',
        proficiency: 0.7,
        category: 'Linguagens de Programação',
      ),
      SkillModel(
        name: 'Java',
        proficiency: 0.6,
        category: 'Linguagens de Programação',
      ),
      
      // Frameworks
      SkillModel(
        name: 'Flutter',
        proficiency: 0.95,
        category: 'Frameworks',
        description: 'Desenvolvimento de aplicações multiplataforma',
      ),
      SkillModel(
        name: 'React',
        proficiency: 0.8,
        category: 'Frameworks',
      ),
      SkillModel(
        name: 'Angular',
        proficiency: 0.7,
        category: 'Frameworks',
      ),
      SkillModel(
        name: 'Node.js',
        proficiency: 0.75,
        category: 'Frameworks',
      ),
      
      // Bancos de Dados
      SkillModel(
        name: 'Firebase',
        proficiency: 0.85,
        category: 'Bancos de Dados',
      ),
      SkillModel(
        name: 'MongoDB',
        proficiency: 0.7,
        category: 'Bancos de Dados',
      ),
      SkillModel(
        name: 'MySQL',
        proficiency: 0.75,
        category: 'Bancos de Dados',
      ),
      
      // Ferramentas
      SkillModel(
        name: 'Git',
        proficiency: 0.9,
        category: 'Ferramentas',
      ),
      SkillModel(
        name: 'Docker',
        proficiency: 0.7,
        category: 'Ferramentas',
      ),
      SkillModel(
        name: 'VS Code',
        proficiency: 0.95,
        category: 'Ferramentas',
      ),
      
      // Metodologias
      SkillModel(
        name: 'Scrum',
        proficiency: 0.85,
        category: 'Metodologias',
      ),
      SkillModel(
        name: 'Kanban',
        proficiency: 0.8,
        category: 'Metodologias',
      ),
      SkillModel(
        name: 'TDD',
        proficiency: 0.7,
        category: 'Metodologias',
      ),
    ];
    
    // Agrupar habilidades por categoria
    final Map<String, List<SkillModel>> skillsByCategory = {};
    
    for (final skill in allSkills) {
      if (!skillsByCategory.containsKey(skill.category)) {
        skillsByCategory[skill.category] = [];
      }
      
      skillsByCategory[skill.category]!.add(skill);
    }
    
    return skillsByCategory;
  }
  
  /// Retorna uma lista de todas as habilidades
  Future<List<SkillModel>> getAllSkills() async {
    final Map<String, List<SkillModel>> skillsByCategory = await getSkillsByCategory();
    
    final List<SkillModel> allSkills = [];
    
    for (final category in skillsByCategory.keys) {
      allSkills.addAll(skillsByCategory[category]!);
    }
    
    return allSkills;
  }
}