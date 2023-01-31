import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/domain/repositories/local/auth_local_repository.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:core_project/features/auth/data/models/auth_model.dart';

class AuthLocalRepositoryImplementation implements AuthLocalRepository {
  final AuthLocalDatasource _authLocalDatasource;

  AuthLocalRepositoryImplementation({
    required AuthLocalDatasource datasource
  }): _authLocalDatasource = datasource;

  @override
  Future<Either<AuthFailure, UserEntity>> call(AuthModel authModel) async {
    try {
      final result = await _authLocalDatasource(authModel);

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }on NotInternetConnectionException catch(e) {
      return Left(NotInternetConnectionException(failureMessage: e.failureMessage));
    }
  }
}