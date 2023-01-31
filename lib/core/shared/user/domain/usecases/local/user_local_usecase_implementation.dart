import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:core_project/core/shared/user/domain/repositories/local/user_local_repository.dart';
import 'package:core_project/core/shared/user/domain/usecases/local/user_local_usecase.dart';

class UserLocalUsecaseImplementation implements UserLocalUsecase {
  final UserLocalRepository _repository;

  UserLocalUsecaseImplementation({
    required UserLocalRepository repository
  }): _repository = repository;

  @override
  Future<Either<AuthFailure, int>> store(UserModel user) {
    return _repository.store(user);
  }

  @override
  Future<Either<AuthFailure, UserEntity>> getLogged() {
    return _repository.getLogged();
  }
  
  @override
  Future<Either<AuthFailure, UserEntity>> get(int id) {
    return _repository.get(id);
  }
  
  @override
  Future<Either<AuthFailure, void>> update(UserModel user, bool logged) {
    return _repository.update(user, logged);
  }
  
  @override
  Future<Either<AuthFailure, bool>> exists() {
    return _repository.exists();
  }

  @override
  Future<Either<AuthFailure, void>> truncate() {
    return _repository.truncate();
  }
}