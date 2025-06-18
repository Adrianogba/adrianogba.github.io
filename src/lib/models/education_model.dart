class EducationModel {
  final String degree;
  final String institution;
  final String? institutionUrl;
  final String period;
  final String? description;
  
  const EducationModel({
    required this.degree, 
    required this.institution, 
    this.institutionUrl,
    required this.period,
    this.description,
  });
}