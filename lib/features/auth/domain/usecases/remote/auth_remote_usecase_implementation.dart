
import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/domain/entities/auth_entity.dart';
import 'package:core_project/features/auth/domain/repositories/remote/auth_remote_repository.dart';
import 'package:core_project/features/auth/domain/usecases/remote/auth_remote_usecase.dart';

class AuthRemoteUsecaseImplementation implements AuthRemoteUsecase {
  final AuthRemoteRepository _repository;

  AuthRemoteUsecaseImplementation({
    required AuthRemoteRepository repository
  }): _repository = repository;

  @override
  Future<Either<AuthFailure, UserEntity>> call(AuthEntity auth) async {
    return await _repository(auth);
  }
}