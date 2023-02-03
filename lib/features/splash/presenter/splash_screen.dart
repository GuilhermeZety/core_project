// ignore_for_file: use_build_context_synchronously

import 'package:core_project/core/common/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:core_project/core/common/constants/app_assets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:core_project/routes.dart';

import 'package:core_project/core/common/services/current_session.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _pageAnimationController;
  @override
  void initState() {
    _pageAnimationController = AnimationController(vsync: this, duration: 1000.ms);
    WidgetsBinding.instance.addPostFrameCallback((_) async {      
      var user = CurrentSession().user;

      if (user == null) {
        Future.delayed(2800.ms, () {
          _pageAnimationController.reverse();
          Future.delayed(1.seconds, () {
            context.go(Routes.home);
          });
        });
      } 
      else {
        // if(await ConnectionChecker().hasConnection){
          // await  Synchronization().synchronize(context);
        // }
        Future.delayed(const Duration(seconds: 3), () {
          context.go(Routes.home);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              Hero(
                tag: 'logo',
                child: Image.asset(AppAssets.logo, width: 160, height: 160, color: context.colorScheme.inverseSurface, fit: BoxFit.fitHeight,)
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true),)
              .shimmer(delay: 400.ms, duration: 1800.ms, color: context.colorScheme.background.withOpacity(0.3))
              .shake(hz: 2, curve: Curves.easeInOutCubic, rotation: 0.05)
              .scaleXY(end: 1.1, duration: 600.ms) 
              .then(delay: 600.ms)
              .scaleXY(end: 1 / 1.1)
          ],
        )
      ).animate(controller: _pageAnimationController).fade(duration: 1000.ms),
    );
  } 
}