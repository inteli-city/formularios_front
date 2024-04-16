import 'package:go_router/go_router.dart';
import 'package:formularios_front/app/presentation/pages/home_page.dart';
import 'package:formularios_front/app/presentation/pages/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: routePaths.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

const routePaths = (home: '/home',);
