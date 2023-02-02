import 'package:core_project/core/common/models/user_token_model.dart';

class UserEntity {
  final int id;
  final String name;
  final String password;
  final String email;
  final String? birthDate;
  final String? picture;

  final UserTokenModel userAuth;

  UserEntity({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    this.birthDate,
    this.picture,
    required this.userAuth,
  });  
}