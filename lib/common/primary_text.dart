import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  double? fontWeight;
  double? letterSpacing;
  double? lineHeight;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;

  PrimaryText({
    super.key, 
    required this.text, 
    this.fontSize = 14,
    this.color = const Color(0xFF008F66),
    this.fontWeight = 400,
    this.textAlign = null,
    this.letterSpacing = 0,
    this.lineHeight = 0,
    this.textOverflow = null,
    this.maxLines = null});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontVariations: [
          FontVariation(
            "wght", fontWeight!)
        ],
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: lineHeight
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}