// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rejected_consultation_request .dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectedResponse _$RejectedResponseFromJson(Map<String, dynamic> json) =>
    RejectedResponse(
      reason: json['reason'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$RejectedResponseToJson(RejectedResponse instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'notes': instance.notes,
    };
