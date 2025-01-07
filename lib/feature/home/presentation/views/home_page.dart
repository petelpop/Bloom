import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/aqi_widget.dart';
import 'package:bloom/feature/home/presentation/methods/shortcut_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home-page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                    text: "Hi Teman Alam!",
                    color: neutralDefault,
                    letterSpacing: -0.2,
                    lineHeight: 1.4,
                    fontWeight: 700,
                    fontSize: 18),
                SizedBox(height: 2),
                PrimaryText(
                  text: "Sudahkah kamu memulai langkah kecil hari ini?",
                  color: neutralTertiary,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                ),
                SizedBox(height: 22),
                Container(
                  height: 180,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 115),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFF0FEF8),
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: primaryColor100, width: 1)),
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: 16, left: 16, top: 25),
                            child: Row(children: [
                              Image.asset(Constants.icHeart, width: 16),
                              SizedBox(width: 10),
                              PrimaryText(
                                text: "Udaranya lagi bagus nih, olahraga yuk!",
                                color: primaryColor600,
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
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: neutralTertiary,
                                        size: 16,
                                      ),
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
                                    text: "Baik",
                                    fontSize: 28,
                                    color: neutralDefault,
                                    letterSpacing: -0.1,
                                    lineHeight: 1.4,
                                    fontWeight: 900,
                                  )
                                ],
                              ),
                              AqiWidget()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                PrimaryText(
                  text: "SHORTCUT",
                  fontWeight: 700,
                  fontSize: 12,
                  color: neutralAccent2,
                  letterSpacing: -0.1,
                  lineHeight: 1.4,
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShortcutWidget(
                        icon: Constants.icBox,
                        text: "Pilah Sampah",
                        desc: "Sebelum dibuang, pilah dulu!"),
                    ShortcutWidget(
                        icon: Constants.icChatDots,
                        text: "Tanya Flora",
                        desc: "Chatbot AI yang peduli bumi.")
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  constraints: BoxConstraints(
                    minHeight: 69,
                    maxHeight: 71
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: whiteColor,
                    border: Border.all(
                      color: surface300,
                      width: 1
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.04),
                        blurRadius: 20
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: surface200),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: Image.asset(Constants.icTrash),
                          ),
                        ),
                        
                        SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: "Males Cari Tempat Sampah ?",
                              fontWeight: 700,
                              lineHeight: 1.4,
                              letterSpacing: -0.1,
                              color: neutralDefault,),
                              PrimaryText(
                                text: "Klik dan temukan tempat sampah terdekat!",
                                fontSize: 12,
                                letterSpacing: -0.1,
                                lineHeight: 1.4,
                                color: neutralTertiary,)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
