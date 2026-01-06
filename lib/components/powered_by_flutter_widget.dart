import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class PoweredByFlutterWidget extends StatelessWidget {
  const PoweredByFlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Powered By",
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        Gap(8),
        Image.asset(
          AppAssets.flutterLogo,
          width: 200,
          height: 100,
          color: context.theme.colorScheme.onBackground,
        ),
      ],
    );
  }
}
