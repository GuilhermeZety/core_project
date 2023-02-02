

import 'package:core_project/core/common/extensions/bool_sql_extension.dart';
import 'package:core_project/core/logic/errors/app_exceptions.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/failure_messages.dart';
import 'package:sqflite/sql.dart';

import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/data/datasource/local/user_local_datasource.dart';

import 'package:core_project/core/common/services/database_service.dart';

import 'package:core_project/core/common/services/current_session.dart';

class UserLocalDatasourceImplementation implements UserLocalDatasource {
  final DatabaseHandler databaseHandler = DatabaseHandler();

  /// It stores a user in the database.
  /// 
  /// Args:
  ///   user (`UserModel`): The user model to be stored.
  ///   logged: 1 if the user is logged in, 0 if not. Defaults to 1
  @override
  Future<int> store(UserModel user, {logged = 1}) async {
    try {
      /// Stores the user data
      final database = await databaseHandler.getDatabase();
      await database.insert(
        'usuario', 
        user.toMapWith({'logado': logged, 'senha': user.password }), 
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      /// Stores the user auth data
      await database.insert(
        'autenticacao', 
        user.userAuth.toMapWith({'usuario_id': user.id}), 
        conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
    catch(e){
      throw DatabaseExceptions(message: e.toString());
    }

    return user.id;
  }

  /// It returns the user data.
  /// 
  /// Args:
  ///  id (`int`): The user id.
  /// 
  /// Returns:
  /// `UserModel`: The user data.
  @override
  Future<UserModel> get(int id) async {
    try {
      final database = await databaseHandler.getDatabase();

      var userData = await database.query('usuario', where: 'id = $id');
      
      if (userData.isEmpty) {
        Failure('Não foi possível encontrar o usuário').exception;
      }
      
      final authMap = await database.query('autenticacao', where: 'usuario_id = $id');

      return UserModel.fromMap({
        'usuario': userData.first,
        'autenticacao': authMap.first,
      });

    } on UserNotFoundException catch(e) {
      throw UserNotFoundException(failureMessage: e.failureMessage);
    }
    catch(e){
      throw DatabaseExceptions(message: e.toString());
    }
  }

  /// It updates the user data.
  @override
  Future<void> update(UserModel user, bool logged) async {
    try{
      await store(user, logged: logged.toNumber());
    }
    catch(e){
      throw DatabaseExceptions(message: e.toString());
    }
  }

  /// It returns the logged user.
  @override
  Future<UserModel> getLogged() async {
    try {
      final database = await databaseHandler.getDatabase();    

      var userData = await database.query('usuario', where: 'logado = 1');

      if (userData.isEmpty) {
        Failure('Não foi possível encontrar o usuário').exception;
      }

      return get(userData.first['id'] as int);
    }
    catch(e){
      throw UserNotFoundException(failureMessage: e.toString());
    }
  }

  @override
  /// It returns true if the user is logged in, false if not.
  Future<bool> exists() async {
    try {
      final database = await databaseHandler.getDatabase();    

      var userData = await database.query('usuario', where: 'logado = 1');

      if (userData.isEmpty) {
        Failure('Não foi possível encontrar o usuário').exception;
      }

      return true;
      
    } on UserNotFoundException catch(e) {
      throw UserNotFoundException(failureMessage: e.failureMessage);
    }
    catch(e){
      throw DatabaseExceptions(message: e.toString());
    }
  }
  
  @override
  /// It deletes the user from the database.
  Future<void> truncate() async {
    try {
      CurrentSession session = CurrentSession();

      if(session.user != null){
        final database = await databaseHandler.getDatabase();
        await database.delete('usuario', where: 'id = ${session.user!.id}');
        await database.delete('autenticacao', where: 'usuario_id = ${session.user!.id}');
      }
    } on UserNotFoundException catch(e) {
      throw UserNotFoundException(failureMessage: e.failureMessage);
    }
    catch(e){
      throw DatabaseExceptions(message: e.toString());
    }
  }
}