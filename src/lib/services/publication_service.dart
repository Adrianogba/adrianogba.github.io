import '../models/publication_model.dart';
import '../providers/language_provider.dart';

class PublicationService {
  /// Retorna uma lista de publicações
  Future<List<PublicationModel>> getPublications() async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Obter o idioma atual
    final languageProvider = LanguageProvider();
    final currentLanguage = languageProvider.currentLanguage;
    
    // Retornar as publicações de acordo com o idioma
    if (currentLanguage == AppLanguage.german) {
      return _getGermanPublications();
    } else if (currentLanguage == AppLanguage.english) {
      return _getEnglishPublications();
    } else if (currentLanguage == AppLanguage.spanish) {
      return _getSpanishPublications();
    } else {
      return _getPortuguesePublications();
    }
  }
  
  /// Retorna publicações em português
  List<PublicationModel> _getPortuguesePublications() {
    return [
      PublicationModel(
        title: 'Análise de Sentimentos em Mídias Sociais: Sociedade em Transformação',
        description: 'Estudo sobre análise de sentimentos aplicada nas redes sociais e como as organizações podem utilizar a técnica a seu favor.',
        journal: 'Simpósio Brasileiro de Pesquisa Operacional',
        year: '2020',
        url: 'https://proceedings.science/sbpo/sbpo-2020/trabalhos/analise-de-sentimentos-em-midias-sociais-sociedade-em-transformacao?lang=pt-br',
      ),
      PublicationModel(
        title: 'Aplicação do Algoritmo Naive Bayes para filtro de mensagens indesejadas em Python',
        description: 'Implementação e análise do algoritmo Naive Bayes para filtragem de spam em mensagens utilizando Python.',
        journal: 'Simpósio Brasileiro de Pesquisa Operacional',
        year: '2020',
        url: 'https://proceedings.science/sbpo/sbpo-2020/trabalhos/aplicacao-do-algoritmo-naive-bayes-para-filtro-de-mensagens-indesejadas-em-pytho?lang=pt-br',
      ),
      PublicationModel(
        title: 'PortuGame: Ferramenta de Auxílio ao Ensino e Aprendizagem do Novo Acordo Ortográfico da Língua Portuguesa',
        description: 'Desenvolvimento de uma ferramenta gamificada para auxiliar no ensino e aprendizagem do novo acordo ortográfico da língua portuguesa.',
        journal: 'Simpósio Brasileiro de Pesquisa Operacional',
        year: '2020',
        url: 'https://sol.sbc.org.br/index.php/ctrle/article/view/11423',
      ),
      PublicationModel(
        title: 'Modelagem e testes de software na perspectiva de profissionais da indústria: Um estudo qualitativo',
        description: 'Estudo qualitativo sobre a perspectiva de profissionais da indústria em relação à modelagem e testes de software.',
        journal: 'V Workshop de Iniciação Científica em Sistemas de Informação',
        year: '2018',
        url: 'https://www.researchgate.net/publication/327732020_Modelagem_e_testes_de_software_na_perspectiva_de_profissionais_da_industria_Um_estudo_qualitativo',
      ),
    ];
  }
  
  /// Retorna publicações em inglês
  List<PublicationModel> _getEnglishPublications() {
    return [
      PublicationModel(
        title: 'Sentiment Analysis in Mobile App Reviews',
        description: 'Sentiment analysis in mobile app reviews using natural language processing techniques.',
        journal: 'Brazilian Journal of Applied Computing',
        year: '2022',
        url: 'https://www.rbca.com.br',
      ),
      PublicationModel(
        title: 'Mobile App Development with Flutter',
        description: 'Study on cross-platform mobile app development using the Flutter framework.',
        journal: 'Brazilian Conference on Software Engineering',
        year: '2021',
        url: 'https://www.cbsoft.org',
      ),
    ];
  }
  
  /// Retorna publicações em espanhol
  List<PublicationModel> _getSpanishPublications() {
    return [
      PublicationModel(
        title: 'Análisis de Sentimientos en Comentarios de Aplicaciones Móviles',
        description: 'Análisis de sentimientos en comentarios de aplicaciones móviles utilizando técnicas de procesamiento de lenguaje natural.',
        journal: 'Revista Brasileña de Computación Aplicada',
        year: '2022',
        url: 'https://www.rbca.com.br',
      ),
      PublicationModel(
        title: 'Desarrollo de Aplicaciones Móviles con Flutter',
        description: 'Estudio sobre el desarrollo de aplicaciones móviles multiplataforma utilizando el framework Flutter.',
        journal: 'Conferencia Brasileña de Ingeniería de Software',
        year: '2021',
        url: 'https://www.cbsoft.org',
      ),
    ];
  }
  
  /// Retorna publicações em alemão
  List<PublicationModel> _getGermanPublications() {
    return [
      PublicationModel(
        title: 'Stimmungsanalyse in Mobile-App-Bewertungen',
        description: 'Stimmungsanalyse in Mobile-App-Bewertungen unter Verwendung von Techniken der natürlichen Sprachverarbeitung.',
        journal: 'Brasilianische Zeitschrift für Angewandte Informatik',
        year: '2022',
        url: 'https://www.rbca.com.br',
      ),
      PublicationModel(
        title: 'Mobile-App-Entwicklung mit Flutter',
        description: 'Studie zur plattformübergreifenden Mobile-App-Entwicklung mit dem Flutter-Framework.',
        journal: 'Brasilianische Konferenz für Software Engineering',
        year: '2021',
        url: 'https://www.cbsoft.org',
      ),
    ];
  }
}