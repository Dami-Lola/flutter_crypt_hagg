import 'package:dart_json_mapper/dart_json_mapper.dart' as serialize;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@serialize.jsonSerializable
@serialize.Json(allowCircularReferences: 1)
class User {
  String firstName;
  String middleName;
  String lastName;
  String dateOfBirth;
  String placeOfBirth;
  String selfie;
  String gender;
  String title;
  String maritalStatus;

  // FIXME: use the appropirate type
  dynamic armMembershipId;
  Map<String, dynamic> nationality;
  List<dynamic> addresses;

  User({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.selfie,
    this.gender,
    this.addresses,
    this.armMembershipId,
    this.maritalStatus,
    this.middleName,
    this.nationality,
    this.placeOfBirth,
    this.title,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
