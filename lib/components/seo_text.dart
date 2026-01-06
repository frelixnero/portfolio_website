import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class SeoText extends StatelessWidget {
  final String data;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;
  const SeoText({
    super.key,
    required this.data,
    this.textStyle,
    this.textAlign,
    this.textRendererStyle,
    this.maxLines,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
