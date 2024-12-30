import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  String? text;
  double? fontSize;
  PrimaryText({
    super.key, 
    required this.text, 
    this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
      ),
    );
  }
}