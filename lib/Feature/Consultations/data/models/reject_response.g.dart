// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectResponse _$RejectResponseFromJson(Map<String, dynamic> json) =>
    RejectResponse(
      success: json['success'] as bool,
      errorMessage: json['errorMessage'] as String?,
      consultationId: (json['consultationId'] as num?)?.toInt(),
      rejectionReason: json['rejectionReason'] as String?,
    );

Map<String, dynamic> _$RejectResponseToJson(RejectResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'consultationId': instance.consultationId,
      'rejectionReason': instance.rejectionReason,
    };
