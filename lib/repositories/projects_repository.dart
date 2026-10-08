import 'package:portfolio_website/models/projects_model.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/app_strings.dart';

class ProjectsRepository {
  List<ProjectsModel> getProjects = [
    ProjectsModel(
      title: "Nodeline — Workflow Automation Platform",
      projectDesc: AppStrings.nodelineDesc,
      imagePath: AppAssets.projectImage2,
      projectLink: "https://github.com/frelixnero/nodeline",
      techStack: [
        "Next.js 15",
        "TypeScript",
        "React Flow",
        "tRPC",
        "Inngest",
        "Prisma",
        "BetterAuth",
        "PostgreSQL",
        "NeonDB",
        "Polar",
        "Sentry",
      ],
    ),
    ProjectsModel(
      title: "AI Voice Generation Platform",
      projectDesc: AppStrings.voicePlatformDesc,
      imagePath: AppAssets.projectImage,
      projectLink: "https://github.com/frelixnero/MyStyleTTS2Model",
      techStack: [
        "Next.js",
        "React",
        "FastAPI",
        "Python",
        "StyleTTS2",
        "Docker",
        "AWS EC2",
        "AWS S3",
        "AWS ECR",
        "IAM",
      ],
    ),
    ProjectsModel(
      title: "Food Delivery App",
      projectDesc: AppStrings.foodProjectDesc,
      imagePath: AppAssets.projectImage,
      projectLink: "https://github.com/frelixnero/delivery_app",
      techStack: ["Flutter", "FastAPI", "Firebase", "Hive", "Google Maps"],
    ),
    ProjectsModel(
      title: "Fastapi Paystack Payment Processor",
      projectDesc: AppStrings.payStackDesc,
      imagePath: AppAssets.projectImage3,
      projectLink: "https://github.com/frelixnero/paystack-api",
      techStack: ["FastAPI", "Python", "Paystack API"],
    ),
    ProjectsModel(
      title: "Fast API Social Media Backend",
      projectDesc: AppStrings.fastApiDesc,
      imagePath: AppAssets.projectImage2,
      projectLink: "https://github.com/frelixnero/my_fastapi_backend",
      techStack: ["FastAPI", "PostgreSQL", "JWT", "Alembic"],
    ),
    ProjectsModel(
      title: "Desktop Database Application",
      projectDesc: AppStrings.desktopDatabaseDesc,
      imagePath: AppAssets.projectImage5,
      projectLink: "https://github.com/frelixnero/database_flet",
      techStack: ["Python", "Flet", "SQLite"],
    ),
    ProjectsModel(
      title: "Bus Tracker/Fleet Management Solution",
      projectDesc: AppStrings.fleetDesc,
      imagePath: AppAssets.projectImage4,
      projectLink: "https://github.com/frelixnero/bus_tracker",
      techStack: ["Flutter", "Dart", "Open Street Maps", "Firebase"],
    ),
  ];
}
