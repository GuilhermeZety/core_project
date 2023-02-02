import 'dart:convert';

import 'package:core_project/features/auth/domain/entities/auth_entity.dart';


class AuthModel extends AuthEntity {
  AuthModel({
    required super.registration,
    required super.password,
    required super.notificationHash
  });

  Map<String, dynamic> toMap() {
    return {
      'matricula': registration,
      'senha': password,
      'hashNotificacao': notificationHash,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      registration: map['matricula'] ?? '',
      password: map['senha'] ?? '',
      notificationHash: map['hashNotificacao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source));
}