import 'package:flutter/material.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(AppAssets.profilePicFrown, fit: BoxFit.cover),
      ),
    );
  }
}
