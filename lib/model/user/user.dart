import 'package:dart_json_mapper/dart_json_mapper.dart' as serialize;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@serialize.jsonSerializable
@serialize.Json(allowCircularReferences: 1)
class User {
  String id;
  String phonenumber;
  String email;
  String referralCode;
  String username;
  bool emailVerified;
  String gender;


  User({
    this.id,
    this.email,
    this.username,
    this.gender,
    this.phonenumber,
    this.emailVerified,
    this.referralCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}


