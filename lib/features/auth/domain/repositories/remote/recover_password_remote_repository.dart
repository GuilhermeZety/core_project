import 'package:dartz/dartz.dart';

import 'package:core_project/features/auth/errors/auth/auth_failure.dart';

abstract class RecoverPasswordRemoteRepository {
  Future<Either<AuthFailure, bool>> call(String matricula);
}