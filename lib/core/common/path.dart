import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_;
import 'package:path_provider_foundation/path_provider_foundation.dart' as path_ios;

class Path {
  /// A function that returns the path to the documents directory.
  static Future<String?> pathDocuments() async {
    String? path;
    
    if(Platform.isAndroid){
     path = (await path_.getApplicationDocumentsDirectory()).path;
    }
    else if(Platform.isIOS){
      path = await path_ios.PathProviderFoundation().getApplicationDocumentsPath();
    }

    return path;
  }
}