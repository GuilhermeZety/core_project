

import 'package:core_project/core/common/extensions/bool_sql_extension.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/failure_messages.dart';
import 'package:sqflite/sql.dart';

import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/data/datasource/local/user_local_datasource.dart';

import 'package:core_project/core/common/services/database_service.dart';

import 'package:core_project/core/common/services/current_session.dart';

class UserLocalDatasourceImplementation implements UserLocalDatasource {
  final DatabaseHandler databaseHandler = DatabaseHandler();

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

      /// Stores the user level dataDigest
      await database.insert(
        'nivel', 
        (user.userLevel as UserLevelModel).toMapWith({'usuario_id': user.id}), 
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      /// Stores the user allocated sector data
      await database.insert(
        'setor_alocado', 
        (user.userAllocatedSector as UserAllocatedSectorModel).toMapWith({'usuario_id': user.id}), 
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      /// Stores the user auth data
      await database.insert(
        'autenticacao', 
        (user.userAuth as UserAuthModel).toMapWith({'usuario_id': user.id}), 
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      /// Stores the user permissions data from the user
      await databaseHandler.batch(
        'usuario_permissao', 
        user.userPermissions.map((e) => (e as UserPermissionModel).toMapWith({'usuario_id': user.id})).toList()
      );

      /// Stores the user activities data from the user
      await databaseHandler.batch(
        'usuario_atividade', 
        user.userActivities.map((e) => (e as UserActivitiesModel).toMapWith({'usuario_id': user.id})).toList()
      );

      /// Stores the user activities permissions data from the user
      List<Map<String, dynamic>> listPermissions = [];
      
      for(var activity in user.userActivities){
        listPermissions.addAll((activity as UserActivitiesModel).mapPermissionsWith({'usuario_id': user.id, 'usuario_atividade_id': activity.id}));
      }

      await databaseHandler.batch(
        'usuario_atividade_permissao', 
        listPermissions
      );
    }
    catch (e){
      throw AuthExceptions(failureMessage: e.toString());
    }

    return user.id;
  }

  @override
  Future<UserModel> get(int id) async {
    try {
      final database = await databaseHandler.getDatabase();

      var userData = await database.query('usuario', where: 'id = $id');
      
      if (userData.isEmpty) {
        Failure('Não foi possível encontrar o usuário').exception;
      }

      final levelMap = await database.query('nivel', where: 'usuario_id = $id');

      var allocatedSectorMap = await database.query('setor_alocado', where: 'usuario_id = $id');
      
      final authMap = await database.query('autenticacao', where: 'usuario_id = $id');

      final listPermissionsMap = await database.query('usuario_permissao', where: 'usuario_id = $id');

      final listActivitiesMap = await database.query('usuario_atividade', where: 'usuario_id = $id');

      final listActivitiesPermissionsMap = await database.query('usuario_atividade_permissao', where: 'usuario_id = $id');

      return _structureUser(
        userMap: userData.first,
        levelMap: levelMap.first,
        authMap: authMap.first,
        allocatedSectorMap: allocatedSectorMap.first,
        listPermissionsMap: listPermissionsMap,
        listActivitiesMap: listActivitiesMap,
        listActivitiesPermissionsMap: listActivitiesPermissionsMap,
      );
    } on UserNotFoundException catch(e) {
      throw UserNotFoundException(failureMessage: e.failureMessage);
    }
  }

  @override
  Future<void> update(UserModel user, bool logged) async {
    try{
      await store(user, logged: logged.toNumber());
    }
    catch(e){
      throw UserNotFoundException(failureMessage: e.toString());
    }
  }

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

  UserModel _structureUser({
    required Map<String, dynamic> userMap,
    required Map<String, dynamic> levelMap,
    required Map<String, dynamic> allocatedSectorMap,
    required Map<String, dynamic> authMap,
    required List<Map<String, dynamic>> listPermissionsMap,
    required List<Map<String, dynamic>> listActivitiesMap,
    required List<Map<String, dynamic>> listActivitiesPermissionsMap,
  }) {
    return UserModel.fromMap({
      'usuario': userMap,
      'autenticacao': authMap,
      'setorAlocado': allocatedSectorMap,
      'nivel': levelMap,
      'aPermissao': listPermissionsMap,
      'aAtividade': mixActivities(listActivitiesMap, listActivitiesPermissionsMap)
    });
  }

  List<Map<String, dynamic>> mixActivities(
    List<Map<String, dynamic>> listActivitiesMap, 
    List<Map<String, dynamic>> listActivitiesPermissionsMap
  ){
    listActivitiesMap = listActivitiesMap.map((e) => Map<String, dynamic>.from(e)).toList();
    listActivitiesPermissionsMap = listActivitiesPermissionsMap.map((e) => Map<String, dynamic>.from(e)).toList();
    

    final List<Map<String, dynamic>> finalListActivities = [];
    for(var activity in listActivitiesMap){
      var list = listActivitiesPermissionsMap.where((element) => element['usuario_atividade_id'] == activity['id']).toList();

      if(list.isNotEmpty){
        activity['aPermissao'] = list.toList();
      }

      finalListActivities.add(activity);
    }

    return finalListActivities;
  }
  
  @override
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
  }
  
  @override
  Future<void> truncate() async {
    try {
      CurrentSession session = CurrentSession();

      if(session.user != null){
        final database = await databaseHandler.getDatabase();
        await database.delete('usuario', where: 'id = ${session.user!.id}');
        await database.delete('nivel', where: 'usuario_id = ${session.user!.id}');
        await database.delete('setor_alocado', where: 'usuario_id = ${session.user!.id}');
        await database.delete('autenticacao', where: 'usuario_id = ${session.user!.id}');
        await database.delete('usuario_permissao', where: 'usuario_id = ${session.user!.id}');
        await database.delete('usuario_atividade', where: 'usuario_id = ${session.user!.id}');
        await database.delete('usuario_atividade_permissao', where: 'usuario_id = ${session.user!.id}');      
      }
    } on UserNotFoundException catch(e) {
      throw UserNotFoundException(failureMessage: e.failureMessage);
    }
    catch(e){
      throw AuthExceptions(failureMessage: e.toString());
    }
  }
}