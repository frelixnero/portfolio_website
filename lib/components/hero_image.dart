import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.2,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(250),
      child: Image.asset("assets/icons/profile.jpg", fit: BoxFit.cover,)
    ,),
    );
  }
}