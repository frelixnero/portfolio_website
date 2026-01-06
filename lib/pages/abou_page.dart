import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/app_scaffold.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/app_strings.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScaffold(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.inserts.padding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(16),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: Image.asset(AppAssets.profilePic).image,
                  ),
                  const Gap(16),
                  SeoText(
                    data: AppStrings.aboutTitle,
                    textStyle: context.textStyle.titleSmBold,
                  ),
                  const Gap(16),
                  SeoText(
                    data: AppStrings.aboutDescription,
                    textStyle: context.textStyle.bodyMdMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
