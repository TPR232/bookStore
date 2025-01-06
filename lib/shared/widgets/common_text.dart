import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool isUpperCase;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final TextOverflow? overflow;
  final Color? textColor;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final String? fontFamily;
  final double? lineHeight;
  final List<Shadow>? shadows;
  final FontStyle? fontStyle;
  const CommonText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.textDecoration = TextDecoration.none,
    this.fontSize,
    this.isUpperCase = false,
    this.fontWeight,
    this.letterSpacing,
    this.maxLines = 999,
    this.fontFamily = 'Plus Jakarta Sans',
    this.lineHeight,
    this.shadows,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase ? text.toUpperCase() : text,
      textAlign: textAlign,
      textScaleFactor: 1.0,
      overflow: overflow,
      maxLines: maxLines,
      style: style ??
          TextStyle(
            height: lineHeight,
            shadows: shadows,
            color: textColor,
            decoration: textDecoration,
            fontFamily: fontFamily ?? "PlusJakartaSans",
            fontSize: 16,
            letterSpacing: letterSpacing ?? 0.0,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontStyle: fontStyle,
          ),
    );
  }
}
