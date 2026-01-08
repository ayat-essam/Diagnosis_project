import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_reply_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class SendReplyUseCase {
  final SystemSettingsRepository repository;

  SendReplyUseCase({required this.repository});

  Future<void> call({required SendReplyRequest sendReplyRequest}) async {
    return await repository.sendReply(sendReplyRequest: sendReplyRequest);
  }
}