import 'package:dart_json_mapper/dart_json_mapper.dart' as serialize;
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@serialize.jsonSerializable
@serialize.Json(allowCircularReferences: 1)
class AccessToken {
  String authToken;
  String refreshToken;
  double expiresIn;

  AccessToken({
    this.authToken,
    this.refreshToken,
    this.expiresIn,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
  
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
