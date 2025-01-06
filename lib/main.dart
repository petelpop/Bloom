import 'package:bloom/feature/home/presentation/views/home_page.dart';
import 'package:bloom/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ResponsiveSizer(
      builder:(context, orientation, screenType) {
        return MaterialApp.router(
        title: 'Bloom',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routeInformationParser: AppRoute.router.routeInformationParser,
        routerDelegate: AppRoute.router.routerDelegate,
        routeInformationProvider: AppRoute.router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      );
      } 

    );
  }
}
