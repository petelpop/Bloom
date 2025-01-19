import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  String? text;
  String? aqi;
  Color? color;
  InfoWidget({super.key, required this.text, required this.aqi, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: surface300
        )
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: text,
            fontWeight: 600,
            fontSize: 14,
            lineHeight: 1.4,
            letterSpacing: -0.1,
            color: neutralSecondary,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.5, vertical: 8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: whiteColor.withOpacity(0.12),
                  width: 3.5
                )
              ),
              child: PrimaryText(
                text: aqi,
                fontWeight: 900,
                letterSpacing: -0.1,
                lineHeight: 1.4,
                color: whiteColor,),
            )
        ],
      ),
    );
  }
}