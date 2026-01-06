import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/components/styled_card.dart';
import 'package:portfolio_website/util/constants/extension.dart';
import 'package:seo/seo.dart';
import 'package:url_launcher/url_launcher.dart';

const int expLength = 6;

class CourseItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String projectLink;
  const CourseItem({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.projectLink,
  });

  void _launchURL(String url, BuildContext context) async {
    // Implementation for launching URL
    if (await canLaunchUrl(Uri.parse(projectLink))) {
      await launchUrl(
        Uri.parse(projectLink),
        mode: LaunchMode.externalApplication,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Payment initialization failed")));
      throw 'Could not launch $projectLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: context.isDesktop ? 600 : 400,
      isBackgroundBlur: false,
      width: 400,
      widget: AspectRatio(
        aspectRatio: 0.7,
        child: InkWell(
          onTap: () {
            return _launchURL(
              projectLink,
              context,
            ); // 'return' is unnecessary here
          },
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: ClipRRect(
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              Gap(24),
              SeoText(
                data: title,
                textStyle: context.textStyle.bodyLgBold.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                tag: TextTagStyle.h4,
              ),
              Gap(8),
              Expanded(
                child: SeoText(
                  data: description,
                  textStyle: context.textStyle.bodyMdMedium.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  maxLines: context.isDesktop ? 13 : 7,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
