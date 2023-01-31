import 'package:flutter/material.dart';

import 'package:core_project/core/common/constants/app_assets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:core_project/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go(Routes.home);
    });
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
              child: Image.asset(AppAssets.logo, width: 100, height: 100, color: Theme.of(context).colorScheme.inverseSurface, fit: BoxFit.fitHeight,)
            ),
            Gap(40),
            LoadingAnimationWidget.stretchedDots(color: Theme.of(context).colorScheme.inverseSurface, size: 60)
          ],
        )
      ),
    );
  } 
}