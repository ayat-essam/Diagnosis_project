import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/datasources/system_settings_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/add_admin_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_reply_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_outside_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_message_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_reply_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class SystemSettingsRepositoryImpl implements SystemSettingsRepository {
  final SystemSettingsDataSource systemSettingsDataSource;

  SystemSettingsRepositoryImpl({required this.systemSettingsDataSource});

  @override
  Future<Either<ErrorModel, String>> addAdmin(
      {required AddAdminRequest addAdminRequest}) async {
    try {
      final response = await systemSettingsDataSource.addAdmin(
          addAdminRequest: addAdminRequest);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> setAiRateLimit(
      {required int maxRequestsPerDay}) async {
    try {
      final res = await systemSettingsDataSource.setAiRateLimit(
          maxRequestsPerDay: maxRequestsPerDay);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> setDoctorRateLimit(
      {required int maxRequestsPerDay}) async {
    try {
      final res = await systemSettingsDataSource.setDoctorRateLimit(
          maxRequestsPerDay: maxRequestsPerDay);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> setDoctorWorkHour(
      {required int hours}) async {
    try {
      final res =
          await systemSettingsDataSource.setDoctorWorkHour(hours: hours);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> toggleAi({required bool enabled}) async {
    try {
      final res = await systemSettingsDataSource.toggleAi(enabled: enabled);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> sendMessage(
      {required SendMessageRequest sendMessageRequest}) async {
    try {
      await systemSettingsDataSource.sendMessage(
          sendMessageRequest: sendMessageRequest);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> sendReply(
      {required SendReplyRequest sendReplyRequest}) async {
    try {
      await systemSettingsDataSource.sendReply(
          sendReplyRequest: sendReplyRequest);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, GetReplyResponse>> getReply(
      {required int requestId}) async {
    try {
      final response =
          await systemSettingsDataSource.getReply(requestId: requestId);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<GetOutsideResponse>>>
      getOutsideRequests() async {
    try {
      final response = await systemSettingsDataSource.getOutsideRequests();
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
