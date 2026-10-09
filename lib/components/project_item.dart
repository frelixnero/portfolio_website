import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/components/styled_card.dart';
import 'package:portfolio_website/util/constants/extension.dart';
import 'package:seo/seo.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatefulWidget {
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

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(_isHovered ? 0.25 : 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primary.withOpacity(_isHovered ? 0.8 : 0.3),
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.5),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : const [],
      ),
      child: Text(
        tech,
        style: context.textStyle.bodyMdMedium.copyWith(
          color: colorScheme.primary,
          shadows: _isHovered
              ? [
                  Shadow(
                    color: colorScheme.primary.withOpacity(0.9),
                    blurRadius: 8,
                  ),
                ]
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: StyledCard(
        height: context.isDesktop ? 600 : 400,
        isBackgroundBlur: false,
        isAnimated: true,
        width: 400,
        widget: AspectRatio(
          aspectRatio: 0.7,
          child: InkWell(
            onTap: () {
              return _launchURL(widget.projectLink, context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: ClipRRect(
                    child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                  ),
                ),
                Gap(24),
                SeoText(
                  data: widget.title,
                  textStyle: context.textStyle.bodyLgBold.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  tag: TextTagStyle.h4,
                ),
                if (widget.techStack.isNotEmpty) ...[
                  Gap(12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.techStack
                        .map((tech) => _buildTechChip(context, tech))
                        .toList(),
                  ),
                ],
                Gap(8),
                Expanded(
                  child: _ScrollableDescription(
                    data: widget.description,
                    textStyle: context.textStyle.bodyMdMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Renders the project description. If the text fits within the allocated
/// area it is shown plain; otherwise it becomes scrollable with an
/// always-visible, primary-colored, rounded scrollbar thumb.
class _ScrollableDescription extends StatefulWidget {
  final String data;
  final TextStyle textStyle;

  const _ScrollableDescription({
    required this.data,
    required this.textStyle,
  });

  @override
  State<_ScrollableDescription> createState() => _ScrollableDescriptionState();
}

class _ScrollableDescriptionState extends State<_ScrollableDescription> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: widget.data, style: widget.textStyle),
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: constraints.maxWidth);

        final overflows = textPainter.height > constraints.maxHeight;
        textPainter.dispose();

        if (!overflows) {
          return SeoText(
            data: widget.data,
            textStyle: widget.textStyle,
            tag: TextTagStyle.p,
          );
        }

        return ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
            radius: const Radius.circular(8),
          ),
          child: Scrollbar(
            controller: _controller,
            thumbVisibility: true,
            interactive: context.isDesktop,
            thickness: context.isDesktop ? 6 : 3,
            child: SingleChildScrollView(
              controller: _controller,
              padding: EdgeInsets.only(right: context.isDesktop ? 10 : 6),
              child: SeoText(
                data: widget.data,
                textStyle: widget.textStyle,
                tag: TextTagStyle.p,
              ),
            ),
          ),
        );
      },
    );
  }
}