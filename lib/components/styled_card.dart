// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:portfolio_website/util/constants/extension.dart';

// class StyledCard extends StatefulWidget {
//   final double? width;
//   final double? height;
//   final EdgeInsets? padding;
//   final BorderRadius? borderRadius;
//   final Widget widget;
//   final bool borderEffect;
//   final bool isBackgroundBlur;

//   /// New flag to control animation
//   final bool isAnimated;

//   const StyledCard({
//     super.key,
//     this.width,
//     this.height,
//     this.padding,
//     this.borderRadius,
//     required this.widget,
//     this.borderEffect = false,
//     this.isBackgroundBlur = false,
//     this.isAnimated = true, // default to animated
//   });

//   @override
//   State<StyledCard> createState() => _StyledCardState();
// }

// class _StyledCardState extends State<StyledCard>
//     with SingleTickerProviderStateMixin {
//   bool _isHovered = false;

//   late final AnimationController _controller;
//   late final Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation if isAnimated is true
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2), // slide from bottom
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     if (widget.isAnimated) {
//       _controller.forward();
//     } else {
//       _controller.value = 1.0;
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final effectiveBorderRadius =
//         widget.borderRadius ?? BorderRadius.circular(24);
//     final primaryColor = Theme.of(context).colorScheme.primary;

//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       cursor: SystemMouseCursors.click,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Stack(
//           children: [
//             // 1. Background Glow / Highlight effect (External)
//             if (widget.borderEffect) ...[
//               _BorderShadow(isHovered: _isHovered),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: _BorderShadow(isHovered: _isHovered),
//               ),
//             ],

//             // 2. Main Glass Card
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               height: widget.height,
//               width: widget.width,
//               decoration: BoxDecoration(
//                 borderRadius: effectiveBorderRadius,
//                 boxShadow:
//                     _isHovered
//                         ? [
//                           BoxShadow(
//                             color: primaryColor.withOpacity(0.12),
//                             blurRadius: 30,
//                             spreadRadius: 2,
//                           ),
//                         ]
//                         : [],
//               ),
//               child: ClipRRect(
//                 borderRadius: effectiveBorderRadius,
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     padding:
//                         widget.padding ??
//                         EdgeInsets.all(context.inserts.cardPadding),
//                     decoration: BoxDecoration(
//                       borderRadius: effectiveBorderRadius,
//                       color:
//                           widget.isBackgroundBlur
//                               ? context.theme.colorScheme.outline
//                               : Colors.transparent,
//                       gradient:
//                           widget.isBackgroundBlur
//                               ? null
//                               : LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                                   const Color.fromARGB(
//                                     255,
//                                     255,
//                                     255,
//                                     252,
//                                   ).withOpacity(_isHovered ? 0.1 : 0.08),
//                                   const Color.fromARGB(
//                                     255,
//                                     255,
//                                     255,
//                                     252,
//                                   ).withOpacity(_isHovered ? 0.09 : 0.05),
//                                 ],
//                               ),
//                       border: Border.all(
//                         color:
//                             _isHovered
//                                 ? primaryColor.withOpacity(0.5)
//                                 : Colors.white.withOpacity(0.1),
//                         width: 1.2,
//                       ),
//                     ),
//                     child: widget.widget,
//                   ),
//                 ),
//               ),
//             ),

//             // 3. Custom Painted corner accents
//             if (widget.borderEffect) ...[
//               IgnorePointer(
//                 child: AnimatedOpacity(
//                   duration: const Duration(milliseconds: 300),
//                   opacity: _isHovered ? 1.0 : 0.4,
//                   child: CustomPaint(
//                     size: Size(widget.width ?? 30, widget.height ?? 30),
//                     painter: CurvedLinePainter(color: primaryColor),
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CurvedLinePainter extends CustomPainter {
//   final Color color;

//   CurvedLinePainter({required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     const lineSize = 60.0;
//     final topLeftPaint =
//         Paint()
//           ..shader = LinearGradient(
//             colors: [color.withOpacity(0), color, color.withOpacity(0)],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize))
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 2.5
//           ..strokeCap = StrokeCap.round;

//     final bottomRightPaint =
//         Paint()
//           ..shader = LinearGradient(
//             colors: [color.withOpacity(0), color, color.withOpacity(0)],
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//           ).createShader(
//             Rect.fromLTWH(
//               size.width - lineSize,
//               size.height - lineSize,
//               lineSize,
//               lineSize,
//             ),
//           )
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 2.5
//           ..strokeCap = StrokeCap.round;

//     final path = Path();
//     path.moveTo(lineSize, 0);
//     path.cubicTo(0, 0, 0, 0, 0, lineSize);

//     final path2 = Path();
//     path2.moveTo(size.width - lineSize, size.height);
//     path2.cubicTo(
//       size.width,
//       size.height,
//       size.width,
//       size.height,
//       size.width,
//       size.height - lineSize,
//     );
//     canvas.drawPath(path, topLeftPaint);
//     canvas.drawPath(path2, bottomRightPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CurvedLinePainter oldDelegate) =>
//       color != oldDelegate.color;
// }

// class _BorderShadow extends StatelessWidget {
//   final bool isHovered;
//   const _BorderShadow({required this.isHovered});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: 80,
//       height: 80,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: context.theme.colorScheme.primary.withOpacity(
//               isHovered ? 0.4 : 0.15,
//             ),
//             blurRadius: isHovered ? 40 : 20,
//             spreadRadius: isHovered ? 10 : 2,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/util/constants/extension.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StyledCard extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget widget;
  final bool borderEffect;
  final bool isBackgroundBlur;

  /// Animate only once the card enters the viewport
  final bool isAnimated;

  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    required this.widget,
    this.borderEffect = false,
    this.isBackgroundBlur = false,
    this.isAnimated = true,
  });

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  bool _hasAnimated = false; // Track if animation already ran

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuart,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(curved);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(curved);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curved);

    if (!widget.isAnimated) {
      _controller.value = 1.0;
      _hasAnimated = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_hasAnimated && widget.isAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }

    // Reset hover when card leaves viewport
    if (info.visibleFraction == 0 && _isHovered) {
      setState(() => _isHovered = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(24);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return VisibilityDetector(
      key: widget.key ?? ValueKey(hashCode),
      onVisibilityChanged: _onVisibilityChanged,

      child: SizedBox(
        width: widget.width,
        height: widget.height,

        child: MouseRegion(
          opaque: true,
          hitTestBehavior: HitTestBehavior.opaque,
          cursor: SystemMouseCursors.click,

          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),

          child: _AnimatedCardContent(
            slideAnimation: _slideAnimation,
            scaleAnimation: _scaleAnimation,
            fadeAnimation: _fadeAnimation,
            isHovered: _isHovered,
            widget: widget,
          ),
        ),
      ),
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;

  CurvedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;
    final topLeftPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [color.withOpacity(0), color, color.withOpacity(0)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round;

    final bottomRightPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [color.withOpacity(0), color, color.withOpacity(0)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          )
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);

    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );
    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(covariant CurvedLinePainter oldDelegate) =>
      color != oldDelegate.color;
}

class _BorderShadow extends StatelessWidget {
  final bool isHovered;
  const _BorderShadow({required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.primary.withOpacity(
              isHovered ? 0.4 : 0.15,
            ),
            blurRadius: isHovered ? 40 : 20,
            spreadRadius: isHovered ? 20 : 10,
          ),
        ],
      ),
    );
  }
}

class _AnimatedCardContent extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;
  final bool isHovered;
  final StyledCard widget;

  const _AnimatedCardContent({
    required this.slideAnimation,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.isHovered,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(24);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: Stack(
            children: [
              if (widget.borderEffect) ...[
                _BorderShadow(isHovered: isHovered),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: _BorderShadow(isHovered: isHovered),
                ),
              ],

              AnimatedScale(
                scale: isHovered ? 1.03 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                child: AnimatedSlide(
                  offset: isHovered ? const Offset(0, -0.01) : Offset.zero,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      borderRadius: effectiveBorderRadius,
                      boxShadow:
                          isHovered
                              ? [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.12),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                ),
                              ]
                              : [],
                    ),
                    child: ClipRRect(
                      borderRadius: effectiveBorderRadius,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding:
                              widget.padding ??
                              EdgeInsets.all(context.inserts.cardPadding),
                          decoration: BoxDecoration(
                            color:
                                widget.isBackgroundBlur
                                    ? Theme.of(context).colorScheme.outline
                                    : Colors.transparent,
                            borderRadius: effectiveBorderRadius,
                            gradient:
                                widget.isBackgroundBlur
                                    ? null
                                    : LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(
                                          isHovered ? 0.08 : 0.05,
                                        ),
                                        Colors.white.withOpacity(
                                          isHovered ? 0.03 : 0.01,
                                        ),
                                      ],
                                    ),
                            border: Border.all(
                              color:
                                  isHovered
                                      ? primaryColor.withOpacity(0.5)
                                      : Colors.white.withOpacity(0.1),
                              width: 1.2,
                            ),
                          ),
                          child: widget.widget,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The rest of your painters and _BorderShadow can stay unchanged
