class UserEntity {
  final int id;
  final String name;
  final String password;
  final String email;
  final String? birthDate;
  final String? picture;

  final UserAuthEntity userAuth;

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

class UserAuthEntity {
  final String clientId;
  final String clientSecret;
  final String grantTypes;
  final String accessToken;
  final int expiresIn;
  final String tokenType;

  UserAuthEntity({
    required this.clientId,
    required this.clientSecret,
    required this.grantTypes,
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType
  });

}