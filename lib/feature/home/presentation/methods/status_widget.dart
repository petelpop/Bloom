import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/aqi_widget.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  String? aqi;
  String? city;
  StatusWidget({
    super.key, 
    this.city = "...", 
    this.aqi = "..."});

  @override
  Widget build(BuildContext context) {
    Color? colorAqi;
    Color? textColor;
    Color? borderDesc;
    Color? colorDesc;
    String? aqiStatus;
    String? aqiIcon;
    String? aqiDesc;
    double aqiParse = double.parse(aqi!);

  if (aqiParse < 50) {
    colorAqi = primaryColor600;
    borderDesc = primaryColor100;
    textColor = primaryColor600;
    colorDesc = Color(0xFFF0FEF8);
    aqiStatus = "Baik";
    aqiIcon = Constants.icHeart;
    aqiDesc = "Udaranya lagi bagus nih, olahraga yuk!";
  } else if (aqiParse < 100) {
    colorAqi = moderatColor500;
    borderDesc = moderatColor100;
    textColor = moderatColor600;
    colorDesc = moderatColor50;
    aqiStatus = "Moderat";
    aqiIcon = Constants.icMask;
    aqiDesc = "Gunakan masker jika beraktivitas diluar ringan.";
  } else if (aqiParse < 150) {
    colorAqi = tidakSehatColor600;
    borderDesc = tidakSehatColor100;
    textColor = tidakSehatColor600;
    colorDesc = tidakSehatColor50;
    aqiStatus = "Tidak Sehat";
    aqiIcon = Constants.icDanger;
    aqiDesc = "Kelompok sensitif sebaiknya kurangi aktivitas di luar.";
  } else if (aqiParse < 200) {
    colorAqi = tidakSehatBColor600;
    borderDesc = tidakSehatBColor100;
    textColor = tidakSehatBColor600;
    colorDesc = tidakSehatBColor50;
    aqiStatus = "Tidak Sehat";
    aqiIcon = Constants.icDangerTriangleRed;
    aqiDesc = "Hindari aktivitas berat di luar ruangan.";
  } else if (aqiParse < 300) {
    colorAqi = tidakSehatBColor800;
    borderDesc = tidakSehatBColor100;
    textColor = tidakSehatBColor800;
    colorDesc = tidakSehatBColor50;
    aqiStatus = "Berbahaya";
    aqiIcon = Constants.icDangerTriangleDarkRed;
    aqiDesc = "Tetap di dalam ruangan untuk perlindungan.";
  } else {
    colorAqi = beracunColor950;
    borderDesc = beracunColor100;
    textColor = beracunColor950;
    colorDesc = beracunColor50;
    aqiStatus = "Beracun";
    aqiIcon = Constants.icDangerTrianglePurple;
    aqiDesc = "Jangan keluar rumah sampai udara membaik.";
  }

    return Container(
      height: 180,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: colorDesc,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: primaryColor100, width: 1)),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16, left: 16, top: 25),
                child: Row(
                  children: [
                  Image.asset(aqiIcon, width: 16),
                  SizedBox(width: 10),
                  PrimaryText(
                    text: aqiDesc,
                    color: textColor,
                    letterSpacing: -0.1,
                    lineHeight: 1.4,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                ]),
              ),
            ),
          ),
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(
                color: surface300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Constants.icLocation,
                            width: 16,
                          ),
                          PrimaryText(
                            text: city,
                            letterSpacing: -0.1,
                            lineHeight: 1.4,
                            color: neutralTertiary,
                            fontWeight: 500,
                          )
                        ],
                      ),
                      PrimaryText(
                        text: aqiStatus,
                        fontSize: 28,
                        color: neutralDefault,
                        letterSpacing: -0.1,
                        lineHeight: 1.4,
                        fontWeight: 900,
                      )
                    ],
                  ),
                  AqiWidget(
                    aqi: aqi,
                    aqiColor: colorAqi,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
