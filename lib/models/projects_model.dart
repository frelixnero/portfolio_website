// 1. Define the ProjectsModel data model
class ProjectsModel {
  final String title; // e.g., '₦100' (This is the amount)
  final String projectDesc;
  final String imagePath;
  final String projectLink; // e.g., 'projectLink' // e.g., '/ ₦10.00'

  ProjectsModel({
    required this.title,
    required this.projectDesc,
    required this.imagePath,
    required this.projectLink,
  });
}
