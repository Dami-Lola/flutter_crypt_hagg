import 'package:json_annotation/json_annotation.dart';

part 'api_client_response.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class ApiClientResponse {

  String message;
  dynamic data;
  bool hasError = false;

  ApiClientResponse({
    this.data,
    this.hasError,
    this.message,
  });

  factory ApiClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiClientResponseToJson(this);
}
