import 'dart:convert';

import 'package:core_project/core/common/services/request_service.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/data/datasource/remote/recover_password_remote_datasource.dart';

class RecoverPasswordRemoteDatasourceImplementation extends RecoverPasswordRemoteDatasource {
  RequestService service = RequestService();

  @override
  Future<bool> call(String matricula) async {
    try {
      
      //TODO: Remover código abaixo após disponibilizar api
              // final response = await service.post(
              //   APIPath.recoveryPassword,
              //   body: {
              //     'matricula': matricula
              //   }
              // );

              // Map<String, dynamic> data = jsonDecode(response.body);    
      ///  
      
      // final recoveryJson = await fixture('recovery_password.json');

      Map<String, dynamic> data = jsonDecode('{}');

      return data['success'];

    } catch(e) {
       throw UserNotFoundException(failureMessage: e.toString());
    }
  }
}