// 1. Define the ExperienceModel data model
class ExperienceModel {
  final String title; // e.g., '₦100' (This is the amount)
  final String companyName;
  final String description1;
  final String description2;
  final String description3; // e.g., 'description2' // e.g., '/ ₦10.00'

  ExperienceModel({
    required this.title,
    required this.companyName,
    required this.description1,
    required this.description2,
    required this.description3,
  });
}
