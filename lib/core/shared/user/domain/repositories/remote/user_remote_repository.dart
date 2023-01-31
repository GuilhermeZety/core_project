import 'package:dartz/dartz.dart';

import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/errors/user_failures.dart';

abstract class UserRemoteRepository {
  Future<Either<UserFailure, String>> getToken(UserModel user);
}