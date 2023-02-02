import 'package:core_project/core/shared/user/data/models/user_model.dart';

import 'package:core_project/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDatasource {
  /// A function that returns a Future of UserModel and takes an AuthModel as a parameter.
  Future<UserModel> call(AuthModel auth);
}