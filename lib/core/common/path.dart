import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_;
import 'package:path_provider_ios/path_provider_ios.dart' as path_ios;

class Path {
  static Future<String?> pathDocuments() async {
    String? path;
    
    if(Platform.isAndroid){
     path = (await path_.getApplicationDocumentsDirectory()).path;
    }
    else if(Platform.isIOS){
      path = await path_ios.PathProviderIOS().getApplicationDocumentsPath();
    }

    return path;
  }
}