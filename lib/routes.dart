import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/pages/home_page.dart';
import 'package:formularios_front/app/presentation/widgets/bottom_navigation_widget.dart';
import 'package:formularios_front/app/shared/themes/app_responsive_dimensions.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: child,
          extendBody: true,
          bottomNavigationBar: const BottomNavigationWidget(),
          floatingActionButton: Builder(builder: (context) {
            double responsiveIconSize =
                ResponsiveDimensions.getResponsiveIconSize(context);
            double responsiveFabSize =
                ResponsiveDimensions.getResponsiveFabSize(context);
            return SizedBox(
              width: responsiveFabSize,
              height: responsiveFabSize,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                hoverColor: Theme.of(context).colorScheme.primary,
                shape: const CircleBorder(),
                onPressed: () {},
                child: Icon(
                  Icons.rotate_right,
                  size: responsiveIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
      ],
    ),
    // GoRoute(
    //   path: routePaths.home,
    //   builder: (context, state) => const HomePage(),
    // ),
  ],
);

const routePaths = (home: '/home',);
