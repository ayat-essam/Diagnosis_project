<<<<<<< HEAD
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class APIErrorModel {
  final String message;
  final int? code;
  APIErrorModel({required this.message, this.code});

  factory APIErrorModel.fromJson(Map<String, dynamic> json) =>
      _$APIErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$APIErrorModelToJson(this);
}
=======
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'api_error_model.g.dart';
// @JsonSerializable()
// class APIErrorModel{
//   final String message ;
//   final int? code;
//   APIErrorModel({ required this.message, this.code});
//
//   factory APIErrorModel.fromJson(Map<String, dynamic> json) => _$APIErrorModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$APIErrorModelToJson(this);
//
// }
>>>>>>> b59bc0e0c30810bbf52f75671c3352d782c29bc0
