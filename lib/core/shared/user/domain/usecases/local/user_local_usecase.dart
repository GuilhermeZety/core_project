import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';

abstract class UserLocalUsecase {
  /// It's a method that stores a user in the local database
  Future<Either<AuthFailure, int>> store(UserModel user);

  /// It's a method that returns the logged user
  Future<Either<AuthFailure, UserEntity>> getLogged();

  /// It's a method that returns a user by id
  Future<Either<AuthFailure, bool>> exists();
  
  /// It's a method that returns a user by id
  Future<Either<AuthFailure, UserEntity>> get(int id);

  /// It's a method that updates a user
  Future<Either<AuthFailure, void>> update(UserModel user, bool logged);

  /// It's a method that deletes all users
  Future<Either<AuthFailure, void>> truncate();
}