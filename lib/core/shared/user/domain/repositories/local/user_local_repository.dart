import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';

abstract class UserLocalRepository {
  Future<Either<AuthFailure, int>> store(UserModel user);

  Future<Either<AuthFailure, UserEntity>> getLogged();

  Future<Either<AuthFailure, bool>> exists();

  Future<Either<AuthFailure, void>> truncate();

  Future<Either<AuthFailure, UserEntity>> get(int id);

  Future<Either<AuthFailure, void>> update(UserModel user, bool logged);
}