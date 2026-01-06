import 'package:flutter/material.dart';
import 'package:portfolio_website/components/staggered_card_wrapper.dart';

class StaggeredStyledCardList extends StatelessWidget {
  /// List of widgets/cards to show
  final List<Widget> children;

  /// Base delay between each card animation
  final Duration staggerDelay;

  /// Whether the cards should animate
  final bool isAnimated;

  const StaggeredStyledCardList({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 150),
    this.isAnimated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(children.length, (index) {
        final child = children[index];

        return StaggeredCardWrapper(
          child: child,
          delay: Duration(milliseconds: staggerDelay.inMilliseconds * index),
          isAnimated: isAnimated,
        );
      }),
    );
  }
}
