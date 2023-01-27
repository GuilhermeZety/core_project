import 'package:core_project/core/common/models/access_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheLogic{
  /// Singleton
    CacheLogic._();
    static final CacheLogic _instance = CacheLogic._();
    factory CacheLogic() => CacheLogic._instance;
  ///
  
  ///Configuration
  late SharedPreferences preferences;
  Future<void> setInstanceCache() async {
    preferences = await SharedPreferences.getInstance();
  }
  ///

  ///Paths
  final String _accessToken = 'accessToken';

  Future<bool> setAccessToken(AccessTokenModel token) => preferences.setString(_accessToken, token.toJson());
  AccessTokenModel? getAccessToken() {
    final String? token = preferences.getString(_accessToken);
    return token != null ? AccessTokenModel.fromJson(token) : null;
  }
}