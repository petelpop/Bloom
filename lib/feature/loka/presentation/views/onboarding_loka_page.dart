import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/shortcut_widget.dart';
import 'package:bloom/feature/loka/presentation/views/aqi_loka_page.dart';
import 'package:bloom/feature/loka/presentation/views/loka_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingLokaPage extends StatelessWidget {
  static const String routeName = "onboarding-loka-page";
  const OnboardingLokaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Constants.imgLokaBg,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: "Mau Lihat Lokasi Apa?",
                  fontWeight: 700,
                  color: neutralDefault,
                  fontSize: 28,
                  lineHeight: 1.4,
                  letterSpacing: -0.2,
                ),
                SizedBox(height: 8),
                PrimaryText(
                  text:
                      "Saat ini, kamu bisa dapetin lokasi tempat sampah terdekat. Informasi kualitas udara akan segera hadir!",
                  fontSize: 16,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                  color: neutralSecondary,
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(LokaPage.routeName);
                      },
                      child: ShortcutWidget(
                          icon: Constants.icTrash,
                          text: "Tempat Sampah",
                          desc: "Dicariin yang terdekat"),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AqiLokaPage.routeName);
                      },
                      child: ShortcutWidget(
                          icon: Constants.icTrash,
                          text: "Tempat Sampah",
                          desc: "Dicariin yang terdekat"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
