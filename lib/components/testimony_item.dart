import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/styled_card.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class TestimonyItem extends StatelessWidget {
  const TestimonyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      isBackgroundBlur: true,
      widget: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: Image.asset(AppAssets.courseImage3).image,
                ),
              ),
              Gap(16),
              Expanded(
                child: Text(
                  "Testimony",
                  style: context.textStyle.bodyLgBold.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          Gap(16),
          Text(
            "Text of Testimonies",
            style: context.textStyle.bodyMdMedium.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
