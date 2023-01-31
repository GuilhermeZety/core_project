

class AuthEntity {
  final String registration;
  final String password;
  final String notificationHash;

  AuthEntity({
    required this.registration,
    required this.password,
    required this.notificationHash
  });
}
