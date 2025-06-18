import '../models/education_model.dart';

class EducationService {
  /// Retorna uma lista de formações acadêmicas
  Future<List<EducationModel>> getEducations() async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));
    
    return [
      EducationModel(
        degree: 'Mestrado Profissional em Engenharia de Software',
        institution: 'CESAR School',
        institutionUrl: 'https://www.cesar.school/mestrado-profissional/engenharia-de-software-mpes/',
        period: '2024 - 2026',
        description: null,
      ),
      EducationModel(
        degree: 'MBA em Full Stack Web Development',
        institution: 'UNIESP',
        institutionUrl: 'https://www.iesp.edu.br/cursos/pos-graduacao/mba-em-full-stack-web-development',
        period: '2022 - 2023',
        description: null,
      ),
      EducationModel(
        degree: 'Bacharel em Sistemas de Informação',
        institution: 'UNIESP',
        institutionUrl: 'https://www.iesp.edu.br/cursos/graduacao/sistemas-de-informacao',
        period: '2019 - 2020',
        description: null,
      ),
      EducationModel(
        degree: 'Bacharel em Sistemas de Informação',
        institution: 'UFPB',
        institutionUrl: 'http://www.ccae.ufpb.br/si',
        period: '2016 - 2018',
        description: null,
      ),
    ];
  }
}