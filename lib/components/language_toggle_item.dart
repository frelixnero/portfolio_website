import 'package:flutter/material.dart';
import 'package:portfolio_website/components/seo_text.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class LanguageToggleItem extends StatelessWidget {
  final String language;
  final String icon;
  const LanguageToggleItem({
    super.key,
    required this.language,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 18,
          width: 18,
          color: context.theme.colorScheme.onBackground,
        ),
        SizedBox(width: 8),
        SeoText(data: language),
      ],
    );
  }
}
