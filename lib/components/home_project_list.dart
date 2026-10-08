import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/home_title_subtitle.dart';
import 'package:portfolio_website/components/project_item.dart';
import 'package:portfolio_website/components/staggered_card_wrapper.dart';
import 'package:portfolio_website/models/projects_model.dart';
import 'package:portfolio_website/repositories/projects_repository.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class HomeProjectList extends StatelessWidget {
  const HomeProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    // Show the 3 newest projects (repository order is newest-first).
    final projects = ProjectsRepository().getProjects.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          homeTitle: "Projects",
          subTitle: "Selected work across mobile, backend, and AI systems.",
        ),
        Gap(32),
        context.isDesktop
            ? HomeProjectListDesktop(projects: projects)
            : HomeProjectListPhone(projects: projects),
      ],
    );
  }
}

class HomeProjectListDesktop extends StatelessWidget {
  final List<ProjectsModel> projects;
  const HomeProjectListDesktop({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final delays = [
      const Duration(microseconds: 10),
      const Duration(microseconds: 70),
      const Duration(microseconds: 500),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.inserts.padding),
      child: Row(
        children: [
          for (int i = 0; i < projects.length; i++) ...[
            if (i > 0) Gap(8),
            Expanded(
              child: StaggeredCardWrapper(
                delay: delays[i % delays.length],
                isAnimated: true,
                child: ProjectItem(
                  title: projects[i].title,
                  description: projects[i].projectDesc,
                  imagePath: projects[i].imagePath,
                  projectLink: projects[i].projectLink,
                  techStack: projects[i].techStack,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class HomeProjectListPhone extends StatelessWidget {
  final List<ProjectsModel> projects;
  const HomeProjectListPhone({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < projects.length; i++) ...[
              SizedBox(
                width: 240,
                child: ProjectItem(
                  title: projects[i].title,
                  description: projects[i].projectDesc,
                  imagePath: projects[i].imagePath,
                  projectLink: projects[i].projectLink,
                  techStack: projects[i].techStack,
                ),
              ),
              if (i != projects.length - 1) Gap(8),
            ],
          ],
        ),
      ),
    );
  }
}
