import 'package:core_project/core/logic/throttler.dart';
import 'package:flutter/foundation.dart';

import 'package:core_project/core/logic/json_prefs_file.dart';


/// It's a mixin that defines the methods that a class must implement to be able to save and load data
mixin ThrottledSaveLoadMixin {
  late final _file = JsonPrefsFile(fileName);
  final _throttle = Throttler(const Duration(seconds: 2));

  
  /// It loads the data from the database.
  Future<void> load() async {
    final results = await _file.load();
    try {
      copyFromJson(results);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  /// It saves the data to the database.
  Future<void> save() async {
    debugPrint('Saving...');
    try {
      await _file.save(toJson());
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  /// "If the last time we called save was more than a second ago, call save now, otherwise wait until
  /// the last call to save has been more than a second ago."
  /// 
  /// The Throttle class is a simple class that takes a function and a duration. When you call the
  /// Throttle.call() method, it will call the function if the last time it was called was more than the
  /// duration ago. If the last call was less than the duration ago, it will wait until the last call
  /// was more than the duration ago before calling the function
  Future<void> scheduleSave() async => _throttle(save);

  /// Serialization
  String get fileName;

  Map<String, dynamic> toJson();

  void copyFromJson(Map<String, dynamic> value);
  ///
}
