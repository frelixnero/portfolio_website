import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

/// A wrapper that provides SEO metadata for Text widgets.
/// Replaces the old 'seo_renderer' TextRenderer approach.
class SeoText extends StatelessWidget {
  final String data;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  /// Tag for SEO purposes: h1, h2, p, etc.
  final TextTagStyle tag;

  const SeoText({
    super.key,
    required this.data,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.tag = TextTagStyle.h1, // Default to paragraph
  });

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: data,
      style: tag,
      child: Text(
        data,
        style: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: textOverflow,
      ),
    );
  }
}
