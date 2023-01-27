import 'package:flutter/services.dart' show rootBundle;

Future<String> fixture(String name) {
  return rootBundle.loadString('assets/jsons/$name');
}