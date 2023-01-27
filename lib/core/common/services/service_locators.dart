
import 'package:core_project/main.dart';

import 'package:core_project/core/logic/settings_logic.dart';

class ServiceLocators{
  static void setup() {
    getIt.registerSingleton<SettingsLogic>(SettingsLogic());
  }
}