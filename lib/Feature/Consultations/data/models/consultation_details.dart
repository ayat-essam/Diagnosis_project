import 'package:json_annotation/json_annotation.dart';
part 'consultation_details.g.dart';


@JsonSerializable()
class ResponseConsultationDetails {
  int? id;
  String? patientName;
  String? patientBirthDate;
  String? patientGender;
  String? symptoms;
  String? response;
  String? requestDate;
  String? notes;

  @JsonKey(fromJson: _attachmentsFromJson)
  List<String>? attachments;

  bool? success;
  String? errorMessage;

  ResponseConsultationDetails({
    this.id,
    this.patientName,
    this.patientBirthDate,
    this.patientGender,
    this.symptoms,
    this.response,
    this.requestDate,
    this.notes,
    this.attachments,
    this.success,
    this.errorMessage,
  });

  factory ResponseConsultationDetails.fromJson(Map<String, dynamic> json) =>
      _$ResponseConsultationDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseConsultationDetailsToJson(this);

  static List<String>? _attachmentsFromJson(dynamic json) {
    if (json == null) return null;
    if (json is List) {
      return json.map((e) => e.toString()).toList();
    }
    return null;
  }
}