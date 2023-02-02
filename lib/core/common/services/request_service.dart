import 'package:core_project/core/shared/user/data/models/user_token_model.dart';
import 'package:core_project/core/common/services/connection_checker_service.dart';
import 'package:core_project/core/logic/cache_logic.dart';
import 'package:core_project/core/logic/errors/app_exceptions.dart';
import 'package:dio/dio.dart';

import 'package:core_project/core/common/constants/app_constants.dart';

import 'package:core_project/core/common/constants/app_api_path.dart';

import 'package:core_project/features/auth/data/models/auth_model.dart';

class RequestService{
    RequestService._();
    static final RequestService _instance = RequestService._();
    factory RequestService() => RequestService._instance;

    final Dio _dio = Dio();

    final CacheLogic cache = CacheLogic();

    void setup(){
      _dio.options.baseUrl = AppConstants.baseUrl;
      _dio.options.connectTimeout = 5000;
      _dio.options.receiveTimeout = 3000;
    }

    Future<Response> post(AppApiPath path, {Map<String, dynamic>? data}) async {
       try{
        if(await ConnectionChecker().hasConnection == false) {
          return Response(
              statusCode: 0, 
              requestOptions: RequestOptions(path: ''), 
              statusMessage: 'No internet connection'
            );
        }

        final accessToken = await getUserToken();
        if(accessToken != null){
          _dio.options.headers['Authorization'] = 'Bearer ${accessToken.accessToken}';
        }

        final response = await _dio.post(
          path.value,
          data: data,
        ).onError(
          (error, stackTrace) => 
            Response(
              statusCode: 404, 
              requestOptions: RequestOptions(path: ''), 
              statusMessage: error.toString()
            )
        );

        if(response.statusCode != 200){
          throw SyncExceptions(message: 'Error to post data: ${path.value}');
        }
        else{
          return response;
        }
      }
      catch(err){
        rethrow;
      }
    }

    Future<Response> get(AppApiPath path, {Map<String, dynamic>? queryParameters}) async {
      try{
        if(await ConnectionChecker().hasConnection == false) {
          return Response(
              statusCode: 0, 
              requestOptions: RequestOptions(path: ''), 
              statusMessage: 'No internet connection'
            );
        }
        
        final accessToken = await getUserToken();
        if(accessToken != null){
          _dio.options.headers['Authorization'] = 'Bearer ${accessToken.accessToken}';
        }

        final response = await _dio.get(
          path.value,
          queryParameters: queryParameters,
        ).onError(
          (error, stackTrace) => 
            Response(
              statusCode: 404, 
              requestOptions: RequestOptions(path: ''), 
              statusMessage: error.toString()
            )
        );

        if(response.statusCode != 200){
          throw SyncExceptions(message: 'Error on get data: ${path.value}');
        }
        else{
          return response;
        }
      }
      catch(err){
        rethrow;
      }
    }
    
   /// It gets the user token from the server.
   /// 
   /// Args:
   ///   auth (AuthModel): This is the authentication model that you will use to authenticate the user.
   /// 
   /// Returns:
   ///   A Future<UserTokenModel?>
    Future<UserTokenModel?> getUserToken({AuthModel? auth}) async {
      try{
        if(await ConnectionChecker().hasConnection == false) return null;

        final accessToken = cache.getAccessToken();
        
       /// Checking if the token is still valid.
        if(accessToken != null){
          if(accessToken.updatedDate.add(Duration(seconds: accessToken.expiresIn)).isAfter(DateTime.now())){
            return accessToken;
          }
        }

        final response = await _dio.post(
          AppApiPath.token.value,
          data: {
            //todo Add your data
          },
        ).onError(
          (error, stackTrace) => 
            Response(
              statusCode: 404, 
              requestOptions: RequestOptions(path: ''), 
              statusMessage: error.toString()
            )
        );

        if(response.statusCode != 200){
          throw SyncExceptions(message: 'Error on get token');
        }
        else{
          UserTokenModel token =UserTokenModel.fromJson(response.data);
          cache.setAccessToken(token);
          return token;
        }
      }
      catch(err){
        rethrow;
      }
    }
}