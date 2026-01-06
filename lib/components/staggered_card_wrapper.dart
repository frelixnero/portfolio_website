import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StaggeredCardWrapper extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final bool isAnimated;

  const StaggeredCardWrapper({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.isAnimated = true,
  });

  @override
  State<StaggeredCardWrapper> createState() => _StaggeredCardWrapperState();
}

class _StaggeredCardWrapperState extends State<StaggeredCardWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (!widget.isAnimated) {
      _controller.value = 1.0;
      _hasAnimated = true;
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_hasAnimated && widget.isAnimated) {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
      _hasAnimated = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('StaggeredCardWrapper_${widget.key ?? UniqueKey()}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
