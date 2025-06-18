class ExperienceModel {
  final String position;
  final String company;
  final String? companyUrl;
  final String period;
  final String description;
  
  const ExperienceModel({
    required this.position, 
    required this.company, 
    this.companyUrl,
    required this.period,
    required this.description,
  });
}