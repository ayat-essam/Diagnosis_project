<<<<<<< HEAD
import 'package:json_annotation/json_annotation.dart';
part 'conultation_model.g.dart';

@JsonSerializable()
class ConsultationModel {
  final int id;
  final String patientName;

  @JsonKey(name: 'patientBirthDate')
  final String patientBirthDate;

  @JsonKey(name: 'patientGender')
  final String patientGender;

  final String symptoms;
  final String? response;

  @JsonKey(name: 'requestDate')
  final String requestDate;

  final String? notes;
  final List<String> attachments;
  final bool success;
  final String? errorMessage;

  ConsultationModel({
    required this.id,
    required this.patientName,
    required this.patientBirthDate,
    required this.patientGender,
    required this.symptoms,
    this.response,
    required this.requestDate,
    this.notes,
    required this.attachments,
    required this.success,
    this.errorMessage,
  });

  factory ConsultationModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);
}
=======
// import 'package:json_annotation/json_annotation.dart';
// part 'conultation_model.g.dart';
//
//
// @JsonSerializable()
// class ConsultationModel {
//   final int id;
//   final String patientName;
//
//   @JsonKey(name: 'patientBirthDate')
//   final String patientBirthDate;
//
//   @JsonKey(name: 'patientGender')
//   final String patientGender;
//
//   final String symptoms;
//   final String? response;
//
//   @JsonKey(name: 'requestDate')
//   final String requestDate;
//
//   final String? notes;
//   final List<String> attachments;
//   final bool success;
//   final String? errorMessage;
//
//   ConsultationModel({
//     required this.id,
//     required this.patientName,
//     required this.patientBirthDate,
//     required this.patientGender,
//     required this.symptoms,
//     this.response,
//     required this.requestDate,
//     this.notes,
//     required this.attachments,
//     required this.success,
//     this.errorMessage,
//   });
//
//   factory ConsultationModel.fromJson(Map<String, dynamic> json) =>
//       _$ConsultationModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);
// }
>>>>>>> b59bc0e0c30810bbf52f75671c3352d782c29bc0
