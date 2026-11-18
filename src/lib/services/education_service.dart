import '../models/education_model.dart';
import '../providers/language_provider.dart';

const String _cesarUrl = 'https://www.cesar.school/mestrado-profissional/engenharia-de-software-mpes/';
const String _uniespMbaUrl = 'https://www.iesp.edu.br/cursos/pos-graduacao/mba-em-full-stack-web-development';
const String _uniespSiUrl = 'https://www.iesp.edu.br/cursos/graduacao/sistemas-de-informacao';
const String _ufpbSiUrl = 'http://www.ccae.ufpb.br/si';

class EducationService {
  /// Retorna as formações acadêmicas no idioma informado.
  Future<List<EducationModel>> getEducations(AppLanguage currentLanguage) async {
    // Simulando uma chamada de API ou banco de dados
    await Future.delayed(const Duration(milliseconds: 300));

    final (mestrado, mba, bacharel) = switch (currentLanguage) {
      AppLanguage.english => ("Professional Master's in Software Engineering", 'MBA in Full Stack Web Development', "Bachelor's in Information Systems"),
      AppLanguage.spanish => ('Maestría Profesional en Ingeniería de Software', 'MBA en Desarrollo Web Full Stack', 'Licenciatura en Sistemas de Información'),
      AppLanguage.german => ('Berufsbegleitender Master in Software Engineering', 'MBA in Full-Stack-Webentwicklung', 'Bachelor in Wirtschaftsinformatik'),
      AppLanguage.portuguese => ('Mestrado Profissional em Engenharia de Software', 'MBA em Full Stack Web Development', 'Bacharel em Sistemas de Informação'),
    };

    return [
      EducationModel(degree: mestrado, institution: 'CESAR School', institutionUrl: _cesarUrl, period: '2024 - 2026', description: null),
      EducationModel(degree: mba, institution: 'UNIESP', institutionUrl: _uniespMbaUrl, period: '2022 - 2023', description: null),
      EducationModel(degree: bacharel, institution: 'UNIESP', institutionUrl: _uniespSiUrl, period: '2019 - 2020', description: null),
      EducationModel(degree: bacharel, institution: 'UFPB', institutionUrl: _ufpbSiUrl, period: '2016 - 2018', description: null),
    ];
  }
}
