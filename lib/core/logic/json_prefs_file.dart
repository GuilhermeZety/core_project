import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// It's a wrapper around a JSON file that allows you to store and retrieve Dart objects
class JsonPrefsFile {
  JsonPrefsFile(this.name);
  final String name;

  /// It loads the data from the file.
  Future<Map<String, dynamic>> load() async {
    final p = (await SharedPreferences.getInstance()).getString(name);
    return Map<String, dynamic>.from(jsonDecode(p ?? '{}'));
  }

  /// It saves the data to the file.
  Future<void> save(Map<String, dynamic> data) async {
    await (await SharedPreferences.getInstance()).setString(name, jsonEncode(data));
  }
}
