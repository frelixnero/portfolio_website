import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/hero_buttons.dart';
import 'package:portfolio_website/components/hero_image.dart';
import 'package:portfolio_website/components/hero_text.dart';
import 'package:portfolio_website/components/powered_by_flutter_widget.dart';
import 'package:portfolio_website/util/constants/app_size.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class MyHeroWidget extends StatelessWidget {
  const MyHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrapping in SingleChildScrollView prevents the bottom overflow error
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Allows column to only take needed space
          children: [
            PoweredByFlutterWidget(),
            const Gap(20),
            // Check responsiveness using your custom extensions
            context.isDesktop || context.isTablet
                ? const LargeHeroWidget()
                : const SmallHeroWidget(),
          ],
        ),
      ),
    );
  }
}

class SmallHeroWidget extends StatelessWidget {
  const SmallHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
          child: const HeroImage(),
        ),
        Gap(Inserts.xl),
        const HeroText(),
        Gap(Inserts.xxl),
        const SmallHeroButton(),
      ],
    );
  }
}

class LargeHeroWidget extends StatelessWidget {
  const LargeHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1200,
        ), // Limits width on ultra-wide screens
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex: 3, child: HeroImage()),
            Gap(Inserts.xxxl),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeroText(),
                  Gap(Inserts.xxl), // Increased gap for better breathing room
                  context.isTablet
                      ? const MediumHeroButtons()
                      : const LargeHeroButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
