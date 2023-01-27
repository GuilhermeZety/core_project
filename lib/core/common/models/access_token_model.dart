import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AccessTokenModel {
  final String accessToken;
  final String clientId;
  final String grantTypes;
  final int expiryIn;
  final String tokenType;
  final DateTime updatedDate;

  AccessTokenModel({
    required this.accessToken,
    required this.clientId,
    required this.grantTypes,
    required this.expiryIn,
    required this.tokenType,
    required this.updatedDate,
  });

  AccessTokenModel copyWith({
    String? accessToken,
    String? clientId,
    String? grantTypes,
    int? expiryIn,
    String? tokenType,
    DateTime? updatedDate,
  }) {
    return AccessTokenModel(
      accessToken: accessToken ?? this.accessToken,
      clientId: clientId ?? this.clientId,
      grantTypes: grantTypes ?? this.grantTypes,
      expiryIn: expiryIn ?? this.expiryIn,
      tokenType: tokenType ?? this.tokenType,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'clientId': clientId,
      'grantTypes': grantTypes,
      'expiryIn': expiryIn,
      'tokenType': tokenType,
      'updatedDate': updatedDate.millisecondsSinceEpoch,
    };
  }

  factory AccessTokenModel.fromMap(Map<String, dynamic> map) {
    return AccessTokenModel(
      accessToken: map['accessToken'] as String,
      clientId: map['clientId'] as String,
      grantTypes: map['grantTypes'] as String,
      expiryIn: map['expiryIn'] as int,
      tokenType: map['tokenType'] as String,
      updatedDate: DateTime.fromMillisecondsSinceEpoch(map['updatedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccessTokenModel.fromJson(String source) => AccessTokenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
