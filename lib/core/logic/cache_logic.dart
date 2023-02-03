import 'package:core_project/core/shared/user/data/models/user_token_model.dart';
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

  
  
  /// It saves the token to the shared preferences.
  /// 
  /// Args:
  ///   token (UserTokenModel): The token to be saved.
  Future<bool> setAccessToken(UserTokenModel token) => preferences.setString(_accessToken, token.toJson());
  
  /// If the user is logged in, return their access token, otherwise return null.
  UserTokenModel? getAccessToken() {
    final String? token = preferences.getString(_accessToken);
    return token != null ? UserTokenModel.fromJson(token) : null;
  }
}