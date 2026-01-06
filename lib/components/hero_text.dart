import 'package:flutter/material.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/app_size.dart';
import 'package:portfolio_website/util/constants/extension.dart';
import 'package:seo/seo.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          context.isDesktop || context.isTablet
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      children: [
        SeoText(
          data: "Ogene Osita Felix",
          textAlign:
              context.isDesktop || context.isTablet
                  ? TextAlign.left
                  : TextAlign.center,
          textStyle: context.textStyle.titleLgBold.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          tag: TextTagStyle.h1,
        ),

        SizedBox(height: Inserts.med),

        SizedBox(height: Inserts.med),
        SeoText(
          data: "Flutter and Python Developer",
          textAlign:
              context.isDesktop || context.isTablet
                  ? TextAlign.left
                  : TextAlign.center,
          textStyle: context.textStyle.titleMdMedium.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          tag: TextTagStyle.h2,
        ),

        SizedBox(height: Inserts.med),

        SeoText(
          data: AppAssets.descritionText,
          textAlign:
              context.isDesktop || context.isTablet
                  ? TextAlign.left
                  : TextAlign.center,
          textStyle: context.textStyle.bodyMdMedium.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          tag: TextTagStyle.h3,
        ),
      ],
    );
  }
}
