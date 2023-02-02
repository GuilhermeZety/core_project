import 'package:core_project/core/shared/user/data/models/user_model.dart';

/// It's an abstract class that defines the methods that a remote data source must implement
abstract class UserRemoteDatasource {
  Future<String> getToken(UserModel user);
}