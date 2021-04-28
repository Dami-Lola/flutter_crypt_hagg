import 'package:dart_json_mapper/dart_json_mapper.dart' as serialize;
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
@serialize.jsonSerializable
@serialize.Json(allowCircularReferences: 1)
class User {
  String id;
  String email;
  bool emailVerified;
  String phonenumber;
  String referralCode;
  String username;

  User({this.id, this.email, this.emailVerified, this.phonenumber, this.referralCode, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      emailVerified: json['emailVerified'],
      phonenumber: json['phonenumber'],
      referralCode: json['referralCode'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    data['phonenumber'] = this.phonenumber;
    data['referralCode'] = this.referralCode;
    data['username'] = this.username;
    return data;
  }
}



