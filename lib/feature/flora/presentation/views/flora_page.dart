import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/flora/presentation/views/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloraPage extends StatelessWidget {
  static const String routeName = 'flora-page';
  const FloraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Constants.imgSparklesBg
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: "Kenalin, Flora!",
                  fontSize: 28,
                  fontWeight: 700,
                  lineHeight: 1.4,
                  letterSpacing: -0.2,
                  color: neutralDefault,),
                  SizedBox(height: 8),
                  PrimaryText(
                    text: "Flora adalah chatbot yang akan membantu menjawab semua pertanyaan kamu seputar lingkungan.",
                    fontSize: 16,
                    color: neutralSecondary,
                    lineHeight: 1.4,
                    letterSpacing: -0.1,),
                    SizedBox(height: 28),
                    PrimaryButton(
                      width: double.infinity,
                      text: "Chat",
                      fontSize: 16,
                      textColor: whiteColor,
                      fontWeight: 700,
                      lineHeight: 1.4,
                      letterSpacing: -0.2,
                      function: (){
                        context.pushNamed(ChatbotPage.routeName);
                      })
              ],
            ),
          )
        ],
      ),
    );
  }
}