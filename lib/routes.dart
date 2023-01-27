import 'package:core_project/features/auth/presenter/auth_screen.dart';
import 'package:core_project/features/splash/presenter/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:core_project/features/home/presenter/home_screen.dart';

class Routes {
  // routes for the app
  static String splash = '/';
  static String auth = '/auth';
  static String home = '/home';

  /// Configure the routes for the app
  static GoRouter get routesConfig => _router;

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.auth,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
    ],
  );
}
