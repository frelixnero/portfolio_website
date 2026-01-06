import 'package:portfolio_website/models/projects_model.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/app_strings.dart';

class ProjectsRepository {
  List<ProjectsModel> getProjects = [
    ProjectsModel(
      title: "Food Delivery App",
      projectDesc: AppStrings.foodProjectDesc,
      imagePath: AppAssets.courseImage,
      projectLink: "https://github.com/frelixnero/delivery_app",
    ),
    ProjectsModel(
      title: "Fastapi Paystack Payment Processor",
      projectDesc: AppStrings.payStackDesc,
      imagePath: AppAssets.courseImage3,
      projectLink: "https://github.com/frelixnero/paystack-api",
    ),
    ProjectsModel(
      title: "Fast API Social Media Backend",
      projectDesc: AppStrings.fastApiDesc,
      imagePath: AppAssets.courseImage2,
      projectLink: "https://github.com/frelixnero/my_fastapi_backend",
    ),
    ProjectsModel(
      title: "Desktop Database Application",
      projectDesc: AppStrings.desktopDatabaseDesc,
      imagePath: AppAssets.courseImage5,
      projectLink: "https://github.com/frelixnero/database_flet",
    ),
    ProjectsModel(
      title: "Bus Tracker/Fleet Management Solution",
      projectDesc: AppStrings.fleetDesc,
      imagePath: AppAssets.courseImage4,
      projectLink: "https://github.com/frelixnero/bus_tracker",
    ),
  ];
}
