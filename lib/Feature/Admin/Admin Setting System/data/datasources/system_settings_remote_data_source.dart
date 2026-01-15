import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/add_admin_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_reply_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_outside_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_message_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_reply_request.dart';

abstract class SystemSettingsDataSource {
  Future<String> addAdmin({required AddAdminRequest addAdminRequest});
  Future<String> setAiRateLimit({required int maxRequestsPerDay});
  Future<String> setDoctorRateLimit({required int maxRequestsPerDay});
  Future<String> setDoctorWorkHour({required int hours});
  Future<String> toggleAi({required bool enabled});
  Future<void> sendMessage({required SendMessageRequest sendMessageRequest});
  Future<void> sendReply({required SendReplyRequest sendReplyRequest});
  Future<List<GetOutsideResponse>> getOutsideRequests();
  Future<GetReplyResponse> getReply({required int requestId});
}
