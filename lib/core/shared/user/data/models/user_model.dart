import 'dart:convert';

import 'package:core_project/core/common/extensions/bool_sql_extension.dart';
import 'package:core_project/core/shared/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({
    required super.id, 
    required super.registration, 
    required super.name, 
    required super.password, 
    required super.email,    
    super.document,
    super.office,
    super.birthDate,
    super.admissionDate,
    super.language,
    super.picture,
    required super.userAuth, 
    required super.userAllocatedSector, 
    required super.userLevel, 
    required super.userPermissions, 
    required super.userActivities
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'matricula': registration,
      'nome': name,
      'senha': password,
      'email': email,
      'documento': document,
      'cargo': office,
      'dataNascimento': birthDate,
      'dataAdmissao': admissionDate,
      'idioma': language,
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
      registration: map['usuario']['matricula'] ?? '',
      name: map['usuario']['nome'] ?? '',
      password: map['usuario']['senha'] ?? '',
      email: map['usuario']['email'] ?? '',
      document: map['usuario']['documento'],
      office: map['usuario']['cargo'],
      birthDate: map['usuario']['dataNascimento'],
      admissionDate: map['usuario']['dataAdmissao'],
      language: map['usuario']['idioma'],
      picture: map['usuario']['foto'],
      userAuth: UserAuthModel.fromMap(map['autenticacao']),
      userAllocatedSector: UserAllocatedSectorModel.fromMap(map['setorAlocado']),
      userLevel: UserLevelModel.fromMap(map['nivel']),
      userPermissions: List<UserPermissionModel>.from(
        map['aPermissao']?.map((_) => UserPermissionModel.fromMap(_))
      ),
      userActivities: List<UserActivitiesModel>.from(
        map['aAtividade']?.map((_) => UserActivitiesModel.fromMap(_))
      ),
    );
  }

  UserModel copyWith({
    int? id,
    String? registration,
    String? name,
    String? password,
    String? email,
    String? document,
    String? office,
    String? birthDate,
    String? admissionDate,
    String? language,
    String? picture,
    UserAuthEntity? userAuth,
    UserAllocatedSectorEntity? userAllocatedSector,
    UserLevelEntity? userLevel,
    List<UserPermissionEntity>? userPermissions,
    List<UserActivitiesEntity>? userActivities,
  }) {
    return UserModel(
      id: id ?? this.id,
      registration: registration ?? this.registration,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      document: document ?? this.document,
      office: office ?? this.office,
      birthDate: birthDate ?? this.birthDate,
      admissionDate: admissionDate ?? this.admissionDate,
      language: language ?? this.language,
      picture: picture ?? this.picture,
      userAuth: userAuth ?? this.userAuth,
      userAllocatedSector: userAllocatedSector ?? this.userAllocatedSector,
      userLevel: userLevel ?? this.userLevel,
      userPermissions: userPermissions ?? this.userPermissions,
      userActivities: userActivities ?? this.userActivities,
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

class UserAllocatedSectorModel extends UserAllocatedSectorEntity {
  UserAllocatedSectorModel({
    required super.id,
    required super.name,
    required super.hierarchicalName
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'nomeHierarquico': hierarchicalName,
    };
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserAllocatedSectorModel.fromMap(Map<String, dynamic> map) {
    return UserAllocatedSectorModel(
      id: map['id']?.toInt() ?? 0,
      name: map['nome'] ?? '',
      hierarchicalName: map['nomeHierarquico'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAllocatedSectorModel.fromJson(String source) => UserAllocatedSectorModel.fromMap(json.decode(source));
}

class UserLevelModel extends UserLevelEntity {

  UserLevelModel({
    required super.id,
    required super.name
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
    };
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserLevelModel.fromMap(Map<String, dynamic> map) {
    return UserLevelModel(
      id: map['id']?.toInt() ?? 0,
      name: map['nome'] ?? '',
    );
  }
  

  String toJson() => json.encode(toMap());

  factory UserLevelModel.fromJson(String source) => UserLevelModel.fromMap(json.decode(source));
}

class UserPermissionModel extends UserPermissionEntity {
  UserPermissionModel({
    required super.name,
    required super.module,
    required super.hasPermission,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'modulo': module,
      'temPermissao': hasPermission.toNumber(),
    };
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserPermissionModel.fromMap(Map<String, dynamic> map) {
    return UserPermissionModel(
      name: map['nome'] ?? '',
      module: map['modulo'] ?? '',
      hasPermission: map['temPermissao'] != null ? (map['temPermissao'] as int).toBool() :false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPermissionModel.fromJson(String source) => UserPermissionModel.fromMap(json.decode(source));
}

class UserActivitiesModel extends UserActivitiesEntity{
  UserActivitiesModel({
    required super.id,
    required super.name,
    required super.permissions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
    };
  }

  List<Map<String, dynamic>> mapPermissionsWith(Map<String, dynamic> data){
    return permissions.map((e) => (e as UserActivitiesPermissionModel).toMapWith(data)).toList();
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserActivitiesModel.fromMap(Map<String, dynamic> map) {
    return UserActivitiesModel(
      id: map['id']?.toInt() ?? 0,
      name: map['nome'] ?? '',
      permissions: List<UserActivitiesPermissionModel>.from(
        map['aPermissao']?.map((_) => UserActivitiesPermissionModel.fromMap(_))
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserActivitiesModel.fromJson(String source) => UserActivitiesModel.fromMap(json.decode(source));
}

class UserActivitiesPermissionModel extends UserActivitiesPermissionEntity{

  UserActivitiesPermissionModel({
    required super.name,
    required super.hasPermission,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'temPermissao': hasPermission.toNumber(),
    };
  }

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  factory UserActivitiesPermissionModel.fromMap(Map<String, dynamic> map) {
    return UserActivitiesPermissionModel(
      name: map['nome'] ?? '',
      hasPermission: (map['temPermissao'] as int).toBool(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserActivitiesPermissionModel.fromJson(String source) => UserActivitiesPermissionModel.fromMap(json.decode(source));
}
