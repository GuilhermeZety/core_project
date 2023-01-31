import 'package:core_project/core/shared/user/data/datasource/remote/user_remote_datasource_implementation.dart';
import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/domain/repositories/remote/user_remote_repository.dart';
import 'package:core_project/core/shared/user/errors/user_failures.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/core/shared/user/errors/user_exceptions.dart';

class UserRemoteRepositoryImplementation extends UserRemoteRepository {
  final UserRemoteDatasourceImplementation _datasource;

  UserRemoteRepositoryImplementation({
    required UserRemoteDatasourceImplementation datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<UserFailure, String>> getToken(UserModel user) async {
    try {
      String result = await _datasource.getToken(user);

      return Right(result);
    } on UserTokenNotFoundException catch (e) {
      return Left(UserTokenNotFoundException(e.failureMessage));
    } on UserCouldNotGetTokenException catch(e) {
      return Left(UserCouldNotGetTokenException(e.failureMessage));
    }
  }
}