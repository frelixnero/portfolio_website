import 'package:flutter/material.dart';
import 'package:portfolio_website/components/app_scaffold.dart';
import 'package:portfolio_website/components/course_item.dart';
import 'package:portfolio_website/models/projects_model.dart';
import 'package:portfolio_website/repositories/projects_repository.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProjectsModel> projectList = ProjectsRepository().getProjects;
    return Scaffold(
      body: AppScaffold(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.inserts.padding),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    context.mq.size.width ~/ 300 >= 3
                        ? 3
                        : context.mq.size.width ~/ 300,
                crossAxisSpacing: context.isDesktop ? 24 : 16,
                mainAxisSpacing: context.isDesktop ? 24 : 16,
                childAspectRatio:
                    context.isDesktop
                        ? 0.5
                        : context.isTablet
                        ? 0.8
                        : 1.2,
              ),
              itemBuilder: ((context, index) {
                return Align(
                  alignment: AlignmentGeometry.center,
                  child: CourseItem(
                    title: projectList[index].title,
                    description: projectList[index].projectDesc,
                    imagePath: projectList[index].imagePath,
                    projectLink: projectList[index].projectLink,
                  ),
                );
              }),
              itemCount: projectList.length,
            ),
          ),
        ],
      ),
    );
  }
}
