import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/pilah/data/model/pilah.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = "result-page";

  PilahModel? pilah;
  ResultPage({super.key, required this.pilah});

  @override
  Widget build(BuildContext context) {

    LoggerService.info("this is label ${pilah?.label} ${pilah?.image}");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Constants.icPilahText,
                width: 70,
              ),
              InkWell(
                  onTap: () => context.pop(),
                  child: Image.asset(
                    Constants.icX,
                    width: 24,
                  )),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            PrimaryText(
              text: "Tipe Sampah Kamu Adalah...",
              fontWeight: 700,
              fontSize: 18,
              lineHeight: 1.2,
              letterSpacing: -0.3,
              color: neutralDefault,
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: pilah?.image != null ? 
                            FileImage(pilah!.image!) : AssetImage(Constants.imgPlaceHolder)
                            )),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: tidakSehatBColor50,
                        border:
                            Border.all(color: tidakSehatBColor100, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: "Sampah",
                            color: Color(0xFFE02141).withOpacity(0.5),
                            fontWeight: 600,
                            fontSize: 16,
                            letterSpacing: -0.2,
                            lineHeight: 1.4,
                          ),
                          PrimaryText(
                            text: "B3",
                            fontWeight: 900,
                            fontSize: 28,
                            letterSpacing: -0.2,
                            lineHeight: 1.2,
                            color: tidakSehatBColor600,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            PrimaryText(
              text: "PENJELASAN SINGKAT",
              fontWeight: 700,
              fontSize: 12,
              letterSpacing: -0.1,
              lineHeight: 1.4,
              color: neutralAccent2,
            ),
            SizedBox(height: 8),
            PrimaryText(
                text:"Sampah yang mengandung bahan berbahaya atau beracun yang dapat merusak lingkungan dan membahayakan kesehatan manusia, seperti baterai bekas, pestisida, limbah medis, oli, dan bahan kimia lainnya. Sampah ini memerlukan penanganan khusus.",
                fontSize: 14,
                letterSpacing: -0.2,
                lineHeight: 1.4,
                color: neutralSecondary,    
                    ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: surface200,
                border: Border.all(
                  color: surface500
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Center(
                  child: PrimaryText(
                    text: "Pastikan kamu membuang sampah pada tempat yang sesuai!",
                    fontSize: 13,
                    lineHeight: 1.4,
                    letterSpacing: -0.1,
                    color: neutralSecondary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xFFFFFFFF),
                        border: Border.all(
                          color: surface300
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.04),
                            blurRadius: 20
                          )
                        ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Constants.icCamera, width: 20),
                            SizedBox(width: 8),
                            PrimaryText(
                              text: "Foto Lagi",
                              lineHeight: 1.4,
                              letterSpacing: -0.1,
                              color: neutralDefault,
                              fontWeight: 700,
                              )
                          ],
                        ),),
                    ),
                  ),

                    SizedBox(width: 14,),

                    Expanded(
                      child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xFFFFFFFF),
                        border: Border.all(
                          color: surface300
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.04),
                            blurRadius: 20
                          )
                        ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Constants.icImage, width: 20),
                            SizedBox(width: 8),
                            PrimaryText(
                              text: "Upload Lagi",
                              lineHeight: 1.4,
                              letterSpacing: -0.1,
                              color: neutralDefault,
                              fontWeight: 700,
                              )
                          ],
                        ),),
                                        ),
                    ),
                ],
              ),

              SizedBox(height: 16),

              PrimaryButton(
                backgroundColor: primaryColor600,
                textColor: whiteColor,
                lineHeight: 1.4,
                letterSpacing: -0.1,
                fontWeight: 700,
                width: double.infinity,
                text: "Lihat Tempat Sampah Terdekat", 
                function: () {

                },
                )
            ],
          ),
        ),
      ),
    );
  }
}
