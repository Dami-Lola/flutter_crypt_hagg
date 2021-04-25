import 'package:dart_json_mapper/dart_json_mapper.dart' as serialize;
import 'package:json_annotation/json_annotation.dart';

part 'user_account.g.dart';

// @serialize.jsonSerializable
enum UserType {
  @JsonValue('new')
  newUser,

  @JsonValue('existing')
  existingUser,
}

@JsonSerializable(fieldRename: FieldRename.snake)
@serialize.jsonSerializable
@serialize.Json(allowCircularReferences: 1)
class UserAccount {
  String engageId;
  String username;
  String email;
  String phoneNumber;
  bool isEmailConfirmed;
  bool isPhoneNumberConfirmed;
  bool isOnboardingComplete;
  bool isLockedOut;
  UserType userType;

  UserAccount({
    this.engageId,
    this.username,
    this.email,
    this.phoneNumber,
    this.isEmailConfirmed,
    this.isOnboardingComplete,
    this.isPhoneNumberConfirmed,
    this.userType,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}

serialize.JsonMapperAdapter userTypeMapperAdapter = serialize.JsonMapperAdapter(
  enumValues: {
    UserType: UserType.values,
  },
);
