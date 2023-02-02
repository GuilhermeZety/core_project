import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

/// A model class for the user token.
class UserTokenModel {
  final String accessToken;
  final String clientId;
  final String grantTypes;
  final int expiresIn;
  final String tokenType;
  final DateTime updatedDate;

  UserTokenModel({
    required this.accessToken,
    required this.clientId,
    required this.grantTypes,
    required this.expiresIn,
    required this.tokenType,
    required this.updatedDate,
  });

  Map<String, dynamic> toMapWith(Map<String, dynamic> data) {
    final map = toMap();
    map.addAll(data);
    return map;
  }

  UserTokenModel copyWith({
    String? accessToken,
    String? clientId,
    String? grantTypes,
    int? expiresIn,
    String? tokenType,
    DateTime? updatedDate,
  }) {
    return UserTokenModel(
      accessToken: accessToken ?? this.accessToken,
      clientId: clientId ?? this.clientId,
      grantTypes: grantTypes ?? this.grantTypes,
      expiresIn: expiresIn ?? this.expiresIn,
      tokenType: tokenType ?? this.tokenType,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'client_id': clientId,
      'grant_types': grantTypes,
      'expires_in': expiresIn,
      'token_type': tokenType,
      'updated_date': updatedDate.millisecondsSinceEpoch,
    };
  }

  factory UserTokenModel.fromMap(Map<String, dynamic> map) {
    return UserTokenModel(
      accessToken: map['access_token'] as String,
      clientId: map['client_id'] as String,
      grantTypes: map['grant_types'] as String,
      expiresIn: map['expires_in'] as int,
      tokenType: map['token_type'] as String,
      updatedDate: DateTime.fromMillisecondsSinceEpoch(map['updated_date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTokenModel.fromJson(String source) => UserTokenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}