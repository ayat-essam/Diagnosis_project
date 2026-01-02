// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_con_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptResponse _$AcceptResponseFromJson(Map<String, dynamic> json) =>
    AcceptResponse(
      success: json['success'] as bool?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$AcceptResponseToJson(AcceptResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessage': instance.errorMessage,
    };
