import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/data/models/auth_model.dart';
import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/domain/repositories/local/auth_local_repository.dart';
import 'package:core_project/features/auth/domain/usecases/local/auth_local_usecase.dart';

class AuthLocalUsecaseImplementation implements AuthLocalUsecase {
  final AuthLocalRepository _repository;

  AuthLocalUsecaseImplementation({
    required AuthLocalRepository repository
  }): _repository = repository;

  @override
  Future<Either<AuthFailure, UserEntity>> call(AuthModel authModel) {
    return _repository(authModel);
  }
}