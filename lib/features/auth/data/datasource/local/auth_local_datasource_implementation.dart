
import 'dart:convert';

import 'package:core_project/core/common/services/database_service.dart';
import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:core_project/core/shared/user/domain/usecases/local/user_local_usecase.dart';
import 'package:core_project/main.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/errors/failure_messages.dart';
import 'package:core_project/features/auth/data/models/auth_model.dart';
import 'package:core_project/features/auth/data/datasource/local/auth_local_datasource.dart';

class AuthLocalDatasourceImplementation implements AuthLocalDatasource {
  DatabaseHandler databaseHandler = DatabaseHandler();

  @override
  Future<UserEntity> call(AuthModel authModel) async {
    Database database = await databaseHandler.getDatabase();
    try {
      var password = md5.convert(utf8.encode(authModel.password)).toString();

      var userData = await database.query('usuario', where: 'matricula = "${authModel.registration}" and senha = "$password"');

      if (userData.isEmpty) {
        var quantityUsers = await database.count('usuario');

        if(quantityUsers == 0){
          Failure('É necessário conexão com a internet ao primeiro acesso').exception;
        }else{
          Failure('Não foi possível encontrar o usuário').exception;
        }
        
      }
      
      final response = await getIt<UserLocalUsecase>().get(userData.first['id'] as int);

      if (response.isRight()) {
        var r = response.fold((l) => null, (r) => r);
        if(r != null){
          return r;
        }
      }

      throw UserNotFoundException(failureMessage: (Left(response) as AuthFailure).failureMessage);
      
    } on UserNotFoundException catch(e) {
      throw UserNotFoundException(failureMessage: e.failureMessage);
    }
  }
}