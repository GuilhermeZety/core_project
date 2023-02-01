import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get light => FlexThemeData.light(
    colors: FlexSchemeColor(
      primary: AppColors.yellow_500,
      primaryContainer: Colors.white,
      secondary: AppColors.yellow_400,
      secondaryContainer: AppColors.grey_100,
      tertiary: AppColors.grey_100,
      appBarColor: AppColors.yellow_500,
      error: AppColors.red_500,      
    ),
    appBarBackground: AppColors.yellow_500,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 9,
    // tabBarStyle: null,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      switchSchemeColor: SchemeColor.primary,
      switchThumbSchemeColor: SchemeColor.background,
      blendOnColors: false,
      checkboxSchemeColor: SchemeColor.primary,
      // useM2StyleDividerInM3: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Myriad Pro'
  );

  static ThemeData get dark => FlexThemeData.dark(   
    colors: FlexSchemeColor(
      primary: AppColors.yellow_500,
      primaryContainer: AppColors.grey_900,      
      secondary: Color(0xffffb59c),
      secondaryContainer: AppColors.grey_800,
      tertiary: Colors.black,
      appBarColor: Color(0xff783116),
      error: Color(0xffcf6679),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    // tabBarStyle: null,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      // useM2StyleDividerInM3: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Myriad Pro'
  );
}