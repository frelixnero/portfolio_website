import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/my_app_bar.dart';
import 'package:portfolio_website/components/powered_by_flutter_widget.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.inserts.padding),
      child: Column(
        children: [
          context.isDesktop ? DesktopFooter() : MobileFooter(),
          Divider(height: 24),
          PoweredByFlutterWidget(),
        ],
      ),
    );
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [AppLogo(), Spacer(), LargeAppMenu(), FooterLinks()]);
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [AppLogo(), SmallMenu(), FooterLinks()],
    );
  }
}

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FooterLinksItems(iconImage: AppAssets.gitHub, onPressed: () {}),
        Gap(5),
        FooterLinksItems(iconImage: AppAssets.linkedIn, onPressed: () {}),
        Gap(5),
        FooterLinksItems(iconImage: AppAssets.youtube, onPressed: () {}),
        Gap(5),
        FooterLinksItems(iconImage: AppAssets.instagram, onPressed: () {}),
      ],
    );
  }
}

class FooterLinksItems extends StatelessWidget {
  final String iconImage;
  final void Function()? onPressed;
  const FooterLinksItems({
    super.key,
    required this.iconImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          iconImage,
          colorBlendMode: BlendMode.srcIn,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
