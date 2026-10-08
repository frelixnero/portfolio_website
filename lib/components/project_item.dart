import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/components/styled_card.dart';
import 'package:portfolio_website/util/constants/extension.dart';
import 'package:seo/seo.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String projectLink;
  final List<String> techStack;

  const ProjectItem({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.projectLink,
    this.techStack = const [],
  });

  void _launchURL(String url, BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Could not open project link")));
      throw 'Could not launch $url';
    }
  }

  Widget _buildTechChip(BuildContext context, String tech) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
      ),
      child: Text(
        tech,
        style: context.textStyle.bodyMdMedium.copyWith(
          color: colorScheme.primary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: context.isDesktop ? 600 : 400,
      isBackgroundBlur: false,
      isAnimated: true,
      width: 400,
      widget: AspectRatio(
        aspectRatio: 0.7,
        child: InkWell(
          onTap: () {
            return _launchURL(projectLink, context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              if (techStack.isNotEmpty) ...[
                Gap(12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      techStack
                          .map((tech) => _buildTechChip(context, tech))
                          .toList(),
                ),
              ],
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
