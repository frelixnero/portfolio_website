import 'package:portfolio_website/models/experience_model.dart';

class ExperienceRepository {
  List<ExperienceModel> getExperiences = [
    ExperienceModel(
      title: "Mobile Developer",
      companyName: "Paritie Dynamic Enterprise.",
      description1:
          "Developed and maintained web applications using Flutter and Dart.",
      description2:
          "Collaborated with cross-functional teams to define, design, and ship new features.",
      description3:
          "Implemented responsive UI designs to enhance user experience across devices.",
    ),
    ExperienceModel(
      title: "Python Backend Developer",
      companyName: "Des and Dev",
      description1:
          "Designed and implemented RESTful APIs using FastAPI and Python.",
      description2:
          "Optimized database queries to improve application performance.",
      description3:
          "Integrated third-party services and APIs to extend application functionality.",
    ),
    ExperienceModel(
      title: "Technical Instructor",
      companyName: "N.B.M.C. Technologies",
      description1:
          "Developed and maintained embedded software applications in C/C++ for hardware platforms",
      description2:
          "Created prototypes and proof-of-concepts to validate technical feasibility.",
      description3:
          "Conducted debugging, memory handling/refinement and performance optimization to ensure reliability.",
    ),
    ExperienceModel(
      title: "Associate Engineer",
      companyName: "The Lord is Good Computers",
      description1:
          "Developed and maintained embedded software applications in C/C++ for hardware platforms",
      description2:
          "Created prototypes and proof-of-concepts to validate technical feasibility.",
      description3:
          "Conducted debugging, memory handling/refinement and performance optimization to ensure reliability.",
    ),
  ];
}
