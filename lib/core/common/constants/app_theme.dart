import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get light => FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xffbb1614),
      primaryContainer: Color(0xffffdad5),
      secondary: Color(0xff96482b),
      secondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xff286294),
      tertiaryContainer: Color(0xffd0e4ff),
      appBarColor: Color(0xffffdbcf),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 9,
    // tabBarStyle: null,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      // useM2StyleDividerInM3: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Myriad Pro'
  );

  static ThemeData get dark => FlexThemeData.dark(    
    colors: const FlexSchemeColor(
      primary: Color(0xffffb4aa),
      primaryContainer: Color(0xff930006),
      secondary: Color(0xffffb59c),
      secondaryContainer: Color(0xff783116),
      tertiary: Color(0xff9bcbff),
      tertiaryContainer: Color(0xff004a79),
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