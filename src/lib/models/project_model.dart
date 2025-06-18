class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String? projectUrl;
  final String? repositoryUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    this.imageUrl,
    this.projectUrl,
    this.repositoryUrl,
  });
}