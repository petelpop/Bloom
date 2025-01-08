import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/shortcut_widget.dart';
import 'package:flutter/material.dart';

class PilahPage extends StatelessWidget {
  static const String routeName = "pilah-page";
  const PilahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Constants.imgTrashBg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    text: "Pilah Dulu Yuk!",
                    fontSize: 28,
                    fontWeight: 700,
                    lineHeight: 1.4,
                    letterSpacing: -0.2,
                    color: neutralDefault,
                  ),
                  SizedBox(height: 8),
                  PrimaryText(
                    text:
                        "Langsung jepret atau upload foto sampahmu dari galeri, semua sama gampangnya!",
                    lineHeight: 1.4,
                    fontSize: 16,
                    letterSpacing: -0.1,
                    color: neutralSecondary,
                  ),
                  SizedBox(height: 28,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShortcutWidget(
                        icon: Constants.icCamera, 
                        text: "Pakai Kamera", 
                        desc: "Cekrek! langsung kepilah"),
                      ShortcutWidget(
                        icon: Constants.icImage, 
                        text: "Upload Gambar", 
                        desc: "Satset! langsung kepilah"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
