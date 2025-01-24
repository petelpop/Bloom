import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/flora/presentation/views/chatbot_page.dart';
import 'package:bloom/feature/main/cubit/main_page_cubit.dart';
import 'package:bloom/utils/shared_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FloraPage extends StatefulWidget {
  static const String routeName = 'flora-page';
  const FloraPage({super.key});

  @override
  State<FloraPage> createState() => _FloraPageState();
}

class _FloraPageState extends State<FloraPage> {
  bool? isOpen;

  void checkIsOpen() async {
    bool floraIsOpen = await SharedStorage.isFloraOpen();
    setState(() {
      isOpen = floraIsOpen;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIsOpen();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          context.read<MainPageCubit>().setPage(3);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFDFDFD),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Constants.imgSparklesBg),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: isOpen == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: "Kenalin, Flora!",
                            fontSize: 28,
                            fontWeight: 700,
                            lineHeight: 1.4,
                            letterSpacing: -0.2,
                            color: neutralDefault,
                          ),
                          SizedBox(height: 8),
                          PrimaryText(
                            text:
                                "Flora adalah chatbot yang akan membantu menjawab semua pertanyaan kamu seputar lingkungan.",
                            fontSize: 16,
                            color: neutralSecondary,
                            lineHeight: 1.4,
                            letterSpacing: -0.1,
                          ),
                          SizedBox(height: 28),
                          PrimaryButton(
                              width: double.infinity,
                              text: "Chat",
                              fontSize: 16,
                              textColor: whiteColor,
                              fontWeight: 700,
                              lineHeight: 1.4,
                              letterSpacing: -0.2,
                              function: () {
                                context.goNamed(ChatbotPage.routeName);
                              })
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: "Chat Kamu",
                            fontSize: 28,
                            fontWeight: 700,
                            lineHeight: 1.4,
                            letterSpacing: -0.2,
                            color: neutralDefault,
                          ),
                          SizedBox(height: 8),
                          PrimaryText(
                            text: "Mau nanya apa ke flora hari ini?",
                            fontSize: 16,
                            color: neutralSecondary,
                            lineHeight: 1.4,
                            letterSpacing: -0.1,
                          ),
                          SizedBox(height: 28),
                          InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () {
                              context.pushNamed(ChatbotPage.routeName);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Color(0xFFF2F5F8))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Constants.icFloraProfile,
                                          width: 32,
                                        ),
                                        SizedBox(width: 16),
                                        PrimaryText(
                                          text: "Flora",
                                          fontSize: 14,
                                          lineHeight: 1.4,
                                          letterSpacing: -0.1,
                                          fontWeight: 700,
                                          color: neutralDefault,
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: neutralAccent1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
