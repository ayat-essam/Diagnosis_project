// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIError _$APIErrorFromJson(Map<String, dynamic> json) => APIError(
      message: json['message'] as String,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$APIErrorToJson(APIError instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
