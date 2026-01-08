import 'package:json_annotation/json_annotation.dart';

part 'accept_con_request.g.dart';

@JsonSerializable()
class AcceptResponse {
  final bool success;
  final String? errorMessage;
  final int? consultationId;
  final String? newStatus;

  AcceptResponse({
    required this.success,
    this.errorMessage,
    this.consultationId,
    this.newStatus,
  });

  factory AcceptResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptResponseToJson(this);
}