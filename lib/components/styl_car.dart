import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class StyledCard extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget widget;
  final bool borderEffect;
  final bool isBackgroundBlur;

  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    required this.widget,
    this.borderEffect = false,
    this.isBackgroundBlur = true,
  });

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(24);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Stack(
        children: [
          // 1. Background Glow / Highlight effect (External)
          if (widget.borderEffect) ...[
            _BorderShadow(isHovered: _isHovered),
            Positioned(
              bottom: 0,
              right: 0,
              child: _BorderShadow(isHovered: _isHovered),
            ),
          ],

          // 2. Main Glass Card
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
                // The "Frosted" blur intensity
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
                            ? Theme.of(context).colorScheme.outline
                            : Colors.transparent,
                    // Subtle gradient for depth
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(_isHovered ? 0.08 : 0.05),
                        Colors.white.withOpacity(_isHovered ? 0.03 : 0.01),
                      ],
                    ),
                    border: Border.all(
                      // Thin luminous border
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

          // 3. Custom Painted corner accents
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
          ..strokeWidth =
              2.5 // Slightly thinner for "pro" look
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
