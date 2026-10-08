class ProjectsModel {
  final String title;
  final String projectDesc;
  final String imagePath;
  final String projectLink;
  final List<String> techStack;

  ProjectsModel({
    required this.title,
    required this.projectDesc,
    required this.imagePath,
    required this.projectLink,
    this.techStack = const [],
  });
}
