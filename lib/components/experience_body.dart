import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/home_title_subtitle.dart';
import 'package:portfolio_website/components/styled_card.dart';
import 'package:portfolio_website/util/constants/extension.dart';

const int expLength = 6;
const double expPointSize = 16;
const double expScaleFactor = 150;
const double expPointFcator = experinceHeight / 2 - expPointSize / 2;

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          homeTitle: "Experiences",
          subTitle: "Experiences Description",
        ),
        Gap(32),
        context.isDesktop ? DesktopExperienceBody() : MobileEperienceBody(),
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
      height: expLength * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLength * expScaleFactor + expScaleFactor,
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
            if (i.isEven)
              Positioned(
                top: i * 150,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EXperienceItem(),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              )
            else
              Positioned(
                top: i * 150,
                left: 400,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    EXperienceItem(),
                  ],
                ),
              ),
            Positioned(
              top: i * expScaleFactor + expPointFcator,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: expPointSize,
                height: expPointSize,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onBackground.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: expPointSize / 2,
                  height: expPointSize / 2,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.onBackground.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
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
    return Center(
      child: Column(
        children: [
          EXperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          EXperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          EXperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          EXperienceItem(),
        ],
      ),
    );
  }
}

const experinceWidth = 300.0;
const experinceHeight = 230.0;

class EXperienceItem extends StatelessWidget {
  const EXperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: experinceWidth,
      height: experinceHeight,
      borderEffect: true,
      widget: Column(
        children: [
          Text(
            "Experience ttile",
            style: context.textStyle.bodyLgBold.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ExperienceDescription(),
                ExperienceDescription(),
                ExperienceDescription(),
                ExperienceDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceDescription extends StatelessWidget {
  const ExperienceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Gap(6),
        Expanded(
          child: Text(
            "Description Item",
            style: context.textStyle.bodyMdMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
