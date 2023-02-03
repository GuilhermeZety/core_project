import 'package:core_project/features/auth/presenter/auth_screen.dart';
import 'package:core_project/features/splash/presenter/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:go_router/go_router.dart';

import 'package:core_project/features/home/presenter/home_presenter.dart';

class Routes {
  // routes for the app
  static String splash = '/';
  static String auth = '/auth';
  static String home = '/home';

  /// Configure the routes for the app
  static GoRouter get routesConfig => _router;

  /// TODO: Routes
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
        pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AuthScreen(),
              transitionDuration: const Duration(milliseconds: 1000),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                // Change the opacity of the screen using a Curve based on the the animation's
                // value
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              }
            );
        },
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return HomePresenter();
        },
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context, 
  required GoRouterState state, 
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    transitionDuration: 1000.ms,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => 
      FadeTransition(opacity: animation, child: child),
  );
}