import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/home_title_subtitle.dart';
import 'package:portfolio_website/components/styled_card.dart';
import 'package:portfolio_website/models/experience_model.dart';
import 'package:portfolio_website/repositories/experience_repository.dart';
import 'package:portfolio_website/util/constants/extension.dart';

// Unified constants to ensure alignment
List<ExperienceModel> expList = ExperienceRepository().getExperiences;
int expLength = expList.length;
const double expPointSize = 16;
const double expScaleFactor = 200.0; // The vertical distance between items
const double experinceWidth = 350.0;
const double experinceHeight = 230.0;
// This factor calculates exactly where the center of the card is vertically
const double expPointFactor = (experinceHeight / 2) - (expPointSize / 2);

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeTitleSubtitle(
          homeTitle: "Experiences",
          subTitle: "My professional journey and key contributions.",
        ),
        const Gap(32),
        context.isDesktop
            ? const DesktopExperienceBody()
            : const MobileEperienceBody(),
      ],
    );
  }
}

class DesktopExperienceBody extends StatelessWidget {
  const DesktopExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: expLength * expScaleFactor + 120,
      child: Stack(
        children: [
          // Central Vertical Gradient Line
          Center(
            child: Container(
              width: 2,
              height: expLength * expScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0),
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          for (int i = 0; i < expLength; i++) ...[
            // 1. Position the Experience Card and Dotted Line
            Positioned(
              top: i * expScaleFactor,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child:
                              i.isEven
                                  ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        EXperienceItem(
                                          title: expList[i].title,
                                          company: expList[i].companyName,
                                          description1: expList[i].description1,
                                          description2: expList[i].description2,
                                          description3: expList[i].description3,
                                        ),
                                        const Gap(6),
                                        const _HorizontalDottedLine(),
                                      ],
                                    ),
                                  )
                                  : const SizedBox(),
                        ),
                        Expanded(
                          child:
                              !i.isEven
                                  ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const _HorizontalDottedLine(),
                                        EXperienceItem(
                                          title: expList[i].title,
                                          company: expList[i].companyName,
                                          description1: expList[i].description1,
                                          description2: expList[i].description2,
                                          description3: expList[i].description3,
                                        ),
                                      ],
                                    ),
                                  )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                    const _TimelineDot(),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class MobileEperienceBody extends StatelessWidget {
  const MobileEperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: List.generate(expLength, (index) {
          return Column(
            children: [
              EXperienceItem(
                title: expList[index].title,
                company: expList[index].companyName,
                description1: expList[index].description1,
                description2: expList[index].description2,
                description3: expList[index].description3,
              ),
              if (index != expLength - 1)
                const SizedBox(
                  height: 40,
                  child: DottedLine(
                    dashColor: Colors.white24,
                    direction: Axis.vertical,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class EXperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String description1;
  final String description2;
  final String description3;

  const EXperienceItem({
    super.key,
    required this.title,
    required this.company,
    required this.description1,
    required this.description2,
    required this.description3,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: experinceWidth,
      // Note: Height is dynamic based on content, but we use experinceHeight for alignment math
      isBackgroundBlur: false,
      borderEffect: true,
      padding: const EdgeInsets.all(20),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: context.textStyle.bodyLgBold),
          Text(
            company,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: const Color.fromARGB(255, 182, 22, 142),
            ),
          ),
          const Divider(height: 24, color: Colors.white10),
          ExperienceDescription(text: description1),
          ExperienceDescription(text: description2),
          ExperienceDescription(text: description3),
        ],
      ),
    );
  }
}

class ExperienceDescription extends StatelessWidget {
  final String text;
  const ExperienceDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(
              Icons.circle,
              size: 6,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Text(
              text,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HorizontalDottedLine extends StatelessWidget {
  const _HorizontalDottedLine();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      child: DottedLine(dashColor: Colors.white70, direction: Axis.horizontal),
    );
  }
}

class _TimelineDot extends StatelessWidget {
  const _TimelineDot();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: expPointSize,
        height: expPointSize,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 182, 22, 142),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: expPointSize / 2,
            height: expPointSize / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
