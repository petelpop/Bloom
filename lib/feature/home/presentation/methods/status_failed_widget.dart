import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/aqi_widget.dart';
import 'package:flutter/material.dart';

class StatusFailedWidget extends StatelessWidget {
  StatusFailedWidget({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: surface200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: surface300, width: 1)),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16, left: 16, top: 25, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  PrimaryText(
                    text: "Silahkan refresh untuk memuat data",
                    color: neutralTertiary,
                    letterSpacing: -0.1,
                    lineHeight: 1.4,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  Container(
                    width: 18,
                    height: 18,
                    child: Image.asset(Constants.icRefresh))
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
                          SizedBox(width: 4),
                          PrimaryText(
                            text: "Jakarta",
                            letterSpacing: -0.1,
                            lineHeight: 1.4,
                            color: neutralTertiary,
                            fontWeight: 500,
                          )
                        ],
                      ),
                      PrimaryText(
                        text: "Tidak ada",
                        fontSize: 28,
                        color: neutralDefault,
                        letterSpacing: -0.1,
                        lineHeight: 1.4,
                        fontWeight: 900,
                      )
                    ],
                  ),
                  AqiWidget(
                    aqi: "0",
                    aqiColor: neutralAccent1,
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
