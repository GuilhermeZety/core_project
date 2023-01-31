import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/domain/entities/auth_entity.dart';
import 'package:core_project/features/auth/domain/repositories/remote/auth_remote_repository.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:core_project/features/auth/data/models/auth_model.dart';

class AuthRepositoryImplementation implements AuthRemoteRepository {
  final AuthRemoteDatasource _datasource;

  AuthRepositoryImplementation({
    required AuthRemoteDatasource datasource
  }): _datasource = datasource;

  @override
  Future<Either<AuthFailure, UserEntity>> call(AuthEntity auth) async {
    try {
      final result = await _datasource(auth as AuthModel);

      return Right(result);
    } on UserNotFoundException catch(e) {
      return Left(UserNotFoundException(failureMessage: e.failureMessage));
    }
  }
}