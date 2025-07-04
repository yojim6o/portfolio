import 'package:flutter/cupertino.dart';

class SeoText extends StatelessWidget {
  const SeoText(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.overflow,
    this.maxLines,
  });

  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final int? maxLines;

  //final TextRendererStyle? textRenderer;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}