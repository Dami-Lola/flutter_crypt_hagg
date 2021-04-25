// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    dateOfBirth: json['date_of_birth'] as String,
    selfie: json['selfie'] as String,
    gender: json['gender'] as String,
    addresses: json['addresses'] as List,
    armMembershipId: json['arm_membership_id'],
    maritalStatus: json['marital_status'] as String,
    middleName: json['middle_name'] as String,
    nationality: json['nationality'] as Map<String, dynamic>,
    placeOfBirth: json['place_of_birth'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dateOfBirth,
      'place_of_birth': instance.placeOfBirth,
      'selfie': instance.selfie,
      'gender': instance.gender,
      'title': instance.title,
      'marital_status': instance.maritalStatus,
      'arm_membership_id': instance.armMembershipId,
      'nationality': instance.nationality,
      'addresses': instance.addresses,
    };
