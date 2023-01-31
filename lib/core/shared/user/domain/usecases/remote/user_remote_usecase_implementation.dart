import 'package:dartz/dartz.dart';

import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/data/repositories/remote/user_remote_repository_implementation.dart';
import 'package:core_project/core/shared/user/errors/user_failures.dart';
import 'package:core_project/core/shared/user/domain/usecases/remote/user_remote_usecase.dart';

class UserRemoteUsecaseImplementation implements UserRemoteUsecase {
  final UserRemoteRepositoryImplementation _repository;

  UserRemoteUsecaseImplementation({
    required UserRemoteRepositoryImplementation repository
  }): _repository = repository;

  @override
  Future<Either<UserFailure, String>> getToken(UserModel user) async
    => await  _repository.getToken(user);
}