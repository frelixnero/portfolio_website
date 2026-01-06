import 'package:flutter/material.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/util/constants/extension.dart';
import 'package:seo/seo.dart';

class HomeTitleSubtitle extends StatelessWidget {
  final String homeTitle;
  final String subTitle;
  const HomeTitleSubtitle({
    super.key,
    required this.homeTitle,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.inserts.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeoText(
            data: homeTitle,
            textStyle: context.textStyle.titleSmBold.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
            tag: TextTagStyle.h3,
          ),
          SeoText(
            data: subTitle,
            textStyle: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onSurface,
            ),
            tag: TextTagStyle.h4,
          ),
        ],
      ),
    );
  }
}
