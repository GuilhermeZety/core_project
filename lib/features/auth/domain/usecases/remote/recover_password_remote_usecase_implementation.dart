import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/domain/repositories/remote/recover_password_remote_repository.dart';
import 'package:core_project/features/auth/domain/usecases/remote/recover_password_remote_usecase.dart';

class RecoverPasswordRemoteUsecaseImplementation implements RecoverPasswordRemoteUsecase {
  final RecoverPasswordRemoteRepository _repository;

  RecoverPasswordRemoteUsecaseImplementation({
    required RecoverPasswordRemoteRepository repository
  }): _repository = repository;

  @override
  Future<Either<AuthFailure, bool>> call(String matricula) async {
    return await _repository(matricula);
  }
}