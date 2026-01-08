// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIErrorModel _$APIErrorModelFromJson(Map<String, dynamic> json) =>
    APIErrorModel(
      message: json['message'] as String,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$APIErrorModelToJson(APIErrorModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
