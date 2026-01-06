import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/styled_buttons.dart';
import 'package:portfolio_website/util/constants/app_size.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PrimaryButton(title: "Courses"),
        Gap(Inserts.xs),
        OutlineButton(title: "Co-Operation"),
      ],
    );
  }
}

class MediumHeroButtons extends StatelessWidget {
  const MediumHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PrimaryButton(title: "Courses"),
        Gap(Inserts.xs),
        OutlineButton(title: "Co-Operation"),
      ],
    );
  }
}

class SmallHeroButton extends StatelessWidget {
  const SmallHeroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(title: "Courses"),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(title: "Co-Operation"),
        ),
      ],
    );
  }
}
