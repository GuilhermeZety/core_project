import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/domain/repositories/remote/recover_password_remote_repository.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';
import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/data/datasource/remote/recover_password_remote_datasource.dart';

class RecoverPasswordRemoteRepositoryImplementation implements RecoverPasswordRemoteRepository {
  final RecoverPasswordRemoteDatasource _datasource;

  RecoverPasswordRemoteRepositoryImplementation({
    required RecoverPasswordRemoteDatasource datasource
  }): _datasource = datasource;

  @override
  Future<Either<AuthFailure, bool>> call(String matricula) async {
    try {
      final result = await _datasource(matricula);

      return Right(result);
    } on UserEmailNotFoundException catch(e) {
      return Left(UserEmailNotFoundException(failureMessage: e.failureMessage));
    }
  }
}