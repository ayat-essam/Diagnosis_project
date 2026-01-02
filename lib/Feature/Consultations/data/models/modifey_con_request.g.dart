// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifey_con_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifyResponse _$ModifyResponseFromJson(Map<String, dynamic> json) =>
    ModifyResponse(
      consultationId: (json['consultationId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ModifyResponseToJson(ModifyResponse instance) =>
    <String, dynamic>{
      'consultationId': instance.consultationId,
      'name': instance.name,
      'description': instance.description,
      'notes': instance.notes,
    };
