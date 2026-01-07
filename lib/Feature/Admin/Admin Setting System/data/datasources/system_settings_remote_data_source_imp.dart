import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/datasources/system_settings_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/add_admin_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_reply_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_outside_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_message_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_reply_request.dart';

class SystemSettingsDataSourceImpl implements SystemSettingsDataSource {
  ApiConsumer apiConsumer;
  SystemSettingsDataSourceImpl({required this.apiConsumer});
  @override
  Future<String> addAdmin({required AddAdminRequest addAdminRequest}) async {
    final response = await apiConsumer.post(
      ApiConstants.addAdmin,
      data: addAdminRequest.toJson(),
    );
    return response['message'];
  }

  @override
  Future<GetReplyResponse> getReply({required int requestId}) async {
    final response = await apiConsumer.get(
      ApiConstants.getReply(requestId),
    );
    return GetReplyResponse.fromJson(response);
  }

  @override
  Future<void> sendMessage(
      {required SendMessageRequest sendMessageRequest}) async {
    await apiConsumer.post(
      ApiConstants.sendMessage,
      data: sendMessageRequest.toJson(),
    );
  }

  @override
  Future<void> sendReply({required SendReplyRequest sendReplyRequest}) async {
    await apiConsumer.post(
      ApiConstants.sendReply,
      data: sendReplyRequest.toJson(),
    );
  }

  @override
  Future<String> setAiRateLimit({required int maxRequestsPerDay}) async {
    final response = await apiConsumer.post(
      ApiConstants.aiRateLimit,
      data: {'maxRequestsPerDay': maxRequestsPerDay},
    );
    return response['message'];
  }

  @override
  Future<String> setDoctorRateLimit({required int maxRequestsPerDay}) async {
    final response = await apiConsumer.post(
      ApiConstants.doctorRateLimit,
      data: {'maxRequestsPerDay': maxRequestsPerDay},
    );
    return response['message'];
  }

  @override
  Future<String> setDoctorWorkHour({required int hours}) async {
    final response = await apiConsumer.post(
      ApiConstants.doctorWorkHours,
      data: {'hours': hours},
    );
    return response['message'];
  }

  @override
  Future<String> toggleAi({required bool enabled}) async {
    final response = await apiConsumer.post(
      ApiConstants.aiToggle,
      data: {'enabled': enabled},
    );
    return response['message'];
  }

  @override
  Future<List<GetOutsideResponse>> getOutsideRequests() async {
    final response = await apiConsumer.get(
      ApiConstants.outsideRequests,
    );
    return List<GetOutsideResponse>.from(
        (response as List).map((e) => GetOutsideResponse.fromJson(e)));
  }
}
