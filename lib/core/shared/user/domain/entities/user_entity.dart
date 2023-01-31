class UserEntity {
  final int id;
  final String registration;
  final String name;
  final String password;
  final String email;
  
  final String? document;
  final String? office;
  final String? birthDate;
  final String? admissionDate;
  final String? language;
  final String? picture;

  final UserAuthEntity userAuth;
  final UserAllocatedSectorEntity userAllocatedSector;
  final UserLevelEntity userLevel;
  final List<UserPermissionEntity> userPermissions;
  final List<UserActivitiesEntity> userActivities;

  UserEntity({
    required this.id,
    required this.registration,
    required this.name,
    required this.password,
    required this.email,
    this.document,
    this.office,
    this.birthDate,
    this.admissionDate,
    this.language,
    this.picture,
    required this.userAuth,
    required this.userAllocatedSector,
    required this.userLevel,
    required this.userPermissions,
    required this.userActivities,
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

class UserLevelEntity {
  final int id;
  final String name;

  UserLevelEntity({
    required this.id,
    required this.name
  });
}

class UserAllocatedSectorEntity {
  final int id;
  final String name;
  final String hierarchicalName;

  UserAllocatedSectorEntity({
    required this.id,
    required this.name,
    required this.hierarchicalName
  });
}

class UserPermissionEntity {
  final String name;
  final String module;
  final bool hasPermission;

  UserPermissionEntity({
    required this.name,
    required this.module,
    required this.hasPermission,
  });
}

class UserActivitiesEntity {
  final int id;
  final String name;
  final List<UserActivitiesPermissionEntity> permissions;
  
  UserActivitiesEntity({
    required this.id,
    required this.name,
    required this.permissions,
  });
}

class UserActivitiesPermissionEntity {
  final String name;
  final bool hasPermission;

  UserActivitiesPermissionEntity({
    required this.name,
    required this.hasPermission,
  });

  UserActivitiesPermissionEntity copyWith({
    String? name,
    bool? hasPermission,
  }) {
    return UserActivitiesPermissionEntity(
      name: name ?? this.name,
      hasPermission: hasPermission ?? this.hasPermission,
    );
  }
}
