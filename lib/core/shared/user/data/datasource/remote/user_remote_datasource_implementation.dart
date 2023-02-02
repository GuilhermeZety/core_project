import 'dart:convert';

import 'package:core_project/core/shared/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:core_project/core/shared/user/data/models/user_model.dart';


class UserRemoteDatasourceImplementation implements UserRemoteDatasource {
  // final RequestService _service = RequestService();

  @override
  /// It returns a token for the user.
  /// 
  /// Args:
  ///   user `(UserModel)`: The user object that you want to get the token for.
  Future<String> getToken(UserModel user) async {
    try {
      //TODO: Remover código abaixo após disponibilizar api
      
      // final request = await _service.post(
      //   AppApiPath.token,
      //     body: {
      //       'grant_types': user.userAuth.grantTypes,
      //       'client_id': user.userAuth.clientId,
      //       'client_secret': user.userAuth.clientSecret,
      //     }
      // );

      // Map<String, dynamic> response = jsonDecode(request.body);
      Map<String, dynamic> response = jsonDecode('{}');

      if(response['success']){
        return response['data']['autenticacao']['access_token'];
      }
      else{
        throw Exception(response['message']);
      }

    } catch (e) {
      rethrow;
    }
  }
}