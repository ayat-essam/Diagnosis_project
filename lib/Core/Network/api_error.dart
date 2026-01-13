import 'package:json_annotation/json_annotation.dart';
part 'api_error.g.dart';

@JsonSerializable()
class APIError {
  final String message;
  final int? code;
  APIError({required this.message, this.code});

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  Map<String, dynamic> toJson() => _$APIErrorToJson(this);
}
