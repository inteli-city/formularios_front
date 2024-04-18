import 'package:formularios_front/app/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // GoRoute(
    //   path: routePaths.home,
    //   builder: (context, state) => const HomePage(),
    // ),
  ],
);

const routePaths = (home: '/home',);
