import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/data/models/auth_model.dart';
import 'package:core_project/features/auth/errors/auth/auth_failure.dart';

abstract class AuthLocalUsecase {
  /// A function that returns a Future of Either of AuthFailure or UserEntity.
  Future<Either<AuthFailure, UserEntity>> call(AuthModel authModel);
}