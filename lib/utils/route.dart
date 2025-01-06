import 'package:bloom/feature/splash/presentation/views/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: '/${SplashPage.routeName}',
    routes: [
      GoRoute(
        path: '/${SplashPage.routeName}',
        name: SplashPage.routeName,
        builder: (context, state) {
          return const SplashPage();
        },)
    ]);
}