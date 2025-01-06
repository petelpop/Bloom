import 'package:bloom/common/constants.dart';
import 'package:bloom/feature/onboarding/presentation/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "splash-page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}



class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.pushNamed(OnboardingPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Constants.bgSplashScreen
                ),
                fit: BoxFit.cover)
            ),
          ),
          Center(
            child: Image.asset(
              Constants.icTextBloomWhite,
              width: 50.w,
            ),
          )
        ],
      ),
    );
  }
}