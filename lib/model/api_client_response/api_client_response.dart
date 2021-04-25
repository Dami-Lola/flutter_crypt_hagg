import 'package:json_annotation/json_annotation.dart';

part 'api_client_response.g.dart';

enum ApiClientResponseStatus {
  @JsonValue('fail')
  fail,

  @JsonValue('success')
  success
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiClientResponse {
  final String responseCode;
  String responseMessage;
  String message;
  final ApiClientResponseStatus status;
  final dynamic data;
  final dynamic authorization;
  final List<Map<String, dynamic>> errors;

  ApiClientResponse({
    this.data,
    this.responseCode,
    this.responseMessage,
    this.message,
    this.status,
    this.authorization,
    this.errors,
  });

  factory ApiClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiClientResponseToJson(this);
}
