import 'package:bloom/common/colors.dart';
import 'package:bloom/feature/onboarding/presentation/methods/onboarding_list.dart';
import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int onActivePage;

  const OnboardingDots({super.key, required this.onActivePage});

  @override
  Widget build(BuildContext context) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    titleOnBoarding.length,
    (index) => AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: onActivePage == index ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: onActivePage == index ? primaryColor600 : neutralAccent1,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20)
      ),
    ),
  ),
);
  }
}