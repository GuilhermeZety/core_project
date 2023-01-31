import 'package:core_project/core/shared/user/data/models/user_model.dart';

abstract class UserLocalDatasource {
  Future<int> store(UserModel user);

  Future<UserModel> get(int id);

  Future<bool> exists();

  Future<void> truncate();

  Future<void> update(UserModel user, bool logged);

  Future<UserModel> getLogged();
}