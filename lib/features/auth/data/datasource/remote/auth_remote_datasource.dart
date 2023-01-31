import 'package:core_project/core/shared/user/data/models/user_model.dart';

import 'package:core_project/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> call(AuthModel auth);
}