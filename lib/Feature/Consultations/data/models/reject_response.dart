import 'package:json_annotation/json_annotation.dart';

part 'reject_response.g.dart';

@JsonSerializable()
class RejectResponse {
  final bool success;
  final String? errorMessage;
  final int? consultationId;
  final String? rejectionReason;

  RejectResponse({
    required this.success,
    this.errorMessage,
    this.consultationId,
    this.rejectionReason,
  });

  factory RejectResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RejectResponseToJson(this);
}