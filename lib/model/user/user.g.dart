// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String,
    email: json['email'] as String,
    username: json['username'] as String,
    gender: json['gender'] as String,
    phonenumber: json['phonenumber'] as String,
    phoneNumberVerified: json['phoneNumberVerified'] as bool,
    referralCode: json['referralCode'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'phonenumber': instance.phonenumber,
      'email': instance.email,
      'referralCode': instance.referralCode,
      'username': instance.username,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'gender': instance.gender,
    };
