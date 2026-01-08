import 'package:json_annotation/json_annotation.dart';
import 'conultation_model.dart';

part 'modify_response.g.dart';

@JsonSerializable()
class ModifyResponse {
  final bool success;
  final String? errorMessage;
  final ConsultationModel? updatedConsultation;

  ModifyResponse({
    required this.success,
    this.errorMessage,
    this.updatedConsultation,
  });

  factory ModifyResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyResponseToJson(this);
}