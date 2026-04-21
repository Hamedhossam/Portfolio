class ProjectModel {
  final String title;
  final String description;
  final List<String> techStack;
  final String imagePath;
  final String? playStoreUrl;
  final String? appStoreUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
  });
}
