import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final VoidCallback function;
  final Color textColor;
  final double fontSize;
  final double fontWeight;
  final double borderRadius;
  final double lineHeight;
  final double letterSpacing;

  const PrimaryButton({
    super.key, 
    required this.text,
    required this.function,
    this.textColor = Colors.white, 
    this.backgroundColor = const Color(0xFF008F66),
    this.fontSize = 14,
    this.fontWeight = 400,
    this.width = 100,
    this.height = 50,
    this.borderRadius = 16,
    this.letterSpacing = 0,
    this.lineHeight = 0
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: function,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)
          )
        ),
        child: PrimaryText(
          text: text,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          letterSpacing: letterSpacing,
          ),
      ),
    );
  }
}