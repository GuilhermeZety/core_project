import 'package:core_project/core/logic/save_load_mixin.dart';
import 'package:flutter/material.dart';


class SettingsLogic with ThrottledSaveLoadMixin {  
  ///File name for the settings file is saved as device
  @override
  String get fileName => 'settings.dat';
  ///
  
  /// Settings variables notifiers
  late final currentLocale = ValueNotifier<String?>(null)..addListener(scheduleSave);
  late final currentThemeMode = ValueNotifier<ThemeMode?>(null)..addListener(scheduleSave);
  ///
  
  ///Changers for the settings variables 
  Future<void> changeLocale(context, Locale value) async {
    currentLocale.value = value.languageCode;
  }

  Future<void> changeThemeMode(ThemeMode value) async {
    currentThemeMode.value = value;    
  }
  ///
  
  /// Convert return to cache to this variables
  @override
  void copyFromJson(Map<String, dynamic> value) {
    currentLocale.value = value['currentLocale'];
    currentThemeMode.value = makeThemeMode(value['currentThemeMode']);
  }
  ///
  
  /// Convert this variables to jsons values to cache
  @override
  Map<String, dynamic> toJson() {
    return {
      'currentLocale': currentLocale.value,
      'currentThemeMode': currentThemeMode.value.toString(),
    };
  }
  ///
}

//OTHERS FUNCTIONS UTILS
ThemeMode makeThemeMode(String? theme){
    switch(theme){
      case 'ThemeMode.system':
        return ThemeMode.light;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }