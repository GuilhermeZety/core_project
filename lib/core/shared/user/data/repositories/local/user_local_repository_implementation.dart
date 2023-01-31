import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:core_project/core/shared/user/domain/repositories/local/user_local_repository.dart';
import 'package:core_project/core/shared/user/data/datasource/local/user_local_datasource.dart';
import 'package:core_project/core/shared/user/data/models/user_model.dart';

import 'package:core_project/features/auth/errors/auth/auth_failure.dart';

class UserLocalRepositoryImplementation implements UserLocalRepository {
  final UserLocalDatasource _userLocalDatasource;

  UserLocalRepositoryImplementation({
    required UserLocalDatasource datasource
  }): _userLocalDatasource = datasource;

  @override
  Future<Either<AuthFailure, int>> store(UserModel user) async {
    try {
      final result = await _userLocalDatasource.store(user);

      return Right(result);
    } on CouldNotInsertException catch(e) {
      return Left(CouldNotInsertException(failureMessage: e.failureMessage));
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> getLogged() async {
    try {
      final result = await _userLocalDatasource.getLogged();

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }
  }
  
  @override
  Future<Either<AuthFailure, UserEntity>> get(int id) async {
    try {
      final result = await _userLocalDatasource.get(id);

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }
  }
  
  @override
  Future<Either<AuthFailure, void>> update(UserModel user, bool logged) async {
    try {
      final result = await _userLocalDatasource.update(user, logged);

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }
  }
  
  @override
  Future<Either<AuthFailure, bool>> exists() async {
    try {
      final result = await _userLocalDatasource.exists();

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }
  }
  
  @override
  Future<Either<AuthFailure, void>> truncate() async {
    try {
      final result = await _userLocalDatasource.truncate();

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }
  }  
}