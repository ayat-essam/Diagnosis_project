import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/get_reply_response.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class GetReplyUseCase {
  final SystemSettingsRepository repository;

  GetReplyUseCase({required this.repository});

  Future<Either<ErrorModel, GetReplyResponse>> call({required int requestId}) async {
    return await repository.getReply(requestId: requestId);
  }
}
