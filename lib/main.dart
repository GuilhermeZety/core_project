import 'package:core_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:core_project/core/logic/locale_logic.dart';
import 'package:core_project/core/logic/settings_logic.dart';
import 'package:core_project/core/common/services/service_locators.dart';
import 'package:core_project/core/common/constants/app_theme.dart';

import 'package:core_project/core/common/services/request_service.dart';

import 'package:core_project/core/logic/cache_logic.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Whent set Devices Orientations preferable
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  ///

  ///Configure the app
  ServiceLocators.setup();
  RequestService().setup();
  CacheLogic().setInstanceCache();
  
  await settingsLogic.load();
  ///
  
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget with GetItMixin{
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// Watch the settings variables
    final locale = watchX((SettingsLogic s) => s.currentLocale);
    final themeMode = watchX((SettingsLogic s) => s.currentThemeMode);
    ///

    return MaterialApp.router(
      restorationScopeId: 'app',
      scaffoldMessengerKey: globalContext,
      routerConfig: Routes.routesConfig,
      locale: locale == null ? null : Locale(locale),
      localizationsDelegates: LocaleLogic.delegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Set the public variables and logic to be used in the app
final getIt = GetIt.instance;
final globalContext = GlobalKey<ScaffoldMessengerState>();

SettingsLogic get settingsLogic => getIt.get<SettingsLogic>();
///