import 'package:bloom/feature/home/presentation/cubit/aqi_cubit.dart';
import 'package:bloom/feature/loka/presentation/cubit/loka/loka_cubit.dart';
import 'package:bloom/feature/main/cubit/main_page_cubit.dart';
import 'package:bloom/feature/pilah/presentation/cubit/pilah_cubit.dart';
import 'package:bloom/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:bloom/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await dotenv.load();
    Gemini.init(
    apiKey: dotenv.env["GEMINI_TOKEN"].toString()
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AqiCubit()),
        BlocProvider(create: (context) => MainPageCubit()),
        BlocProvider(create: (context) => PilahCubit()),
        BlocProvider(create: (context) => LokaCubit()),
        BlocProvider(create: (context) => SplashCubit()),
      ],
      child: ResponsiveSizer(
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
      
      ),
    );
  }
}
