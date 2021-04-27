// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiClientResponse _$ApiClientResponseFromJson(Map<String, dynamic> json) {
  return ApiClientResponse(
    data: json['data'],
    hasError: json['has_error'] as bool,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ApiClientResponseToJson(ApiClientResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'has_error': instance.hasError,
    };
