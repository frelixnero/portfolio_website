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
  bool _hasAnimated = false; // Track if animation already ran

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // slide from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (!widget.isAnimated) {
      _controller.value = 1.0; // Immediately visible if animation disabled
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
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(24);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return VisibilityDetector(
      key: Key('StyledCard_${widget.key ?? UniqueKey()}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: SlideTransition(
          position: _slideAnimation,
          child: Stack(
            children: [
              // Background glow
              if (widget.borderEffect) ...[
                _BorderShadow(isHovered: _isHovered),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: _BorderShadow(isHovered: _isHovered),
                ),
              ],

              // Main Card
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: effectiveBorderRadius,
                  boxShadow:
                      _isHovered
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
                        borderRadius: effectiveBorderRadius,
                        color:
                            widget.isBackgroundBlur
                                ? context.theme.colorScheme.outline
                                : Colors.transparent,
                        gradient:
                            widget.isBackgroundBlur
                                ? null
                                : LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      252,
                                    ).withOpacity(_isHovered ? 0.1 : 0.08),
                                    const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      252,
                                    ).withOpacity(_isHovered ? 0.09 : 0.05),
                                  ],
                                ),
                        border: Border.all(
                          color:
                              _isHovered
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

              // Custom corner accents
              if (widget.borderEffect) ...[
                IgnorePointer(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isHovered ? 1.0 : 0.4,
                    child: CustomPaint(
                      size: Size(widget.width ?? 30, widget.height ?? 30),
                      painter: CurvedLinePainter(color: primaryColor),
                    ),
                  ),
                ),
              ],
            ],
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
            spreadRadius: isHovered ? 10 : 2,
          ),
        ],
      ),
    );
  }
}

// The rest of your painters and _BorderShadow can stay unchanged
