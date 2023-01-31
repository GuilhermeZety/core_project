import 'package:core_project/core/shared/user/data/models/user_model.dart';

abstract class UserRemoteDatasource {
  Future<String> getToken(UserModel user);
}