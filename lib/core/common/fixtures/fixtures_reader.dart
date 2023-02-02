import 'package:flutter/services.dart' show rootBundle;

/// It loads a file from the assets folder and returns it as a string
/// 
/// Args:
///   name (String): The name of the file you want to load.
/// 
/// Returns:
///   A Future<String>
Future<String> fixture(String name) {
  return rootBundle.loadString('assets/jsons/$name');
}