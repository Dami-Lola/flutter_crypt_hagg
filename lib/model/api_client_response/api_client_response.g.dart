// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiClientResponse _$ApiClientResponseFromJson(Map<String, dynamic> json) {
  return ApiClientResponse(
    data: json['data'],
    responseCode: json['response_code'] as String,
    responseMessage: json['response_message'] as String,
    message: json['message'] as String,
    status:
        _$enumDecodeNullable(_$ApiClientResponseStatusEnumMap, json['status']),
    authorization: json['authorization'],
    errors: (json['errors'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$ApiClientResponseToJson(ApiClientResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'response_message': instance.responseMessage,
      'message': instance.message,
      'status': _$ApiClientResponseStatusEnumMap[instance.status],
      'data': instance.data,
      'authorization': instance.authorization,
      'errors': instance.errors,
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

const _$ApiClientResponseStatusEnumMap = {
  ApiClientResponseStatus.fail: 'fail',
  ApiClientResponseStatus.success: 'success',
};
