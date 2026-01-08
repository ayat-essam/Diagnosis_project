// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifyResponse _$ModifyResponseFromJson(Map<String, dynamic> json) =>
    ModifyResponse(
      success: json['success'] as bool,
      errorMessage: json['errorMessage'] as String?,
      updatedConsultation: json['updatedConsultation'] == null
          ? null
          : ConsultationModel.fromJson(
              json['updatedConsultation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModifyResponseToJson(ModifyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'updatedConsultation': instance.updatedConsultation,
    };
