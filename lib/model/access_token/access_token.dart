import 'package:dart_json_mapper/dart_json_mapper.dart' as serialize;
import 'package:flutter_crypt_hagg/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@serialize.jsonSerializable
@serialize.Json(allowCircularReferences: 1)
class AccessToken {
  String token;
  String refreshToken;
  double expiresIn;
  User  data;

  AccessToken({
    this.token,
    this.refreshToken,
    this.expiresIn,
    this.data
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
  
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
