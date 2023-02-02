import 'dart:convert';

import 'package:core_project/core/shared/user/data/models/user_token_model.dart';
import 'package:core_project/core/common/services/path_service.dart';
import 'package:core_project/core/common/services/request_service.dart';
import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:dio/dio.dart';

import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/failure_messages.dart';
import 'package:core_project/features/auth/data/models/auth_model.dart';
import 'package:core_project/features/auth/data/datasource/remote/auth_remote_datasource.dart';

class AuthRemoteDatasourceImplementation extends AuthRemoteDatasource {
  // final RequestService _service = RequestService();

  @override
  Future<UserModel> call(AuthModel auth) async {
    try {
      UserTokenModel? userToken = await RequestService().getUserToken(auth: auth);
      //todo: Remover código abaixo após disponibilizar api
      
      // final response = await _service.post(
      //   APIPath.login,
      //   body: {
      //     'matricula': auth.registration,
      //     'hashNotificacao': '213'
      //   },
      //   headers: {
      //     'Authorization': 'Bearer ${userToken.accessToken}',
      //   }
      // );

      // Map<String, dynamic> data = jsonDecode(response.body);

      Map<String, dynamic> data = jsonDecode('{}');

      if (data['success'] == false) {
        var error = data['data']['message'];

        Failure(error).exception;
      }
 
      String? path = await PathService.pathDocuments();
      String imagePath = "$path/${(data["data"]["usuario"]['foto'] as String).split('/').last}";

      if (data['data']['usuario']['foto'] != null) {
        await Dio().download(data['data']['usuario']['foto'], imagePath).onError(
          (error, stackTrace) => Response(statusCode: 404, requestOptions: RequestOptions(path: ''))
        );
      }
 
      data['data']['usuario']['foto'] = imagePath;

      data['data'].addAll({
        'autenticacao': userToken!.toMap()
      });

      return UserModel.fromMap(data['data']);

    } on UserNotFoundException catch(e) {
       throw UserNotFoundException(failureMessage: e.failureMessage);
    }
  }
}