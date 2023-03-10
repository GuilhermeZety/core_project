import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:core_project/features/auth/data/models/auth_model.dart';

abstract class AuthLocalDatasource {
  /// A function that returns a Future of UserModel and takes an AuthModel as a parameter.
  Future<UserEntity> call(AuthModel authModel);
}