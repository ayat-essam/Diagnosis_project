// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conultation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationModel _$ConsultationModelFromJson(Map<String, dynamic> json) =>
    ConsultationModel(
      id: (json['id'] as num).toInt(),
      patientName: json['patientName'] as String,
      patientBirthDate: json['patientBirthDate'] as String,
      patientGender: json['patientGender'] as String,
      symptoms: json['symptoms'] as String,
      response: json['response'] as String?,
      requestDate: json['requestDate'] as String,
      notes: json['notes'] as String?,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      success: json['success'] as bool,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ConsultationModelToJson(ConsultationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientName': instance.patientName,
      'patientBirthDate': instance.patientBirthDate,
      'patientGender': instance.patientGender,
      'symptoms': instance.symptoms,
      'response': instance.response,
      'requestDate': instance.requestDate,
      'notes': instance.notes,
      'attachments': instance.attachments,
      'success': instance.success,
      'errorMessage': instance.errorMessage,
    };
