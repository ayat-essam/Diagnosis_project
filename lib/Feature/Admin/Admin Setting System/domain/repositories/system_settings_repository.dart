import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/add_admin_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_reply_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_outside_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_message_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_reply_request.dart';

abstract class SystemSettingsRepository {
  Future<Either<ErrorModel, String>> addAdmin( {required AddAdminRequest addAdminRequest});
  Future<Either<ErrorModel, String>> setAiRateLimit({required int maxRequestsPerDay});
  Future<Either<ErrorModel, String>> setDoctorRateLimit({required int maxRequestsPerDay});
  Future<Either<ErrorModel, String>> setDoctorWorkHour({required int hours});
  Future<Either<ErrorModel, String>> toggleAi({required bool enabled});
  Future<Either<ErrorModel, void>> sendMessage({required SendMessageRequest sendMessageRequest});
  Future<Either<ErrorModel, List<GetOutsideResponse>>> getOutsideRequests();
  Future<void> sendReply({required SendReplyRequest sendReplyRequest});
  Future<Either<ErrorModel, GetReplyResponse>> getReply({required int requestId});
}