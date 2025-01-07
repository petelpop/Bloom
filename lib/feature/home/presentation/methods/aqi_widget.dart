import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';

class AqiWidget extends StatelessWidget {
  Color? aqiColor;
  String? aqi;

  AqiWidget({
    super.key, 
    this.aqiColor = const Color(0xFF008F66),
    this.aqi,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: aqiColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: whiteColor.withOpacity(0.12),
          strokeAlign: BorderSide.strokeAlignInside,
          width: 5
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryText(
            text: aqi,
            fontSize: 26,
            letterSpacing: -0.1,
            color: whiteColor,
            fontWeight: 900,
            lineHeight: 1,),
            PrimaryText(
              text: "AQI",
              color: whiteColor.withOpacity(0.64),
              letterSpacing: -0.1,
              fontWeight: 900,
              fontSize: 12,
              lineHeight: 1,
              )
        ],
      ),
    );
  }
}