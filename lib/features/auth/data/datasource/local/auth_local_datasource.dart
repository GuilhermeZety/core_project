import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';
import 'package:core_project/features/auth/data/models/auth_model.dart';

abstract class AuthLocalDatasource {
  Future<UserEntity> call(AuthModel authModel);
}