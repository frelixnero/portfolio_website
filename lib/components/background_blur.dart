import 'package:flutter/material.dart';
import 'dart:ui'; // Required for ImageFilter if you want to add BackdropBlur later

// Assuming your extensions and constants are in these paths
// import 'package:portfolio_website/util/constants/app_size.dart';
// import 'package:portfolio_website/util/constants/extension.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    // We calculate a responsive size for the blur circle
    final double circleSize = MediaQuery.of(context).size.width * 0.5;

    return Positioned(
      // Negative offset moves it off-screen to the left for that "glow" effect
      // Adjusting to -circleSize / 3 to keep more of it visible, or / 2 to hide more
      left: -(circleSize * 0.4), 
      top: -(circleSize * 0.3),
      child: Container(
        height: circleSize,
        width: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 150, // High blur for the atmospheric glow
              spreadRadius: 80, // How far the solid color reaches
              color: Theme.of(context).colorScheme.primary.withOpacity(0.35),
            )
          ],
        ),
      ),
    );
  }
}