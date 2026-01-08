import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/send_message_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class SendMessageUseCase {
  final SystemSettingsRepository repository;

  SendMessageUseCase({required this.repository});

  Future<Either<ErrorModel, void>> call({required SendMessageRequest sendMessageRequest}) async {
    return await repository.sendMessage(sendMessageRequest: sendMessageRequest);
  }
}