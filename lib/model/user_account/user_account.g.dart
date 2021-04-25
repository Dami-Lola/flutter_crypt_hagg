// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return UserAccount(
    engageId: json['engage_id'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    phoneNumber: json['phone_number'] as String,
    isEmailConfirmed: json['is_email_confirmed'] as bool,
    isOnboardingComplete: json['is_onboarding_complete'] as bool,
    isPhoneNumberConfirmed: json['is_phone_number_confirmed'] as bool,
    userType: _$enumDecodeNullable(_$UserTypeEnumMap, json['user_type']),
  )..isLockedOut = json['is_locked_out'] as bool;
}

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'engage_id': instance.engageId,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'is_email_confirmed': instance.isEmailConfirmed,
      'is_phone_number_confirmed': instance.isPhoneNumberConfirmed,
      'is_onboarding_complete': instance.isOnboardingComplete,
      'is_locked_out': instance.isLockedOut,
      'user_type': _$UserTypeEnumMap[instance.userType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$UserTypeEnumMap = {
  UserType.newUser: 'new',
  UserType.existingUser: 'existing',
};
