import 'dart:ui';

import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/views/home_page.dart';
import 'package:bloom/feature/main/presentation/views/main_page.dart';
import 'package:bloom/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:bloom/feature/onboarding/presentation/methods/onboarding_dots.dart';
import 'package:bloom/feature/onboarding/presentation/methods/onboarding_list.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OnboardingPage extends StatelessWidget {
  static const String routeName = "onboarding-page";

  OnboardingPage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    int? onActivePage = 0;

    return BlocProvider(
        create: (_) => OnboardingCubit(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 90.h,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            LoggerService.info("value dari change $value");
                            context.read<OnboardingCubit>().nextPage(value);
                            onActivePage = value;
                          },
                          controller: _pageController,
                          itemCount: imgOnBoarding.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 65.h,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.asset(
                                        imgOnBoarding[index],
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        height: 65.h,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 65.h,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              whiteColor,
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: PrimaryText(
                                      text: titleOnBoarding[index],
                                      color: neutralDefault,
                                      fontSize: 28,
                                      fontWeight: 700,
                                      textAlign: TextAlign.left,
                                      letterSpacing: -0.3,
                                      lineHeight: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: PrimaryText(
                                      text: descOnBoarding[index],
                                      color: neutralSecondary,
                                      fontSize: 16,
                                      textAlign: TextAlign.left,
                                      letterSpacing: -0.3,
                                      lineHeight: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryButton(
                            text: "Skip",
                            function: () {
                              context.pushNamed(MainPage.routeName);
                            },
                            fontSize: 16,
                            fontWeight: 700,
                            textColor: primaryColor600,
                            backgroundColor: Colors.transparent,
                          ),
                          OnboardingDots(onActivePage: onActivePage!),
                          PrimaryButton(
                            height: 50,
                            fontSize: 16,
                            fontWeight: 700,
                            text: state.isLastPage == true ? "Selesai" : "Lanjut",
                            function: () {
                              if (state.isLastPage == true) {
                                context.pushNamed(MainPage.routeName);
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 200), 
                                  curve: Curves.linear);
                              }
                            },
                          ),
                          
                        ],
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
