<<<<<<< HEAD
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
=======
// import 'package:json_annotation/json_annotation.dart';
// part 'api_error.g.dart';
//
// @JsonSerializable()
// class APIError{
//   final String message ;
//   final int? code;
//   APIError({ required this.message, this.code});
//
//   factory APIError.fromJson(Map<String, dynamic> json) => _$APIErrorFromJson(json);
//
//   Map<String, dynamic> toJson() => _$APIErrorToJson(this);
//
// }
>>>>>>> b59bc0e0c30810bbf52f75671c3352d782c29bc0
