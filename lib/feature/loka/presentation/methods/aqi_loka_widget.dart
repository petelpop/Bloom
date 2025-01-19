import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:flutter/material.dart';

class AqiLokaWidget extends StatefulWidget {
  String aqi;
  AqiLokaWidget({super.key, required this.aqi});

  @override
  State<AqiLokaWidget> createState() => _AqiLokaWidgetState();
}

class _AqiLokaWidgetState extends State<AqiLokaWidget> {
  Color? colorAqi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAqiData();
  }

  void getAqiData() {
  double aqiParse = double.parse(widget.aqi);

  if (aqiParse < 50) {
    colorAqi = primaryColor600;
  } else if (aqiParse < 100) {
    colorAqi = moderatColor500;
  } else if (aqiParse < 150) {
    colorAqi = tidakSehatColor600;
  } else if (aqiParse < 200) {
    colorAqi = tidakSehatBColor600;
  } else if (aqiParse < 300) {
    colorAqi = tidakSehatBColor800;
  } else {
    colorAqi = beracunColor950;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorAqi
            ),
            child: Center(
              child: PrimaryText(
                text: widget.aqi,
                color: whiteColor,
                fontWeight: 900,
                fontSize: 10.67,
                letterSpacing: -0.13,),
            ),
          );
  }
}