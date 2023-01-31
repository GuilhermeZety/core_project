import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/errors/auth/auth_failure.dart';
import 'package:core_project/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRemoteRepository {
  Future<Either<AuthFailure, UserEntity>> call(AuthEntity auth);
}