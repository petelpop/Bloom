import 'package:bloom/feature/flora/presentation/views/chatbot_page.dart';
import 'package:bloom/feature/flora/presentation/views/flora_page.dart';
import 'package:bloom/feature/home/presentation/views/home_page.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:bloom/feature/loka/presentation/views/aqi_loka_page.dart';
import 'package:bloom/feature/loka/presentation/views/loka_page.dart';
import 'package:bloom/feature/loka/presentation/views/onboarding_loka_page.dart';
import 'package:bloom/feature/main/presentation/views/main_page.dart';
import 'package:bloom/feature/onboarding/presentation/views/onboarding_page.dart';
import 'package:bloom/feature/pilah/data/model/pilah.dart';
import 'package:bloom/feature/pilah/presentation/views/pilah_page.dart';
import 'package:bloom/feature/pilah/presentation/views/result_page.dart';
import 'package:bloom/feature/splash/presentation/views/splash_page.dart';
import 'package:bloom/feature/terra/data/model/article.dart';
import 'package:bloom/feature/terra/presentation/views/article_detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter router =
      GoRouter(initialLocation: '/${SplashPage.routeName}', routes: [
    GoRoute(
      path: '/${SplashPage.routeName}',
      name: SplashPage.routeName,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
        path: '/${OnboardingPage.routeName}',
        name: OnboardingPage.routeName,
        builder: (context, state) {
          return OnboardingPage();
        }),
    GoRoute(
        path: '/${MainPage.routeName}',
        name: MainPage.routeName,
        builder: (context, state) {
          return const MainPage();
        },
        routes: [
          GoRoute(
            path: ArticleDetailPage.routeName,
            name: ArticleDetailPage.routeName,
            builder: (context, state) {
              return ArticleDetailPage(data: state.extra as ArticleModel);
            },
          ),
          GoRoute(
            path: OnboardingLokaPage.routeName,
            name: OnboardingLokaPage.routeName,
            builder: (context, state) {
              return OnboardingLokaPage();
            },
          ),
          GoRoute(
            path: AqiLokaPage.routeName,
            name: AqiLokaPage.routeName,
            builder: (context, state) {
              return AqiLokaPage();
            },
          ),
          GoRoute(
            path: LokaPage.routeName,
            name: LokaPage.routeName,
            builder: (context, state) {
              return LokaPage();
            },
          ),
          GoRoute(
            path: HomePage.routeName,
            name: HomePage.routeName,
            builder: (context, state) {
              return HomePage();
            },
          ),
          GoRoute(
              path: PilahPage.routeName,
              name: PilahPage.routeName,
              builder: (context, state) {
                return PilahPage();
              }),
          GoRoute(
            path: ResultPage.routeName,
            name: ResultPage.routeName,
            builder: (context, state) {
              return ResultPage(
                pilah: state.extra as PilahModel,
              );
            },
          ),
          GoRoute(
            path: FloraPage.routeName,
            name: FloraPage.routeName,
            builder: (context, state) {
              return FloraPage();
            },
          ),
          GoRoute(
            path: ChatbotPage.routeName,
            name: ChatbotPage.routeName,
            builder: (context, state) {
              return ChatbotPage();
            },
          ),
        ]),
  ]);
}
