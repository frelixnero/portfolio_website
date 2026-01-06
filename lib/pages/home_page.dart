import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/app_scaffold.dart';
import 'package:portfolio_website/components/experience_body.dart';
import 'package:portfolio_website/components/home_course_list.dart';
import 'package:portfolio_website/components/home_title_subtitle.dart';
import 'package:portfolio_website/components/my_hero_widget.dart';
import 'package:portfolio_website/components/testimony_list.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: AppScaffold(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.inserts.padding,
              ),
              child: MyHeroWidget(),
            ),
          ),
          SliverGap(context.inserts.gap),
          SliverToBoxAdapter(child: HomeCourseList()),
          SliverGap(context.inserts.gap),
          SliverToBoxAdapter(child: ExperienceBody()),
          SliverGap(context.inserts.gap),
          SliverToBoxAdapter(
            child: HomeTitleSubtitle(
              homeTitle: "Testimonies",
              subTitle: "Testimony description",
            ),
          ),
          SliverGap(32),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: context.inserts.padding),
            sliver: TestimonyList(),
          ),
          SliverGap(context.inserts.gap),
        ],
      ),
    );
  }
}
