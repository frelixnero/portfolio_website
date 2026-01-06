import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/course_item.dart';
import 'package:portfolio_website/components/home_title_subtitle.dart';
import 'package:portfolio_website/components/staggered_card_wrapper.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/app_strings.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class HomeCourseList extends StatelessWidget {
  const HomeCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          homeTitle: "Courses",
          subTitle: "Very brief but coencise description",
        ),
        Gap(32),
        context.isDesktop ? HomeCourseListDesktop() : HomeCourseListPhone(),
      ],
    );
  }
}

class HomeCourseListDesktop extends StatelessWidget {
  const HomeCourseListDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.inserts.padding),
      child: Row(
        children: [
          Expanded(
            child: StaggeredCardWrapper(
              delay: const Duration(microseconds: 10),
              isAnimated: true,
              child: CourseItem(
                title: "Food Delivery App",
                description: AppStrings.foodProjectDesc,
                imagePath: AppAssets.courseImage,
                projectLink: 'https://github.com/frelixnero/delivery_app',
              ),
            ),
          ),
          Gap(8),
          Expanded(
            child: StaggeredCardWrapper(
              delay: const Duration(microseconds: 20),
              isAnimated: true,
              child: CourseItem(
                title: "Fastapi Paystack Payment Processor",
                description: AppStrings.payStackDesc,
                imagePath: AppAssets.courseImage3,
                projectLink: 'https://github.com/frelixnero/paystack-api',
              ),
            ),
          ),
          Gap(8),
          Expanded(
            child: StaggeredCardWrapper(
              delay: const Duration(microseconds: 30),
              isAnimated: true,
              child: CourseItem(
                title: "Fast API Social Media Backend",
                description: AppStrings.fastApiDesc,
                imagePath: AppAssets.courseImage2,
                projectLink: 'https://github.com/frelixnero/my_fastapi_backend',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCourseListPhone extends StatelessWidget {
  const HomeCourseListPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 240,
              child: CourseItem(
                title: "Food Delivery App",
                description: AppStrings.foodProjectDesc,
                imagePath: AppAssets.courseImage,
                projectLink: '',
              ),
            ),
            SizedBox(
              width: 240,
              child: CourseItem(
                title: "Fastapi Paystack Payment Processor",
                description: AppStrings.payStackDesc,
                imagePath: AppAssets.courseImage3,
                projectLink: '',
              ),
            ),
            SizedBox(
              width: 240,
              child: CourseItem(
                title: "Food Delivery App",
                description: AppStrings.foodProjectDesc,
                imagePath: AppAssets.courseImage2,
                projectLink: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
