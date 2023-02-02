import 'dart:convert';

import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({
    required super.id, 
    required super.name, 
    required super.password, 
    required super.email,    
    super.birthDate,
    super.picture,
    required super.userAuth,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'senha': password,
      'email': email,
      'dataNascimento': birthDate,
      'foto': picture,
    };
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['usuario']['id']?.toInt() ?? 0,
      name: map['usuario']['nome'] ?? '',
      password: map['usuario']['senha'] ?? '',
      email: map['usuario']['email'] ?? '',
      birthDate: map['usuario']['dataNascimento'],
      picture: map['usuario']['foto'],
      userAuth: UserAuthModel.fromMap(map['autenticacao']),
    );
  }

  UserModel copyWith({
    int? id,
    String? registration,
    String? name,
    String? password,
    String? email,
    String? birthDate,
    String? picture,
    UserAuthEntity? userAuth,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      picture: picture ?? this.picture,
      userAuth: userAuth ?? this.userAuth,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

}

class UserAuthModel extends UserAuthEntity{
  UserAuthModel({
    required super.clientId,
    required super.clientSecret,
    required super.grantTypes,
    required super.accessToken,
    required super.expiresIn,
    required super.tokenType
  });

   Map<String, dynamic> toMap() {
    return {
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_types': grantTypes,
      'access_token': accessToken,
      'expires_in': expiresIn,
      'token_type': tokenType,
    };
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserAuthModel.fromMap(Map<String, dynamic> map) {
    return UserAuthModel(
      clientId: map['client_id'] ?? '',
      clientSecret: map['client_secret'] ?? '',
      grantTypes: map['grant_types'] ?? '',
      accessToken: map['access_token'] ?? '',
      expiresIn: map['expires_in']?.toInt() ?? 0,
      tokenType: map['token_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthModel.fromJson(String source) => UserAuthModel.fromMap(json.decode(source));
}