import '../models/experience_model.dart';
import '../providers/language_provider.dart';

class ExperienceService {
  /// Retorna uma lista de experiências profissionais
  Future<List<ExperienceModel>> getExperiences() async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Obter o idioma atual
    final languageProvider = LanguageProvider();
    final currentLanguage = languageProvider.currentLanguage;
    
    // Retornar as experiências de acordo com o idioma
    if (currentLanguage == AppLanguage.german) {
      return _getGermanExperiences();
    } else if (currentLanguage == AppLanguage.english) {
      return _getEnglishExperiences();
    } else if (currentLanguage == AppLanguage.spanish) {
      return _getSpanishExperiences();
    } else {
      return _getPortugueseExperiences();
    }
  }
  
  /// Retorna experiências em português
  List<ExperienceModel> _getPortugueseExperiences() {
    return [
      ExperienceModel(
        position: 'Desenvolvedor Full Stack',
        company: 'Núcleo de Excelência em Tecnologias Sociais - NEES',
        companyUrl: 'https://www.nees.ufal.br/',
        period: '2025 - Presente',
        description: 'Desenvolvimento de sistemas governamentais que dão suporte ao Programa Nacional do Livro Didático (PNLD), uma das maiores iniciativas de distribuição pública de livros do mundo, garantindo acesso gratuito a materiais educacionais e literários em todo o Brasil.',
      ),
      ExperienceModel(
        position: 'Desenvolvedor Mobile',
        company: 'RPE - Retail Payment Ecosystem',
        companyUrl: 'https://www.linkedin.com/company/rpe-retail-payment-ecosystem/',
        period: '2022 - 2025',
        description: 'Desenvolvimento de aplicações para o mercado de crédito e terminais de atendimento automatizado. Tecnologias: Spring, Postgres, Kotlin, VueJS, Firebase, Flutter, Totens de Autoatendimento. Responsabilidades: Gestão de equipe, Revisões Técnicas, Jira, Scrum.',
      ),
      ExperienceModel(
        position: 'Analista Desenvolvedor Mobile III / II / I',
        company: 'Dock',
        companyUrl: 'https://dock.tech/',
        period: '2019 - 2022',
        description: 'Desenvolvimento de aplicações para totens de atendimento automatizado. Tecnologias: Android, Firebase, Totens de Autoatendimento, Spring, Kotlin, Java, Postgres, VueJS. Metodologias: Jira e Scrum.',
      ),
      ExperienceModel(
        position: 'Fullstack Web Developer',
        company: 'Vox Tecnologia',
        companyUrl: 'http://www.voxtecnologia.com.br/',
        period: '2018 - 2019',
        description: 'Desenvolvimento no Sistema da Rede Nacional para a Simplificação do Registro e da Legalização de Empresas e Negócios (RedeSIM). Tecnologias: Symphony, Zend, PostgreSQL. Metodologias: Mantis e Scrum.',
      ),
      ExperienceModel(
        position: 'Mobile Developer / Estagiário',
        company: 'PBSoft Informática',
        companyUrl: 'https://www.pbsoft.com.br/',
        period: '2016 - 2019',
        description: 'Desenvolvimento de aplicativo para gestão condominial. Tecnologias: Play Framework com Scala, Android, iOS, Flutter, PHP e MySQL. Metodologias: Redmine e Scrum.',
      ),
    ];
  }
  
  /// Retorna experiências em inglês
  List<ExperienceModel> _getEnglishExperiences() {
    return [
      ExperienceModel(
        position: 'Full Stack Developer',
        company: 'Center of Excellence in Social Technologies - NEES',
        companyUrl: 'https://www.nees.ufal.br/',
        period: '2025 - Present',
        description: 'Development of government systems that support the National Textbook Program (PNLD), one of the largest public book distribution initiatives in the world, ensuring free access to educational and literary materials throughout Brazil.',
      ),
      ExperienceModel(
        position: 'Mobile Developer',
        company: 'RPE - Retail Payment Ecosystem',
        companyUrl: 'https://www.linkedin.com/company/rpe-retail-payment-ecosystem/',
        period: '2022 - 2025',
        description: 'Development of applications for the credit market and automated service terminals. Technologies: Spring, Postgres, Kotlin, VueJS, Firebase, Flutter, Self-Service Kiosks. Responsibilities: Team Management, Technical Reviews, Jira, Scrum.',
      ),
      ExperienceModel(
        position: 'Mobile Developer Analyst III / II / I',
        company: 'Dock',
        companyUrl: 'https://dock.tech/',
        period: '2019 - 2022',
        description: 'Development of applications for automated service kiosks. Technologies: Android, Firebase, Self-Service Kiosks, Spring, Kotlin, Java, Postgres, VueJS. Methodologies: Jira and Scrum.',
      ),
      ExperienceModel(
        position: 'Fullstack Web Developer',
        company: 'Vox Tecnologia',
        companyUrl: 'http://www.voxtecnologia.com.br/',
        period: '2018 - 2019',
        description: 'Development in the National Network System for the Simplification of Business Registration and Legalization (RedeSIM). Technologies: Symphony, Zend, PostgreSQL. Methodologies: Mantis and Scrum.',
      ),
      ExperienceModel(
        position: 'Mobile Developer / Intern',
        company: 'PBSoft Informática',
        companyUrl: 'https://www.pbsoft.com.br/',
        period: '2016 - 2019',
        description: 'Development of an application for condominium management. Technologies: Play Framework with Scala, Android, iOS, Flutter, PHP and MySQL. Methodologies: Redmine and Scrum.',
      ),
    ];
  }
  
  /// Retorna experiências em espanhol
  List<ExperienceModel> _getSpanishExperiences() {
    return [
      ExperienceModel(
        position: 'Desarrollador Full Stack',
        company: 'Núcleo de Excelencia en Tecnologías Sociales - NEES',
        companyUrl: 'https://www.nees.ufal.br/',
        period: '2025 - Presente',
        description: 'Desarrollo de sistemas gubernamentales que apoyan el Programa Nacional del Libro Didáctico (PNLD), una de las mayores iniciativas de distribución pública de libros del mundo, garantizando el acceso gratuito a materiales educativos y literarios en todo Brasil.',
      ),
      ExperienceModel(
        position: 'Desarrollador Móvil',
        company: 'RPE - Retail Payment Ecosystem',
        companyUrl: 'https://www.linkedin.com/company/rpe-retail-payment-ecosystem/',
        period: '2022 - 2025',
        description: 'Desarrollo de aplicaciones para el mercado crediticio y terminales de servicio automatizado. Tecnologías: Spring, Postgres, Kotlin, VueJS, Firebase, Flutter, Quioscos de Autoservicio. Responsabilidades: Gestión de Equipos, Revisiones Técnicas, Jira, Scrum.',
      ),
      ExperienceModel(
        position: 'Analista Desarrollador Móvil III / II / I',
        company: 'Dock',
        companyUrl: 'https://dock.tech/',
        period: '2019 - 2022',
        description: 'Desarrollo de aplicaciones para quioscos de servicio automatizado. Tecnologías: Android, Firebase, Quioscos de Autoservicio, Spring, Kotlin, Java, Postgres, VueJS. Metodologías: Jira y Scrum.',
      ),
      ExperienceModel(
        position: 'Desarrollador Web Fullstack',
        company: 'Vox Tecnologia',
        companyUrl: 'http://www.voxtecnologia.com.br/',
        period: '2018 - 2019',
        description: 'Desarrollo en el Sistema de Red Nacional para la Simplificación del Registro y Legalización de Empresas y Negocios (RedeSIM). Tecnologías: Symphony, Zend, PostgreSQL. Metodologías: Mantis y Scrum.',
      ),
      ExperienceModel(
        position: 'Desarrollador Móvil / Pasante',
        company: 'PBSoft Informática',
        companyUrl: 'https://www.pbsoft.com.br/',
        period: '2016 - 2019',
        description: 'Desarrollo de una aplicación para la gestión de condominios. Tecnologías: Play Framework con Scala, Android, iOS, Flutter, PHP y MySQL. Metodologías: Redmine y Scrum.',
      ),
    ];
  }
  
  /// Retorna experiências em alemão
  List<ExperienceModel> _getGermanExperiences() {
    return [
      ExperienceModel(
        position: 'Full-Stack-Entwickler',
        company: 'Exzellenzzentrum für Sozialtechnologien - NEES',
        companyUrl: 'https://www.nees.ufal.br/',
        period: '2025 - Heute',
        description: 'Entwicklung von Regierungssystemen, die das Nationale Lehrbuchprogramm (PNLD) unterstützen, eine der größten öffentlichen Buchverteilungsinitiativen der Welt, die den kostenlosen Zugang zu Bildungs- und Literaturmaterialien in ganz Brasilien gewährleistet.',
      ),
      ExperienceModel(
        position: 'Mobile-Entwickler',
        company: 'RPE - Retail Payment Ecosystem',
        companyUrl: 'https://www.linkedin.com/company/rpe-retail-payment-ecosystem/',
        period: '2022 - 2025',
        description: 'Entwicklung von Anwendungen für den Kreditmarkt und automatisierte Serviceterminals. Technologien: Spring, Postgres, Kotlin, VueJS, Firebase, Flutter, Selbstbedienungskioske. Verantwortlichkeiten: Teammanagement, technische Überprüfungen, Jira, Scrum.',
      ),
      ExperienceModel(
        position: 'Mobile-Entwickler Analyst III / II / I',
        company: 'Dock',
        companyUrl: 'https://dock.tech/',
        period: '2019 - 2022',
        description: 'Entwicklung von Anwendungen für automatisierte Servicekioske. Technologien: Android, Firebase, Selbstbedienungskioske, Spring, Kotlin, Java, Postgres, VueJS. Methoden: Jira und Scrum.',
      ),
      ExperienceModel(
        position: 'Fullstack-Webentwickler',
        company: 'Vox Tecnologia',
        companyUrl: 'http://www.voxtecnologia.com.br/',
        period: '2018 - 2019',
        description: 'Entwicklung im Nationalen Netzwerksystem zur Vereinfachung der Unternehmensregistrierung und -legalisierung (RedeSIM). Technologien: Symphony, Zend, PostgreSQL. Methoden: Mantis und Scrum.',
      ),
      ExperienceModel(
        position: 'Mobile-Entwickler / Praktikant',
        company: 'PBSoft Informática',
        companyUrl: 'https://www.pbsoft.com.br/',
        period: '2016 - 2019',
        description: 'Entwicklung einer Anwendung für die Verwaltung von Eigentumswohnungen. Technologien: Play Framework mit Scala, Android, iOS, Flutter, PHP und MySQL. Methoden: Redmine und Scrum.',
      ),
    ];
  }
}